return {
  -- `util.dot` enables bashls, but its Mason installer needs npm.
  -- Skip it until Node/npm is available on PATH.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = vim.fn.executable("npm") == 1 and {} or { enabled = false },
      },
    },
  },
}
