return {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup()
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot-cmp").setup()
        end
    }
