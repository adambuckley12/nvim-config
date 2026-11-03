-- Tokyo Night: "moon" when dark, "day" when light. Toggle with <leader>ub.
return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      light_style = "day",
      on_highlights = function(hl, c)
        local util = require("tokyonight.util")

        -- VS Code-style green comments, easier to read than the default grey-blue,
        -- blended 15% into the background so they don't compete with the code
        local comment_green = vim.o.background == "light" and "#008000" or "#6A9955"
        hl.Comment = { fg = util.blend(comment_green, 0.85, c.bg), italic = true }
        hl["@comment"] = { link = "Comment" }

        -- Strings: the theme's green, muted a little
        hl.String = { fg = util.blend(c.green, 0.9, c.bg) }
        hl["@string"] = { link = "String" }

        -- Unused variables are dimmed grey by default, which is hard to see; make them red.
        hl.DiagnosticUnnecessary = { fg = c.error, undercurl = true, sp = c.error }

        -- Current-scope indent line is blue by default, which looks like OCaml's `|` in a match.
        -- A muted green, a shade dimmer than comments, so it reads as a guide rather than code.
        local scope_green = vim.o.background == "light" and "#7fb67a" or "#4f7a48"
        hl.SnacksIndentScope = { fg = scope_green, nocombine = true }

        -- Inlay hints and the type line above functions: nudged 15% towards the main
        -- text colour so they're a touch easier to read (works in dark and light mode).
        hl.LspInlayHint = { bg = util.blend_bg(c.blue7, 0.1), fg = util.blend(c.fg, 0.2, c.dark3) }
        hl.LspCodeLens = { fg = util.blend(c.fg, 0.2,  c.comment) }

        -- OCaml labels (~policy) default to the same blue as function calls, so they read
        -- like functions. Use the record field colour instead: both are named slots.
        hl["@label.ocaml"] = { link = "@variable.member" }
      end,
    },
  },
}
