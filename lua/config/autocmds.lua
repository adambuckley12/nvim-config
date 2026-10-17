-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- :Tutor puts a sign-less extmark on each exercise line at the same priority as its ✗/✓ sign,
-- and Snacks' statuscolumn picks the empty one. The built-in sign column shows both.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tutor",
  callback = function()
    vim.opt_local.statuscolumn = ""
  end,
})

-- Auto-save real files when leaving insert mode or switching away from Neovim
vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost" }, {
  desc = "Auto-save",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.bo.modifiable and not vim.bo.readonly and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})
