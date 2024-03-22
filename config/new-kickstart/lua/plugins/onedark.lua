return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      -- Set a style preset. 'dark' is default.
      style = 'light', -- dark, darker, cool, deep, warm, warmer, light
      transparent = true,
      -- lualine = {
      --   transparent = true
      -- },
      highlights = {
        -- make floating windows transparent
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        -- but keep background for Lazy and Mason
        -- LazyNormal = { fg = '$fg', bg = '$bg1' },
        -- MasonNormal = { fg = '$fg', bg = '$bg1' },
      }
    }
    require('onedark').load()
  end,
}
