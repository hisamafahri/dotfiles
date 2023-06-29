require("nvim-tree").setup({
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
			},
		},
	},
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	view = {
		width = 50,
	},
})
