require("neorg").setup({
	load = {
-- Loads default behaviour
		["core.defaults"] = {},
        -- Adds pretty icons to your documents-- configuration here
		["core.concealer"] = {
			config = {
				-- folds = false,
				icon_preset = "varied",
                icons = {
                    code_block = {
                        conceal = true,
                    },
                },
			},
        }, 
	},
})
