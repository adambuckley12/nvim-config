# Dotfiles

The real copies of my terminal and shell config live here; the usual locations are symlinks to them.

| File | Symlinked from |
|---|---|
| `alacritty.toml` | `~/.config/alacritty/alacritty.toml` |
| `zshrc` | `~/.zshrc` |

On a new machine, after cloning this repo to `~/.config/nvim`:

```bash
mkdir -p ~/.config/alacritty
ln -s ~/.config/nvim/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s ~/.config/nvim/dotfiles/zshrc ~/.zshrc
```
