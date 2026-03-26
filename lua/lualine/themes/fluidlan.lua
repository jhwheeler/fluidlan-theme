local p = require('fluidlan.palette')

return {
  normal = {
    a = { fg = p.off_white, bg = p.medium_purple, gui = 'bold' },
    b = { fg = p.purple, bg = p.bg5 },
    c = { fg = p.white1, bg = p.bg4 },
  },
  insert = {
    a = { fg = p.white3, bg = p.aqua, gui = 'bold' },
    b = { fg = p.purple, bg = p.bg5 },
    c = { fg = p.white1, bg = p.bg4 },
  },
  visual = {
    a = { fg = p.bg, bg = p.bright_pink, gui = 'bold' },
  },
  replace = {
    a = { fg = p.white1, bg = p.pink, gui = 'bold' },
  },
  command = {
    a = { fg = p.bg, bg = p.yellow, gui = 'bold' },
  },
  inactive = {
    a = { fg = p.medium_purple, bg = p.bg4 },
    b = { fg = p.medium_purple, bg = p.bg4 },
    c = { fg = p.medium_purple, bg = p.bg4 },
  },
}
