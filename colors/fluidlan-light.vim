" Vim color file
" Author: Jackson Holiday Wheeler
" URL: https://github.com/jhwheeler/fluidlan-theme
" Generated from palette.json (light) — do not edit by hand.
" Run: python3 generate.py

if has("nvim")
  lua require("fluidlan").load_light()
  finish
endif

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "fluidlan-light"

" Editor UI
  hi Normal guifg=#252028 guibg=NONE gui=NONE
  hi Cursor guifg=#d4d0c8 guibg=#6838a0 gui=bold
  hi LineNr guifg=#9088a0 gui=NONE
  hi CursorLine guibg=#ccc8c0 gui=NONE
  hi CursorLineNr guifg=#701888 guibg=#ccc8c0 gui=NONE
  hi CursorColumn guibg=#ccc8c0 gui=NONE
  hi ColorColumn guibg=#ccc8c0 gui=NONE
  hi StatusLine guifg=#7c48b0 guibg=#c4c0b8 gui=NONE
  hi StatusLineNC guifg=#9990a8 guibg=#d4d0c8 gui=NONE
  hi WinSeparator guifg=#ccc8c0 gui=NONE
  hi VertSplit guifg=#ccc8c0 gui=NONE
  hi TabLine guifg=#5f8787 guibg=#bcb8b0 gui=NONE
  hi TabLineSel guifg=#488820 guibg=#aea4b8 gui=NONE
  hi TabLineFill guifg=#afafaf guibg=#c4c0b8 gui=NONE
  hi WildMenu guifg=#1a5ca8 guibg=#bcb8b0 gui=NONE
  hi Pmenu guifg=#555370 guibg=#d4d0c8 gui=NONE
  hi PmenuSel guifg=#2e2c36 guibg=#875faf gui=NONE
  hi PmenuSbar guifg=#a478d4 guibg=#ccc8c0 gui=NONE
  hi PmenuThumb guifg=#a84a46 guibg=#875faf gui=NONE
  hi SignColumn guifg=#008050 gui=NONE
  hi FoldColumn guifg=#1a5088 guibg=#d4d0c8 gui=NONE
  hi Folded guifg=#af5faf guibg=#d4d0c8 gui=bold
  hi Search guifg=#dcd8d0 guibg=#2b78c0 gui=bold
  hi IncSearch guifg=#1e1c24 guibg=#2b78c0 gui=bold
  hi MatchParen guifg=#1e1c24 gui=bold,underline
  hi ModeMsg guifg=#086068 gui=NONE
  hi MoreMsg guifg=#086068 gui=NONE
  hi Question guifg=#589028 gui=NONE
  hi Visual guibg=#b0a8d0 gui=NONE
  hi VisualNOS guibg=#b0a8d0 gui=NONE
  hi NonText guifg=#b0a8c0 gui=NONE
  hi Todo guifg=#387018 gui=bold
  hi Warning guifg=#488820 gui=bold
  hi WarningMsg guifg=#488820 gui=bold
  hi Error guifg=#a84a46 gui=bold
  hi ErrorMsg guifg=#a84a46 gui=bold

