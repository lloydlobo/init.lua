-- 
-- PACKAGE MANAGER
--

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
	    vim.cmd('colorscheme rose-pine-moon')
	    -- vim.cmd('set bg=dark')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
end) -- `:so` Shoutout! (source the file) -> `:PackerSync`
