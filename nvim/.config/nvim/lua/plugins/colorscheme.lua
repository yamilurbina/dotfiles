return {
  -- Dracula colorscheme (Neovim/Lua version with LazyVim integrations)
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      italic_comment = true,
    },
  },

  -- Tell LazyVim to use Dracula instead of its default tokyonight.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
