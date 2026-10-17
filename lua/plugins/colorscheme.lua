-- Tokyo Night: "moon" when dark, "day" when light. Toggle with <leader>ub.
return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      light_style = "day",
      on_highlights = function(hl, c)
        -- VS Code-style green comments, easier to read than the default grey-blue
        local comment_green = vim.o.background == "light" and "#008000" or "#6A9955"
        hl.Comment = { fg = comment_green, italic = true }
        hl["@comment"] = { link = "Comment" }

        -- Unused variables are dimmed grey by default, which is hard to see; make them red.
        hl.DiagnosticUnnecessary = { fg = c.error, undercurl = true, sp = c.error }

        -- Current-scope indent line is blue by default, which looks like OCaml's `|` in a match.
        -- A muted green, a shade dimmer than comments, so it reads as a guide rather than code.
        local scope_green = vim.o.background == "light" and "#7fb67a" or "#4f7a48"
        hl.SnacksIndentScope = { fg = scope_green, nocombine = true }

        -- Inlay hints and the type line above functions: nudged 15% towards the main
        -- text colour so they're a touch easier to read (works in dark and light mode).
        local util = require("tokyonight.util")
        hl.LspInlayHint = { bg = util.blend_bg(c.blue7, 0.1), fg = util.blend(c.fg, 0.2, c.dark3) }
        hl.LspCodeLens = { fg = util.blend(c.fg, 0.2,  c.comment) }
      end,
    },
  },
}
