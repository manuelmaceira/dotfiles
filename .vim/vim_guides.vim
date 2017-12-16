"" Defining the guides
inoremap <C-l> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
map <Space><Space> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

""""""""""""""""""""""""""""
" => Java
""""""""""""""""""""""""""""
autocmd FileType java inoremap ;fr for(;<++>;<++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^f;i
autocmd FileType java inoremap ;fc for(: <++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^f:i
autocmd FileType java inoremap ;wl while() {<Enter><++><Enter>}<Enter><++><Esc>3k^f)i
autocmd FileType java inoremap ;dw do {<Enter>;<Enter>} while (<++>);<Enter><++><Esc>2k^xA
autocmd FileType java inoremap ;if if() {<Enter><++><Enter>}<Enter><++><Esc>3k^f)i
autocmd FileType java inoremap ;ie if() {<Enter><++><Enter>} else {<Enter><++><Enter>}<Enter><++><Esc>5k^f)i
autocmd FileType java inoremap ;ii if() {<Enter><++><Enter>} else <++><Esc>2k^f)i
autocmd FileType java inoremap ;pc public class  {<Enter><++><Enter>}<Esc>2k^f{hi
autocmd FileType java inoremap ;cl class  {<Enter><++><Enter>}<Esc>2k^f{hi
autocmd FileType java inoremap ;pf public  <++>(<++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^fc2li
autocmd FileType java inoremap ;rf private  <++>(<++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^fc2li
autocmd FileType java inoremap ;mn public static void main(String[] args) {<Enter>;<Enter>}<Enter><++><Esc>2k^xA
autocmd FileType java inoremap ;rt return 
autocmd FileType java inoremap ;st static 
autocmd FileType java inoremap ;pt System.out.println();<Enter><++><Esc>k^f)i
autocmd FileType java inoremap ;ip <Esc>?import<Enter>oimport ;<Esc>i
autocmd FileType java nnoremap ;ip ?import<Enter>oimport ;<Esc>i

""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""
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
autocmd FileType python inoremap ;pt print()<Enter><++><Esc>k^f)i
autocmd FileType python inoremap ;ip <Esc>?import<Enter>oimport 
autocmd FileType python nnoremap ;ip ?import<Enter>oimport 

""""""""""""""""""""""""""""
" => LaTeX
""""""""""""""""""""""""""""
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
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
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

""""""""""""""""""""""""""""
" => HTML
""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""
" => Bib
""""""""""""""""""""""""""""
autocmd FileType bib inoremap ;a @article{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>journal<Space>=<Space>"<++>",<Enter><Tab>volume<Space>=<Space>"<++>",<Enter><Tab>pages<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ;b @book{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>publisher<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ;c @incollection{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>booktitle<Space>=<Space>"<++>",<Enter><Tab>editor<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>publisher<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>8kA,<Esc>i

""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""
autocmd Filetype markdown inoremap ;b ****<Space><++><Esc>F*hi
autocmd Filetype markdown inoremap ;s ~~~~<Space><++><Esc>F~hi
autocmd Filetype markdown inoremap ;e **<Space><++><Esc>F*i
autocmd Filetype markdown inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ;i ![](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;a [](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;l --------<Enter>
