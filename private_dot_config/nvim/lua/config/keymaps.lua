-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<leader>qo", ":w <bar> %bd <bar> e# <bar> bd# <CR>", { desc = "Close all other buffers" })
map("n", "<leader>o", function()
  vim.wo.spell = not vim.wo.spell
  vim.cmd("redraw")
  print("Spelling " .. (vim.wo.spell and "enabled" or "disabled"))
end, { desc = "Toggle spell" })
map({ "i" }, "<S-Tab>", "<C-d>", { desc = "Tab left" })
map("n", "<M-a>", "<C-a>", { desc = "Increase number" })
