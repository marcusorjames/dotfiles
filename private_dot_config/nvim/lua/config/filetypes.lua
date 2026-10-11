vim.filetype.add({
  pattern = {
    [".*%.ya?ml"] = function()
      -- CloudFormation detection
      if vim.fn.search("AWSTemplateFormatVersion", "nw") ~= 0 then
        return "yaml.cloudformation"
      end
      -- Ansible detection
      if vim.fn.search("hosts:", "nw") ~= 0
         or vim.fn.search("tasks:", "nw") ~= 0
         or vim.fn.search("roles:", "nw") ~= 0 then
        return "yaml.ansible"
      end
      -- Default to normal YAML
      return "yaml"
    end,
  },
})
