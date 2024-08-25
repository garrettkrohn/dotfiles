-- cSpell:words gitsigns nvim topdelete changedelete keymap stylua diffthis
return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = function()
		local icons = require("config.icons")

		local C = {
			signs = {
				add = { text = icons.git.added },
				change = { text = icons.git.changed },
				delete = { text = icons.git.deleted },
				topdelete = { text = icons.git.deleted },
				changedelete = { text = icons.git.changed },
				untracked = { text = icons.git.added },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end
			end,
		}
		return C
	end,
}
