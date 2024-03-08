return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            "efm",

            -- cpp
            "clangd",
            -- python
            "pyright",
            -- lua
            "lua-language-server",
            "stylua",
            -- sql
            "sqls",
            "sql-formatter",
            -- other
            "bash-language-server",
            "json-lsp",
        },
        auto_update = true,
        run_on_start = true,
    },
	dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    }
}
