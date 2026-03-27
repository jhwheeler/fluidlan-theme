" Vim color file
" Author: Jackson Holiday Wheeler
" URL: https://github.com/jhwheeler/fluidlan-theme
" Generated from palette.json (dark) — do not edit by hand.
" Run: python3 generate.py

if has("nvim")
  lua require("fluidlan").load()
  finish
endif

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "fluidlan"

" Editor UI
  hi Normal guifg=#b4b7bd guibg=NONE gui=NONE
  hi Cursor guifg=#292b2e guibg=#b888e2 gui=bold
  hi LineNr guifg=#716882 gui=NONE
  hi CursorLine guibg=#303030 gui=NONE
  hi CursorLineNr guifg=#bc6ec5 guibg=#303030 gui=NONE
  hi CursorColumn guibg=#303030 gui=NONE
  hi ColorColumn guibg=#303030 gui=NONE
  hi StatusLine guifg=#b888e2 guibg=#34323e gui=NONE
  hi StatusLineNC guifg=#666666 guibg=#292b2e gui=NONE
  hi WinSeparator guifg=#303030 gui=NONE
  hi VertSplit guifg=#303030 gui=NONE
  hi TabLine guifg=#5f8787 guibg=#3a3a3a gui=NONE
  hi TabLineSel guifg=#cfc070 guibg=#544a65 gui=NONE
  hi TabLineFill guifg=#afafaf guibg=#34323e gui=NONE
  hi WildMenu guifg=#5f87af guibg=#3a3a3a gui=NONE
  hi Pmenu guifg=#9a9aba guibg=#292b2e gui=NONE
  hi PmenuSel guifg=#c6c6c6 guibg=#875faf gui=NONE
  hi PmenuSbar guifg=#a478d4 guibg=#303030 gui=NONE
  hi PmenuThumb guifg=#c44f5c guibg=#875faf gui=NONE
  hi SignColumn guifg=#20af81 gui=NONE
  hi FoldColumn guifg=#5f87af guibg=#292b2e gui=NONE
  hi Folded guifg=#af5faf guibg=#292b2e gui=bold
  hi Search guifg=#212026 guibg=#0087d7 gui=bold
  hi IncSearch guifg=#e4e4e4 guibg=#0087d7 gui=bold
  hi MatchParen guifg=#e4e4e4 gui=bold,underline
  hi ModeMsg guifg=#2aa1ae gui=NONE
  hi MoreMsg guifg=#2aa1ae gui=NONE
  hi Question guifg=#b888e2 gui=NONE
  hi Visual guibg=#444060 gui=NONE
  hi VisualNOS guibg=#444060 gui=NONE
  hi NonText guifg=#605872 gui=NONE
  hi Todo guifg=#c6b660 gui=bold
  hi Warning guifg=#c9b068 gui=bold
  hi WarningMsg guifg=#c9b068 gui=bold
  hi Error guifg=#c44f5c gui=bold
  hi ErrorMsg guifg=#c44f5c gui=bold

