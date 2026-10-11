return {
  {
    "saghen/blink.cmp",
    opts = {
      -- No completion while doing :Tutor exercises; it only suggests words from the tutorial text.
      enabled = function()
        return vim.bo.filetype ~= "tutor"
      end,
      completion = {
        menu = {
          -- Don't pop up when editing inside an existing word (a word character right after the cursor).
          -- <C-space> still opens it manually.
          auto_show = function(ctx)
            local next_char = ctx.line:sub(ctx.cursor[2] + 1, ctx.cursor[2] + 1)
            return not next_char:match("[%w_]")
          end,
        },
      },
    },
  },
}
