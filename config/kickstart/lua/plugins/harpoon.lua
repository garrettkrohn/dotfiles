return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    commit = '2e25a13',
    lazy=false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require("harpoon"):setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true
            }
        })
    end
}
