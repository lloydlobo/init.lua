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

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

end) -- `:so` to install -> `:PackerSync`

