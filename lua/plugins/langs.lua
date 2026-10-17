-- Languages without a LazyVim extra
return {
  -- OCaml: use the opam-installed ocamllsp (matches the compiler version) instead of Mason's.
  {
    "neovim/nvim-lspconfig",
    opts = {
      codelens = { enabled = true }, -- LazyVim leaves code lens off by default
      inlay_hints = { enabled = true }, -- toggle with <leader>uh
      servers = {
        ocamllsp = {
          mason = false,
          settings = {
            codelens = { enable = true }, -- `val f : ...` above top-level lets
            extendedHover = { enable = true }, -- press K again for more detail
            inlayHints = {
              hintLetBindings = true,
              hintPatternVariables = true,
              hintFunctionParams = true,
            },
          },
        },
      },
    },
  },
  -- Lean 4: LSP, infoview, unicode input (\alpha → α). Toolchain via elan.
  {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },
    dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
    init = function()
      vim.g.lean_config = { mappings = true }
    end,
  },
  -- Idris2: LSP, case split, holes, REPL. Needs idris2-lsp on PATH (pack install-app idris2-lsp).
  {
    "ShinKage/idris2-nvim",
    main = "idris2",
    ft = { "idris2", "ipkg", "lidris2" },
    dependencies = { "neovim/nvim-lspconfig", "MunifTanjim/nui.nvim" },
    opts = {},
  },
}
