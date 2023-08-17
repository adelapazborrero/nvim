require("notify").setup({
	stages = "static",
	fps = 30,
	on_open = nil,
	on_close = nil,
	render = "compact",
	timeout = 5000,

	background_colour = "NotifyBackground",
	minimum_width = 50,
	icons = {
		ERROR = " ",
		WARN = " ",
		INFO = " ",
		DEBUG = " ",
		TRACE = " ✎",
	},
})
