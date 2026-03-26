local M = {}

local function setup(variant)
  if vim.g.colors_name then
    vim.cmd('hi clear')
  end
  if vim.fn.exists('syntax_on') ~= 0 then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.o.background = variant
  vim.g.colors_name = variant == 'dark' and 'fluidlan' or 'fluidlan-light'

  -- Clear cached palette modules so switching variants works
  package.loaded['fluidlan.palette'] = nil
  package.loaded['fluidlan.palette_light'] = nil

  local palette = variant == 'dark'
    and require('fluidlan.palette')
    or require('fluidlan.palette_light')
  require('fluidlan.theme').setup(palette)
end

function M.load()
  setup('dark')
end

function M.load_light()
  setup('light')
end

return M
