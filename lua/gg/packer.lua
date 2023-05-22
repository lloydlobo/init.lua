-- 
-- PACKAGE MANAGER
--

-- NOTE: if you use NixOS don't install mason.nvim

-- Prerquisites: 
-- $ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--
-- [Source](https://github.com/wbthomason/packer.nvim#quickstart)
--
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Tips:
--
-- Select region in <visual> mode and press `=` to align.
--
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim', 
	  as = 'rose-pine',
	  config = function()
	    -- vim.cmd [[set bg=dark]]
	    vim.cmd('colorscheme rose-pine')
	    -- vim.cmd('set bg=dark')
	  end
  })

  use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } )
  use( 'nvim-treesitter/playground') -- `TSPlaygroundToggle` -> (view AST).
  use( 'ThePrimeagen/harpoon' ) -- Getting you where you want with the fewest keystrokes.
  use( 'mbbill/undotree' ) -- undo history visualizer.
  use( 'tpope/vim-fugitive' )

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}

end) -- `:so` Shoutout! (source the file) -> `:PackerSync`
