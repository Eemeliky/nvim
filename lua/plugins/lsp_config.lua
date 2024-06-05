return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				PATH = "prepend", -- "skip" seems to cause the spawning error
				ensure_installed = { "clangd", "jdtls", "lua_ls", "pyright" },
			})
		end,
	},
	{
		"williamboman/nvim-lsp-installer",
		config = function()
			require("nvim-lsp-installer").setup({
				automatic_installation = true,
				ui = {
					icons = {
						server_installed = "✓",
						server_pending = "➜",
						server_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({
				cmd = { "clangd", "--query-driver=C:/msys64/mingw64/bin/gcc.exe" },
				capabilities = capabilities,
        on_attach = on_attach,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
        on_attach = on_attach,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
        on_attach = on_attach,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
        on_attach = on_attach,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
