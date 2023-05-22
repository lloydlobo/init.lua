--
-- PACKAGE MANAGER
--

-- NOTE: if you use NixOS don't install mason.nvim
-- Prerquisites:
-- $ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
--   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- [Source](https://github.com/wbthomason/packer.nvim#quickstart)
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim') -- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')    -- `TSPlaygroundToggle` -> (view AST).
    use('ThePrimeagen/harpoon')          -- Getting you where you want with the fewest keystrokes.
    use({
        "ThePrimeagen/refactoring.nvim", -- The Refactoring library based off the Refactoring book by Martin Fowler
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    })
    use('mbbill/undotree')                         -- undo history visualizer.
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')                 -- Adds git releated signs to the gutter, as well as utilities for managing changes
    use('nvim-treesitter/nvim-treesitter-context') -- sticky parent function/module/.. name on scroll.

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },                                                                 -- Required
            { 'williamboman/mason.nvim',          run = function() pcall(vim.cmd, 'MasonUpdate') end, }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' },                                                     -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    })

    use({
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim', -- See `:help lualine.txt`
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })


    use("folke/zen-mode.nvim")
    --use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim") --  overlay *'s (or any other character) over defined patterns in defined files. It also disables 'cmp' for the buffer(if it is installed).
end)                         -- `:so` Shoutout! (source the file) -> `:PackerSync`
