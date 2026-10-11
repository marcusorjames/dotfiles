return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = opts.linters_by_ft or {}

    -- CloudFormation (keep what you already had)
    opts.linters_by_ft["yaml.cloudformation"] = { "cfn_lint" }
    opts.linters_by_ft["json.cloudformation"] = { "cfn_lint" }

    -- PHP: ONLY phpstan (disable phpcs)
    opts.linters_by_ft.php = {}
    -- opts.linters_by_ft.php = { "phpstan" }
  end,
}
