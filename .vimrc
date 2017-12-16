source ~/.vim/vim_guides.vim
" add personal pathogen plugins
set runtimepath+=~/.vim
call pathogen#infect('~/.vim/pathogen/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""
set encoding=utf8
set history=500
set autoread
set so=7
set ffs=unix,dos,mac
" 1 tab == 4 spaces
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
" no sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Colorscheme
syntax enable
set t_Co=256
let base16colorspace=256
if filereadable(expand("~/.vim/vimrc_background"))
  source ~/.vim/vimrc_background
endif
colorscheme base16-default-dark

" Status line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction



""""""""""""""""""""""""""""
" => Pathogen
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
      \ 'colorscheme': 'wombat',
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

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

" yankstack
nmap <leader>j <Plug>yankstack_substitute_older_paste
nmap <leader>k <Plug>yankstack_substitute_newer_paste

" fugitive
nnoremap <silent> <leader>d :Gdiff<CR>

""""""""""""""""""""""""""""
" => Remaps
""""""""""""""""""""""""""""
map 0 ^
map <leader>pp :setlocal paste!<CR>

" date and time shortcuts
iab xdate <C-r>=strftime("%m/%d/%y")<CR>
iab fdate <C-r>=strftime("%B %d, %Y")<CR>
iab xtime <C-r>=strftime("%H:%M")<CR>
iab stime <C-r>=strftime("%H:%M:%S")<CR>

" Map auto complete of (, ", ', [
vnoremap ;( <esc>`>a)<esc>`<i(<esc>
vnoremap ;[ <esc>`>a]<esc>`<i[<esc>
vnoremap ;{ <esc>`>a}<esc>`<i{<esc>
vnoremap ;" <esc>`>a"<esc>`<i"<esc>
vnoremap ;' <esc>`>a'<esc>`<i'<esc>
inoremap ;( ()<esc>i
inoremap ;[ []<esc>i
inoremap ;{ {<esc>o}<esc>O
inoremap ;' ''<esc>i
inoremap ;" ""<esc>i

" search highlighted in visual mode
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" space to search
map <space> /
map <C-space> ?

" disable highlight
map <silent> <leader><CR> :set hlsearch!<CR>

" remap escape
inoremap jw <Esc>
inoremap wj <Esc>

" spell check
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

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

" latex compile keybindings
nnoremap <leader>ll :w<CR>:!rubber -m xelatex --warn all %<CR><CR>
nnoremap <leader>lc :w<CR>:!rubber -m xelatex --warn all %<CR>
nnoremap <leader>lv :!zathura -- %:r.pdf &> /dev/null &<CR><CR>
nnoremap <leader>lp :!pdf-presenter-console -sS %:r.pdf<CR><CR>

" pandoc compile keybindings
nnoremap <leader>ml :w<CR>:!pandoc % --latex-engine=xelatex -o %:r.pdf<CR><CR>
nnoremap <leader>mb :w<CR>:!pandoc % --latex-engine=xelatex -t beamer -o %:r.pdf<CR>
nnoremap <leader>mc :w<CR>:!pandoc % --latex-engine=xelatex -o %:r.pdf<CR>
nnoremap <leader>mv :!zathura -- %:r.pdf &> /dev/null &<CR><CR>
nnoremap <leader>mp :!pdf-presenter-console -sS %:r.pdf<CR><CR>

""""""""""""""""""""""""""""
" => Commands
""""""""""""""""""""""""""""
" commands to retab document to different tab width
command TTF :source ~/.vim/scripts/2to4.vim
command FTT :source ~/.vim/scripts/4to2.vim

" sudo save with :W
command W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""
" => Autocommands
""""""""""""""""""""""""""""
" Auto build configs on edit of certain files
autocmd BufWritePost ~/git/dotfiles/.config/Scripts/folders,~/git/dotfiles/.config/Scripts/configs !python ~/.config/Scripts/shortcuts.py
