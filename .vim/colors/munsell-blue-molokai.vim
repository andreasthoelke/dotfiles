" Vim color file
"
" Munsell-blue Color scheme. (Custom Matarial Design colors 2018-12)

" Based on Molokai colorscheme:
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson

hi clear

let g:colors_name="munsell-blue-molokai"

" set background=light
set background=dark

hi vimString guifg=#009900

hi Boolean         guifg=#AE81FF
hi Character       guifg=#E6DB74
hi Number          guifg=#AE81FF
hi String          guifg=#E6DB74
hi Conditional     guifg=#F92672               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF
" hi Delimiter       guifg=#8F8F8F
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#4C4745 gui=italic,bold"

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#E6DB74 guibg=#1E0010
" hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi ErrorMsg        guifg=#F6DC69 guibg=#151719
hi Exception       guifg=#A6E22E               gui=bold
hi Float           guifg=#AE81FF

" hi FoldColumn      guifg=#465457 guibg=#000000
" hi Folded          guifg=#465457 guibg=#000000
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#111111

hi Keyword        guifg=#2C9E71
hi Identifier      guifg=#FD971F
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#66D9EF               gui=italic

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#E0306F

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#A6E22E               gui=bold
hi PreProc         guifg=#A6E22E
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=bold
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#7E8E91
hi Special         guifg=#66D9EF guibg=bg      gui=italic
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#F92672               gui=bold
" hi StatusLine      guifg=#455354 guibg=fg
" hi StatusLineNC    guifg=#808080 guibg=#080808
hi StatusLine guibg=#000000 gui=bold
hi StatusLineNC guibg=#000000 gui=bold


hi StorageClass    guifg=#FD971F               gui=italic
hi Structure       guifg=#66D9EF
hi Tag             guifg=#F92672               gui=italic
hi Title           guifg=#ef5939
" hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF
hi Type            guifg=#66D9EF               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#000000 guibg=#080808 gui=bold
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000

hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
hi TabLine         guibg=#1B1D1E guifg=#808080 gui=none


" Copied from https://github.com/dim13/smyck.vim ----------------------------------------------------------------------
" ----------------------------------------------------------------------------
" Syntax Highlighting
" ----------------------------------------------------------------------------
hi Function              cterm=none ctermbg=none ctermfg=10          gui=none        guifg=#D1FA71
" hi Delimiter            cterm=none ctermbg=none ctermfg=15          gui=none        guifg=#F7F7F7
hi Identifier           cterm=none ctermbg=none ctermfg=12          gui=none        guifg=#96D9F1
hi Structure            cterm=none ctermbg=none ctermfg=12          gui=none        guifg=#9DEEF2
hi Ignore               cterm=none ctermbg=none ctermfg=8           gui=none        guifg=bg
hi Constant             cterm=none ctermbg=none ctermfg=12          gui=none        guifg=#96D9F1
hi PreProc              cterm=none ctermbg=none ctermfg=10          gui=none        guifg=#D1FA71
hi Type                 cterm=none ctermbg=none ctermfg=12          gui=none        guifg=#72BCD6
hi Statement            cterm=none ctermbg=none ctermfg=10          gui=none        guifg=#D1FA71
hi Special              cterm=none ctermbg=none ctermfg=6           gui=none        guifg=#d7d7d7
hi String               cterm=none ctermbg=none ctermfg=3           gui=none        guifg=#F6DC69
hi Number               cterm=none ctermbg=none ctermfg=3           gui=none        guifg=#F6DC69
hi Underlined           cterm=none ctermbg=none ctermfg=5           gui=underline   guibg=#272727
hi Symbol               cterm=none ctermbg=none ctermfg=9           gui=none        guifg=#FAB1AB
hi Method               cterm=none ctermbg=none ctermfg=15          gui=none        guifg=#F7F7F7
hi Interpolation        cterm=none ctermbg=none ctermfg=6           gui=none        guifg=#2EB5C1

" Code copied from: --------------------------------------------------------------------------
" https://github.com/skielbasa/vim-material-monokai
if ! exists("g:materialmonokai_gui_italic")
    let g:materialmonokai_gui_italic = 1
endif

if ! exists("g:materialmonokai_italic")
    let g:materialmonokai_italic = 0
endif

let g:materialmonokai_termcolors = 256 " does not support 16 color term right now.

