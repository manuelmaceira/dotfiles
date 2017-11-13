set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" 1 tab == 4 spaces
set shiftwidth=4
set ts=4
set sts=4

imap jk <Esc>
set number
set rnu

set breakindent showbreak=..

command TTF :source ~/.vimScripts/2to4.vim
command FTT :source ~/.vimScripts/4to2.vim

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
