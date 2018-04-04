" wal.vim -- Vim color scheme.
" Author:       Dylan Araps
" Webpage:      https://github.com/dylanaraps/wal
" Description:  A colorscheme that uses your terminal colors, made to work with 'wal'.

highlight clear
set background=dark

if exists('syntax_on')
    syntax reset
endif

" Colorscheme name
let g:colors_name = 'custom-wal'

" highlight groups {{{

" set t_Co=16
highlight Normal ctermbg=NONE ctermfg=7
highlight NonText ctermbg=0 ctermfg=4
highlight Comment ctermbg=NONE ctermfg=8
highlight Constant ctermbg=NONE ctermfg=3
highlight Error ctermbg=1 ctermfg=7
highlight Identifier ctermbg=NONE ctermfg=1 cterm=BOLD
highlight Ignore ctermbg=8 ctermfg=0
highlight PreProc ctermbg=NONE ctermfg=3
highlight Special ctermbg=NONE ctermfg=6
highlight Statement ctermbg=NONE ctermfg=1
highlight String ctermbg=NONE ctermfg=2
highlight Number ctermbg=NONE ctermfg=3
highlight Todo ctermbg=2 ctermfg=0
highlight Type ctermbg=NONE ctermfg=3
highlight Underlined ctermbg=NONE ctermfg=1 cterm=underline
highlight StatusLine ctermbg=7 ctermfg=0
highlight StatusLineNC ctermbg=NONE ctermfg=NONE
highlight TabLine ctermbg=NONE ctermfg=8
highlight TabLineFill ctermbg=NONE ctermfg=8
highlight TabLineSel ctermbg=4 ctermfg=0
highlight TermCursorNC ctermbg=3 ctermfg=0
highlight VertSplit ctermbg=1 ctermfg=0
highlight Title ctermbg=NONE ctermfg=4
highlight CursorLine ctermbg=8 ctermfg=0
highlight LineNr ctermbg=NONE ctermfg=8
highlight CursorLineNr ctermbg=NONE ctermfg=8
highlight helpLeadBlank ctermbg=NONE ctermfg=7
highlight helpNormal ctermbg=NONE ctermfg=7
highlight Visual ctermbg=0 ctermfg=15 cterm=reverse term=reverse
highlight VisualNOS ctermbg=NONE ctermfg=1
highlight Pmenu ctermbg=8 ctermfg=7
highlight PmenuSbar ctermbg=6 ctermfg=7
highlight PmenuSel ctermbg=4 ctermfg=0
highlight PmenuThumb ctermbg=8 ctermfg=8
highlight FoldColumn ctermbg=NONE ctermfg=7
highlight Folded ctermbg=NONE ctermfg=8
highlight WildMenu ctermbg=2 ctermfg=0
highlight SpecialKey ctermbg=NONE ctermfg=8
highlight DiffAdd ctermbg=NONE ctermfg=2
highlight DiffChange ctermbg=NONE ctermfg=8
highlight DiffDelete ctermbg=NONE ctermfg=1
highlight DiffText ctermbg=NONE ctermfg=4
highlight IncSearch ctermbg=3 ctermfg=0
highlight Search ctermbg=3 ctermfg=0
highlight Directory ctermbg=NONE ctermfg=4
highlight MatchParen ctermbg=8 ctermfg=0
highlight ColorColumn ctermbg=0 gui=reverse cterm=reverse
highlight signColumn ctermbg=NONE ctermfg=4
highlight ErrorMsg ctermbg=NONE ctermfg=8
highlight ModeMsg ctermbg=NONE ctermfg=2
highlight MoreMsg ctermbg=NONE ctermfg=2
highlight Question ctermbg=NONE ctermfg=4
highlight WarningMsg ctermbg=1 ctermfg=0
highlight Cursor ctermbg=NONE ctermfg=8
highlight Structure ctermbg=NONE ctermfg=5
highlight CursorColumn ctermbg=8 ctermfg=7
highlight ModeMsg ctermbg=NONE ctermfg=7
highlight SpellBad ctermbg=1 ctermfg=0
highlight SpellCap ctermbg=NONE ctermfg=4 cterm=underline
highlight SpellLocal ctermbg=NONE ctermfg=5 cterm=underline
highlight SpellRare ctermbg=NONE ctermfg=6 cterm=underline
highlight Boolean ctermbg=NONE ctermfg=5
highlight Character ctermbg=NONE ctermfg=1
highlight Conditional ctermbg=NONE ctermfg=5
highlight Define ctermbg=NONE ctermfg=5
highlight Delimiter ctermbg=NONE ctermfg=5
highlight Float ctermbg=NONE ctermfg=5
highlight Include ctermbg=NONE ctermfg=4
highlight Keyword ctermbg=NONE ctermfg=5
highlight Label ctermbg=NONE ctermfg=3
highlight Operator ctermbg=NONE ctermfg=7
highlight Repeat ctermbg=NONE ctermfg=3
highlight SpecialChar ctermbg=NONE ctermfg=5
highlight Tag ctermbg=NONE ctermfg=3
highlight Typedef ctermbg=NONE ctermfg=3
highlight vimUserCommand ctermbg=NONE ctermfg=1 cterm=BOLD
    highlight link vimMap vimUserCommand
    highlight link vimLet vimUserCommand
    highlight link vimCommand vimUserCommand
    highlight link vimFTCmd vimUserCommand
    highlight link vimAutoCmd vimUserCommand
    highlight link vimNotFunc vimUserCommand
