""""""""""""""""""""""""""""
" => Plug
""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged-remote')
Plug 'dhruvasagar/vim-table-mode'
Plug 'dylanaraps/wal.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'glts/vim-textobj-comment'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'roxma/ncm-clang'
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'w0rp/ale'
call plug#end()


""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""
set scrolloff=7
set fileformats=unix,dos,mac
set path+=**
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
set thesaurus+=$HOME/.config/nvim/spell/mthesaur.txt
" 1 tab == 2 spaces
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
" set listchars
set list
set listchars=tab:→\ ,trail:·,extends:›,precedes:‹,nbsp:␣
" language
let $LANG='en'
set langmenu=en
" no backups
set nobackup
set nowritebackup
set noswapfile
" linebreak at 500 characters
set linebreak
set textwidth=500
set wrap
" go to last position on open
augroup startup
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END
" persistent undo
try
  set undodir=~/.undodir
  set undofile
catch
endtry

" disable indent on latex files
augroup markup
  autocmd FileType tex  setlocal indentexpr=
  autocmd FileType rmd  setlocal indentexpr=
augroup END

" disable tab character showing in golang
augroup golang
  autocmd FileType go  setlocal listchars=tab:\ \ ,trail:·,extends:›,precedes:‹,nbsp:␣
augroup END

" define markdown extensions
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" define leader key
let mapleader = " "
let g:mapleader = " "


""""""""""""""""""""""""""""
" => VIM Interface
""""""""""""""""""""""""""""
set ruler
set number
set relativenumber
set showbreak=↪\  breakindent
set fillchars+=vert:│
set hidden
set lazyredraw
set showmatch
set matchtime=2
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set foldcolumn=2
set wildignore=*.o,*~,*.pyc,*/.gi/*,*/.hg/*,*/.cvn/*,*/.DS_Store
" backspace functionality
set whichwrap+=<,>,h,l
" search
set ignorecase
set smartcase
set inccommand=nosplit
" no sounds on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500
" Colorscheme
set t_Co=256
let base16colorspace=256
colorscheme wal
hi Conceal ctermbg=NONE ctermfg=6 cterm=underline
set conceallevel=2

" Status line
set noshowmode
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
function! HasPaste() abort
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction



""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""

" FZF
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
map <leader>ff :Files<CR>
map <leader>fm :Marks<CR>
map <leader>fw :Windows<CR>
map <leader>fb :Buffers<CR>
map <leader>fh :History<CR>
map <leader>fg :Tags<CR>
map <leader>ft :BTags<CR>

" goyo
let g:goyo_width=100
let g:goyo_margin_top=2
let g:goyo_margin_bottom=2
nnoremap <silent> <leader>z :Goyo<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'wal',
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
function! MyOnBattery() abort
  if filereadable('/sys/class/power_supply/AC/online')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  else
    return 0
  endif
endfunction
if MyOnBattery()
  let g:ale_lint_on_text_changed = 'never'
endif
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_java_javac_classpath="lib/*"
command JCP let g:ale_java_javac_classpath="lib/*"
function! JCP(path) abort
  let g:ale_java_javac_classpath="lib/*:" . a:path
endfunction

" nvim completion manager
set shortmess+=c
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" fugitive
nnoremap <silent> <leader>d :Gdiff<CR>

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'minimal'
let g:tmuxline_theme = 'lightline'

" pandoc
augroup pandoc_syntax
  autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" AsyncRun
map <leader>qf :call asyncrun#quickfix_toggle(8)<CR>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
map <leader>nn :call ToggleNetrw()<CR>
let g:NetrwIsOpen=0
function! ToggleNetrw() abort
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore
    endif
endfunction

""""""""""""""""""""""""""""
" => Remaps
""""""""""""""""""""""""""""
map 0 ^
map <leader>pp :setlocal paste!<CR>

"" Defining guides
inoremap ,, <esc>/<++><CR>"_c4l
vnoremap <leader><leader> <esc>/<++><CR>"_c4l
map <leader><leader> <esc>/<++><CR>"_c4l
inoremap ;mk <++>

" date and time shortcuts
iabbrev xdate <C-r>=strftime("%m/%d/%y")<CR>
iabbrev fdate <C-r>=strftime("%B %d, %Y")<CR>
iabbrev xtime <C-r>=strftime("%H:%M")<CR>
iabbrev ftime <C-r>=strftime("%H:%M:%S")<CR>

" tab goes to last buffer
map <TAB> <C-^>

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

" auto closing tags
inoremap </ </<C-x><C-o><C-n><CR>

" search highlighted in visual mode
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" disable highlight
map <silent> <CR> :set hlsearch!<CR>

" remap escape
inoremap jf <esc>
inoremap fj <esc>

" spell check
map <leader>ss :setlocal spell! spelllang=en_us<CR>

" better incrementing/decrementing
noremap + <C-a>
noremap - <C-x>
xnoremap + g<C-a>
xnoremap - g<C-x>

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
augroup tabs
  autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END

" use arrow keys to resize
nnoremap <Up> :resize +5<CR>
nnoremap <Down> :resize -5<CR>
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>

" terminal remaps
tnoremap <leader><ESC> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
augroup term
  autocmd BufEnter term://* startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
map <leader>tt :belowright split<CR>:resize 10<CR>:terminal<CR>i

" move split to new tab and close tab binding
nmap to :tab sp<CR>

augroup markup
  " tex compile keybindings
  autocmd Filetype tex nnoremap <buffer> <leader>mm :w<CR>:AsyncRun rubber -m xelatex --warn all %<CR><CR>
  " md compile keybindings
  autocmd Filetype markdown nnoremap <buffer> <leader>mm :w<CR>:AsyncRun pandoc % --pdf-engine=xelatex --variable urlcolor=blue -o %:r.pdf<CR><CR>
  autocmd Filetype markdown nnoremap <buffer> <leader>mb :w<CR>:AsyncRun pandoc % --pdf-engine=xelatex --variable urlcolor=blue -t beamer -o %:r.pdf<CR><CR>
  " rmd compile keybindings
  autocmd Filetype rmd nnoremap <buffer> <leader>mm :w<CR>:AsyncRun echo "require(rmarkdown); render('%')" \| R --vanilla<CR><CR>
  " compiled doc viewing keybindings
  autocmd Filetype tex,markdown,rmd nnoremap <buffer> <leader>mv :!zathura -- %:r.pdf &> /dev/null &<CR><CR>
  autocmd Filetype tex,markdown nnoremap <buffer> <leader>mp :!pdfpc %:r.pdf<CR><CR>
augroup END

""""""""""""""""""""""""""""
" => Commands
""""""""""""""""""""""""""""
" commands to retab document to different tab width
command TTF :set ts=2 sts=2 noet | retab! | set ts=4 sts=4 et | retab
command FTT :set ts=4 sts=4 noet | retab! | set ts=2 sts=2 et | retab

" toggle colorcolumn
let s:activatedcc=0
function! ToggleColorcolumn()
  if s:activatedcc == 0
    let s:activatedcc=1
    match ColorColumn '\%81v'
  else
    let s:activatedcc=0
    match none
  endif
endfunction
map <leader>cc :call ToggleColorcolumn()<CR>
" toggle colorcolumn
command! ToggleConceal :let &conceallevel = &conceallevel == '2' ? 0 : 2
map <leader>cl :ToggleConceal<CR>

" sudo save with :W
command W w !sudo tee % > /dev/null

" write tags
command! MakeTags AsyncRun ctags -R .

""""""""""""""""""""""""""""
" => Autocommands
""""""""""""""""""""""""""""
" Auto remove whitespace
function! StripWhitespace() abort
  let pos = getcurpos()
  %s/\s\+$//e " EOL
  %s#\($\n\s*\)\+\%$##e " EOF
  cal setpos('.', pos)
endfunction
augroup whitespace
  autocmd BufWritePre * call StripWhitespace()
augroup END

" Auto build configs on edit of certain files
augroup shortcuts
  autocmd BufWritePost ~/dotfiles/scripts/.config/Scripts/configs,~/dotfiles/scripts/.config/Scripts/folders !bash ~/.config/Scripts/shortcuts.sh
augroup END

" Markdown Settings
augroup markup
  " set tab to 4
  autocmd BufNewFile,BufRead *.md,*.rmd setlocal tabstop=4 shiftwidth=4 softtabstop=4
  " set word wrap
  autocmd BufNewFile,BufRead *.md,*.rmd setlocal textwidth=80
  " turn on spell check
  autocmd BufNewFile,BufRead *.md,*.rmd setlocal spell! spelllang=en_us
augroup END

" => Java
augroup java
  autocmd FileType java inoremap <buffer> ;fr for(;<++>;<++>) {<CR><++><CR>}<CR><++><Esc>3k^f;i
  autocmd FileType java inoremap <buffer> ;fe for(: <++>) {<CR><++><CR>}<CR><++><Esc>3k^f:i
  autocmd FileType java inoremap <buffer> ;wl while() {<CR><++><CR>}<CR><++><Esc>3k^f)i
  autocmd FileType java inoremap <buffer> ;dw do {<CR>;<CR>} while (<++>);<CR><++><Esc>2k^xA
  autocmd FileType java inoremap <buffer> ;if if() {<CR><++><CR>}<CR><++><Esc>3k^f)i
  autocmd FileType java inoremap <buffer> ;ie if() {<CR><++><CR>} else {<CR><++><CR>}<CR><++><Esc>5k^f)i
  autocmd FileType java inoremap <buffer> ;ii if() {<CR><++><CR>} else <++><Esc>2k^f)i
  autocmd FileType java inoremap <buffer> ;pc public class  {<CR><++><CR>}<Esc>2k^f{hi
  autocmd FileType java inoremap <buffer> ;cl class  {<CR><++><CR>}<Esc>2k^f{hi
  autocmd FileType java inoremap <buffer> ;fn public  <++>(<++>) {<CR><++><CR>}<CR><++><Esc>3k^fc2li
  autocmd FileType java inoremap <buffer> ;pf public  <++>(<++>) {<CR><++><CR>}<CR><++><Esc>3k^fc2li
  autocmd FileType java inoremap <buffer> ;rf private  <++>(<++>) {<CR><++><CR>}<CR><++><Esc>3k^fc2li
  autocmd FileType java inoremap <buffer> ;mn public static void main(String[] args) {<CR>;<CR>}<CR><++><Esc>2k^xA
  autocmd FileType java inoremap <buffer> ;rt return
  autocmd FileType java inoremap <buffer> ;st static
  autocmd FileType java inoremap <buffer> ;pr System.out.println();<CR><++><Esc>k^f)i
  autocmd FileType java inoremap <buffer> ;ip <Esc>?import<CR>oimport ;<Esc>i
  autocmd FileType java nnoremap <buffer> ;ip ?import<CR>oimport ;<Esc>i
augroup END

" => Python
augroup python
  autocmd FileType python inoremap <buffer> ;fr for  in <++>:<CR><++><CR><C-D><++><Esc>2k^fihi
  autocmd FileType python inoremap <buffer> ;wl while():<CR><++><CR><C-D><++><Esc>2k^f)i
  autocmd FileType python inoremap <buffer> ;we while():<CR><++><CR><C-D>else:<CR><++><CR><C-D><++><Esc>4k^f)i
  autocmd FileType python inoremap <buffer> ;if if :<CR><++><CR><C-D><++><Esc>2k^f:i
  autocmd FileType python inoremap <buffer> ;ie if :<CR><++><CR><C-D>else:<CR><++><CR><C-D><++><Esc>4k^f:i
  autocmd FileType python inoremap <buffer> ;ii if :<CR><++><CR><C-D>el<++><Esc>2k^f:i
  autocmd FileType python inoremap <buffer> ;cl class :<CR><++><Esc>k^f:i
  autocmd FileType python inoremap <buffer> ;fn def (<++>):<CR><++><CR><C-D><++><Esc>2k^f(i
  autocmd FileType python inoremap <buffer> ;mn def main():<CR>;<CR><CR><C-D>if __name__ == "__main__":<CR>main()<Esc>3k^xA
  autocmd FileType python inoremap <buffer> ;rt return
  autocmd FileType python inoremap <buffer> ;pr print()<CR><++><Esc>k^f)i
  autocmd FileType python inoremap <buffer> ;ip <Esc>?import<CR>oimport
  autocmd FileType python nnoremap <buffer> ;ip ?import<CR>oimport
augroup END

" => LaTeX
augroup markup
  autocmd FileType tex inoremap <buffer> ;fr \begin{frame}<CR>\frametitle{}<CR><CR><++><CR><CR>\end{frame}<CR><CR><++><Esc>6kf}i
  autocmd FileType tex inoremap <buffer> ;fi \begin{fitch}<CR><CR>\end{fitch}<CR><CR><++><Esc>3kA
  autocmd FileType tex inoremap <buffer> ;exe \begin{exe}<CR>\ex<Space><CR>\end{exe}<CR><CR><++><Esc>3kA
  autocmd FileType tex inoremap <buffer> ;em \emph{}<Space><++><Esc>T{i
  autocmd FileType tex inoremap <buffer> ;bf \textbf{}<Space><++><Esc>T{i
  autocmd FileType tex inoremap <buffer> ;it \textit{}<Space><++><Esc>T{i
  autocmd FileType tex inoremap <buffer> ;ct \textcite{}<Space><++><Esc>T{i
  autocmd FileType tex inoremap <buffer> ;cm ~\cite{}<++><Esc>T{i
  autocmd FileType tex inoremap <buffer> ;cp \parencite{}<Space><++><Esc>T{i
  autocmd FileType tex inoremap <buffer> ;glos {\gll<Space><++><Space>\\<CR><++><Space>\\<CR>\trans{``<++>''}}<Esc>2k2bcw
  autocmd FileType tex inoremap <buffer> ;x \begin{xlist}<CR>\ex<Space><CR>\end{xlist}<Esc>kA<Space>
  autocmd FileType tex inoremap <buffer> ;ol \begin{enumerate}<CR><CR>\end{enumerate}<CR><CR><++><Esc>3kA\item<Space>
  autocmd FileType tex inoremap <buffer> ;ul \begin{itemize}<CR><CR>\end{itemize}<CR><CR><++><Esc>3kA\item<Space>
  autocmd FileType tex inoremap <buffer> ;li <CR>\item<Space>
  autocmd FileType tex inoremap <buffer> ;ref \ref{}<Space><++><Esc>T{i
  autocmd FileType tex inoremap <buffer> ;tab \begin{tabular}<CR><++><CR>\end{tabular}<CR><CR><++><Esc>4kA{}<Esc>i
  autocmd FileType tex inoremap <buffer> ;a \href{}{<++>}<Space><++><Esc>2T{i
  autocmd FileType tex inoremap <buffer> ;sc \textsc{}<Space><++><Esc>T{i
  autocmd FileType tex inoremap <buffer> ;sec \section{}<CR><CR><++><Esc>2kf}i
  autocmd FileType tex inoremap <buffer> ;ssec \subsection{}<CR><CR><++><Esc>2kf}i
  autocmd FileType tex inoremap <buffer> ;sssec \subsubsection{}<CR><CR><++><Esc>2kf}i
  autocmd FileType tex inoremap <buffer> ;st <Esc>F{i*<Esc>f}i
  autocmd FileType tex inoremap <buffer> ;beg \begin{%DELRN%}<CR><++><CR>\end{%DELRN%}<CR><CR><++><Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<CR>c
  autocmd FileType tex inoremap <buffer> ;up <Esc>/usepackage<CR>o\usepackage{}<Esc>i
  autocmd FileType tex nnoremap <buffer> ;up /usepackage<CR>o\usepackage{}<Esc>i
  autocmd FileType tex inoremap <buffer> ;tt \texttt{}<Space><++><Esc>T{i
  autocmd FileType tex inoremap <buffer> ;bt {\blindtext}
  autocmd FileType tex inoremap <buffer> ;nu $\varnothing$
  autocmd FileType tex inoremap <buffer> ;col \begin{columns}[T]<CR>\begin{column}{.5\textwidth}<CR><CR>\end{column}<CR>\begin{column}{.5\textwidth}<CR><++><CR>\end{column}<CR>\end{columns}<Esc>5kA
  autocmd FileType tex inoremap <buffer> ;ent \gloss{}{<++>}{<++>}<CR><++><Esc>k0f}i
  " Logical Symbols
  autocmd FileType tex inoremap <buffer> ;m $$<Space><++><Esc>2T$i
  autocmd FileType tex inoremap <buffer> ;M $$$$<CR><CR><++><Esc>2k$hi
  autocmd FileType tex inoremap <buffer> ;neg {\neg}
  autocmd FileType tex inoremap <buffer> ;V {\vee}
  autocmd FileType tex inoremap <buffer> ;or {\vee}
  autocmd FileType tex inoremap <buffer> ;L {\wedge}
  autocmd FileType tex inoremap <buffer> ;and {\wedge}
  autocmd FileType tex inoremap <buffer> ;ra {\rightarrow}
  autocmd FileType tex inoremap <buffer> ;la {\leftarrow}
  autocmd FileType tex inoremap <buffer> ;lra {\leftrightarrow}
  autocmd FileType tex inoremap <buffer> ;fa {\forall}
  autocmd FileType tex inoremap <buffer> ;ex {\exists}
  autocmd FileType tex inoremap <buffer> ;dia	{\Diamond}
  autocmd FileType tex inoremap <buffer> ;box	{\Box}
  " smallcaps
  autocmd Filetype tex inoremap <buffer> ;nom {\textsc{nom}}
  autocmd FileType tex inoremap <buffer> ;acc {\textsc{acc}}
  autocmd FileType tex inoremap <buffer> ;dat {\textsc{dat}}
  autocmd FileType tex inoremap <buffer> ;gen {\textsc{gen}}
  autocmd FileType tex inoremap <buffer> ;abl {\textsc{abl}}
  autocmd FileType tex inoremap <buffer> ;voc {\textsc{voc}}
  autocmd FileType tex inoremap <buffer> ;loc {\textsc{loc}}
  autocmd Filetype tex inoremap <buffer> ;inst {\textsc{inst}}

  " => HTML
  autocmd FileType html inoremap <buffer> ;b <b></b><Space><++><Esc>FbT>i
  autocmd FileType html inoremap <buffer> ;i <em></em><Space><++><Esc>FeT>i
  autocmd FileType html inoremap <buffer> ;1 <h1></h1><CR><CR><++><Esc>2kf<i
  autocmd FileType html inoremap <buffer> ;2 <h2></h2><CR><CR><++><Esc>2kf<i
  autocmd FileType html inoremap <buffer> ;3 <h3></h3><CR><CR><++><Esc>2kf<i
  autocmd FileType html inoremap <buffer> ;p <p></p><CR><CR><++><Esc>02kf>a
  autocmd FileType html inoremap <buffer> ;a <a<Space>href=""><++></a><Space><++><Esc>F"i
  autocmd FileType html inoremap <buffer> ;ul <ul><CR><li></li><CR></ul><CR><CR><++><Esc>03kf<i
  autocmd FileType html inoremap <buffer> ;li <Esc>o<li></li><Esc>F>a
  autocmd FileType html inoremap <buffer> ;ol <ol><CR><li></li><CR></ol><CR><CR><++><Esc>03kf<i

  " => Bib
  autocmd FileType bib inoremap <buffer> ;a @article{,<CR>author<Space>=<Space>"<++>",<CR>year<Space>=<Space>"<++>",<CR>title<Space>=<Space>"<++>",<CR>journal<Space>=<Space>"<++>",<CR>volume<Space>=<Space>"<++>",<CR>pages<Space>=<Space>"<++>",<CR>}<CR><++><Esc>8kf,i
  autocmd FileType bib inoremap <buffer> ;b @book{,<CR>author<Space>=<Space>"<++>",<CR>year<Space>=<Space>"<++>",<CR>title<Space>=<Space>"<++>",<CR>publisher<Space>=<Space>"<++>",<CR>}<CR><++><Esc>6kf,i
  autocmd FileType bib inoremap <buffer> ;c @incollection{,<CR>author<Space>=<Space>"<++>",<CR>title<Space>=<Space>"<++>",<CR>booktitle<Space>=<Space>"<++>",<CR>editor<Space>=<Space>"<++>",<CR>year<Space>=<Space>"<++>",<CR>publisher<Space>=<Space>"<++>",<CR>}<CR><++><Esc>8kf,i

  " => Markdown
  autocmd Filetype markdown,rmd inoremap <buffer> ;b ****<Space><++><Esc>F*hi
  autocmd Filetype markdown,rmd inoremap <buffer> ;s ~~~~<Space><++><Esc>F~hi
  autocmd Filetype markdown,rmd inoremap <buffer> ;e **<Space><++><Esc>F*i
  autocmd Filetype markdown,rmd inoremap <buffer> ;i ![](<++>)<Space><++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap <buffer> ;a [](<++>)<Space><++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap <buffer> ;1 #<Space><CR><CR><++><Esc>2kA
  autocmd Filetype markdown,rmd inoremap <buffer> ;2 ##<Space><CR><CR><++><Esc>2kA
  autocmd Filetype markdown,rmd inoremap <buffer> ;3 ###<Space><CR><CR><++><Esc>2kA
  autocmd Filetype markdown,rmd inoremap <buffer> ;4 ####<Space><CR><CR><++><Esc>2kA
  autocmd Filetype markdown,rmd inoremap <buffer> ;5 #####<Space><CR><CR><++><Esc>2kA
  autocmd Filetype markdown,rmd inoremap <buffer> ;6 ######<Space><CR><CR><++><Esc>2kA
  autocmd Filetype markdown,rmd inoremap <buffer> ;l ---<CR>
  autocmd Filetype markdown inoremap <buffer> ;c ```<CR><++><CR>```<CR><CR><++><Esc>4kA
  autocmd Filetype rmd inoremap <buffer> ;c ```{, eval = FALSE}<CR><++><CR>```<CR><CR><++><Esc>4k^f,i
augroup END
