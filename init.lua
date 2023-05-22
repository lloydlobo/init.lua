require("gg")
vim.cmd [[set bg=dark]]
print("hello from nvim/init.lua") -- debug.
vim.cmd [[colorscheme rose-pine-moon]]

--
-- CHEATSHEET
--

-- :Ex -- Netrw Explorer.
-- % -- Create new file when in Netrw window.
-- :so -- *:so* *:source* *load-vim-script* :[range]so[urce] [file]	
       -- Runs |Ex| commands or Lua code (".lua" files) from [file], or current buffer if no [file].
       -- Triggers the |SourcePre| autocommand.
