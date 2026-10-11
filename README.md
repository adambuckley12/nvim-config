# nvim config

[LazyVim](https://www.lazyvim.org)-based Neovim setup for JS/TS, Python, C#, OCaml, Lean 4 and Idris2.

- `lazyvim.json`: enabled LazyVim extras (toggle with `:LazyExtras`)
- `lua/plugins/langs.lua`: Lean, Idris2 and OCaml tweaks
- `lazy-lock.json`: pinned plugin versions (`:Lazy restore` to roll back)

## Setting up a new machine

```bash
brew install neovim ripgrep fd lazygit idris2 openssl@3 opam
brew install --cask font-jetbrains-mono-nerd-font dotnet-sdk
opam init && opam install ocaml-lsp-server ocamlformat      # OCaml
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh      # Lean
# Idris2 LSP: install pack (github.com/stefan-hoeck/idris2-pack), then
pack install-app idris2-lsp
```

Then clone this repo to `~/.config/nvim` and run `nvim`. Mason installs the other language servers.
