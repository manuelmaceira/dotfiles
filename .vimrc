set runtimepath+=~/.vim/runtime

" add ultimate vimrc config and plugins
source ~/.vim/runtime/vimrcs/basic.vim
source ~/.vim/runtime/vimrcs/filetypes.vim
source ~/.vim/runtime/vimrcs/plugins_config.vim
source ~/.vim/runtime/vimrcs/extended.vim
source ~/.vim/vim_guides.vim

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" add personal pathogen plugins
call pathogen#infect('~/.vim/pathogen/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"

""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
nmap <leader>bb :TagbarToggle<CR>

" IDE Mode
nmap <leader>i :TagbarToggle<CR>:NERDTreeToggle<CR>:wincmd p<CR>

" Colorscheme
let base16colorspace=256
if filereadable(expand("~/.vim/vimrc_background"))
  source ~/.vim/vimrc_background
endif
colorscheme base16-default-dark

" 1 tab == 4 spaces
set shiftwidth=2
set ts=2
set sts=2

inoremap jw <Esc>
inoremap wj <Esc>
set number
set rnu

" set break indent indentifier
set breakindent showbreak=..

" set folds
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2  

" Auto build configs on edit
autocmd BufWritePost ~/git/dotfiles/.config/Scripts/folders,~/git/dotfiles/.config/Scripts/configs !python ~/.config/Scripts/shortcuts.py

" commands to retab document to different tab width
command TTF :source ~/.vim/scripts/2to4.vim
command FTT :source ~/.vim/scripts/4to2.vim

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" latex keybindings
nnoremap <leader>ll :w<CR>:!rubber -m xelatex --warn all %<CR><CR>
nnoremap <leader>lc :w<CR>:!rubber -m xelatex --warn all %<CR>
nnoremap <leader>lv :!zathura -- %:r.pdf &> /dev/null &<CR><CR>
nnoremap <leader>lp :!pdf-presenter-console -sS %:r.pdf<CR><CR>

" md to pdf keybindings
nnoremap <leader>ml :w<CR>:!pandoc % --latex-engine=xelatex -o %:r.pdf<CR><CR>
nnoremap <leader>mb :w<CR>:!pandoc % --latex-engine=xelatex -t beamer -o %:r.pdf<CR>
nnoremap <leader>mc :w<CR>:!pandoc % --latex-engine=xelatex -o %:r.pdf<CR>
nnoremap <leader>mv :!zathura -- %:r.pdf &> /dev/null &<CR><CR>
nnoremap <leader>mp :!pdf-presenter-console -sS %:r.pdf<CR><CR>
