# Fluidlan

A cool-toned dark color theme for editors and terminals.

Derived from [space-vim-dark](https://github.com/liuchengxu/space-vim-dark) and [spacemacs-dark-theme](https://github.com/nashamri/spacemacs-theme), with a harmonized palette — all colors sit in the cool spectrum with consistent saturation and lightness.

![Fluidlan Color Theme](https://user-images.githubusercontent.com/23257850/88414702-db760e80-ce0f-11ea-9ae4-29f221612e77.png)

## Supported targets

**Editors** (syntax highlighting):
- Neovim (Lua, with Treesitter + LSP + diagnostics + plugin support)
- Vim (VimScript, generated)
- VS Code
- Helix
- Zed

**Terminals** (ANSI 16 colors):
- Alacritty
- Kitty
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
    vim.cmd.colorscheme('fluidlan')
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

For transparent background:

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
colorscheme fluidlan
set termguicolors
```

### VS Code

Copy `editors/vscode/` and open it with `code --extensionDevelopmentPath=editors/vscode`, or package it with `vsce package`.

### Helix

Copy `editors/helix/fluidlan.toml` to `~/.config/helix/themes/`, then set in `config.toml`:

```toml
theme = "fluidlan"
```

### Zed

Copy `editors/zed/fluidlan.json` to `~/.config/zed/themes/`, then select "Fluidlan Dark" from the theme picker.

### Terminals

Copy the relevant file to your terminal's theme/config directory:

| Terminal | File | Destination |
|---|---|---|
| Alacritty | `terminals/alacritty/fluidlan.toml` | `~/.config/alacritty/themes/` and `import` in config |
| Kitty | `terminals/kitty/fluidlan.conf` | `~/.config/kitty/themes/` and `include` in config |
| WezTerm | `terminals/wezterm/fluidlan.toml` | `~/.config/wezterm/colors/` then `config.color_scheme = "Fluidlan"` |
| Windows Terminal | `terminals/windows-terminal/fluidlan.json` | Add to `schemes` array in `settings.json` |
| Ghostty | `terminals/ghostty/fluidlan` | `~/.config/ghostty/themes/` then `theme = fluidlan` |

## Lualine

A matching [lualine](https://github.com/nvim-lualine/lualine.nvim) theme is included:

```lua
require('lualine').setup {
  options = { theme = 'fluidlan' },
}
```

## Palette

All colors are defined in [`palette.json`](palette.json) — the single source of truth. Edit it and run `python3 generate.py` to regenerate all editor and terminal themes.

The Neovim Lua theme (`lua/fluidlan/theme.lua`) maps palette colors to Neovim-specific highlight groups (Treesitter, LSP, plugins) and is the only hand-maintained file.
