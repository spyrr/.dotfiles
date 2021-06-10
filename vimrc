set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" Plugin setup
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'davidhalter/jedi-vim'
    Plugin 'scrooloose/syntastic'
	Plugin 'nvie/vim-flake8'
	Plugin 'hynek/vim-python-pep8-indent'
    Plugin 'dracula/vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'majutsushi/tagbar'
    Plugin 'vim-airline/vim-airline' " vim status bar
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)

	let g:jedi#show_call_signatures=0
	let g:jedi#popup_select_first="0"
	let g:jedi#force_py_version=3

    let g:dracula_colorterm = 0
	filetype plugin indent on

call vundle#end()
" End of plugin setup

if has("syntax")
 syntax on
endif

set t_Co=256
set encoding=utf-8
set nu
set tabstop=4
set cursorline

set laststatus=2
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
colorscheme dracula

set textwidth=80  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

"autocmd BufWritePost *.py call Flake8()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" For Python
au FileType python map <f2> : !python3 %
au FileType python map <f3> : !nosetests -v --rednose test_%
nmap <F8> :Tagbar<CR>
nmap <F9> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<Cr>

"------------Configure for indent guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>
