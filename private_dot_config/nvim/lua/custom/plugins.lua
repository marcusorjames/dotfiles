local plugins = {
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettier",
        "typescript-language-server",
        "lua-language-server",
        "phpactor",
        "php-cs-fixer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
      },
    },
  },
  {
    "motosir/skel-nvim",
    event = "VeryLazy",
    config = function()
      require("skel-nvim").setup{
        mappings = {
          ['*.php'] = {"default.php.skel", "class.php.skel"},
          -- patterns can map to multiple templates
          ['LICENSE'] = {"license.mit.skel", "license.gpl.skel" }
        }
      }
    end,
  },
}
return plugins
