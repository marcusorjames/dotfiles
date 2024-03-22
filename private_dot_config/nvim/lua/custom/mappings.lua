local M = {}

M.custom = {
  n = {
    ["<leader>o"] = { function ()
          vim.wo.spell = not vim.wo.spell
          vim.cmd("redraw")
          print("Spelling " .. (vim.wo.spell and "enabled" or "disabled"))
      end,
      "Toggle spell",
    }
  }
}

return M
