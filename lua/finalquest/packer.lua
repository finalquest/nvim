local fn = vim.fn
local status_ok, packer = pcall(require, "packer")
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- Automatically install packer
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
if not status_ok then
	return
end

vim.cmd [[packadd packer.nvim]]


return packer.startup(function(use)
  -- Have packer manage itself
  use("wbthomason/packer.nvim")
  use("simrat39/symbols-outline.nvim")

  -- TJ created lodash of neovim
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("ThePrimeagen/git-worktree.nvim")
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {"nvim-telescope/telescope.nvim", branch='0.1.x'}
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })
    
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind-nvim")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use({"glepnir/lspsaga.nvim", branch="main"})  

  -- linting
  --
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")
  
  --autoclose
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  use("numToStr/Comment.nvim")
  use("nvim-treesitter/playground")
  use("romgrk/nvim-treesitter-context")
  -- tree
  use ('nvim-tree/nvim-web-devicons')
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }	
  -- Colorschemes
	use("folke/tokyonight.nvim")
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim'}
  }
  use("lewis6991/gitsigns.nvim")
 -- Automatically set up your configuration after cloning packer.nvim
 -- Put this at the end after all plugins
 if PACKER_BOOTSTRAP then
     require("packer").sync()
 end
end)
