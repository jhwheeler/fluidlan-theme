local M = {}

function M.setup(p)
  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  ---------------------------------------------------------------------------
  -- Editor UI
  ---------------------------------------------------------------------------
  hl('Normal',       { fg = p.fg })
  hl('NormalNC',     { fg = p.fg })
  hl('NormalFloat',  { fg = p.fg, bg = p.bg1 })
  hl('FloatBorder',  { fg = p.light_purple, bg = p.bg1 })
  hl('FloatTitle',   { fg = p.purple, bg = p.bg1, bold = true })
  hl('Cursor',       { fg = p.bg1, bg = p.yellow, bold = true })
  hl('TermCursor',   { fg = p.bg1, bg = p.yellow, bold = true })

  hl('LineNr',       { fg = p.linenr_fg })
  hl('CursorLine',   { bg = p.bg2 })
  hl('CursorLineNr', { fg = p.purple, bg = p.bg2 })
  hl('CursorColumn', { bg = p.bg2 })
  hl('ColorColumn',  { bg = p.bg2 })

  hl('StatusLine',     { fg = p.light_purple, bg = p.bg3 })
  hl('StatusLineNC',   { fg = p.gray4, bg = p.bg1 })
  hl('WinSeparator',   { fg = p.bg2 })
  hl('VertSplit',      { fg = p.bg2 }) -- compat alias

  hl('TabLine',     { fg = p.tab_gray, bg = p.bg4 })
  hl('TabLineSel',  { fg = p.yellow, bg = p.bg5 })
  hl('TabLineFill', { fg = p.very_pale, bg = p.bg3 })

  hl('WildMenu', { fg = p.wildmenu_fg, bg = p.bg4 })

  hl('Pmenu',      { fg = p.pale_purple, bg = p.bg1 })
  hl('PmenuSel',   { fg = p.white1, bg = p.medium_purple })
  hl('PmenuSbar',  { fg = p.bright_purple, bg = p.bg2 })
  hl('PmenuThumb', { fg = p.red, bg = p.medium_purple })

  hl('SignColumn', { fg = p.aqua })
  hl('FoldColumn', { fg = p.blue_gray, bg = p.bg1 })
  hl('Folded',     { fg = p.muted_purple, bg = p.bg1, bold = true })

  hl('Search',    { fg = p.bg, bg = p.cyan_blue, bold = true })
  hl('IncSearch', { fg = p.white2, bg = p.cyan_blue, bold = true })
  hl('CurSearch', { fg = p.bg, bg = p.yellow, bold = true })
  hl('MatchParen', { fg = p.white2, bold = true, underline = true })

  hl('ModeMsg',  { fg = p.teal })
  hl('MoreMsg',  { fg = p.teal })
  hl('Question', { fg = p.bright_yellow })

  hl('Visual',    { bg = p.bg4 })
  hl('VisualNOS', { bg = p.bg4 })

  hl('NonText',    { fg = p.nontext })
  hl('Whitespace', { fg = p.nontext })
  hl('WinBar',     { fg = p.light_purple, bold = true })
  hl('WinBarNC',   { fg = p.gray4 })
  hl('Substitute', { fg = p.bg, bg = p.yellow, bold = true })
  hl('MsgArea',    { fg = p.fg })

  hl('Todo',       { fg = p.dark_yellow, bold = true })
  hl('Warning',    { fg = p.warning, bold = true })
  hl('WarningMsg', { fg = p.warning, bold = true })
  hl('Error',      { fg = p.red, bold = true })
  hl('ErrorMsg',   { fg = p.red, bold = true })

  ---------------------------------------------------------------------------
  -- Syntax
  ---------------------------------------------------------------------------
  hl('Boolean',     { fg = p.deep_purple })
  hl('Character',   { fg = p.bright_pink })
  hl('Number',      { fg = p.soft_pink })
  hl('Float',       { fg = p.lilac })
  hl('String',      { fg = p.aqua })
  hl('Conditional', { fg = p.blue, bold = true })
  hl('Constant',    { fg = p.blue_constant })
  hl('Debug',       { fg = p.pale_pink })
  hl('Define',      { fg = p.magenta })
  hl('Delimiter',   { fg = p.mint })

  hl('Exception',    { fg = p.pink, bold = true })
  hl('Function',     { fg = p.purple, bold = true })
  hl('Identifier',   { fg = p.dark_green })
  hl('Ignore',       { fg = p.ignore })
  hl('Operator',     { fg = p.light_blue })
  hl('PreCondit',    { fg = p.lavender })
  hl('PreProc',      { fg = p.soft_pink })

  hl('Directory',    { fg = p.blue_gray, bold = true })
  hl('Repeat',       { fg = p.blue, bold = true })
  hl('Keyword',      { fg = p.blue, bold = true })
  hl('Statement',    { fg = p.blue })
  hl('Structure',    { fg = p.blue, bold = true })

  hl('Label',        { fg = p.violet })
  hl('Macro',        { fg = p.light_purple })

  hl('Type',         { fg = p.blue })
  hl('Typedef',      { fg = p.blue })
  hl('Underlined',   { underline = true })

  hl('StorageClass', { fg = p.blue, bold = true })
  hl('Comment',      { fg = p.teal, italic = true })

  hl('Special',        { fg = p.purple })
  hl('SpecialKey',     { fg = p.specialkey })
  hl('SpecialChar',    { fg = p.steel_blue, bold = true })
  hl('SpecialComment', { fg = p.gray3 })

  hl('Tag',   { fg = p.magenta_pink })
  hl('Title', { fg = p.soft_pink })

  hl('SpellBad',   { fg = p.pink, bg = p.dark_red, undercurl = true })
  hl('SpellCap',   { fg = p.light_mauve, bg = p.dark_blue, undercurl = true })
  hl('SpellLocal', { fg = p.white3, undercurl = true })
  hl('SpellRare',  { fg = p.tan, undercurl = true })

  hl('diffAdded',   { fg = p.aqua })
  hl('diffRemoved', { fg = p.pink })

  hl('qfLineNr', { link = 'Type' })

  ---------------------------------------------------------------------------
  -- Treesitter
  ---------------------------------------------------------------------------
  hl('@comment',                { link = 'Comment' })
  hl('@keyword',                { link = 'Keyword' })
  hl('@keyword.function',       { link = 'Keyword' })
  hl('@keyword.return',         { link = 'Keyword' })
  hl('@keyword.operator',       { link = 'Keyword' })
  hl('@keyword.conditional',    { link = 'Conditional' })
  hl('@keyword.repeat',         { link = 'Repeat' })
  hl('@keyword.exception',      { link = 'Exception' })
  hl('@keyword.import',         { link = 'PreProc' })
  hl('@keyword.storage',        { link = 'StorageClass' })
  hl('@keyword.directive',      { link = 'PreProc' })

  hl('@function',               { link = 'Function' })
  hl('@function.call',          { fg = p.purple, bold = true })
  hl('@function.builtin',       { fg = p.purple, bold = true })
  hl('@function.method',        { link = 'Function' })
  hl('@function.method.call',   { fg = p.purple, bold = true })

  hl('@variable',               { fg = p.fg })
  hl('@variable.builtin',       { fg = p.blue, bold = true })
  hl('@variable.parameter',     { fg = p.dark_green })
  hl('@variable.member',        { fg = p.light_mauve })

  hl('@string',                 { link = 'String' })
  hl('@string.escape',          { fg = p.steel_blue, bold = true })
  hl('@string.regexp',          { fg = p.steel_blue })
  hl('@string.special',         { fg = p.steel_blue })

  hl('@number',                 { link = 'Number' })
  hl('@number.float',           { link = 'Float' })
  hl('@boolean',                { link = 'Boolean' })
  hl('@character',              { link = 'Character' })

  hl('@type',                   { link = 'Type' })
  hl('@type.builtin',           { fg = p.blue })
  hl('@type.definition',        { link = 'Typedef' })
  hl('@type.qualifier',         { fg = p.blue, bold = true })

  hl('@constant',               { link = 'Constant' })
  hl('@constant.builtin',       { link = 'Constant' })
  hl('@constant.macro',         { link = 'Macro' })

  hl('@operator',               { link = 'Operator' })
  hl('@punctuation',            { link = 'Delimiter' })
  hl('@punctuation.bracket',    { link = 'Delimiter' })
  hl('@punctuation.delimiter',  { link = 'Delimiter' })
  hl('@punctuation.special',    { fg = p.steel_blue })

  hl('@tag',                    { link = 'Tag' })
  hl('@tag.attribute',          { fg = p.dark_green })
  hl('@tag.delimiter',          { fg = p.pink })

  hl('@property',               { fg = p.light_mauve })
  hl('@constructor',            { fg = p.yellow })
  hl('@module',                 { fg = p.lavender })
  hl('@label',                  { link = 'Label' })

  hl('@markup.heading.1',       { fg = p.blue, bold = true })
  hl('@markup.heading.2',       { fg = p.aqua, bold = true })
  hl('@markup.heading.3',       { fg = p.mint, bold = true })
  hl('@markup.heading.4',       { fg = p.light_yellow, bold = true })
  hl('@markup.heading.5',       { fg = p.blue })
  hl('@markup.heading.6',       { fg = p.aqua })
  hl('@markup.strong',          { bold = true })
  hl('@markup.italic',          { fg = p.aqua, italic = true })
  hl('@markup.raw',             { fg = p.aqua })
  hl('@markup.link',            { fg = p.purple, underline = true })
  hl('@markup.link.url',        { fg = p.teal, underline = true })
  hl('@markup.list',            { fg = p.mint })
  hl('@markup.quote',           { fg = p.teal, italic = true })
  hl('@markup.strikethrough',   { strikethrough = true })

  hl('@diff.plus',              { fg = p.aqua })
  hl('@diff.minus',             { fg = p.pink })
  hl('@diff.delta',             { fg = p.yellow })

  ---------------------------------------------------------------------------
  -- LSP semantic tokens
  ---------------------------------------------------------------------------
  hl('@lsp.type.class',         { link = '@type' })
  hl('@lsp.type.decorator',     { link = '@function' })
  hl('@lsp.type.enum',          { link = '@type' })
  hl('@lsp.type.enumMember',    { link = '@constant' })
  hl('@lsp.type.function',      { link = '@function' })
  hl('@lsp.type.interface',     { link = '@type' })
  hl('@lsp.type.keyword',       { link = '@keyword' })
  hl('@lsp.type.method',        { link = '@function.method' })
  hl('@lsp.type.namespace',     { link = '@module' })
  hl('@lsp.type.parameter',     { link = '@variable.parameter' })
  hl('@lsp.type.property',      { link = '@property' })
  hl('@lsp.type.struct',        { link = '@type' })
  hl('@lsp.type.type',          { link = '@type' })
  hl('@lsp.type.typeParameter', { link = '@type' })
  hl('@lsp.type.variable',      { link = '@variable' })

  ---------------------------------------------------------------------------
  -- Diagnostics
  ---------------------------------------------------------------------------
  hl('DiagnosticError',          { fg = p.red })
  hl('DiagnosticWarn',           { fg = p.warning })
  hl('DiagnosticInfo',           { fg = p.blue })
  hl('DiagnosticHint',           { fg = p.teal })
  hl('DiagnosticOk',             { fg = p.aqua })

  hl('DiagnosticSignError',      { fg = p.red })
  hl('DiagnosticSignWarn',       { fg = p.warning })
  hl('DiagnosticSignInfo',       { fg = p.blue })
  hl('DiagnosticSignHint',       { fg = p.teal })

  hl('DiagnosticUnderlineError', { sp = p.red, undercurl = true })
  hl('DiagnosticUnderlineWarn',  { sp = p.warning, undercurl = true })
  hl('DiagnosticUnderlineInfo',  { sp = p.blue, undercurl = true })
  hl('DiagnosticUnderlineHint',  { sp = p.teal, undercurl = true })

  hl('DiagnosticVirtualTextError', { fg = p.red, italic = true })
  hl('DiagnosticVirtualTextWarn',  { fg = p.warning, italic = true })
  hl('DiagnosticVirtualTextInfo',  { fg = p.blue, italic = true })
  hl('DiagnosticVirtualTextHint',  { fg = p.teal, italic = true })

  hl('DiagnosticFloatingError',  { fg = p.red })
  hl('DiagnosticFloatingWarn',   { fg = p.warning })
  hl('DiagnosticFloatingInfo',   { fg = p.blue })
  hl('DiagnosticFloatingHint',   { fg = p.teal })

  hl('LspReferenceText',  { bg = p.bg3 })
  hl('LspReferenceRead',  { bg = p.bg3 })
  hl('LspReferenceWrite', { bg = p.bg3, bold = true })
  hl('LspInlayHint',      { fg = p.gray3, italic = true })

  ---------------------------------------------------------------------------
  -- Language-specific (Vim regex syntax, kept for non-Treesitter fallback)
  ---------------------------------------------------------------------------

  -- markdown
  hl('markdownH1', { fg = p.blue, bold = true })
  hl('markdownH2', { fg = p.aqua, bold = true })
  hl('markdownH3', { fg = p.mint, bold = true })
  hl('markdownH4', { fg = p.light_yellow, bold = true })
  hl('markdownH5', { fg = p.blue })
  hl('markdownH6', { fg = p.aqua })
  hl('mkdCode',    { fg = p.aqua })
  hl('mkdItalic',  { fg = p.aqua, italic = true })

  -- c
  hl('cConstant',    { fg = p.yellow })
  hl('cCustomClass', { fg = p.pink, bold = true })

  -- cpp
  hl('cppSTLexception', { fg = p.deep_pink_alt, bold = true })
  hl('cppSTLnamespace', { fg = p.yellow, bold = true })

  -- css
  hl('cssTagName',       { fg = p.blue, bold = true })
  hl('cssProp',          { fg = p.light_mauve })
  hl('cssClassName',     { fg = p.blue })
  hl('cssIdentifier',    { fg = p.blue })
  hl('cssPseudoClassId', { fg = p.lavender })
  hl('cssColor',         { fg = p.aqua })

  -- dot
  hl('dotKeyChar', { fg = p.soft_pink })
  hl('dotType',    { fg = p.yellow })

  -- sh
  hl('shSet',         { fg = p.blue, bold = true })
  hl('shLoop',        { fg = p.blue, bold = true })
  hl('shFunctionKey', { fg = p.blue, bold = true })
  hl('shTestOpr',     { fg = p.yellow })

  -- solidity
  hl('solContract',     { fg = p.yellow, bold = true })
  hl('solContractName', { fg = p.pink, bold = true })
  hl('solBuiltinType',  { fg = p.soft_pink })

  -- vimL
  hl('vimLet',     { fg = p.blue, bold = true })
  hl('vimFuncKey', { fg = p.blue, bold = true })
  hl('vimCommand', { fg = p.blue, bold = true })
  hl('vimMap',     { fg = p.blue })
  hl('vimGroup',   { fg = p.blue_gray, bold = true })
  hl('vimHiGroup', { fg = p.blue_gray, bold = true })

  -- rust
  hl('rustKeyword',  { fg = p.blue, bold = true })
  hl('rustModPath',  { fg = p.blue })
  hl('rustTrait',    { fg = p.pink, bold = true })
  hl('rustScopeDecl', { fg = p.blue, bold = true })

  -- toml
  hl('tomlTable',   { fg = p.purple, bold = true })
  hl('tomlKey',     { fg = p.blue })
  hl('tomlComment', { fg = p.teal, italic = true })

  -- json
  hl('jsonStringSQError', { fg = p.red })

  -- xml
  hl('xmlTag',     { fg = p.pink })
  hl('xmlEndTag',  { fg = p.pink })
  hl('xmlTagName', { fg = p.pink })

  -- js
  hl('jsReturn', { fg = p.blue, bold = true })
  hl('jsObjectKey',   { link = 'Type' })
  hl('jsFuncBlock',   { link = 'Identifier' })
  hl('jsVariableDef', { link = 'Title' })

  -- go
  hl('goType',                  { fg = p.soft_pink })
  hl('goFloat',                 { fg = p.lilac })
  hl('goField',                 { fg = p.blue })
  hl('goTypeName',              { fg = p.purple, bold = true })
  hl('goFunction',              { fg = p.purple, bold = true })
  hl('goMethodCall',            { fg = p.pink, bold = true })
  hl('goReceiverType',          { fg = p.mint })
  hl('goFunctionCall',          { fg = p.purple, bold = true })
  hl('goFormatSpecifier',       { fg = p.blue })
  hl('goTypeConstructor',       { fg = p.yellow })
  hl('goPredefinedIdentifiers', { fg = p.light_purple })

  -- make
  hl('makeCommands',   { fg = p.blue })
  hl('makeSpecTarget', { fg = p.blue, bold = true })

  -- java
  hl('javaClassDecl', { fg = p.pink, bold = true })

  -- scala
  hl('scalaKeyword',        { fg = p.blue, bold = true })
  hl('scalaNameDefinition', { fg = p.blue, bold = true })

  -- ruby
  hl('rubyClass',                  { fg = p.blue, bold = true })
  hl('rubyDefine',                 { fg = p.blue, bold = true })
  hl('rubyInterpolationDelimiter', { fg = p.soft_pink })

  -- html
  hl('htmlSpecialTagName', { link = 'Tag' })
  hl('htmlItalic', { fg = p.aqua, italic = true })
  hl('htmlBold',   { bold = true })
  hl('htmlH1',     { fg = p.blue, bold = true })
  hl('htmlH2',     { fg = p.aqua, bold = true })
  hl('htmlH3',     { fg = p.mint, bold = true })
  hl('htmlH4',     { fg = p.light_yellow, bold = true })
  hl('htmlH5',     { fg = p.blue })
  hl('htmlH6',     { fg = p.aqua })

  -- python
  hl('pythonLambdaExpr',      { fg = p.blue_constant })
  hl('pythonClass',           { fg = p.bright_magenta, bold = true })
  hl('pythonParameters',      { fg = p.purple_param })
  hl('pythonParam',           { fg = p.green_param })
  hl('pythonBrackets',        { fg = p.pale_lavender })
  hl('pythonClassParameters', { fg = p.light_blue })
  hl('pythonBuiltinType',     { fg = p.blue })
  hl('pythonBuiltinObj',      { fg = p.green_obj, bold = true })
  hl('pythonBuiltinFunc',     { fg = p.purple, bold = true })
  hl('pythonOperator',        { fg = p.blue, bold = true })
  hl('pythonInclude',         { fg = p.blue, bold = true })
  hl('pythonSelf',            { fg = p.blue, bold = true })
  hl('pythonStatement',       { fg = p.blue, bold = true })
  hl('pythonDottedName',      { fg = p.purple, bold = true })
  hl('pythonDecorator',       { fg = p.purple, bold = true })
  hl('pythonException',       { fg = p.dark_orange, bold = true })
  hl('pythonError',           { fg = p.icy_blue })
  hl('pythonIndentError',     { fg = p.red })
  hl('pythonSpaceError',      { fg = p.red })

  ---------------------------------------------------------------------------
  -- Plugin support
  ---------------------------------------------------------------------------

  -- vim-easymotion / hop.nvim / leap.nvim
  hl('EasyMotionTarget',        { fg = p.lime, bold = true })
  hl('EasyMotionTarget2First',  { fg = p.hot_magenta, bold = true })
  hl('EasyMotionTarget2Second', { fg = p.blue_easymotion, bold = true })

  -- vim-markdown
  -- (htmlH1-H6 defined above)

  -- indent-blankline / vim-indent-guides
  hl('IndentGuidesOdd',         { bg = p.bg4 })
  hl('IndentGuidesEven',        { bg = p.gray1 })
  hl('IblIndent',               { fg = p.bg3 })
  hl('IblScope',                { fg = p.light_purple })

  -- gitsigns.nvim / vim-gitgutter
  hl('GitGutterAdd',            { fg = p.aqua })
  hl('GitGutterChange',         { fg = p.yellow })
  hl('GitGutterDelete',         { fg = p.red })
  hl('GitGutterChangeDelete',   { fg = p.light_purple })
  hl('GitSignsAdd',             { fg = p.aqua })
  hl('GitSignsChange',          { fg = p.yellow })
  hl('GitSignsDelete',          { fg = p.red })

  -- vim-signify
  hl('SignifySignAdd',          { fg = p.aqua })
  hl('SignifySignChange',       { fg = p.yellow })
  hl('SignifySignDelete',       { fg = p.red })
  hl('SignifySignChangeDelete', { fg = p.light_purple })

  -- vim-startify / alpha-nvim / dashboard-nvim
  hl('StartifyFile',    { link = 'Normal' })
  hl('StartifyHeader',  { fg = p.magenta })
  hl('startifySection', { fg = p.blue, bold = true })

  -- YouCompleteMe / nvim-cmp
  hl('YcmErrorSection',   { fg = p.fg, bg = p.maroon })
  hl('YcmWarningSection', { fg = p.fg, bg = p.slate_blue })
  hl('CmpItemAbbrMatch',        { fg = p.cyan_blue, bold = true })
  hl('CmpItemAbbrMatchFuzzy',   { fg = p.cyan_blue, bold = true })
  hl('CmpItemKindFunction',     { fg = p.purple })
  hl('CmpItemKindMethod',       { fg = p.purple })
  hl('CmpItemKindVariable',     { fg = p.blue })
  hl('CmpItemKindKeyword',      { fg = p.blue })
  hl('CmpItemKindText',         { fg = p.fg })
  hl('CmpItemKindProperty',     { fg = p.blue })
  hl('CmpItemKindUnit',         { fg = p.soft_pink })

  -- vim-leader-guide / which-key.nvim
  hl('LeaderGuideDesc',     { link = 'Normal' })
  hl('LeaderGuideKeys',     { fg = p.purple, bold = true })
  hl('LeaderGuideBrackets', { fg = p.aqua })
  hl('WhichKey',            { fg = p.purple, bold = true })
  hl('WhichKeyGroup',       { fg = p.blue })
  hl('WhichKeyDesc',        { fg = p.fg })
  hl('WhichKeySeparator',   { fg = p.teal })
  hl('WhichKeyFloat',       { bg = p.bg1 })

  -- NERDTree / nvim-tree
  hl('NERDTreeCWD',      { fg = p.purple, bold = true })
  hl('NERDTreeUp',       { fg = p.blue, bold = true })
  hl('NERDTreeDir',      { fg = p.blue, bold = true })
  hl('NERDTreeDirSlash', { fg = p.blue, bold = true })
  hl('NERDTreeOpenable', { fg = p.blue, bold = true })
  hl('NERDTreeClosable', { fg = p.blue, bold = true })
  hl('NERDTreeExecFile', { fg = p.pink, bold = true })
  hl('NERDTreeLinkTarget', { link = 'Macro' })
  hl('NvimTreeRootFolder',  { fg = p.purple, bold = true })
  hl('NvimTreeFolderIcon',  { fg = p.blue })
  hl('NvimTreeFolderName',  { fg = p.blue, bold = true })
  hl('NvimTreeOpenedFolderName', { fg = p.blue, bold = true })
  hl('NvimTreeGitDirty',   { fg = p.yellow })
  hl('NvimTreeGitNew',     { fg = p.aqua })
  hl('NvimTreeGitDeleted', { fg = p.red })
  hl('NvimTreeSpecialFile', { fg = p.purple })

  -- Tagbar
  hl('TagbarKind',             { fg = p.purple, bold = true })
  hl('TagbarScope',            { fg = p.purple, bold = true })
  hl('TagbarHighlight',        { fg = p.bg, bg = p.aqua, bold = true })
  hl('TagbarNestedKind',       { fg = p.blue, bold = true })
  hl('TagbarVisibilityPublic', { fg = p.pure_green })

  -- vim-signature
  hl('SignatureMarkText', { fg = p.yellow, bold = true })

  -- vim_current_word / illuminate
  hl('CurrentWord',      { bg = p.bg1, underline = true })
  hl('CurrentWordTwins', { bg = p.bg1 })
  hl('IlluminatedWordText',  { bg = p.bg3 })
  hl('IlluminatedWordRead',  { bg = p.bg3 })
  hl('IlluminatedWordWrite', { bg = p.bg3, bold = true })

  -- quick-scope
  hl('QuickScopePrimary',   { fg = p.bright_lime, underline = true })
  hl('QuickScopeSecondary', { fg = p.bright_yellow, underline = true })

  -- telescope.nvim
  hl('TelescopeNormal',        { fg = p.fg, bg = p.bg1 })
  hl('TelescopeBorder',        { fg = p.light_purple, bg = p.bg1 })
  hl('TelescopePromptNormal',  { fg = p.fg, bg = p.bg3 })
  hl('TelescopePromptBorder',  { fg = p.light_purple, bg = p.bg3 })
  hl('TelescopePromptTitle',   { fg = p.bg, bg = p.purple, bold = true })
  hl('TelescopePreviewTitle',  { fg = p.bg, bg = p.aqua, bold = true })
  hl('TelescopeResultsTitle',  { fg = p.bg, bg = p.blue, bold = true })
  hl('TelescopeSelection',     { bg = p.bg3 })
  hl('TelescopeMatching',      { fg = p.cyan_blue, bold = true })

  -- render-markdown.nvim
  hl('RenderMarkdownCode',       { bg = p.bg1 })
  hl('RenderMarkdownCodeInline', { fg = p.aqua, bg = p.bg1 })
  hl('RenderMarkdownH1Bg',      { fg = p.blue, bg = p.bg3, bold = true })
  hl('RenderMarkdownH2Bg',      { fg = p.aqua, bg = p.bg3, bold = true })
  hl('RenderMarkdownH3Bg',      { fg = p.mint, bg = p.bg3, bold = true })
  hl('RenderMarkdownH4Bg',      { fg = p.light_yellow, bg = p.bg3, bold = true })
  hl('RenderMarkdownH5Bg',      { fg = p.blue, bg = p.bg3 })
  hl('RenderMarkdownH6Bg',      { fg = p.aqua, bg = p.bg3 })

  -- lazy.nvim
  hl('LazyButton',       { fg = p.fg, bg = p.bg3 })
  hl('LazyButtonActive', { fg = p.bg, bg = p.purple, bold = true })
  hl('LazyH1',           { fg = p.bg, bg = p.purple, bold = true })
  hl('LazySpecial',      { fg = p.purple })

  -- ALE (legacy, kept for non-LSP setups)
  hl('ALEErrorSign',   { link = 'DiagnosticSignError' })
  hl('ALEWarningSign', { link = 'DiagnosticSignWarn' })
end

return M
