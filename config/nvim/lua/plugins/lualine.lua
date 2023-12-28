-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
-- local lualine_nightfly = require("lualine.themes.nightfly")
--
-- -- new colors for theme
-- local new_colors = {
-- 	blue = "#65D1FF",
-- 	green = "#3EFFDC",
-- 	violet = "#FF61EF",
-- 	yellow = "#FFDA7B",
-- 	black = "#000000",
-- 	transparent = nil,
-- }
--
-- -- change nightlfy theme colors
-- lualine_nightfly.normal.a.bg = new_colors.blue
-- lualine_nightfly.insert.a.bg = new_colors.green
-- lualine_nightfly.visual.a.bg = new_colors.violet
-- lualine_nightfly.command = {
-- 	a = {
-- 		gui = "bold",
-- 		bg = new_colors.yellow,
-- 		fg = new_colors.black,
-- 	},
-- }

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
