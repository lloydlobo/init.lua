-- 
-- LEADER KEY
--
vim.g.mapleader = " " -- (Space as Leader Key)

--
-- LEADER KEYBINDINGS
--

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- <normal> -> `<leader>+p+v` -> `:Ex` (Project view -> Opens Netrw Explorer)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Select and move line below.
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- Select and move line above.

vim.keymap.set("n", "Y", "yg$") -- Copy from cursor position to line end.
vim.keymap.set("n", "J", "mzJ`z") -- keep cursor in same place while appending the line below with space using `J`.
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Half page Jump below and recenter line in window.
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Half page Jump above and recenter line in window.
vim.keymap.set("n", "n", "nzzzv") -- go forward to search terms and recenter.
vim.keymap.set("n", "N", "Nzzzv") -- go previous to search terms and recenter.

-- vim.:cmd([[:stop]]) -- CTRL-Z -- Suspend Nvim, like ":stop".
vim.keymap.set("n", "<leader>gg", function ()
    vim.cmd([[:terminal gitui]]) -- Open gitui in a terminal buffer.
end)


-- [0 to LSP] 25:25 minute mark
--
-- :%s\/(./)noremap(/vim.keymap.set("\1",
-- :%s -- do it for entire file.
-- /\(.\) -- everything that has a `.` (dot). Looks like a fighting one-eyed curvy. e.g. vnoremap("J"...
-- <word_to_replace> -- do not use `<`/`>` while entering the word.
-- (/<word_to_replace_with>"\1 -- suffix with `"` and the first letter (dot) char we skipped earlier. so `"v` e.g. vim.keymap.set("v"...
