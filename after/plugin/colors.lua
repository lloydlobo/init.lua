-- 1. Sets color scheme
-- 2. Sets transparant background.

function ColorMyPencils(color)
	color = color or "rose-pine-moon" -- fallback to default `rose-pine` if no `color`.
	vim.cmd.colorscheme(color) -- Sets colorscheme.

	--
	-- `0` sets global space for every window. `Normal` is for vim.
	--

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Sets transparency for background. 

	-- FIXME: This doesn't work. floats still have background.
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- Sets transparency for background floats too. 
end

ColorMyPencils() -- Run `:lua ColorMyPencils()` from anywhere in neovim cmd.
