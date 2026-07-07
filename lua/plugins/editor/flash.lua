return {
	"folke/flash.nvim",
	event = "VeryLazy",
	config = function()
		require("flash").setup({
			modes = {
				search = {
					enabled = false,
				},
			},
			prompt = {
				enabled = true,
				prefix = { { " ", "FlashPromptIcon" } },
				win_config = {
					relative = "editor",
					width = 1,
					height = 1,
					row = -1,
					col = 0,
					zindex = 1000,
				},
			},
		})
	end,
}