highlight vimNotation ctermbg=NONE ctermfg=4
highlight vimMapModKey ctermbg=NONE ctermfg=4
highlight vimBracket ctermbg=NONE ctermfg=7
highlight vimCommentString ctermbg=NONE ctermfg=8
highlight htmlLink ctermbg=NONE ctermfg=1 cterm=underline
highlight htmlBold ctermbg=NONE ctermfg=3 cterm=BOLD
highlight htmlItalic ctermbg=NONE ctermfg=5
highlight htmlEndTag ctermbg=NONE ctermfg=7
highlight htmlTag ctermbg=NONE ctermfg=7
highlight htmlTagName ctermbg=NONE ctermfg=1 cterm=BOLD
highlight htmlH1 ctermbg=NONE ctermfg=7
    highlight link htmlH2 htmlH1
    highlight link htmlH3 htmlH1
    highlight link htmlH4 htmlH1
    highlight link htmlH5 htmlH1
    highlight link htmlH6 htmlH1
highlight cssMultiColumnAttr ctermbg=NONE ctermfg=2
    highlight link cssFontAttr cssMultiColumnAttr
    highlight link cssFlexibleBoxAttr cssMultiColumnAttr
highlight cssBraces ctermbg=NONE ctermfg=7
    highlight link cssAttrComma cssBraces
highlight cssValueLength ctermbg=NONE ctermfg=7
highlight cssUnitDecorators ctermbg=NONE ctermfg=7
highlight cssValueNumber ctermbg=NONE ctermfg=7
    highlight link cssValueLength cssValueNumber
highlight cssNoise ctermbg=NONE ctermfg=8
highlight cssTagName ctermbg=NONE ctermfg=1
highlight cssFunctionName ctermbg=NONE ctermfg=4
highlight scssSelectorChar ctermbg=NONE ctermfg=7
highlight scssAttribute ctermbg=NONE ctermfg=7
    highlight link scssDefinition cssNoise
highlight sassidChar ctermbg=NONE ctermfg=1
highlight sassClassChar ctermbg=NONE ctermfg=5
highlight sassInclude ctermbg=NONE ctermfg=5
highlight sassMixing ctermbg=NONE ctermfg=5
highlight sassMixinName ctermbg=NONE ctermfg=4
highlight javaScript ctermbg=NONE ctermfg=7
highlight javaScriptBraces ctermbg=NONE ctermfg=7
highlight javaScriptNumber ctermbg=NONE ctermfg=5
highlight markdownH1 ctermbg=NONE ctermfg=7
    highlight link markdownH2 markdownH1
    highlight link markdownH3 markdownH1
    highlight link markdownH4 markdownH1
    highlight link markdownH5 markdownH1
    highlight link markdownH6 markdownH1
highlight markdownAutomaticLink ctermbg=NONE ctermfg=1 cterm=underline
    highlight link markdownUrl markdownAutomaticLink
highlight markdownError ctermbg=NONE ctermfg=7
highlight markdownCode ctermbg=NONE ctermfg=3
highlight markdownCodeBlock ctermbg=NONE ctermfg=3
highlight markdownCodeDelimiter ctermbg=NONE ctermfg=5
highlight xdefaultsValue ctermbg=NONE ctermfg=7
highlight rubyInclude ctermbg=NONE ctermfg=4
highlight rubyDefine ctermbg=NONE ctermfg=5
highlight rubyFunction ctermbg=NONE ctermfg=4
highlight rubyStringDelimiter ctermbg=NONE ctermfg=2
highlight rubyInteger ctermbg=NONE ctermfg=3
highlight rubyAttribute ctermbg=NONE ctermfg=4
highlight rubyConstant ctermbg=NONE ctermfg=3
highlight rubyInterpolation ctermbg=NONE ctermfg=2
highlight rubyInterpolationDelimiter ctermbg=NONE ctermfg=3
highlight rubyRegexp ctermbg=NONE ctermfg=6
highlight rubySymbol ctermbg=NONE ctermfg=2
highlight rubyTodo ctermbg=NONE ctermfg=8
highlight rubyRegexpAnchor ctermbg=NONE ctermfg=7
    highlight link rubyRegexpQuantifier rubyRegexpAnchor
highlight pythonOperator ctermbg=NONE ctermfg=5
highlight pythonFunction ctermbg=NONE ctermfg=4
highlight pythonRepeat ctermbg=NONE ctermfg=5
highlight pythonStatement ctermbg=NONE ctermfg=1 cterm=Bold
highlight pythonBuiltIn ctermbg=NONE ctermfg=4
highlight phpMemberSelector ctermbg=NONE ctermfg=7
highlight phpComparison ctermbg=NONE ctermfg=7
highlight phpParent ctermbg=NONE ctermfg=7
highlight cOperator ctermbg=NONE ctermfg=6
highlight cPreCondit ctermbg=NONE ctermfg=5
highlight SignifySignAdd ctermbg=NONE ctermfg=2
highlight SignifySignChange ctermbg=NONE ctermfg=4
highlight SignifySignDelete ctermbg=NONE ctermfg=1
highlight NERDTreeDirSlash ctermbg=NONE ctermfg=4
highlight NERDTreeExecFile ctermbg=NONE ctermfg=7
highlight ALEErrorSign ctermbg=NONE ctermfg=1
highlight ALEWarningSign ctermbg=NONE ctermfg=3
highlight ALEError ctermbg=NONE ctermfg=1
highlight ALEWarning ctermbg=NONE ctermfg=3

" }}}

" Plugin options {{{

let g:limelight_conceal_ctermfg = 8

" }}}
