return {
  'nvim-java/nvim-java',
  enabled = false,
  -- ft = { 'java' },
  opts = {
    java_debug_adapter = {
      enabled = false,
      notifications = {
        dap = true,
      },
    },
  },
  config = function()
    require('java').setup()
    require('lspconfig').jdtls.setup {}
  end,
}
