-- LazyVim's terminal (Ctrl-/, Option-t, <leader>ft) needs Esc pressed twice to reach normal mode.
-- Make a single Esc do it. Trade-off: programs running inside the terminal no longer receive Esc.
return {
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        terminal = {
          keys = {
            term_normal = {
              "<esc>",
              function()
                vim.cmd("stopinsert")
              end,
              mode = "t",
              expr = false,
              desc = "Escape to normal mode",
            },
          },
        },
      },
    },
  },
}
