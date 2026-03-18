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
							row = "40%",
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
							row = "60%",
							col = "50%",
						},
						size = {
							min_width = 60,
							width = "auto",
							height = "auto",
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
