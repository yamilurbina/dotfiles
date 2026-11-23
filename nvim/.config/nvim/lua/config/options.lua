-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Authenticate GitHub CLI calls made from Neovim (e.g. gh.nvim).
-- Neovim spawns the `gh` binary directly, bypassing the zsh `op plugin run`
-- function, so provide the token from 1Password via GH_TOKEN instead.
if (vim.env.GH_TOKEN == nil or vim.env.GH_TOKEN == "") and vim.fn.executable("op") == 1 then
  local token = vim.fn.trim(vim.fn.system({ "op", "read", "op://Private/Github/add more/token" }))
  if vim.v.shell_error == 0 and token ~= "" then
    vim.env.GH_TOKEN = token
  end
end

