local M = {}

M.custom = {
  n = {
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
  },
  i = {
    ["<S-Tab>"] = { "<C-d>", "Tab left" },
  },
}

return M
