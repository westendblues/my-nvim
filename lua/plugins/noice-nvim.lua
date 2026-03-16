return {
	"folke/noice.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		notify = {
			enabled = false,
			view = "notify",
		},
		lsp = {
			messages = {
				enabled = true,
				view = "notify",
				opts = {},
			},
		},
		presets = {
			command_palette = {
				views = {
					cmdline_popup = {
						position = {
							row = "50%",
							col = "50%",
						},
						size = {
							min_width = 60,
							width = "auto",
							height = "auto",
						},
					},
					cmdline_popupmenu = {
						position = {
							row = "65%",
							col = "50%",
						},
					},
				},
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
