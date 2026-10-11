return {
  "ThePrimeagen/harpoon",
  keys = function()
    local harpoon = require("harpoon")
    local keys = {
      {
        "<leader>A",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>a",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
    }

    -- leader keys for files 1–5
    local jump_keys = { "j", "k", "l", ";", "'" }
    for i, key in ipairs(jump_keys) do
      table.insert(keys, {
        "<leader>" .. key,
        function()
          harpoon:list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end

    return keys
  end,
}
