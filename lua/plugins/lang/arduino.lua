-- #################################
-- #         ARDUINO SETUP         #
-- #################################
--
-- Two halves that must agree on one board:
--   vim-arduino               compile / upload / serial monitor, shelling out to arduino-cli
--   arduino-language-server   completion + diagnostics, driving arduino-cli and clangd
--
-- sketch.yaml is the single source of truth. Create it once per sketch with
-- the board plugged in:
--
--   arduino-cli board list                                     # find fqbn + port
--   arduino-cli board attach -p /dev/ttyACM0 -b arduino:avr:uno blink.ino
--
-- (or :ArduinoAttach from inside the sketch). That writes
--
--   default_fqbn: arduino:avr:uno
--   default_port: /dev/ttyACM0
--
-- which arduino-cli reads on its own, the language server gets via -fqbn
-- below, and vim-arduino gets from sync_from_sketch_yaml() — vim-arduino
-- itself only knows the sketch.json format arduino-cli dropped in 0.30, so
-- without that sync it would compile for whatever board was last chosen
-- interactively while the LSP checked against a different one.
--
-- Binaries (none of which lazy.nvim installs):
--   arduino-cli               ~/.local/bin, from the GitHub release tarball
--   arduino-language-server   mason.nvim (see plugins/lsp/mason.lua)
--   clangd                    mason.nvim, shared with the C/C++ setup

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

-- Nearest sketch.yaml at or above the buffer's directory. Sketches nest one
-- directory deep (blink/blink.ino), but libraries under src/ can be deeper.
local function find_sketch_yaml(bufnr)
	local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
	if dir == "" then
		return nil
	end
	return vim.fs.find("sketch.yaml", { path = dir, upward = true, type = "file" })[1]
end

-- Deliberately not a YAML parse: sketch.yaml is a flat key/value file written
-- by `arduino-cli board attach`, and pulling in a parser for two scalars would
-- be the only reason this config needed one.
local function read_sketch_yaml(path)
	local out = {}
	for line in io.lines(path) do
		local key, value = line:match("^([%w_]+):%s*(%S+)")
		if key then
			out[key] = value
		end
	end
	return out
end

-- Point vim-arduino's globals at whatever sketch.yaml says, so :ArduinoVerify
-- and the language server compile for the same board.
local function sync_from_sketch_yaml(bufnr)
	local path = find_sketch_yaml(bufnr)
	if not path then
		return nil, nil
	end

	local sketch = read_sketch_yaml(path)
	if sketch.default_fqbn then
		vim.g.arduino_board = sketch.default_fqbn
	end
	if sketch.default_port then
		vim.g.arduino_serial_port = sketch.default_port
	end
	return sketch, vim.fs.dirname(path)
end

local function start_lsp(bufnr)
	if vim.fn.executable(mason_bin .. "arduino-language-server") == 0 then
		return
	end

	local sketch, sketch_dir = sync_from_sketch_yaml(bufnr)

	-- The language server hands -fqbn straight to `arduino-cli compile --fqbn`
	-- without checking it, so an empty value silently eats the next flag and
	-- every diagnostic comes back as a build failure. Always send something.
	local fqbn = (sketch and sketch.default_fqbn) or vim.g.arduino_board or "arduino:avr:uno"

	-- The sketch directory, not the git root: arduino-cli compiles a directory
	-- whose name matches its .ino file. Falling back to the buffer's own
	-- directory only helps a bare sketch with no sketch.yaml yet — for anything
	-- under a subdirectory (src/, or the *.h files vim-arduino's ftdetect claims
	-- under ~/Arduino) that is the wrong root, so leave the server unstarted
	-- rather than have it fail to build every keystroke.
	local root = sketch_dir
	if not root then
		local dir = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
		if next(vim.fn.glob(dir .. "/*.ino", false, true)) == nil then
			return
		end
		root = dir
	end

	vim.lsp.start({
		name = "arduino_language_server",
		cmd = {
			mason_bin .. "arduino-language-server",
			"-cli",
			vim.fn.expand("~/.local/bin/arduino-cli"),
			"-cli-config",
			vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
			"-clangd",
			mason_bin .. "clangd",
			"-fqbn",
			fqbn,
		},
		root_dir = root,
		capabilities = vim.tbl_deep_extend("force", require("blink.cmp").get_lsp_capabilities(), {
			textDocument = { semanticTokens = vim.NIL },
			workspace = { semanticTokens = vim.NIL },
		}),
	}, {
		-- The board is baked into cmd, so the default name+root_dir match would
		-- keep an old client alive after switching boards. Compare cmd too and
		-- :e the buffer to pick up a new fqbn.
		reuse_client = function(client, conf)
			return client.name == conf.name
				and not client:is_stopped()
				and client.config.root_dir == conf.root_dir
				and vim.deep_equal(client.config.cmd, conf.cmd)
		end,
	})
end

return {
	"stevearc/vim-arduino",
	ft = "arduino",
	init = function()
		-- Route :ArduinoChooseBoard and friends through vim.ui.select, which
		-- telescope-ui-select owns here.
		vim.g.arduino_nvim_select_enabled = 1

		-- Upstream default is `screen {port} {baud}`; arduino-cli ships its own
		-- monitor, so that is one less package to install.
		vim.g.arduino_serial_cmd = "arduino-cli monitor -p {port} -c baudrate={baud}"
		vim.g.arduino_serial_baud = 9600
	end,
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ArduinoSetup", { clear = true }),
			pattern = "arduino",
			callback = function(args)
				start_lsp(args.buf)

				local opts = { buffer = args.buf, noremap = true, silent = true }
				vim.keymap.set("n", "<leader>av", ":ArduinoVerify<CR>", opts)
				vim.keymap.set("n", "<leader>au", ":ArduinoUpload<CR>", opts)
				vim.keymap.set("n", "<leader>as", ":ArduinoSerial<CR>", opts)
				vim.keymap.set("n", "<leader>aU", ":ArduinoUploadAndSerial<CR>", opts)
				vim.keymap.set("n", "<leader>aa", ":ArduinoAttach<CR>", opts)
				vim.keymap.set("n", "<leader>ab", ":ArduinoChooseBoard<CR>", opts)
				vim.keymap.set("n", "<leader>ap", ":ArduinoChoosePort<CR>", opts)
				vim.keymap.set("n", "<leader>ai", ":ArduinoInfo<CR>", opts)
			end,
		})
	end,
}