" Syntax
  hi Boolean guifg=#5020a0 gui=NONE
  hi Character guifg=#901860 gui=NONE
  hi Number guifg=#801890 gui=NONE
  hi Float guifg=#3030c0 gui=NONE
  hi String guifg=#008050 gui=NONE
  hi Conditional guifg=#1050a8 gui=bold
  hi Constant guifg=#2828c0 gui=NONE
  hi Debug guifg=#882868 gui=NONE
  hi Define guifg=#7810b0 gui=NONE
  hi Delimiter guifg=#108868 gui=NONE
  hi Exception guifg=#8f4f5f gui=bold
  hi Function guifg=#701888 gui=bold
  hi Identifier guifg=#007048 gui=NONE
  hi Ignore guifg=#c8c4d0 gui=NONE
  hi Operator guifg=#1840b8 gui=NONE
  hi PreCondit guifg=#5820c0 gui=NONE
  hi PreProc guifg=#801890 gui=NONE
  hi Directory guifg=#1a5088 gui=bold
  hi Repeat guifg=#1050a8 gui=bold
  hi Keyword guifg=#1050a8 gui=bold
  hi Statement guifg=#1050a8 gui=NONE
  hi Structure guifg=#1050a8 gui=bold
  hi Label guifg=#6018b8 gui=NONE
  hi Macro guifg=#5828a8 gui=NONE
  hi Type guifg=#1050a8 gui=NONE
  hi Typedef guifg=#1050a8 gui=NONE
  hi Underlined gui=underline
  hi StorageClass guifg=#1050a8 gui=bold
  hi Comment guifg=#086068 gui=italic
  hi Special guifg=#701888 gui=NONE
  hi SpecialKey guifg=#b0a8c0 gui=NONE
  hi SpecialChar guifg=#1048b0 gui=bold
  hi SpecialComment guifg=#65737e gui=NONE
  hi Tag guifg=#7018a8 gui=NONE
  hi Title guifg=#801890 gui=NONE
  hi SpellBad guifg=#8f4f5f guibg=#5f0000 gui=undercurl
  hi SpellCap guifg=#87afd7 guibg=#005faf gui=undercurl
  hi SpellLocal guifg=#dadada gui=undercurl
  hi SpellRare guifg=#c2b088 gui=undercurl
  hi diffAdded guifg=#008050 gui=NONE
  hi diffRemoved guifg=#8f4f5f gui=NONE
  hi link qfLineNr Type

" Markdown
  hi markdownH1 guifg=#1050a8 gui=bold
  hi markdownH2 guifg=#008050 gui=bold
  hi markdownH3 guifg=#108868 gui=bold
  hi markdownH4 guifg=#488820 gui=bold
  hi markdownH5 guifg=#1050a8 gui=NONE
  hi markdownH6 guifg=#008050 gui=NONE
  hi mkdCode guifg=#008050 gui=NONE
  hi mkdItalic guifg=#008050 gui=italic

" HTML
  hi link htmlSpecialTagName Tag
  hi htmlItalic guifg=#008050 gui=italic
  hi htmlBold gui=bold
  hi htmlH1 guifg=#1050a8 gui=bold
  hi htmlH2 guifg=#008050 gui=bold
  hi htmlH3 guifg=#108868 gui=bold
  hi htmlH4 guifg=#488820 gui=bold
  hi htmlH5 guifg=#1050a8 gui=NONE
  hi htmlH6 guifg=#008050 gui=NONE

" CSS
  hi cssTagName guifg=#1050a8 gui=bold
  hi cssProp guifg=#1850a0 gui=NONE
  hi cssClassName guifg=#1050a8 gui=NONE
  hi cssIdentifier guifg=#1050a8 gui=NONE
  hi cssPseudoClassId guifg=#5820c0 gui=NONE
  hi cssColor guifg=#008050 gui=NONE

" JavaScript
  hi jsReturn guifg=#1050a8 gui=bold
  hi link jsObjectKey Type
  hi link jsFuncBlock Identifier
  hi link jsVariableDef Title

" Git gutter / Signify
  hi GitGutterAdd guifg=#008050 gui=NONE
  hi GitGutterChange guifg=#488820 gui=NONE
  hi GitGutterDelete guifg=#a84a46 gui=NONE
  hi GitGutterChangeDelete guifg=#5828a8 gui=NONE
  hi SignifySignAdd guifg=#008050 gui=NONE
  hi SignifySignChange guifg=#488820 gui=NONE
  hi SignifySignDelete guifg=#a84a46 gui=NONE
  hi SignifySignChangeDelete guifg=#5828a8 gui=NONE

" ALE
  hi link ALEErrorSign Error
  hi link ALEWarningSign Warning