function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:materialmonokai_italic == 0
    let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
  endif
  if g:materialmonokai_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ",italic", "", "")
    let s:guiformat = substitute(s:guiformat, "italic,", "", "")
    let s:guiformat = substitute(s:guiformat, "italic", "", "")
  endif
  if g:materialmonokai_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction




" Munsell Blue Colors: -------------------------
" Colorscheme: https://coolors.co/0087af-76e0d9-aab27c-983b4d-065143

" Tools:
" > current Highlights
" command! HighlightTest exec "source $VIMRUNTIME/syntax/hitest.vim"
" > disable highlighting for a group
" hi clear DataConstructor
" > where was the highlight set?
" verbose hi DataConstructor

" * Syntax stack
" `<leader>hsg :call SyntaxStack()`
" * Syntax group → Highlight group
" `<leader>hhg :call SyntaxGroup()`
" * Highlight group - color values
" `<leader>hsc :call SyntaxColor()
" `
" > Highligh color values in the current line
" `nnoremap <leader>hcc :,ColorHighlight<CR>`
" `nnoremap <leader>hcd :ColorClear<CR>`

" Get syntax group
" echo synIDattr( synID( line('.'), col('.'), 0), 'name' )

" PURESCRIPT HASKELL COLORS: ---------------------------

" purescriptFunction > Function
" hi! Function guifg=#0087AF "munsell blue"
hi! Function guifg=#008EB8 "munsell blue"

" purescriptIdentifier > purescriptIdentifier
" hi! purescriptIdentifier guifg=#E7F4F7 "anti flash white"
hi! purescriptIdentifier guifg=#BECACD "white-grey"

" purescriptType > Type
hi! Type guifg=#76E0D9 "middle blue"

" purescriptTypeVar > Identifier
hi! Identifier guifg=#AAB27C "Misty moss - shift sage yellow from red to green"

" purescriptConstructor
hi! DataConstructor guifg=#983B4D "smoky topaz red"
hi! def link purescriptConstructor DataConstructor

" purescipt Import section
hi! def link purescriptModule Function
hi! def link purescriptImport Function
hi! def link purescriptImportParams Statement
hi! def link purescriptImportAs Type

" let g:color_sacramento_green_brighter = '#066150'
let g:color_sacramento_green_brighter = '#077D67'

" purescriptNumber > Number
hi! def link purescriptNumber Number
exec 'hi! Number guifg=' . g:color_sacramento_green_brighter

" purescriptFloat > Float
exec 'hi! Float guifg=' . g:color_sacramento_green_brighter

" purescriptString > String
exec 'hi! String guifg=' . g:color_sacramento_green_brighter

" purescriptBoolean > Boolean
exec 'hi! Boolean guifg=' . g:color_sacramento_green_brighter


let g:color_ming_green_dark = '#3C6B7C '
let g:color_ming_green = '#3A768C '

" purescriptStructure (data) > Keyword
exec 'hi! Keyword guifg=' . g:color_ming_green

" purescriptOperator > Operator
exec 'hi! Operator guifg=' . g:color_ming_green

" purescriptDelimiter > Delimiter
exec 'hi! Delimiter guifg=' . g:color_ming_green

" purescriptStatement (do and let) > Statement
exec 'hi! Statement guifg=' . g:color_ming_green

" purescriptConditional > Conditional
exec 'hi! Conditional guifg=' . g:color_ming_green


" Magit Git colors
hi! def link fileEntry Function
hi! def link diffAdded Type
hi! def link diffRemoved Macro
hi! def link gitHunk Comment
hi! def link diffSubname Comment

" VimScript colors
hi! Todo guibg=bg guifg=#F92672
hi! def link vimCommentTitle Type
hi! def link vimString String
hi! def link vimIsCommand purescriptIdentifier
hi! def link vimFgBgAttrib String
hi! def link vimHiAttrib String
hi! VimOption guifg=#F92672
hi! def link vimOption String

" Vim help colors
hi! def link helpHyperTextEntry Type
hi! def link helpHyperTextJump DataConstructor
hi! def link helpOption DataConstructor
hi! def link helpStar DataConstructor
hi! def link helpExample DataConstructor
hi! def link helpCommand DataConstructor

" Tagbar colors
hi! def link TagbarSignature Type
hi! def link TagbarScope Function
hi! def link TagbarType Keyword

" Markdown colors
hi! Title gui=bold guifg=#0087AF "munsell blue"
hi! Highlight1 gui=bold guifg=#F6DC69 "vim flashy yellow"

