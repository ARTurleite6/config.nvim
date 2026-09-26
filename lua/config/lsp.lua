vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig", -- default configs for lsps

	-- NOTE: if you'd rather install the lsps through your OS package manager you
	-- can delete the next three mason-related lines and their setup calls below.
	-- see `:h lsp-quickstart` for more details.
	"https://github.com/mason-org/mason.nvim", -- package manager
	"https://github.com/mason-org/mason-lspconfig.nvim", -- lspconfig bridge
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", -- auto installer
}, { confirm = false })

local lsp_servers = {
	lua_ls = {
		-- https://luals.github.io/wiki/settings/ | `:h nvim_get_runtime_file`
		Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) } },
	},
	clangd = {},
	rust_analyzer = {},
  ols = {
    cmd = {"ols"}
  }
}

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = vim.tbl_keys(lsp_servers),
})

for server, config in pairs(lsp_servers) do
	vim.lsp.config(server, {
		settings = config,

		on_attach = function(_, bufnr)
			vim.keymap.set("n", "grf", vim.lsp.buf.format, { buffer = bufnr, desc = "vim.lsp.buf.format()" })
		end,
	})
end

-- format on save
local format_group = vim.api.nvim_create_augroup("lsp-format-on-save", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = format_group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client or not client:supports_method("textDocument/formatting") then
			return
		end

		vim.api.nvim_clear_autocmds({ group = format_group, buffer = args.buf })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = format_group,
			buffer = args.buf,
			callback = function()
				if vim.g.disable_autoformat or vim.b[args.buf].disable_autoformat then
					return
				end
				vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 1000 })
			end,
		})
	end,
})

vim.api.nvim_create_user_command("FormatToggle", function(opts)
	if opts.bang then
		vim.b.disable_autoformat = not vim.b.disable_autoformat
	else
		vim.g.disable_autoformat = not vim.g.disable_autoformat
	end
end, { bang = true, desc = "Toggle format on save (! = buffer only)" })
