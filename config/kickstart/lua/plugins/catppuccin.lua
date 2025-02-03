return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  flavour = 'mocha',
  transparent_background = true,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {
        all = {
          base = '#141415',
          mantle = '#252530',
          surface0 = '#252530',
          surface1 = '#252530',
          surface2 = '#252530',
          text = '#cdcdcd',
          rosewater = '#e8b589',
          lavender = '#7e98e8',
          red = '#df6882',
          peach = '#f3be7c',
          yellow = '#f3be7c',
          green = '#8cb66d',
          teal = '#b4d4cf',
          blue = '#7e98e8',
          mauve = '#bb9dbd',
          flamingo = '#df6882',
          maroon = '#df6882',
          sky = '#f3be7c',
          pink = '#bb9dbd',
          sapphire = '#7e98e8',
          subtext1 = '#aeaed1',
          subtext0 = '#c3c3d5',
          overlay2 = '#606079',
          overlay1 = '#606079',
          overlay0 = '#606079',
          crust = '#141415',
        },
      },
      custom_highlights = {
        LineNr = { fg = '#f8f8f2' },
      },
      default_integrations = true,
      integrations = {
        blink_cmp = true,
        cmp = true,
        diffview = true,
        gitsigns = true,
        mason = true,
        neotest = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }

    -- setup must be called before loading
    vim.cmd.colorscheme 'catppuccin'
  end,
}
