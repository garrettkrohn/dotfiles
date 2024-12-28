return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      preset = {
        header = [[
          ██████╗ ██████╗        ██╗   ██╗██╗███╗   ███╗
          ██╔══██╗██╔══██╗       ██║   ██║██║████╗ ████║
          ██║  ██║██████╔╝       ██║   ██║██║██╔████╔██║
          ██║  ██║██╔══██╗       ╚██╗ ██╔╝██║██║╚██╔╝██║
          ██████╔╝██║  ██║██╗     ╚████╔╝ ██║██║ ╚═╝ ██║
          ╚═════╝ ╚═╝  ╚═╝╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
      },
    },
    indent = {
      enabled = true,
    },
    ---@class snacks.lazygit.Config: snacks.terminal.Opts
    ---@field args? string[]
    ---@field theme? snacks.lazygit.Theme
    lazygit = {
      enabled = true,
      configure = true,
    },
    scratch = {
      enabled = true,
    },
  },
  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
  },
}
