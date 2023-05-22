--
-- LEADER KEY
--
vim.g.mapleader = " " -- (Space as Leader Key)

--
-- LEADER KEYBINDINGS
--

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- <normal> -> `<leader>+p+v` -> `:Ex` (Project view -> Opens Netrw Explorer)

-- PERF: How to handle moving multiple lines up?
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Select and move line below.
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- Select and move line above.

vim.keymap.set("n", "Y", "yg$")              -- Copy from cursor position to line end.
vim.keymap.set("n", "J", "mzJ`z")            -- keep cursor in same place while appending the line below with space using `J`.
vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- Half page Jump below and recenter line in window.
vim.keymap.set("n", "<C-u>", "<C-u>zz")      -- Half page Jump above and recenter line in window.
vim.keymap.set("n", "n", "nzzzv")            -- go forward to search terms and recenter.
vim.keymap.set("n", "N", "Nzzzv")            -- go previous to search terms and recenter.

-- vim.:cmd([[:stop]]) -- CTRL-Z -- Suspend Nvim, like ":stop".
vim.keymap.set("n", "<leader>gg", function()
    vim.cmd([[:terminal gitui]]) -- Open gitui in a terminal buffer.
end)

vim.keymap.set("x", "<leader>p", "\"_dP") -- Retain highlighted copied buffer while pasting over another term.

-- system clipboard. yank and Ctrl+v. Separate buffers to hold clipboard. @asbjornHaland.
-- `y/Y` only for vim AND `<leader> + y/Y` for system clipboard.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Deleting to void register.
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- eg: vertical edit mode, doesn't save changes vertically, Escape does
vim.keymap.set("i", "<C-c>", "<Esc>") -- C-c to exit. (old habits die hard)

vim.keymap.set("n", "Q", "<nop>")     -- Never press Q.

-- NOTE: Use tree for now.
--
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-f>t", "<cmd>!tree<CR>") -- Show directories file tree structure.
vim.keymap.set("n", "<C-f>d", "<cmd>!fd<CR>")   -- List all files in current directory.
vim.keymap.set("n", "<C-f>d", "<cmd>!zellij run -- <CR>")

vim.keymap.set('n', '<leader>tz', function()
    local prompt = vim.fn.input("zellij run -- ") -- grep_string (provides search term which is an vim function input.
    -- TODO: something ling this :split term://node " . a:filename.
    print(prompt)
    --vim.cmd([["!zellij run -- " + prompt]])
end) -- <normal> -> `<leader>+p+s` -> `:Telescope grep_string` (Grep search term project).

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Display the [count] previous/next error in the list that includes a file
-- name. If there are no file names at all, go to the [count] previous/next error.
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- Same as ":cnext", except the location list for the current window is used
-- instead of the quickfix list.
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace string under cursor globally.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>") -- Make file executable.

-- Edit [v]im [p]lugins [p]acker/[p]lugin file.
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/gg/packer.lua<CR>")

-- Source file ShoutOut!!!
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- EOF --

-- [0 to LSP] 25:25 minute mark
--
-- :%s\/(./)noremap(/vim.keymap.set("\1",
-- :%s -- do it for entire file.
-- /\(.\) -- everything that has a `.` (dot). Looks like a fighting one-eyed curvy. e.g. vnoremap("J"...
-- <word_to_replace> -- do not use `<`/`>` while entering the word.
-- (/<word_to_replace_with>"\1 -- suffix with `"` and the first letter (dot) char we skipped earlier. so `"v` e.g. vim.keymap.set("v"...
