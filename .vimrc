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
set shiftwidth=2
set ts=2
set sts=2

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

nnoremap <leader>ll :w<CR>:!rubber --pdf --warn all %<CR><CR>
nnoremap <leader>lv :!xreader %:r.pdf &> /dev/null &<CR><CR>
nnoremap <leader>lp :!xreader -s %:r.pdf &> /dev/null &<CR><CR>
