return {
  'nvim-java/nvim-java',
  ft = { 'java' },
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
