return {
  'nvim-java/nvim-java',
  lazy = false,
  opts = {
    java_debug_adapter = {
      enabled = true,
      notifications = {
        dap = false,
      },
    },
  },
  config = function()
    require('java').setup()
    require('lspconfig').jdtls.setup {}
  end,
}
