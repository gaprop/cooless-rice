" I have the coolest config file.
"-----------Global shiz-------------------
set termguicolors 
set clipboard+=unnamedplus

"Leader key
let mapleader = ' '

"Put preview window to the bottom
set splitbelow

nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap $ g$
nnoremap g$ $
nnoremap 0 g0
nnoremap g0 0

"-----------------------------------------


"-----------Plugins-----------------------
call plug#begin('~/.local/share/nvim/plugged')

"For autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }

"Status bar
Plug 'vim-airline/vim-airline'

"Status bar themes
Plug 'vim-airline/vim-airline-themes'

"Automatic qoute and bracket completion
Plug 'jiangmiao/auto-pairs'

"Comment"
Plug 'scrooloose/nerdcommenter'

"File managing and exploration
Plug 'scrooloose/nerdtree'

" Wut da fuck is this?
Plug 'rbgrouleff/bclose.vim'

"Highlight for yank
Plug 'machakann/vim-highlightedyank'

"Color-theme
" Plug 'artanikin/vim-synthwave84'

" Plug 'tiagovla/tokyodark.nvim'

"Syntax highlight for js
Plug 'pangloss/vim-javascript'

"Syntax highlight for haskell (among other things)
Plug 'neovimhaskell/haskell-vim'

"Syntax highlight for f#
Plug 'kongo2002/fsharp-vim'

"Syntax highlight for latex and a auto compiler
Plug 'lervag/vimtex'

Plug 'lifepillar/vim-colortemplate'

call plug#end()
"-----------------------------------------


"------------Themes stuff...--------------
"Theme for airline 
let g:airline_theme='minimalist' 

"Color-theme
syntax on
filetype plugin indent on
colorscheme mycolor
 
"Literally syntax highlighting only for .rafi
au BufNewFile, BufRead /* .rasi setf css

"-----------------------------------------

"------------Syntax highlighting----------
"For latex
let g:vimtex_compiler_progname = 'nvr'

let g:haskell_classic_highlighting = 1

" Toggle search highlighting 
set hlsearch!
nnoremap <leader>n :set hlsearch!<CR>
"-----------------------------------------

"------------Autocomplete options---------
"Default setting for deoplete
let g:deoplete#enable_at_startup = 1

"Removes the method showcase window after autocomplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Change autocomplete list navigation key to tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"Remove focus to center line, when creating a {
let g:AutoPairsCenterLine = 0
"-----------------------------------------


"------------Tab options------------------
"Change the move between tab to <leader> + h/l
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>

"-----------------------------------------

"------------Interface options------------
"Display numbers to the left of the screen
set number

"Line number is relative to the line your at
set relativenumber
"-----------------------------------------

"------------Indentation option------------
"Allows to change tab to whitespace
set expandtab

"Makes tabulation with number of spaces
set shiftwidth=2

" Add one space after comment
let g:NERDSpaceDelims = 1

""-----------------------------------------


"------------Nerdtree stuff---------------
"Remap open key to <leader>+f
map <leader>f :NERDTreeToggle<CR>

"Close nerdtree if it is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"-----------------------------------------

"------------Latex specific stuff---------
" \ll for autocompile

" Set spell check for english
map <leader>o :setlocal spell! spellang=en_us

"Make vimtex commands specific to latex
let g:tex_flavor='latex'

let g:vimtex_quickfix_open_on_warning = 0

let g:Tex_IgnoredWarnings = 
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n"
let g:Tex_IgnoreLevel = 8
"-----------------------------------------

"------------auto command options---------

"-----------------------------------------
