-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- Set <leader>sr to rename symbol with LSPA
vim.api.nvim_set_keymap("n", "<leader>sr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })

local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local function factorized_on_attach(_, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
end

lspconfig.ts_ls.setup     { on_attach = factorized_on_attach }
lspconfig.lua_ls.setup{
  on_attach = factorized_on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
    },
  },
}
lspconfig.bashls.setup       { on_attach = factorized_on_attach }
lspconfig.yamlls.setup       { on_attach = factorized_on_attach }
lspconfig.jdtls.setup        { on_attach = factorized_on_attach , config = require("plugins.jdtls")}
