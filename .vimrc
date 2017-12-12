set runtimepath+=~/.vim_runtime

" add ultimate vimrc config and plugins
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

" add personal pathogen plugins
call pathogen#infect('~/.vim_pathogen/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"

""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

" Colorscheme
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
colorscheme base16-default-dark

" 1 tab == 4 spaces
set shiftwidth=2
set ts=2
set sts=2

imap jk <Esc>
set number
set rnu

" set break indent indentifier
set breakindent showbreak=..

" set folds
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2  

" commands to retab document to different tab width
command TTF :source ~/.vimScripts/2to4.vim
command FTT :source ~/.vimScripts/4to2.vim

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
