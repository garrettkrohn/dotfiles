local bufferline = require("bufferline")
bufferline.setup({
	options = {
		mode = "buffers",
		separator_style = "thick",
		always_show_bufferline = false,
		show_buffer_close_icons = true,
		show_close_icon = true,
		color_icons = true,
		close_icons = true,
		buffer_close_icon = "X",
	},
	highlights = {
		separator = {
			guifg = "#073642",
			guibg = "#002b36",
		},
		separator_selected = {
			guifg = "#073642",
		},
		background = {
			guifg = "#657b83",
			guibg = "#002b36",
		},
		buffer_selected = {
			guifg = "#fdf6e3",
			gui = "bold",
		},
		fill = {
			guibg = "#073642",
		},
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
