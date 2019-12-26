call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

Plug 'dag/vim-fish'

Plug 'posva/vim-vue'
Plug 'asciidoc/vim-asciidoc'
call plug#end()

" behave mswin

let mapleader = " "

syntax on " syntax highlighting
set clipboard=unnamedplus " https://vim.fandom.com/wiki/Accessing_the_system_clipboard
set nocompatible  " be iMproved
"set nu " line number
set rnu " relative  line number
set ts=2
set sw=2
set softtabstop=2
set expandtab " tab을 space로 저장
set scrolloff=15 " scroll offset. 15줄 범위에서부터 scroll
set ruler " 현재 row, col을 출력
set autoindent
set cindent
set incsearch " incremental search
set hlsearch " 검색 결과 강조
set ignorecase " 대소문자 무시 검색
set smartcase " 대문자가 검색 문자열에 있을때는 noignorecase
set laststatus=2 " vim-powerline이 꾸며주는 상태바를 항상 출력하기 위해
set hidden
set autowrite
set wildmenu "명령어 tab completion 
set enc=utf-8
set fencs=ucs-bom,utf-8,cp949
set fenc=utf-8
set mmp=10000

" sound, visual bell 둘 다 비활성화.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

colorscheme onedark
if has("win32")
  lang mes en
  " E303: Unable to open swap file for [No Name], recovery impossible
  set directory=.,$TEMP
endif

if has('gui_running')
  set guioptions-=T " no toolbar
  set guioptions-=m " no memnubar
  if has("win32")
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ko_kr.utf-8
    source $VIMRUNTIME/menu.vim
  endif
else
  "set background=dark
endif

autocmd BufWinEnter *.{md,mkd,mkdn,mark*} silent setf markdown

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"!+ vim-go
let g:go_fmt_command = 'goimports'
let g:go_metalinter_command = 'gometalinter'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_gocode_propose_builtins = 0
let g:go_template_autocreate = 0
let g:go_fmt_autosave = 0
let g:go_echo_go_info = 0
let g:go_highlight_format_strings = 0
augroup nhooyr_go
  autocmd!
  autocmd FileType go nmap <Leader>gi :GoImport<space>
  autocmd FileType go nmap <Leader>gn :GoInfo<CR>
augroup END
"!- vim-go

let g:tagbar_type_groovy = {
      \ 'ctagstype' : 'groovy',
      \ 'kinds'     : [
      \ 'p:package:1',
      \ 'c:classes',
      \ 'i:interfaces',
      \ 't:traits',
      \ 'e:enums',
      \ 'm:methods',
      \ 'f:fields:1'
      \ ]
      \ }

nmap <F8> :TagbarToggle<CR>
nmap <C-p> :Files<Cr>
nmap <C-n> :NERDTreeToggle<CR>
nmap <Leader>ms :NERDTreeFind<CR>
