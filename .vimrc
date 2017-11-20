set runtimepath+=~/.vim_runtime

" add ultimate vimrc config and plugins
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

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
nnoremap <leader>ll :w<CR>:!rubber --pdf --warn all %<CR><CR>
nnoremap <leader>lc :w<CR>:!rubber --pdf --warn all %<CR>
nnoremap <leader>lv :!xreader %:r.pdf &> /dev/null &<CR><CR>
nnoremap <leader>lp :!xreader -s %:r.pdf &> /dev/null &<CR><CR>