" Syntax
  hi Boolean guifg=#a568c8 gui=NONE
  hi Character guifg=#d572a4 gui=NONE
  hi Number guifg=#E697E6 gui=NONE
  hi Float guifg=#B7B7FF gui=NONE
  hi String guifg=#20af81 gui=NONE
  hi Conditional guifg=#4f97d7 gui=bold
  hi Constant guifg=#8787ff gui=NONE
  hi Debug guifg=#e4b4d0 gui=NONE
  hi Define guifg=#D881ED gui=NONE
  hi Delimiter guifg=#5cbcac gui=NONE
  hi Exception guifg=#b56777 gui=bold
  hi Function guifg=#bc6ec5 gui=bold
  hi Identifier guifg=#35b07c gui=NONE
  hi Ignore guifg=#44404e gui=NONE
  hi Operator guifg=#87afff gui=NONE
  hi PreCondit guifg=#d698fe gui=NONE
  hi PreProc guifg=#E697E6 gui=NONE
  hi Directory guifg=#5f87af gui=bold
  hi Repeat guifg=#4f97d7 gui=bold
  hi Keyword guifg=#4f97d7 gui=bold
  hi Statement guifg=#4f97d7 gui=NONE
  hi Structure guifg=#4f97d7 gui=bold
  hi Label guifg=#df90ff gui=NONE
  hi Macro guifg=#b888e2 gui=NONE
  hi Type guifg=#4f97d7 gui=NONE
  hi Typedef guifg=#4f97d7 gui=NONE
  hi Underlined gui=underline
  hi StorageClass guifg=#4f97d7 gui=bold
  hi Comment guifg=#2aa1ae gui=italic
  hi Special guifg=#bc6ec5 gui=NONE
  hi SpecialKey guifg=#605872 gui=NONE
  hi SpecialChar guifg=#6094DB gui=bold
  hi SpecialComment guifg=#65737e gui=NONE
  hi Tag guifg=#ca78e8 gui=NONE
  hi Title guifg=#E697E6 gui=NONE
  hi SpellBad guifg=#b56777 guibg=#5f0000 gui=undercurl
  hi SpellCap guifg=#87afd7 guibg=#005faf gui=undercurl
  hi SpellLocal guifg=#dadada gui=undercurl
  hi SpellRare guifg=#c2b088 gui=undercurl
  hi diffAdded guifg=#20af81 gui=NONE
  hi diffRemoved guifg=#b56777 gui=NONE
  hi link qfLineNr Type

" Markdown
  hi markdownH1 guifg=#4f97d7 gui=bold
  hi markdownH2 guifg=#20af81 gui=bold
  hi markdownH3 guifg=#5cbcac gui=bold
  hi markdownH4 guifg=#d5c888 gui=bold
  hi markdownH5 guifg=#4f97d7 gui=NONE
  hi markdownH6 guifg=#20af81 gui=NONE
  hi mkdCode guifg=#20af81 gui=NONE
  hi mkdItalic guifg=#20af81 gui=italic

" HTML
  hi link htmlSpecialTagName Tag
  hi htmlItalic guifg=#20af81 gui=italic
  hi htmlBold gui=bold
  hi htmlH1 guifg=#4f97d7 gui=bold
  hi htmlH2 guifg=#20af81 gui=bold
  hi htmlH3 guifg=#5cbcac gui=bold
  hi htmlH4 guifg=#d5c888 gui=bold
  hi htmlH5 guifg=#4f97d7 gui=NONE
  hi htmlH6 guifg=#20af81 gui=NONE

" CSS
  hi cssTagName guifg=#4f97d7 gui=bold
  hi cssProp guifg=#87afd7 gui=NONE
  hi cssClassName guifg=#4f97d7 gui=NONE
  hi cssIdentifier guifg=#4f97d7 gui=NONE
  hi cssPseudoClassId guifg=#d698fe gui=NONE
  hi cssColor guifg=#20af81 gui=NONE

" JavaScript
  hi jsReturn guifg=#4f97d7 gui=bold
  hi link jsObjectKey Type
  hi link jsFuncBlock Identifier
  hi link jsVariableDef Title

" Git gutter / Signify
  hi GitGutterAdd guifg=#20af81 gui=NONE
  hi GitGutterChange guifg=#cfc070 gui=NONE
  hi GitGutterDelete guifg=#c44f5c gui=NONE
  hi GitGutterChangeDelete guifg=#b888e2 gui=NONE
  hi SignifySignAdd guifg=#20af81 gui=NONE
  hi SignifySignChange guifg=#cfc070 gui=NONE
  hi SignifySignDelete guifg=#c44f5c gui=NONE
  hi SignifySignChangeDelete guifg=#b888e2 gui=NONE

" ALE
  hi link ALEErrorSign Error
  hi link ALEWarningSign Warning
