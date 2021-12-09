" Name:         mycolor
" Author:       Anders Kildemand
" Maintainer:   Anders Kildemand
" Website:      https://github.com/gaprop/my-color
" License:      Vim License (see `:help license`)

set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'mycolor'

" let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2

hi! link EndOfBuffer NonText
hi! link QuickFixLine Search
hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Define PreProc
hi! link Debug Special
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Number
hi! link Function Identifier
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PreCondit PreProc
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor
hi! link jsFlowMaybe Normal
hi! link jsFlowObject Normal
hi! link jsFlowType PreProc
hi! link jsArrowFunction Operator
hi! link jsClassDefinition Normal
hi! link jsClassFuncName Title
hi! link jsImport Include
hi! link jsExport Include
hi! link jsFrom PreProc
hi! link jsFuncName Identifier
hi! link jsFutureKeys Statement
hi! link jsFuncCall Identifier
hi! link jsGlobalObjects Statement
hi! link jsModuleKeywords Statement
hi! link jsModuleOperators Statement
hi! link jsNull Constant
hi! link jsObjectFuncName Identifier
hi! link jsObjectKey Title
hi! link jsSuper Statement
hi! link jsTemplateBraces Special
hi! link jsUndefined Constant
hi! link jsFunction PreProc
hi! link jsThis Constant
hi! link jsStorageClass PreProc
hi! link jsVariableDef Title
hi! link rubyClass PreProc
hi! link rubyConstant Constant
hi! link rubyInstanceVariable Title
hi! link rubyInterpolationDelimiter Identifier
hi! link rubyModule Statement
hi! link rubyFunction Identifier
hi! link rubyInclude Include
hi! link markdownBold Special
hi! link markdownCode String
hi! link markdownCodeDelimiter String
hi! link markdownHeadingDelimiter Comment
hi! link markdownRule Comment

" if (has('termguicolors') && &termguicolors) || has('gui_running')
"   let g:terminal_ansi_colors = ['Black', 'DarkRed', 'DarkGreen', 'DarkYellow',
"         \ 'DarkBlue', 'DarkMagenta', 'DarkCyan', 'LightGrey', 'DarkGrey', 'Red',
"         \ 'Green', '#962D4C', 'Blue', '#D884C7', 'Cyan', 'White']
  hi Normal guifg=#8098b1 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi ColorColumn guifg=NONE guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi Cursor guifg=Black guibg=fg guisp=NONE gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi CursorLine guifg=NONE guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi CursorLineNr guifg=#D4D3D7 guibg=#2C2540 guisp=NONE gui=bold cterm=bold
  hi DiffAdd guifg=NONE guibg=#574dae guisp=NONE gui=NONE cterm=NONE
  hi DiffChange guifg=NONE guibg=#FF0000 guisp=NONE gui=NONE cterm=NONE
  hi DiffDelete guifg=Black guibg=#FF0000 guisp=NONE gui=bold cterm=bold
  hi DiffText guifg=NONE guibg=Red guisp=NONE gui=bold cterm=bold
  hi FoldColumn guifg=#525252 guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi Folded guifg=#525252 guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi LineNr guifg=#888690 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi NonText guifg=#525252 guibg=NONE guisp=NONE gui=bold cterm=bold
  hi Pmenu guifg=#8098b1 guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi PmenuSbar guifg=NONE guibg=#3E3B4B guisp=NONE gui=NONE cterm=NONE
  hi PmenuSel guifg=#8098b1 guibg=#525252 guisp=NONE gui=NONE cterm=NONE
  hi PmenuThumb guifg=NONE guibg=#8098b1 guisp=NONE gui=NONE cterm=NONE
  hi Search guifg=Black guibg=#962D4C guisp=NONE gui=NONE cterm=NONE
  hi SignColumn guifg=#888690 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi SignColumn guifg=#8098b1 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi SpecialKey guifg=#8098b1 guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi StatusLine guifg=#8098b1 guibg=#2C2540 guisp=NONE gui=bold,reverse cterm=bold,reverse
  hi StatusLineNC guifg=#8098b1 guibg=#2C2540 guisp=NONE gui=reverse cterm=reverse
  hi TabLine guifg=#525252 guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi TabLineFill guifg=NONE guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi TabLineSel guifg=#574dae guibg=#2C2540 guisp=NONE gui=NONE cterm=NONE
  hi Title guifg=#574dae guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Todo guifg=#ffffff guibg=#2d1d34 guisp=NONE gui=NONE cterm=NONE
  hi VertSplit guifg=#2C2540 guibg=#525252 guisp=NONE gui=reverse cterm=reverse
  hi Visual guifg=NONE guibg=#3E3B4B guisp=NONE gui=NONE cterm=NONE
  hi VisualNOS guifg=NONE guibg=NONE guisp=NONE gui=bold,underline ctermfg=NONE ctermbg=NONE cterm=bold,underline
  hi WildMenu guifg=Black guibg=#FF0000 guisp=NONE gui=NONE cterm=NONE
  hi Comment guifg=#495495 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Constant guifg=#724372 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Error guifg=#8098b1 guibg=Red guisp=NONE gui=NONE cterm=NONE
  hi Identifier guifg=#525252 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Ignore guifg=Black guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Include guifg=#574dae guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi PreProc guifg=#ffffff guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Special guifg=#724372 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Statement guifg=#ffffff guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi String guifg=#b18b77 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Type guifg=#c9af82 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi Underlined guifg=#FF0000 guibg=NONE guisp=NONE gui=underline cterm=underline
  hi rubySymbol guifg=#FF0000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi rubyBoolean guifg=#FF0000 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  " unlet s:t_Co
  finish
