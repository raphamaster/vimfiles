" .vimrc
" Author: Raphael Franco <raphael.rfranco@gmail.com>
" Source: http://github.com/raphamaster/vimfiles

"*****************************************************************************
" Opcoes Basicas 
"*****************************************************************************

" Habilitar highlighting
syntax on
syntax enable

" Esquema de cores
set background=dark

" Desabilitar Menus GVim
set guioptions-=m
set guioptions-=r
set guioptions-=T

" Tema
colorscheme yowish

" Habilita auto identacao
filetype plugin indent on

" Exibe numera de linhas
set number

" Usa as definicoes do vim e nao as do vi
set nocompatible

" Tamanho do histórico de comandos
set history=1000

" Habilitando o recohecimento de arquivos
filetype plugin on
filetype indent on

" Recarrega o arquivo caso ele seja editado por um programa externo aberto
set autoread

" Habilita o mouse para cliques e coisas fdo tipo
set mouse=a

" clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Ativa o menu Wild (ativa <ctrl>n e <ctrl>p para navegar entre correspondencias de busca
set wildmenu

" Sempre mostra posicao atual do cursor
set ruler

" Altura da barra de comandos
set cmdheight=1

" Configurando a tecla <Backspace>
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Destaca os resultados de busca
set hlsearch

" Ignora o case sensitve as buscas
set ignorecase

" Habilita expressoes regulares
set magic

" Destaca pares de colchetes ao passar o cursor, e configura o tempo destaque para decimos de segundo
set showmatch
set mat=3

" Desativa quebra de linha automatica
set nolinebreak

" Permite navegacao dentro de uma mesma linha longa com k e k
set nowrap

" Insere espacos no lugar de caractes de tabulacao
set expandtab

" Uso inteligente de tabulacoes
set smarttab

" Define tabulacao como sendo oito espacos
set shiftwidth=4
set tabstop=4

" Sempre mosta a linha de status
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline+=%{fugitive#statusline()}

" Acetando unicode
set encoding=utf-8

" Completa o comando o TAB igual no Bash
set wildmode=longest,list

" Colorir linhas e colunas na posicao atual do cursor
au WinLeave * set nocursorline nocursorcolumn
au WinLeave * set cursorline cursorcolumn
set cursorline cursorcolumn

"*****************************************************************************
"" Mapeado Teclas de Atalho
"*****************************************************************************

"" Navegacao em Tabs
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>e :tabedit
nnoremap <leader>c :tabclose<cr>
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>p :tabprevious<cr>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" session management
nnoremap <leader>so :opensession
nnoremap <leader>ss :savesession
nnoremap <leader>sd :deletesession<cr>
nnoremap <leader>sc :closesession<cr>

"" tabs
nnoremap <tab> gt
nnoremap <s-tab> gt
nnoremap <silent> <s-t> :tabnew<cr>

"" set working directory
nnoremap <leader>. :lcd %:p:h<cr>

"" opens an edit command with the path of the currently edited file filled in
noremap <leader>e :e <c-r>=expand("%:p:h") . "/" <cr>

"" opens a tab edit command with the path of the currently edited file filled
noremap <leader>te :tabe <c-r>=expand("%:p:h") . "/" <cr>

"" Copy/Paste/Cut
noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

" Markdown
" Sets markdown syntax for *.md files.
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Wrap markdown files.
autocmd BufRead,BufNewFile *.md set wrap

"*****************************************************************************
"" Teclas de Atalho para execucao de plugins e configuracoes de plugins
"*****************************************************************************
" Vundle-Setup
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""" Bundles

" Temas
Plugin 'KabbAmine/yowish.vim'
Plugin 'tomasr/molokai'

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'szw/vim-ctrlspace'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'

" HTML/CSS
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'tpope/vim-haml'
Plugin 'mattn/emmet-vim'

" Vundle Post-Setup
call vundle#end()            " required
filetype plugin indent on    " required

""" Configuracoes de Bundles """

" Airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" NERDTree
let NERDTreeHighlightCursorline=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'

" Syntastic
set statusline +=%#warningmsg#
set statusline +=%{SyntasticStatuslineFlag()}
set statusline +=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" CtrlSpace
set nocompatible
set hidden

" MultipleCursors"
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

