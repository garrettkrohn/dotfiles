return {
    -- enabled = false,
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "rcasia/neotest-java"
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-java")({
                    ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
                    junit_jar = "/Users/gkrohn/.local/share/kickstart/neotest-java/junit-platform-console-standalone-1.10.1.jar"
                    -- default: .local/share/nvim/neotest-java/junit-platform-console-standalone-[version].jar
                })
            }
        })
    end,
    event = "BufEnter *.java"
}
