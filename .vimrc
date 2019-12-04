"Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'jiangmiao/auto-pairs'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/taglist.vim'
Plug 'junegunn/goyo.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" shows numbers
	set number relativenumber
	
"activates plugins
	filetype plugin on
	
"sets the color	
	syntax on 
	color codedark 

	"turn spellcheck on
	set spell	
	"remapping esc to jj in insert mode
	inoremap jj <Esc>

"autocmd stuff
	filetype plugin on
	set nocompatible


	"making the arrow keys pointless"
	noremap <Up> <Nop>
	noremap <Down> <Nop>
	noremap <Left> <Nop>
	noremap <Right> <Nop>

	"setting tabs to 4
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set noexpandtab

	"soft line wrop"
	set linebreak
	"map for nerdtree
map <C-n> :NERDTreeToggle<CR>

" TagList options                                                                                                                        
let Tlist_Auto_Open = 1                                                                                                              
let Tlist_Auto_Highlight_tag = 1 "highlights the current tag                                                                         
let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left, exit vim                                                  
let Tlist_Show_Menu = 1 "show Tags menu in gvim                                                                                     
 let Tlist_Show_One_File = 1 "show tags of only one file                                                                              
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window                                                     
let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag i|   ~                          
let Tlist_Use_Right_Window = 1 "display taglist window on the right                                                                  
let Tlist_Display_Prototype = 1 "display full prototype instead of just function name                                                
"let Tlist_Ctags_Cmd = /path/to/exuberant/ctags                                                                                     
                                                                                                                                     
nnoremap <C-t> :TlistToggle<CR>                                                                                                      
nnoremap <F6> :TlistShowPrototype                                                                                                    
                                                                                                
set statusline=[%n]\ %<%f\ %([%1*%M%*%R%Y]%)\ \ \ [%{Tlist_Get_Tagname_By_Line()}]\ %=%-19(\LINE\ [%l/%L]\ COL\|[%02c%03V]%)\ %P

"random editing commands"
"for going to end of line while in edit
autocmd FileType * inoremap ;e <Esc>A
autocmd FileType * inoremap ,d <Esc>:filetype detect<Enter>
autocmd FileType * inoremap ;r <Esc>:source ~/.vimrc <Enter>i
""autocmd snippets for writting commands hahah
autocmd FileType vim inoremap ,lt autocmd FileType tex inoremap ,<Esc>a
autocmd FileType vim inoremap ,ct autocmd FileType c inoremap ,<Esc>a
autocmd FileType vim inoremap ,ht autocmd FileType html inoremap ,<Esc>a

"compile while editing tex file"
autocmd FileType tex inoremap ,c <Esc>:w<Enter> :!pdflatex %  <Enter>i
"Latex snippets"
autocmd FileType plaintex inoremap ,bd \documentclass{article}<Enter>\author{Daniel Schaffel}<Enter>\title{}<Enter>\begin{document}<Enter>\maketitle<Enter><Enter>\end{document}<Esc>4kf}i

autocmd FileType tex inoremap ,up \usepackage{}<Esc>F}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Esc>zzi
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Esc>zzi
autocmd FileType tex inoremap ,bf \textbf{}<Esc>zzi
autocmd FileType tex inoremap ,if \textit{}<Esc>zzi

"Math macros"
autocmd FileType tex inoremap ,m $$<Esc>i
autocmd FileType tex inoremap ,lm \[<Enter><Enter>\]<Esc>ki
autocmd FileType tex inoremap ,cm <Enter>\center{$$}\\<Esc>zzF$i 
autocmd FileType tex inoremap ,bm \begin{bmatrix}<Enter><Enter>\end{bmatrix}<Esc>zzk
autocmd FileType tex inoremap ,p \left(\right)<Esc>F\i
autocmd FileType tex inoremap ,4m \begin{bmatrix}<Enter>&<Space>&<Space>&<Space>\\<Enter>&<Space>&<Space>&<Space>\\<Enter>&<Space>&<Space>&<Space>\\<Enter>\end{bmatrix}<Esc>zzk
autocmd FileType tex inoremap ,3m \begin{bmatrix}<Enter><Space>&<Space>&<Space>\\<Enter><Space>&<Space>&<Space>\\<Enter><Space>&<Space>&<Space><Enter>\end{bmatrix}<Esc>zzk

"C macros"
autocmd FileType c inoremap ,if int<Space><Space>{<Enter><Enter>return 0;<Enter>}<Esc>2kFta
autocmd FileType c inoremap ;db  printf("\n");<Esc>F\i


"html snippets
autocmd FileType html inoremap ,bt <!doctype html><Enter><html><Enter><head><Enter><title></title><Enter></head><Enter><Enter><body><Enter><Enter></body><Enter></html>


autocmd FileType html inoremap ,p <p></p><Esc>F<i


"markdown snippets"
autocmd FileType markdown inoremap ,i **<Esc>i
autocmd FileType markdown inoremap ,b ****<Esc>hi

"for changing the cursur to line in insert mode"
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

