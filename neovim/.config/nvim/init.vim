""""""""""""""""""""""""""""
" => Plug
""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged-remote')
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'rhysd/vim-grammarous'
Plug 'neovimhaskell/haskell-vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mru.vim'
Plug 'roxma/ncm-clang'
Plug 'scrooloose/nerdtree'
Plug 'roxma/nvim-completion-manager'
Plug 'amix/open_file_under_cursor.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'majutsushi/tagbar'
Plug 'edkolev/tmuxline.vim'
Plug 'dylanaraps/wal.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'amix/vim-zenroom2'

Plug '~/.config/nvim/plugged-local/custom-vim'
call plug#end()


""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""
set nocompatible
set encoding=utf8
set history=500
set autoread
set so=7
set ffs=unix,dos,mac
set path+=**
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
set thesaurus+=$HOME/.config/nvim/spell/mthesaur.txt
" 1 tab == 2 spaces
set expandtab
set smarttab
set shiftwidth=2
set ts=2
set sts=2
" language
let $LANG='en'
set langmenu=en
" no backups
set nobackup
set nowb
set noswapfile
" linebreak at 500 characters
set lbr
set tw=500
" smart indenting
set ai
set si
set wrap
" go to last position on open
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" persistent undo
try
  set undodir=~/.undodir
  set undofile
catch
endtry

filetype plugin on
filetype indent on
" disable indent on latex files
autocmd FileType tex  setlocal indentexpr=
autocmd FileType rmd  setlocal indentexpr=

" define markdown extensions
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" define leader key
let mapleader = ","
let g:mapleader = ","


""""""""""""""""""""""""""""
" => VIM Interface
""""""""""""""""""""""""""""
set ruler
set number
set rnu
set breakindent showbreak=..
set hid
set lazyredraw
set magic
set showmatch
set mat=2
" set folds
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2  
set foldcolumn=2
" wildmenu
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.gi/*,*/.hg/*,*/.cvn/*,*/.DS_Store
" backspace functionality
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" search
set ignorecase
set smartcase
set incsearch
set icm=nosplit
" no sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Colorscheme
syntax enable
set t_Co=256
let base16colorspace=256
colorscheme wal

" Status line
set laststatus=2
set noshowmode
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction



""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""

" Nerd Tree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc$','__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<CR>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<CR>

" Tagbar
nmap <leader>bb :TagbarToggle<CR>

" IDE Mode (enable tagbar and nerd tree)
nmap <leader>i :TagbarToggle<CR>:NERDTreeToggle<CR>:wincmd p<CR>

" MRU
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

" bufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<CR>

" goyo and zenroom2
let g:goyo_width=100
let g:goyo_margin_top=2
let g:goyo_margin_bottom=2
nnoremap <silent> <leader>z :Goyo<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'pywal',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

" ALE
"function! MyOnBattery()
"  return readfile('/sys/class/power_supply/AC/online') == ['0']
"endfunction
"
"if MyOnBattery()
"  let g:ale_lint_on_text_changed = 'never'
"endif

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" nvim completion manager
set shortmess+=c
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" yankstack
nmap <leader>j <Plug>yankstack_substitute_older_paste
nmap <leader>k <Plug>yankstack_substitute_newer_paste

" fugitive
nnoremap <silent> <leader>d :Gdiff<CR>

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'minimal'
let g:tmuxline_theme = 'lightline'

" pandoc
augroup pandoc_syntax
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
let g:pandoc#syntax#conceal#use = 1

" grammarous
nmap ]g <Plug>(grammarous-move-to-next-error)
nmap [g <Plug>(grammarous-move-to-previous-error)
nmap <leader>gf <Plug>(grammarous-fixit)
nmap <leader>gr <Plug>(grammarous-remove-error)
nmap <leader>gc <Plug>(grammarous-close-info-window)
nmap <leader>go <Plug>(grammarous-open-info-window)

""""""""""""""""""""""""""""
" => Remaps
""""""""""""""""""""""""""""
map 0 ^
map <leader>pp :setlocal paste!<CR>

"" Defining guides
inoremap <leader><leader> <esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <esc>/<++><Enter>"_c4l
map <leader><leader> <esc>/<++><Enter>"_c4l
inoremap ;gui <++>

" date and time shortcuts
iab xdate <C-r>=strftime("%m/%d/%y")<CR>
iab fdate <C-r>=strftime("%B %d, %Y")<CR>
iab xtime <C-r>=strftime("%H:%M")<CR>
iab ftime <C-r>=strftime("%H:%M:%S")<CR>

" Map auto complete of (, ", ', [
vnoremap ;( <esc>`>a)<esc>`<i(<esc>
vnoremap ;[ <esc>`>a]<esc>`<i[<esc>
vnoremap ;{ <esc>`>a}<esc>`<i{<esc>
vnoremap ;' <esc>`>a'<esc>`<i'<esc>
vnoremap ;" <esc>`>a"<esc>`<i"<esc>
vnoremap ;` <esc>`>a`<esc>`<i`<esc>
inoremap ;( ()<esc>i
inoremap ;[ []<esc>i
inoremap ;{ {<esc>o}<esc>O
inoremap ;' ''<esc>i
inoremap ;" ""<esc>i
inoremap ;` ``<esc>i

" search highlighted in visual mode
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" space to search
map <space> /
map <C-space> ?

" disable highlight
map <silent> <leader><CR> :set hlsearch!<CR>

" remap escape
inoremap jf <esc>
inoremap fj <esc>

" spell check
map <leader>ss :setlocal spell! spelllang=en_us<CR>

" better pane navigation
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" tab management
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>t<leader> :tabnext<CR>
" go to last tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" tex compile keybindings
autocmd Filetype tex nnoremap <leader>mm :w<CR>:AsyncRun rubber -m xelatex --warn all %<CR><CR>
autocmd Filetype tex nnoremap <leader>mc :w<CR>:!rubber -m xelatex --warn all %<CR>
autocmd Filetype tex nnoremap <leader>mp :AsyncRun pdfpc %:r.pdf<CR><CR>
" md compile keybindings
autocmd Filetype markdown nnoremap <leader>mm :w<CR>:AsyncRun pandoc % --pdf-engine=xelatex --variable urlcolor=blue -o %:r.pdf<CR><CR>
autocmd Filetype markdown nnoremap <leader>mb :w<CR>:AsyncRun pandoc % --pdf-engine=xelatex --variable urlcolor=blue -t beamer -o %:r.pdf<CR><CR>
autocmd Filetype markdown nnoremap <leader>mc :w<CR>:!pandoc % --pdf-engine=xelatex --variable urlcolor=blue -o %:r.pdf<CR>
" rmd compile keybindings
autocmd Filetype rmd nnoremap <leader>mm :w<CR>:AsyncRun echo "require(rmarkdown); render('%')" \| R --vanilla<CR><CR>
autocmd Filetype rmd nnoremap <leader>mc :w<CR>:!echo "require(rmarkdown); render('%')" \| R --vanilla<CR>
" compiled doc viewing keybindings
autocmd Filetype tex,markdown,rmd nnoremap <leader>mv :AsyncRun zathura -- %:r.pdf &> /dev/null &<CR><CR>

""""""""""""""""""""""""""""
" => Commands
""""""""""""""""""""""""""""
" commands to retab document to different tab width
command TTF :set ts=2 sts=2 noet | retab! | set ts=4 sts=4 et | retab
command FTT :set ts=4 sts=4 noet | retab! | set ts=2 sts=2 et | retab

" sudo save with :W
command W w !sudo tee % > /dev/null

" write tags
command! MakeTags !ctags -R .

""""""""""""""""""""""""""""
" => Autocommands
""""""""""""""""""""""""""""
" Auto build configs on edit of certain files
autocmd BufWritePost ~/dotfiles/scripts/.config/Scripts/configs,~/dotfiles/scripts/.config/Scripts/folders !bash ~/.config/Scripts/shortcuts.sh

" Markdown Settings
" set tab to 4
autocmd BufNewFile,BufRead *.md,*.rmd setlocal tabstop=4 shiftwidth=4 softtabstop=4
" turn on spell check
autocmd BufNewFile,BufRead *.md,*.rmd setlocal spell! spelllang=en_us

" => Java
autocmd FileType java inoremap ;fr for(;<++>;<++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^f;i
autocmd FileType java inoremap ;fe for(: <++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^f:i
autocmd FileType java inoremap ;wl while() {<Enter><++><Enter>}<Enter><++><Esc>3k^f)i
autocmd FileType java inoremap ;dw do {<Enter>;<Enter>} while (<++>);<Enter><++><Esc>2k^xA
autocmd FileType java inoremap ;if if() {<Enter><++><Enter>}<Enter><++><Esc>3k^f)i
autocmd FileType java inoremap ;ie if() {<Enter><++><Enter>} else {<Enter><++><Enter>}<Enter><++><Esc>5k^f)i
autocmd FileType java inoremap ;ii if() {<Enter><++><Enter>} else <++><Esc>2k^f)i
autocmd FileType java inoremap ;pc public class  {<Enter><++><Enter>}<Esc>2k^f{hi
autocmd FileType java inoremap ;cl class  {<Enter><++><Enter>}<Esc>2k^f{hi
autocmd FileType java inoremap ;fn public  <++>(<++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^fc2li
autocmd FileType java inoremap ;pf public  <++>(<++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^fc2li
autocmd FileType java inoremap ;rf private  <++>(<++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^fc2li
autocmd FileType java inoremap ;mn public static void main(String[] args) {<Enter>;<Enter>}<Enter><++><Esc>2k^xA
autocmd FileType java inoremap ;rt return 
autocmd FileType java inoremap ;st static 
autocmd FileType java inoremap ;pr System.out.println();<Enter><++><Esc>k^f)i
autocmd FileType java inoremap ;ip <Esc>?import<Enter>oimport ;<Esc>i
autocmd FileType java nnoremap ;ip ?import<Enter>oimport ;<Esc>i

" => Python
autocmd FileType python inoremap ;fr for  in <++>:<Enter><++><Enter><C-D><++><Esc>2k^fihi
autocmd FileType python inoremap ;wl while():<Enter><++><Enter><C-D><++><Esc>2k^f)i
autocmd FileType python inoremap ;we while():<Enter><++><Enter><C-D>else:<Enter><++><Enter><C-D><++><Esc>4k^f)i
autocmd FileType python inoremap ;if if :<Enter><++><Enter><C-D><++><Esc>2k^f:i
autocmd FileType python inoremap ;ie if :<Enter><++><Enter><C-D>else:<Enter><++><Enter><C-D><++><Esc>4k^f:i
autocmd FileType python inoremap ;ii if :<Enter><++><Enter><C-D>el<++><Esc>2k^f:i
autocmd FileType python inoremap ;cl class :<Enter><++><Esc>k^f:i
autocmd FileType python inoremap ;fn def (<++>):<Enter><++><Enter><C-D><++><Esc>2k^f(i
autocmd FileType python inoremap ;mn def main():<Enter>;<Enter><Enter><C-D>if __name__ == "__main__":<Enter>main()<Esc>3k^xA
autocmd FileType python inoremap ;rt return 
autocmd FileType python inoremap ;pr print()<Enter><++><Esc>k^f)i
autocmd FileType python inoremap ;ip <Esc>?import<Enter>oimport 
autocmd FileType python nnoremap ;ip ?import<Enter>oimport 

" => LaTeX
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;it \textit{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{%DELRN%}<Enter><++><Enter>\end{%DELRN%}<Enter><Enter><++><Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ;ent \gloss{}{<++>}{<++>}<Enter><++><Esc>k0f}i
" Logical Symbols
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;M $$$$<Enter><Enter><++><Esc>2k$hi
autocmd FileType tex inoremap ;neg {\neg}
autocmd FileType tex inoremap ;V {\vee}
autocmd FileType tex inoremap ;or {\vee}
autocmd FileType tex inoremap ;L {\wedge}
autocmd FileType tex inoremap ;and {\wedge}
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;ex {\exists}
autocmd FileType tex inoremap ;dia	{\Diamond}
autocmd FileType tex inoremap ;box	{\Box}
" smallcaps
autocmd Filetype tex inoremap ;nom {\textsc{nom}}
autocmd FileType tex inoremap ;acc {\textsc{acc}}
autocmd FileType tex inoremap ;dat {\textsc{dat}}
autocmd FileType tex inoremap ;gen {\textsc{gen}}
autocmd FileType tex inoremap ;abl {\textsc{abl}}
autocmd FileType tex inoremap ;voc {\textsc{voc}}
autocmd FileType tex inoremap ;loc {\textsc{loc}}
autocmd Filetype tex inoremap ;inst {\textsc{inst}}

" => HTML
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>F"i
autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ;li <Esc>o<li></li><Esc>F>a
autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i

" => Bib
autocmd FileType bib inoremap ;a @article{,<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>journal<Space>=<Space>"<++>",<Enter>volume<Space>=<Space>"<++>",<Enter>pages<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kf,i
autocmd FileType bib inoremap ;b @book{,<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>6kf,i
autocmd FileType bib inoremap ;c @incollection{,<Enter>author<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>booktitle<Space>=<Space>"<++>",<Enter>editor<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kf,i

" => Markdown
autocmd Filetype markdown,rmd inoremap ;b ****<Space><++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ;s ~~~~<Space><++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ;e **<Space><++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ;a [](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown,rmd inoremap ;4 ####<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown,rmd inoremap ;5 #####<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown,rmd inoremap ;6 ######<Space><Enter><Enter><++><Esc>2kA
autocmd Filetype markdown,rmd inoremap ;l ---<Enter>
autocmd Filetype markdown inoremap ;c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype rmd inoremap ;c ```{, eval = FALSE}<Enter><++><Enter>```<Enter><Enter><++><Esc>4k^f,i
