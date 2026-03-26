local M = {}

function M.load()
  if vim.g.colors_name then
    vim.cmd('hi clear')
  end
  if vim.fn.exists('syntax_on') ~= 0 then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.o.background = 'dark'
  vim.g.colors_name = 'fluidlan'

  local palette = require('fluidlan.palette')
  require('fluidlan.theme').setup(palette)
end

return M
