return {
	"wincent/base16-nvim",
	lazy = false, -- load at start
	priority = 1000, -- load at start

	config = function()
		vim.cmd([[colorscheme gruvbox-dark-hard]])
		vim.o.background = "dark"

		local bools = vim.api.nvim_get_hl(0, { name = "Boolean" })
		vim.api.nvim_set_hl(0, "Comment", bools)

		-- Make it clearly visible which argument we're at.
		local marked = vim.api.nvim_get_hl(0, { name = "PMenu" })
		vim.api.nvim_set_hl(
			0,
			"LspSignatureActiveParameter",
			{ fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, bold = true }
		)
	end,
}
