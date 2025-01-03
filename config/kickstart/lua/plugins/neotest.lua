return {
  lazy = false,
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/neotest-jest',
  },
  config = function()
    ---@diagnostic disable: missing-fields
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'yarn test --',
          jestConfigFile = 'jest.config.js',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
      },
    }
  end,
}
