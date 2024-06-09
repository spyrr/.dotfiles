set nocompatible
filetype off

" Plug setup
call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'preservim/tagbar'
	Plug 'dracula/vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'vim-airline/vim-airline' " vim status bar
	Plug 'vim-airline/vim-airline-themes'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	let g:dracula_colorterm = 0
	filetype plugin indent on
call plug#end()
" End of plugin setup

" Default settings
if has("syntax")
 syntax on
endif

set t_Co=256
set encoding=utf-8
set nu
set relativenumber
set tabstop=2
set cursorline
set showmatch
set mouse=a

set laststatus=2
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
colorscheme dracula

"set textwidth=80  " lines longer than 79 columns will be broken
"set shiftwidth=2  " operation >> indents 4 columns; << unindents 4 columns
"set softtabstop=2 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set hlsearch
set colorcolumn=120
highlight OverLength guibg=#592929
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

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
au FileType python setlocal colorcolumn=80
au FileType python setlocal tabstop=4 shiftwidth=4 expandtab
"au FileType python let g:jedi#environment_path = "python3"


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

nnoremap <silent><C-j> :tabprevious<CR>
nnoremap <silent><C-k> :tabnext<CR>
nnoremap <silent><C-h> :bp<CR>
nnoremap <silent><C-l> :bn<CR>
nnoremap <silent><C-w>t :NERDTreeFocus<CR>

" 우측 하단(botright)에 창 생성(new), 해당 창을 terminal 로 변경
" 크기를 10 으로 재설정(resize) 후 창 높이를 고정(winfixheight)시킴
" 줄번호는 삭제하고, 터미널 디렉터리 글자색을 변경
nnoremap <silent><F2> 
	\:botright new<CR><bar>
	\:terminal<CR><bar><ESC>
	\:resize 10<CR><bar>
	\:set winfixheight<CR><bar>
	\:set nonu<CR><bar>
	\iLS_COLORS=$LS_COLORS:'di=1;33:ln=36'<CR>

" ------------------------------------
" 터미널 모드 
" ------------------------------------
" 터미널 모드에서 <Ctrl + w> 누르면 명령 모드로 전환하고 <Ctrl + w> 입력
tmap <silent><C-w> <ESC><C-w>

" jk 혹은 kj 를 누르면 <ESC> 를 실행
tmap <silent>jk <ESC>
tmap <silent>kj <ESC>

" <ESC> 입력 시 <C-\><C-n> 실행 => 터미널 모드에서 기본 모드로 전환
tnoremap <silent><ESC> <C-\><C-n>

" =========================================================================
" =  하이라이트 정의                                                      =
" =========================================================================
" 버퍼(창)과 버퍼의 끝(창의 끝)을 투명하게
highlight Normal guibg=NONE
highlight EndOfBuffer guibg=NONE

" 줄번호 배경색은 투명(NULL)하게,
" 글자는 굵게(bold), 글자색은 하얗게(White)
highlight LineNr guibg=NONE gui=bold guifg=white

" 행 표시선 색상
highlight ColorColumn guibg=White

let g:python3_host_prog = '/Users/spyrr/miniforge3/bin/python3'
let g:coc_global_extensions = ['coc-explorer', 'coc-json', 'coc-tsserver', 'coc-import-cost', 'coc-eslint', 'coc-html', 'coc-css', 'coc-emmet', 'coc-pyright', 'coc-angular', 'coc-git', 'coc-rust-analyzer']
let g:coc_global_extensions += ['https://github.com/andys8/vscode-jest-snippets']
