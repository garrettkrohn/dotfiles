vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	----------------------------------------------
	--               UTILITIES                 --
	----------------------------------------------
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"numToStr/Comment.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",
	"nvim-lualine/lualine.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder
	{
		"filipdutescu/renamer.nvim",
		branch = "master",
		requires = { { "nvim-lua/plenary.nvim" } },
		-- Lua
	},

	{
		"folke/todo-comments.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "xiyaowong/transparent.nvim" },

	{ "garrettkrohn/harpoon" },
	{
		"FabijanZulj/blame.nvim",
	},
	{
		"NvChad/nvim-colorizer.lua",
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "jsborjesson/vim-uppercase-sql" },

	----------------------------------------------
	--               AUTOCOMPLETION             --
	----------------------------------------------
	{
		{
			"hrsh7th/nvim-cmp",
			lazy = true,
			opts = function(_, opts)
				local cmp = require("cmp")
				opts.completion = {
					completeopt = "menu,menuone,noinsert",
				}
				opts.window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				}
				return opts
			end,
		},
	},
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths

	----------------------------------------------
	--               SNIPPETS                   --
	----------------------------------------------
	"rafamadriz/friendly-snippets", -- useful snippets
	"honza/vim-snippets", -- vim snippets
	"dcampos/nvim-snippy", -- custom snippets
	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim", -- optional
		opts = { snippetDir = vim.fn.stdpath("data") .. "/lazy/friendly-snippets" },
	},
	{ "saadparwaiz1/cmp_luasnip" },

	----------------------------------------------
	--               LSP                        --
	----------------------------------------------
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
	"neovim/nvim-lspconfig", -- easily configure language server
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}, -- enhanced lsp uis

	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
	"L3MON4D3/LuaSnip",
	"VonHeikemen/lsp-zero.nvim",

	----------------------------------------------
	--         FORMATTING AND LINTING           --
	----------------------------------------------
	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

	----------------------------------------------
	--             USER INTERFACE               --
	----------------------------------------------
	-- git integration
	{
		"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
		opts = function()
			local icons = require("config.icons")

			local C = {
				signs = {
					add = { text = icons.git.added },
					change = { text = icons.git.changed },
					delete = { text = icons.git.deleted },
					topdelete = { text = icons.git.deleted },
					changedelete = { text = icons.git.changed },
					untracked = { text = icons.git.added },
				},
				on_attach = function(buffer)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
					end
				end,
			}
			return C
		end,
	},

	{ "catppuccin/nvim", as = "catppuccin" },

	----------------------------------------------
	--                  TOOLS                   --
	----------------------------------------------
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		requires = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "vimwiki/vimwiki" },
	{
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		commit = "8b62563",
		config = function()
			require("rest-nvim").setup({
				ces = {},
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					-- show the generated curl command in case you want to launch
					-- the same request via the terminal (can be verbose)
					show_curl_command = false,
					show_http_info = true,
					show_headers = true,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end,
	},
	{ "diepm/vim-rest-console" },
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
	},
	{ "echasnovski/mini.nvim", branch = "stable" },
	-- add more here
	{
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup()
		end,
	},
	{
		"nvim-java/nvim-java",
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					handlers = {
						["jdtls"] = function()
							require("java").setup()
						end,
					},
				},
			},
		},
	},
	{
		{
			"kristijanhusak/vim-dadbod-ui",
			dependencies = {
				{ "tpope/vim-dadbod", lazy = true },
				{ "kristijanhusak/vim-dadbod-completion", lazy = true, ft = { "sql", "mysql", "plsql" } },
				{ "pbogut/vim-dadbod-ssh", lazy = true },
			},
			cmd = { "DBUI", "DBUIFindBuffer" },
		},
	},

	----------------------------------------------
	--               DEBUGGING                  --
	----------------------------------------------
	-- debugging
	{ "mfussenegger/nvim-dap", commit = "b3d4408" },
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",
	"xdebug/vscode-php-debug",
}, {})

----------------------------------------------
--               CONFIGURATIONS             --
----------------------------------------------
require("config.options")
require("config.keymaps")
require("config.colorscheme")
require("plugins.lspzero")
require("plugins.comment")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.mason")
require("java").setup()
require("plugins.lspsaga")
require("plugins.lspconfig")
require("lspconfig").jdtls.setup({})
require("plugins.null-ls")
require("plugins.autopairs")
require("plugins.treesitter")
require("plugins.gitsigns")
require("plugins.snippy")
require("plugins.replacer")
require("plugins.xdebug")
require("plugins.todo-comments")
require("plugins.rust-tools")
require("plugins.gitsigns")
require("plugins.indentscope")
require("plugins.nvim-cmp")
