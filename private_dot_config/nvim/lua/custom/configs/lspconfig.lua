local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local servers = { "tsserver", "twiggy_language_server", "phpactor", "gopls", "ansiblels", "marksman", "tailwindcss" }

lspconfig.tsserver.setup {
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
      importModuleSpecifierPreference = 'non-relative'
    },
  },
}

lspconfig.phpactor.setup{
  init_options = {
    ["language_server_phpstan.enabled"] = true,
    ["language_server_psalm.enabled"] = false,
    ["language_server_worse_reflection.inlay_hints.enable"] = false,
    ["language_server_worse_reflection.inlay_hints.params"] = true,
    ["language_server_worse_reflection.inlay_hints.types"] = false,
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
