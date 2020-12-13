call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'valloric/youcompleteme', { 'do': './install.py --go-completer' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'

Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'godlygeek/tabular'

Plug 'roxma/vim-tmux-clipboard'

Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/AnsiEsc.vim' " Ansi color 적용
Plug 'asciidoc/vim-asciidoc'

Plug 'jceb/vim-orgmode'
Plug 'plasticboy/vim-markdown'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

syntax on
let g:rehash256 = 1
let mapleader = " "

"https://github.com/vim/vim/issues/3608
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256
"set termguicolors

colorscheme onedark

if has('gui_running')
  set guioptions-=T " no toolbar
  set guioptions-=m " no memnubar
  if has("win32")
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ko_kr.utf-8
    source $VIMRUNTIME/menu.vim
  endif
endif

if has("win32")
  lang mes en
  " E303: Unable to open swap file for [No Name], recovery impossible
  set directory=.,$TEMP
endif


set clipboard=unnamed " https://vim.fandom.com/wiki/Accessing_the_symtem_clipboard
set nocompatible  " be iMproved
set nu
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
set noerrorbells visualbell t_vb= " sound, visual bell 둘 다 비활성화.

autocmd GUIEnter * set visualbell t_vb=
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
" ==================== vim-go ====================
"let g:go_fmt_fail_silently = 1
"let g:go_fmt_command = "goimports"
"let g:go_debug_windows = {
      "\ 'vars':  'leftabove 35vnew',
      "\ 'stack': 'botright 10new',
"\ }

"let g:go_test_prepend_name = 1
"let g:go_list_type = "quickfix"
"let g:go_auto_type_info = 0
"let g:go_auto_sameids = 0
"let g:go_null_module_warning = 0
"let g:go_echo_command_info = 1
"let g:go_autodetect_gopath = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint']
"let g:go_metalinter_enabled = ['vet', 'golint']
"let g:go_gocode_propose_source = 1
"let g:go_modifytags_transform = 'camelcase'
"let g:go_fold_enable = []
"let g:go_info_mode = 'gopls'
"let g:go_rename_command='gopls'
"let g:go_implements_mode='gopls'
"let g:go_gopls_complete_unimported = 1
"let g:go_diagnostics_enabled = 1
"let g:go_doc_popup_window = 1

let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1


nmap <C-o> :GoDecls<cr>
imap <C-o> <esc>:<C-u>GoDecls<cr>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  "autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  " I like these more!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

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
nmap <C-p> :Files<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <Leader>ms :NERDTreeFind<CR>
nmap <Leader>b :BuffergatorOpen<CR>

let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
