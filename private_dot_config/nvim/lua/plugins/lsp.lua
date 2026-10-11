return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {},
      },
      setup = {
        phpactor = function(_, opts)
          opts.on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end
        end,
      },
    },
  },
}