endif

" if s:t_Co >= 256
"   hi Normal ctermfg=7 ctermbg=8 cterm=NONE
"   if !has('patch-8.0.0616') " Fix for Vim bug
"     set background=dark
"   endif
"   hi ColorColumn ctermfg=NONE ctermbg=7 cterm=NONE
"   hi Cursor ctermbg=fg cterm=NONE
"   hi CursorColumn ctermfg=NONE ctermbg=7 cterm=NONE
"   hi CursorLine ctermfg=NONE ctermbg=7 cterm=NONE
"   hi CursorLineNr ctermfg=7 ctermbg=7 cterm=NONE
"   hi DiffAdd ctermfg=NONE ctermbg=121 cterm=NONE
"   hi DiffChange ctermfg=NONE ctermbg=13 cterm=NONE
"   hi DiffDelete ctermbg=224 cterm=NONE
"   hi DiffText ctermfg=NONE ctermbg=9 cterm=bold
"   hi FoldColumn ctermfg=14 ctermbg=7 cterm=NONE
"   hi Folded ctermfg=14 ctermbg=7 cterm=NONE
"   hi LineNr ctermfg=7 ctermbg=NONE cterm=NONE
"   hi NonText ctermfg=14 ctermbg=NONE cterm=NONE
"   hi Pmenu ctermfg=7 ctermbg=7 cterm=NONE
"   hi PmenuSbar ctermfg=NONE ctermbg=8 cterm=NONE
"   hi PmenuSel ctermfg=7 ctermbg=14 cterm=NONE
"   hi PmenuThumb ctermfg=NONE ctermbg=7 cterm=NONE
"   hi Search ctermbg=11 cterm=NONE
"   hi SignColumn ctermfg=7 ctermbg=NONE cterm=NONE
"   hi SignColumn ctermfg=7 ctermbg=NONE cterm=NONE
"   hi SpecialKey ctermfg=7 ctermbg=7 cterm=NONE
"   hi StatusLine ctermfg=7 ctermbg=7 cterm=bold,reverse
"   hi StatusLineNC ctermfg=7 ctermbg=7 cterm=reverse
"   hi TabLine ctermfg=14 ctermbg=7 cterm=NONE
"   hi TabLineFill ctermfg=NONE ctermbg=7 cterm=NONE
"   hi TabLineSel ctermfg=224 ctermbg=7 cterm=NONE
"   hi Title ctermfg=13 ctermbg=NONE cterm=NONE
"   hi Todo ctermbg=11 cterm=NONE
"   hi VertSplit ctermfg=7 ctermbg=14 cterm=reverse
"   hi Visual ctermfg=NONE ctermbg=8 cterm=NONE
"   hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=bold,underline
"   hi WildMenu ctermbg=11 cterm=NONE
"   hi Comment ctermfg=14 ctermbg=NONE cterm=NONE
"   hi Constant ctermfg=9 ctermbg=NONE cterm=NONE
"   hi Error ctermfg=7 ctermbg=9 cterm=NONE
"   hi Identifier ctermfg=14 ctermbg=NONE cterm=NONE
"   hi Ignore ctermbg=NONE cterm=NONE
"   hi Include ctermfg=121 ctermbg=NONE cterm=NONE
"   hi PreProc ctermfg=11 ctermbg=NONE cterm=NONE
"   hi Special ctermfg=224 ctermbg=NONE cterm=NONE
"   hi Statement ctermfg=11 ctermbg=NONE cterm=NONE
"   hi String ctermfg=224 ctermbg=NONE cterm=NONE
"   hi Type ctermfg=9 ctermbg=NONE cterm=NONE
"   hi Underlined ctermfg=14 ctermbg=NONE cterm=underline
"   hi rubySymbol ctermfg=224 ctermbg=NONE cterm=NONE
"   hi rubyBoolean ctermfg=224 ctermbg=NONE cterm=NONE
"   unlet s:t_Co
"   finish
" endif
" 
" if s:t_Co >= 8
"   hi Normal ctermfg=LightGray ctermbg=DarkGray cterm=NONE
"   if !has('patch-8.0.0616') " Fix for Vim bug
"     set background=dark
"   endif
"   hi ColorColumn ctermfg=NONE ctermbg=LightGray cterm=NONE
"   hi Cursor ctermfg=Black ctermbg=fg cterm=NONE
"   hi CursorColumn ctermfg=NONE ctermbg=LightGray cterm=NONE
"   hi CursorLine ctermfg=NONE ctermbg=LightGray cterm=NONE
"   hi CursorLineNr ctermfg=LightGray ctermbg=LightGray cterm=NONE
"   hi DiffAdd ctermfg=NONE ctermbg=LightGreen cterm=NONE
"   hi DiffChange ctermfg=NONE ctermbg=Magenta cterm=NONE
"   hi DiffDelete ctermfg=Black ctermbg=LightRed cterm=NONE
"   hi DiffText ctermfg=NONE ctermbg=Red cterm=bold
"   hi FoldColumn ctermfg=Cyan ctermbg=LightGray cterm=NONE
"   hi Folded ctermfg=Cyan ctermbg=LightGray cterm=NONE
"   hi LineNr ctermfg=LightGray ctermbg=NONE cterm=NONE
"   hi NonText ctermfg=Cyan ctermbg=NONE cterm=NONE
"   hi Pmenu ctermfg=LightGray ctermbg=LightGray cterm=NONE
"   hi PmenuSbar ctermfg=NONE ctermbg=DarkGray cterm=NONE
"   hi PmenuSel ctermfg=LightGray ctermbg=Cyan cterm=NONE
"   hi PmenuThumb ctermfg=NONE ctermbg=LightGray cterm=NONE
"   hi Search ctermfg=Black ctermbg=Yellow cterm=NONE
"   hi SignColumn ctermfg=LightGray ctermbg=NONE cterm=NONE
"   hi SignColumn ctermfg=LightGray ctermbg=NONE cterm=NONE
"   hi SpecialKey ctermfg=LightGray ctermbg=LightGray cterm=NONE
"   hi StatusLine ctermfg=LightGray ctermbg=LightGray cterm=bold,reverse
"   hi StatusLineNC ctermfg=LightGray ctermbg=LightGray cterm=reverse
"   hi TabLine ctermfg=Cyan ctermbg=LightGray cterm=NONE
"   hi TabLineFill ctermfg=NONE ctermbg=LightGray cterm=NONE
"   hi TabLineSel ctermfg=LightRed ctermbg=LightGray cterm=NONE
"   hi Title ctermfg=Magenta ctermbg=NONE cterm=NONE
"   hi Todo ctermfg=Black ctermbg=Yellow cterm=NONE
"   hi VertSplit ctermfg=LightGray ctermbg=Cyan cterm=reverse
"   hi Visual ctermfg=NONE ctermbg=DarkGray cterm=NONE
"   hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=bold,underline
"   hi WildMenu ctermfg=Black ctermbg=Yellow cterm=NONE
"   hi Comment ctermfg=Cyan ctermbg=NONE cterm=NONE
"   hi Constant ctermfg=Red ctermbg=NONE cterm=NONE
"   hi Error ctermfg=LightGray ctermbg=Red cterm=NONE
"   hi Identifier ctermfg=Cyan ctermbg=NONE cterm=NONE
"   hi Ignore ctermfg=Black ctermbg=NONE cterm=NONE
"   hi Include ctermfg=LightGreen ctermbg=NONE cterm=NONE
"   hi PreProc ctermfg=Yellow ctermbg=NONE cterm=NONE
"   hi Special ctermfg=LightRed ctermbg=NONE cterm=NONE
"   hi Statement ctermfg=Yellow ctermbg=NONE cterm=NONE
"   hi String ctermfg=LightRed ctermbg=NONE cterm=NONE
"   hi Type ctermfg=Red ctermbg=NONE cterm=NONE
"   hi Underlined ctermfg=Cyan ctermbg=NONE cterm=underline
"   hi rubySymbol ctermfg=LightRed ctermbg=NONE cterm=NONE
"   hi rubyBoolean ctermfg=LightRed ctermbg=NONE cterm=NONE
"   unlet s:t_Co
"   finish
" endif

