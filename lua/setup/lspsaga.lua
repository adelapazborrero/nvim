local saga = require("lspsaga")

saga.setup({
	ui = {
		-- currently only round theme
		theme = "round",
		title = true,
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = "",
		diagnostic = "󰨮",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal background color
			-- normal_bg = "#2d353b",
			--title background color
			-- title_bg = "#83c092",
			-- red = "#ca7275",
			-- magenta = "#b33076",
			-- orange = "#e49774",
			-- yellow = "#edd96f",
			-- green = "#afd700",
			-- cyan = "#36d0e0",
			-- blue = "#61afef",
			-- purple = "#CBA6F7",
			-- white = "#d1d4cf",
			-- black = "#1c1c19",
		},
		kind = {},
	},
	-- Options with default value
	-- "single" | "double" | "rounded" | "bold" | "plus"
	border_style = "rounded",
	--the range of 0 for fully opaque window (disabled) to 100 for fully
	--transparent background. Values between 0-30 are typically most useful.
	saga_winblend = 0,
	-- when cursor in saga window you config these to move
	move_in_saga = { prev = "<C-j>", next = "<C-k>" },
	-- Error, Warn, Info, Hint
	-- use emoji like
	-- { "🙀", "😿", "😾", "😺" }
	-- or
	-- { "😡", "😥", "😤", "😐" }
	-- and diagnostic_header can be a function type
	-- must return a string and when diagnostic_header
	-- is function type it will have a param `entry`
	-- entry is a table type has these filed
	-- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
	diagnostic_header = { "  ", "  ", "  ", "  " },
	-- show diagnostic source
	-- show_diagnostic_source = true,
	-- add bracket or something with diagnostic source, just have 2 elements
	-- diagnostic_source_bracket = {},
	-- use emoji lightbulb in default
	code_action_icon = "",
	-- if true can press number to execute the codeaction in codeaction window
	code_action_num_shortcut = true,
	-- same as nvim-lightbulb but async
	code_action_lightbulb = {
		enable = false,
		enable_in_insert = false,
		sign = false,
		sign_priority = 20,
		virtual_text = false,
	},
	lightbulb = {
		enable = false,
		enable_in_insert = false,
		sign = true,
		sign_priority = 40,
		virtual_text = false,
	},
	-- finder icons
	finder_icons = {
		def = "  ",
		ref = "  ",
		link = "󰿳 ",
	},
	lines = { "┗", "┣", "┃", "━", "┏" },
	-- preview lines of lsp_finder and definition preview
	max_preview_lines = 20,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	rename_action_quit = "<C-c>",
	-- definition_preview_icon = "  ",
	-- show symbols in winbar must nightly
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = " ",
		show_file = true,
		click_support = false,
	},
	-- show outline
	show_outline = {
		win_position = "right",
		-- set the special filetype in there which in left like nvimtree neotree defx
		left_with = "",
		win_width = 30,
		auto_enter = true,
		auto_preview = true,
		virt_text = "┃",
		jump_key = "o",
		-- auto refresh when change buffer
		auto_refresh = true,
	},
	-- if you don't use nvim-lspconfig you must pass your server name and
	-- the related filetypes into this table
	-- like server_filetype_map = { metals = { "sbt", "scala" } }
	server_filetype_map = {},
})
