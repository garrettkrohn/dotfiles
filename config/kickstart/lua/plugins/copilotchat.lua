return
{
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    branch = "canary",
    dependencies = {
        { "zbirenbaum/copilot.lua" },     -- or github/copilot.vim
        { "nvim-lua/plenary.nvim" },      -- for curl, log wrapper
    },
    opts = {
        debug = true,     -- Enable debugging
        -- See Configuration section for rest
    },
    config = function()
        require("CopilotChat").setup {
            debug = true,
        }
    end
}
