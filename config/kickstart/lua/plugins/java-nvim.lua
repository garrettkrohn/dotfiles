-- old way
-- return {
--     'nvim-java/nvim-java',
--     lazy = true,
--     dependencies = {
--         'nvim-java/lua-async-await',
--         'nvim-java/nvim-java-core',
--         'nvim-java/nvim-java-test',
--         'nvim-java/nvim-java-dap',
--         'MunifTanjim/nui.nvim',
--         'neovim/nvim-lspconfig',
--         'mfussenegger/nvim-dap',
--         {
--             'williamboman/mason.nvim',
--             opts = {
--                 registries = {
--                     'github:nvim-java/mason-registry',
--                     'github:mason-org/mason-registry',
--                 }
--             }
--         },
--         {
--             "williamboman/mason-lspconfig.nvim",
--             opts = {
--                 handlers = {
--                     ["jdtls"] = function()
--                         require("java").setup()
--                         require("lspconfig").jdtls.setup({})
--                     end,
--                 },
--             },
--         },
--     },
-- }
--


-- new way?
return {
    "nvim-java/nvim-java",
    lazy = false,
    opts = {
        java_debug_adapter = {
            enabled = true
        }
    },
    config = function()
        require('java').setup()
        require('lspconfig').jdtls.setup({})
    end
}
