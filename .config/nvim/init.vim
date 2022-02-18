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
" Find find and replace for <++>
autocmd FileType tex inoremap <C-n> <Esc>/<++><Enter>"_c4l
autocmd FileType tex vnoremap <C-n> <Esc>/<++><Enter>"_c4l
autocmd FileType tex map <C-n> <Esc>/<++><Enter>"_c4l
autocmd FileType tex inoremap ;gui <++>

" Latex
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter><Esc>A\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter><Esc>A\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;beg \begin{D}<Enter><++><Enter><Esc>A\end{D}<Enter><Enter><++><Esc>4kV2j
autocmd FileType tex inoremap ;fig \begin{figure}<Enter><Enter>\caption{<++>}<Enter>\label{<++>}<Enter><Esc>A\end{figure}<Enter><Enter><++><Esc>5kA<Tab>
autocmd FileType tex inoremap ;tab \begin{table}[]<Enter>\begin{tabular}<Enter>\hline<Enter><++><Space>\\<Space>\hline<Enter><Backspace>\end{tabular}<Enter><Esc>A\end{table}<Enter><Enter><++><Esc>6kA{}<Esc>i
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i

" Latex Math
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;M \begin{align*}<Enter><Enter><Esc>A\end{align*}<Enter><++><Esc>2kA<Tab>
autocmd FileType tex inoremap ;fr \frac{}{<++>}<++><Esc>2T{i
autocmd FileType tex inoremap ;sum \sum_{}^{<++>} <++><Esc>2T{i
"-----------------------------------------
