return {
  -- Errors: inline at the end of other lines, but on the cursor's line show the full
  -- message underneath instead, so long messages don't run off the screen.
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = { current_line = false },
        virtual_lines = { current_line = true },
      },
    },
  },
}
