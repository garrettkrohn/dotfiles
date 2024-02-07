return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = function()
    local theme = function()
      local colors = {
        darkgray = "#16161d",
        gray = "#727169",
        innerbg = nil,
        outerbg = "#16161D",
        normal = "#7e9cd8",
        insert = "#98bb6c",
        visual = "#ffa066",
        replace = "#e46876",
        command = "#e6c384",
      }
      return {
        inactive = {
          a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        visual = {
          a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        replace = {
          a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        normal = {
          a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        insert = {
          a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        command = {
          a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
      }
    end


    local icons = require("config.icons")

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = {
        error = icons.diagnostics.error,
        hint = icons.diagnostics.hint,
        info = icons.diagnostics.info,
        warn = icons.diagnostics.warn,
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


    local c = {
      options = {
        theme = theme(),
      },
      tabline = {
        lualine_a = { "filename" },
        lualine_b = { diff, diagnostics },
        lualine_c = {},
        lualine_x = {},
      },
      sections = {}
    }
    return c
  end
}