hi! def link mkdHeading Operator
hi! def link mkdNonListItemBlock purescriptIdentifier
hi! def link mkdListItemLine purescriptIdentifier
hi! def link mkdListItemLine mkdListItemLine
hi! def link mkdCode Statement
hi! def link mkdListItem Type
" hi! Underlined2 guifg=#3C6B7C guibg=#0C0C0C gui=italic
" hi! Underlined2 guifg=#BECACD guibg=#0C0C0C gui=italic
hi! Underlined2 guifg=#077D67 guibg=#0C0C0C gui=italic
hi! def link mkdInlineURL Underlined2
hi! def link mkdLink Underlined2
" hi! def link htmlBold htmlBold
" hi! def link htmlItalic htmlItalic

" Dirvish{{{
hi! def link DirvishPathTail Function
hi! def link DirvishArg DataConstructor"}}}

" Markbar
exec 'hi! DarkHeader guifg=' . g:color_ming_green_dark
hi! link markbarHeader DarkHeader
hi! link markbarID Highlight1

" Editor & Quickfix
hi LineNr guifg=#404040
hi FoldColumn guibg=gray10 guifg=gray20
hi Folded     guifg=#3D5862 guibg=#121212


" Vim Native HighlighGroups:
" This is where to set the main background color
" hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
hi Normal          guifg=#F8F8F2 guibg=#151719

hi Comment         guifg=#3D5862

" Note: Cursor is show with inverted bg-fg colors by alacritty.
" Could alternatively activate custom colors in alacretty settings
" Not sure when this is unsed
hi Cursor          guifg=#000000 guibg=#F8F8F0
" Only bg color seems to have an effect in nvim + Alacritty
hi iCursor         guibg=#727272

" Contrast Of CursorLine:
hi CursorLine                    guibg=#1C2020

hi CursorLineNr    guifg=#FD971F               gui=none
" hi LineNr          guifg=#303030
hi NonText         guifg=#465457
hi SpecialKey      guifg=#465457

" Seach
hi Search guibg=#3E3E3E guifg=#FFFFFF gui=none

" Visual selection
hi Visual guibg=#2E2E2E gui=none


" Comment syntax additions
hi BlackBG guibg=#000000
" hi CommentSection guifg=#3D5862 guibg=#0B0B0B
hi CommentSection guifg=#42606B guibg=#0B0B0B
hi CommentSection guifg=#42606B guibg=#0E0E0E
" hi CommentLabel guifg=#2E6B69 guibg=#030303
" hi CommentLabel guifg=#306C6F guibg=#030303
" hi CommentLabel guifg=#3C7C80 guibg=#030303
" hi CommentLabel guifg=#4C8588 guibg=#030303
hi CommentLabel guifg=#42606B guibg=#030303
" hi CommentLabel guifg=#466571 guibg=#030303
" hi CommentLabel guifg=#419398 guibg=#030303
" hi CommentLabel guifg=#69DFE6 guibg=#030303

"    From Vimrc: ---------------------------------
" run: RedirMessagesBuf hi Folded
" to get:
" guifg=#4B5B61 guibg=#0B0B0B
" Folded         xxx ctermfg=4 ctermbg=248 guifg=#0087af guibg=#afd7ff
" → write command so input color into code
" JSON colors for ".vim/plugged/vim-json/syntax/json.vim" syntax file
hi link jsonPadding   Operator
hi link jsonString    vimString
hi link jsonTest			Label
hi link jsonEscape		Special
hi! link jsonNumber		Function
hi link jsonBraces		Delimiter
hi link jsonNull			Include
hi link jsonBoolean		Boolean
hi link jsonKeyword		Keyword
hi link jsonCommentError				Error

" Custom Coloring: --
" Examples: 1. run "leader hh / SyntaxStack" to get the syntax group under the cursor
"           2. this links the vimCommentTitle systax group to the Error highlight group
" highlight! def link vimCommentTitle Error
" This removes any highlighs (colors) defined for the syntax group
" highlight! link vimCommentTitle NONE

" Overwrite the 'Normal' highlight group
" highlight! Normal guifg=Yellow guibg=Green
" highlight! Normal guifg=White guibg=Black

highlight! def link vimMapRhs Macro

" highlight! Normal guifg=Yellow guibg=Green
" Function       xxx ctermfg=10 guifg=#D1FA71

"    From Vimrc: ---------------------------------

