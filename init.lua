require("gg")

-- EOF --

-- print("hello from nvim/init.lua") -- debug.

--
-- CHEATSHEET
--

-- :Ex -- Netrw Explorer.
-- % -- Create new file when in Netrw window.
-- :so -- *:so* *:source* *load-vim-script* :[range]so[urce] [file]	
       -- Runs |Ex| commands or Lua code (".lua" files) from [file], or current buffer if no [file].
       -- Triggers the |SourcePre| autocommand.
-- :s/<from>/<to>/g -- Find & Replace, all words after cursor.
-- = -- Indents selection(s) or line.

---
--- OS PREFERENCES
---

-- Set Dark Theme GTK for Linux
--
-- Firefox uses the GTK theme settings. On sway set the setting gtk-application-prefer-dark-theme to 1 to get Firefox and GTK apps to use a dark theme by default.
-- Edit (or create if it doesn't exist) the following file: ~/.config/gtk-3.0/settings.ini
-- To look something like this:
-- ```ini
-- [Settings]
-- gtk-application-prefer-dark-theme=1
-- After that firefox and GTK apps were dark by default. It will likely require a restart of the application in the case of them already running.
-- ```

--
-- GIT REFERENCES
--

-- git log -S <filename> 
-- git add -p -- patch (selects hunk interactively to stage)
