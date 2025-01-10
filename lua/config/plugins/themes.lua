-- return {
-- 	"rebelot/kanagawa.nvim",
--
-- 	config = function()
-- 		vim.cmd("colorscheme kanagawa")
-- 	end,
-- }
return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		vim.o.background = "dark"
		vim.cmd([[colorscheme gruvbox]])
	end,
	opts = ...,
}
