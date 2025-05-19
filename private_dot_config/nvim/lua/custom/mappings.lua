local M = {}

M.custom = {
  n = {
    ["<leader>qo"] = { ":w <bar> %bd <bar> e# <bar> bd# <CR>", "Close all other buffers" },
    ["<leader>o"] = { function ()
          vim.wo.spell = not vim.wo.spell
          vim.cmd("redraw")
          print("Spelling " .. (vim.wo.spell and "enabled" or "disabled"))
      end,
      "Toggle spell",
    },
    ["<leader>qq"] = { "<cmd> cclose <CR>", "Close quickfix" },
    ["<S-Tab>"] = { "<<", "Tab left" },
    ["<C-e>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader><space>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>a"] = { "<C-a>", "Increase number" },
    ["<leader>lh"] = { function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end,
      "Toggle inlay hint"
    },
  },
  i = {
    ["<S-Tab>"] = { "<C-d>", "Tab left" },
  },
}

return M
