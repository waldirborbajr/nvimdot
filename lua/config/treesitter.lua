require"nvim-treesitter.configs".setup(
  {
    ensure_installed = {
      "dockerfile",
      "elm",
      "fish",
      "go",
      "gomod",
      "html",
      "javascript",
      "css",
      "json",
      "lua",
      "python",
      "regex",
      "scss",
      "toml",
      "tsx",
      "typescript",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>is",
        node_incremental = "+",
        scope_incremental = "w",
        node_decremental = "-",
      },
    },
    highlight = {enable = true, disable = {}},
    indent = {enable = true},
  }
)
