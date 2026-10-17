-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { desc = "Leave insert mode" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Leave terminal mode" })
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File (Cmd-s)" })

-- Option-t toggles the terminal like Ctrl-/, but without macOS's beep in Alacritty.
-- A count picks which terminal: 2<A-t> opens a second one alongside.
vim.keymap.set({ "n", "t" }, "<A-t>", function()
  Snacks.terminal.focus(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })
