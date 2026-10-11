return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        php_cs_fixer_docker = {
          command = "butler",
          args = {
            "exec",
            "php",
            "tools/php-cs-fixer/vendor/bin/php-cs-fixer",
            "fix",
            "--using-cache=no",
            "$RELATIVE_FILEPATH",
          },
          stdin = false,
        },
      },
      formatters_by_ft = {
        php = { "php_cs_fixer_docker" },
      },
    },
  },
}
