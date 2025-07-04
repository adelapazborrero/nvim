require("nvim-lsp-installer").setup({
	ensure_installed = {
		"gopls",
		"sumneko_lua",
		"yamlls",
		"jsonls",
		"tsserver",
	},
	automatic_installation = false,

	ui = {
		check_outdated_servers_on_open = true,
		border = "rounded",

		icons = {
			server_installed = "✓",
			server_pending = "",
			server_uninstalled = "✗",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
		},
	},

	pip = {
		install_args = {},
	},

	log_level = vim.log.levels.INFO,

	max_concurrent_installers = 4,

	github = {
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},
})
