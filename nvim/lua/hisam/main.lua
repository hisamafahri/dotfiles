local vim = vim

vim.g.mapleader = " "

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

return require("lazy").setup({
	-- NOTE: First, some plugins that doesn't require the configuration
	-- Themes
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "sainnhe/gruvbox-material" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	},
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	-- { "akinsho/flutter-tools.nvim", dependencies = "nvim-lua/plenary.nvim" },

	-- Utilities
	{ "mhartington/formatter.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "numToStr/Comment.nvim" },
	{ "windwp/nvim-ts-autotag" },
	{ "akinsho/bufferline.nvim", version = "v3.*" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},

	-- Diagnostics
	{ "yorickpeterse/nvim-pqf" },
	{ "folke/trouble.nvim" },

	-- Debugger
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

	-- Git
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },
	{ "kdheepak/lazygit.nvim" },
	{ "sindrets/diffview.nvim" },

	-- Discovery
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "mbbill/undotree" },
	{ "willthbill/opener.nvim" },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	-- {
	-- 	"folke/flash.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	keys = {
	-- 		{
	-- 			"s",
	-- 			mode = { "n", "x", "o" },
	-- 			function()
	-- 				-- default options: exact mode, multi window, all directions, with a backdrop
	-- 				require("flash").jump()
	-- 			end,
	-- 			desc = "Flash",
	-- 		},
	-- 		{
	-- 			"S",
	-- 			mode = { "n", "o", "x" },
	-- 			function()
	-- 				require("flash").treesitter()
	-- 			end,
	-- 			desc = "Flash Treesitter",
	-- 		},
	-- 		{
	-- 			"r",
	-- 			mode = "o",
	-- 			function()
	-- 				require("flash").remote()
	-- 			end,
	-- 			desc = "Remote Flash",
	-- 		},
	-- 	},
	-- },
})
