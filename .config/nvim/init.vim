" I have the coolest config file.
"-----------Global shiz-------------------
set termguicolors 
set clipboard+=unnamedplus

"Leader boiii
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


"-----------Plugins yuh-------------------
call plug#begin('~/.local/share/nvim/plugged')

"For autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }

"Autocomplete for python
Plug 'zchee/deoplete-jedi'

"Code go-to for python (Needs some extsra config)
"Plug 'davidhalter/jedi-vim'

"Status bar
Plug 'vim-airline/vim-airline'

"Status bar themes
Plug 'vim-airline/vim-airline-themes'

"Automatic qoute and bracket completion
Plug 'jiangmiao/auto-pairs'

"Comment uh"
Plug 'scrooloose/nerdcommenter'

"File managing and exploration
Plug 'scrooloose/nerdtree'

" Wut da fuck is this?
Plug 'rbgrouleff/bclose.vim'

"Highlight for yank
Plug 'machakann/vim-highlightedyank'

"Code folding
Plug 'tmhedberg/SimpylFold'

"Color-theme
"Plug 'trusktr/seti.vim'
"Plug 'szorfein/fromthehell.vim'
Plug 'artanikin/vim-synthwave84'
"Plug 'bcicen/vim-vice'

"Syntax highlight for js
Plug 'pangloss/vim-javascript'

"Syntax highlight for haskell (among other things)
Plug 'neovimhaskell/haskell-vim'

"Syntax highlight for f#
Plug 'kongo2002/fsharp-vim'
"Plug 'fsharp/vim-fsharp', {
      "\ 'for': 'fsharp',
      "\ 'do':  'make fsautocomplete',
      "\}

"Syntax highlight for latex and a auto compiler
Plug 'lervag/vimtex'

"ಠ_ಠ
"Plug 'dodie/vim-disapprove-deep-indentation'
call plug#end()
"-----------------------------------------


"------------Themes stuff...--------------
"Theme for airline 
let g:airline_theme='minimalist' "jellybean is a worthy theme aswell

"Color-theme
syntax on
filetype plugin indent on
colorscheme synthwave84
"autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
"Literally syntax highlighting only for .rafi
au BufNewFile, BufRead /* .rasi setf css

"-----------------------------------------

"------------Syntax highlighting----------
"For latex
let g:vimtex_compiler_progname = 'nvr'

let g:haskell_classic_highlighting = 1
"-----------------------------------------

"------------Autocomplete options---------
"Default setting for deoplete
let g:deoplete#enable_at_startup = 1

"Removes the method showcase window after autocomplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Change autocomplete list navigation key to tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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

"------------Syntastic--------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"-----------------------------------------

"------------Indentation option------------
"Allows to change tab to whitespace
set expandtab

"Makes tabulation with number of spaces
set shiftwidth=2

"Set tab to be 4 spaces long, only really used for ಠ_ಠ
"set tabstop=4

"-----------------------------------------


"------------Nerdtree stuff---------------
"Remap open key to <leader>+f
map <leader>f :NERDTreeToggle<CR>

"Close nerdtree if it is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"-----------------------------------------

"------------Latex specific stuff---------
" \ll for autocompile
map <leader>o :setlocal spell! spellang=en_us

"Make vimtex commands specific to latex
let g:tex_flavor='latex'

let g:vimtex_quickfix_open_on_warning = 0
"-----------------------------------------

"------------auto command options---------

"-----------------------------------------
