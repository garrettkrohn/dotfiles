-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local icons = require("config.icons")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = {
		error = icons.diagnostics.Error,
		hint = icons.diagnostics.Hint,
		info = icons.diagnostics.Info,
		warn = icons.diagnostics.Warn,
	},
	colored = true,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	symbols = {
		added = icons.git.added .. " ",
		untracked = icons.git.added .. " ",
		modified = icons.git.changed .. " ",
		removed = icons.git.deleted .. " ",
	},
	colored = true,
	always_visible = false,
	source = function()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end,
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = require("plugins.lualineTheme").theme(),
	},
	sections = {
		lualine_c = { diff, diagnostics },
		lualine_x = {},
	},
})
