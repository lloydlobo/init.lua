--
-- LSP 
--

-- https://github.com/VonHeikemen/lsp-zero.nvim#usage
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- NOTE: `.ensure_installed()` will be removed. Use the module mason-lspconfig to install LSP servers.
lsp.ensure_installed({ 'tsserver', 'eslint', 'lua_ls', 'rust_analyzer',})

-- Fix Undefined global 'vim'.
lsp.nvim_workspace()

-- Manual setup. 
-- NOTE: if you use NixOS don't install mason.nvim.
-- When you don't have mason.nvim installed. You'll need to list the servers installed in your system.
lsp.setup_servers({'tsserver', 'eslint', 'lua_ls', 'rust_analyzer'})

-- Run `:LspInstall` and select the option Mason presents.
-- To make sure lua_ls can detect the "root directory" of our config we need to create a file
-- called `.luarc.json` in the Neovim config folder. This file can be empty, it just need to exists.
--
-- NOTE: Add this before the setup function of lsp-zero.
-- If you wanted to, you could setup lua_ls specifically for Neovim, all with one line of code.
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Defines the sign icons that appear in the gutter.
lsp.set_sign_icons({
  error = 'E',-- ✘
  warn = 'W',-- ▲
  hint = 'H', -- ⚑
  info = 'I' -- »
})

lsp.setup()

--
-- CMP
--

-- NOTE: You need to setup `cmp` after `lsp-zero`.
local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  -- NOTE: To add more keybindings I recommend you use nvim-cmp directly.
  mapping = {
    -- `Enter` key to confirm completion. If you want to confirm without selecting the item, use this.
    ['C-y'] = cmp.mapping.confirm({select = true}), -- default: <CR> = ... {select = false}
                                                    -- Enter will only confirm the selected item. You need to select the item before pressing enter.

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-n>'] = cmp_action.luasnip_jump_forward(), -- default: '<C-f>'
    ['<C-p>'] = cmp_action.luasnip_jump_backward(),-- default: '<C-b>'
  }
})

--local cmp_mappings = lsp.defaults.cmp_mappings({
--  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--  ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- `Ctrl+y` key to confirm completion
--  ["<C-Space>"] = cmp.mapping.complete(), -- Ctrl+Space to trigger completion menu
--})

vim.diagnostic.config({
  virtual_text = true
})

-- TODO:
--
-- - [ ] .ensure_installed() will be removed. Use the module mason-lspconfig to install LSP servers.
--		  {'williamboman/mason-lspconfig.nvim'},
--
-- - [ ] I would like to get rid of named preset in the future. It's better if you use the default preset, the minimal. I would advice against using the one called "recommended". Just add your settings using the .preset() function.
--
-- v v v v
--  v v v
--    v    
--
-- NOTE: 
-- [Source](https://github.com/VonHeikemen/lsp-zero.nvim#future-changesdeprecation-notice)
-- > I would like to get rid of named preset in the future. It's better if you use the
-- default preset, the minimal. I would advice against using the one called "recommended". Just
-- add your settings using the .preset() function.
--
-- Future Changes/Deprecation notice
-- Settings and functions that will change in case I feel forced to created a v3.x branch.
-- 
-- 
-- set_lsp_keymaps will be removed in favor of .default_keymaps().
-- manage_nvim_cmp will be removed in favor of .extend_cmp().
-- setup_servers_on_start will be removed. LSP servers will need to be listed explicitly using .setup_servers().
-- call_servers will be removed in favor of a explicit setup.
-- configure_diagnostics will be removed.
-- Functions
-- .set_preferences() will be removed in favor of overriding option directly in .preset.
-- .setup_nvim_cmp() will be removed. Use the cmp module to customize nvim-cmp.
-- .setup_servers() will no longer take an options argument. It'll only be a convenient way to initialize a list of servers.
-- .default.diagnostics() will be removed. Diagnostic config has been reduced, only severity_sort and borders are enabled. There is no need for this anymore.
-- .defaults.cmp_sources() will be removed. Sources for nvim-cmp will be handled by the user.
-- .defaults.cmp_mappings() will be removed. In the future only the defaults that align with Neovim's behavior will be configured. lsp-zero default functions for nvim-cmp will have to be added manually by the user.
-- .nvim_workspace() will be removed. Use .nvim_lua_ls() to get the config and then use .configure() to setup the server.
-- .defaults.nvim_workspace() will be replaced by .nvim_lua_ls().
-- .ensure_installed() will be removed. Use the module mason-lspconfig to install LSP servers.
-- .extend_lspconfig() will be removed.