" Color: black                Black                  0        Black
" Color: blue                 Blue                  12        Blue
" Color: cyan                 Cyan                  14        Cyan
" Color: cyanidentifier       #58679B               14        Cyan
" Color: darkblue             DarkBlue               4        DarkBlue
" Color: darkcyan             DarkCyan               6        DarkCyan
" Color: darkgreen            DarkGreen              2        DarkGreen
" Color: darkmagenta          DarkMagenta            5        DarkMagenta
" Color: darkred              DarkRed                1        DarkRed
" Color: green                Green                 10        Green
" Color: lightgrey            LightGrey              7        LightGrey
" Color: red                  Red                    9        Red
" Color: white                White                 15        White
" Color: darkyellow           DarkYellow             3        DarkYellow
" Color: darkgrey             DarkGrey               8        DarkGrey
" Color: s_steelgray          #262335                8        DarkGray
" Color: s_white              #8098b1                7        LightGray
" Color: s_tolopea            #2C2540                7        LightGray
" Color: s_oslogray           #888690                7        LightGray
" Color: s_lightgray          #D4D3D7                7        LightGray
" Color: s_yellow             #FF0000                11       Yellow
" Color: s_governorbay        #525252                14       Cyan
" Color: s_grape              #3E3B4B                8        DarkGray
" Color: s_red                #B49052                9        Red
" Color: s_lightred           #FF0000                224      LightRed
" Color: s_magenta            #FF0000                13       Magenta
" Color: s_orange             #EA9652                224      LightRed
" Color: s_green              #574dae                121      LightGreen
" Term Colors: black darkred darkgreen darkyellow darkblue darkmagenta darkcyan lightgrey
" Term Colors: darkgrey red green s_yellow blue s_magenta cyan white
" Background: dark
" vim: et ts=2 sw=2
