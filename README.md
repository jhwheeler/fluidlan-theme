# Fluidlan

A cool-toned color theme for editors and terminals, in dark and light variants.

Derived from [space-vim-dark](https://github.com/liuchengxu/space-vim-dark) and [spacemacs-dark-theme](https://github.com/nashamri/spacemacs-theme), with a fully harmonized palette — all colors sit in the cool spectrum with consistent saturation and lightness. No ochre, no neon.

![Fluidlan Color Theme](https://user-images.githubusercontent.com/23257850/88414702-db760e80-ce0f-11ea-9ae4-29f221612e77.png)

## Variants

- **Fluidlan Dark** — transparent-friendly dark theme
- **Fluidlan Light** — warm parchment background with high-contrast syntax colors

## Supported targets

**Editors** (syntax highlighting, dark + light):
- Neovim (Lua, with Treesitter + LSP + diagnostics + plugin support)
- Vim (VimScript, generated)
- VS Code
- Helix
- Zed

**Terminals** (ANSI 16 colors, dark + light):
- Alacritty
- Kitty
- tmux
- WezTerm
- Windows Terminal
- Ghostty

## Installation

### Neovim

[lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'jhwheeler/fluidlan-theme',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('fluidlan')       -- dark
    -- vim.cmd.colorscheme('fluidlan-light') -- light
  end,
}
```

[packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
  'jhwheeler/fluidlan-theme',
  config = function()
    vim.cmd.colorscheme('fluidlan')
  end,
}
```

For transparent background (dark variant):

```lua
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
```

### Vim

[vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'jhwheeler/fluidlan-theme'
```

```vim
colorscheme fluidlan       " dark
" colorscheme fluidlan-light " light
set termguicolors
```

### VS Code

Copy `editors/vscode/` and open it with `code --extensionDevelopmentPath=editors/vscode`, or package it with `vsce package`.

### Helix

Copy `editors/helix/fluidlan.toml` (or `fluidlan-light.toml`) to `~/.config/helix/themes/`, then set in `config.toml`:

```toml
theme = "fluidlan"
```

### Zed

Copy `editors/zed/fluidlan.json` (or `fluidlan-light.json`) to `~/.config/zed/themes/`, then select from the theme picker.

### Terminals

Copy the relevant file to your terminal's theme/config directory:

| Terminal | Dark | Light | Destination |
|---|---|---|---|
| Alacritty | `fluidlan.toml` | `fluidlan-light.toml` | `~/.config/alacritty/themes/` and `import` in config |
| Kitty | `fluidlan.conf` | `fluidlan-light.conf` | `~/.config/kitty/themes/` and `include themes/fluidlan.conf` in `~/.config/kitty/kitty.conf` |
| tmux | `fluidlan.conf` | `fluidlan-light.conf` | `~/.config/tmux/themes/` and `source-file` in config |
| WezTerm | `fluidlan.toml` | `fluidlan-light.toml` | `~/.config/wezterm/colors/` then `config.color_scheme = "Fluidlan Dark"` |
| Windows Terminal | `fluidlan.json` | `fluidlan-light.json` | Add to `schemes` array in `settings.json` |
| Ghostty | `fluidlan` | `fluidlan-light` | `~/.config/ghostty/themes/` then `theme = fluidlan` |

All terminal files are in their respective `terminals/` subdirectory.

## Lualine

A matching [lualine](https://github.com/nvim-lualine/lualine.nvim) theme is included:

```lua
require('lualine').setup {
  options = { theme = 'fluidlan' },
}
```

## Palette

All colors are defined in [`palette.json`](palette.json) — the single source of truth for both variants. Edit it and run `python3 generate.py` to regenerate all editor and terminal themes.

The Neovim Lua theme (`lua/fluidlan/theme.lua`) maps palette colors to Neovim-specific highlight groups (Treesitter, LSP, plugins) and is the only hand-maintained file.
