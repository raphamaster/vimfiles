" ==========================
" Básico
" ==========================
set nocompatible              " Desativa compatibilidade com o vi antigo (habilita recursos modernos do Vim)
scriptencoding utf-8          " Define a codificação deste arquivo de configuração como UTF-8
set encoding=utf-8            " Define a codificação interna do Vim como UTF-8

syntax on                     " Liga o realce de sintaxe
syntax enable                 " Garante que o realce de sintaxe esteja habilitado para todos os tipos de arquivo

set background=dark           " Informa ao Vim que o fundo do terminal é escuro (ajuda temas a escolherem cores)
if has('termguicolors')       " Verifica se o Vim suporta cores verdadeiras (24-bit)
  set termguicolors           " Habilita cores verdadeiras no terminal, se suportado
endif

" Destacar linha/coluna do cursor de forma visível
set cursorline                " Destaca a linha onde o cursor está
set cursorcolumn              " Destaca a coluna onde o cursor está

" Grupo de autocmd para ajustar cores da linha/coluna/seleção
augroup CursorHighlights
  " Limpa autocmds antigos desse grupo
  autocmd!

  " Ajusta a cor de fundo da linha do cursor
  autocmd VimEnter,ColorScheme * highlight CursorLine   cterm=NONE ctermbg=236 guibg=#2c313c

  " Ajusta a cor de fundo da coluna do cursor
  autocmd VimEnter,ColorScheme * highlight CursorColumn cterm=NONE ctermbg=236 guibg=#2c313c

  " Ajusta a cor de fundo da seleção visual (modo visual)
  autocmd VimEnter,ColorScheme * highlight Visual       cterm=NONE ctermbg=238 guibg=#44475a
augroup END

" ==========================
" Comportamento geral
" ==========================
filetype plugin indent on    " Detecta tipo de arquivo, carrega plugins e regras de indentação específicas

set number                   " Mostra o número das linhas na coluna da esquerda
set history=1000             " Guarda histórico de 1000 comandos e buscas
set autoread                 " Recarrega automaticamente o arquivo se ele mudar no disco

" Não habilitamos 'set mouse=a' para deixar o terminal controlar o botão direito.
" Assim, o clique direito cola texto no modo INSERT usando o menu/atalho do terminal.

if has('unnamedplus')        " Se houver suporte ao clipboard do sistema (+ e *)...
  set clipboard=unnamed,unnamedplus " Usa o clipboard do sistema junto com o interno do Vim
endif

set wildmenu                 " Habilita menu de conclusão para comandos (barra de status)
set wildmode=longest,list    " Define o comportamento do wildmenu: completa o mais longo e mostra lista

set ruler                    " Mostra posição do cursor (linha/coluna) na barra de status
set cmdheight=1              " Usa uma linha de altura para a linha de comandos

set backspace=eol,start,indent " Permite backspace apagar quebras de linha, início de inserção e indentação
set whichwrap+=<,>,h,l       " Permite que as teclas de movimento (<,>,h,l) “pulem” de uma linha para outra

" Configurações de busca
set hlsearch                 " Destaca todas as ocorrências encontradas na última busca
set ignorecase               " Ignora maiúsculas/minúsculas nas buscas...
set smartcase                " ...a não ser que a busca tenha alguma letra maiúscula (busca “inteligente”)
set magic                    " Usa regex estendidas (mais poderosas) nas buscas

set showmatch                " Destaca o par de parênteses/colchetes/chaves correspondente
set mat=3                    " Tempo (em décimos de segundo) que o par correspondente fica destacado

set nowrap                   " Não quebra linhas automaticamente na visualização
set nolinebreak              " Não quebra linhas respeitando palavras (mantém texto corrido)

" Tabs / indentação
set expandtab                " Converte TAB em espaços
set smarttab                 " Faz TAB respeitar a indentação inteligente
set shiftwidth=4             " Define tamanho da indentação (>> e <<) como 4 espaços
set tabstop=4                " Define um TAB como equivalente a 4 espaços na visualização

" Sempre mostrar a barra de status
set laststatus=2

" Statusline cheia de informações:
" buffer:nome | flags | filetype | encoding/formato | pwd | linha/coluna | porcentagem
set statusline=%#StatusLine#%n:%<%f\ %m%r%h%w\ [FT:%{&filetype==''?'noft':&filetype}]\ [ENC:%{&fileencoding==''?&encoding:&fileencoding}/%{&fileformat}]\ [PWD:%{fnamemodify(getcwd(),':t')}]\ %=Ln:%l/%L\ Col:%c\ [%p%%]

" ==========================
" Atalhos básicos
" ==========================
let mapleader="\<Space>"     " Define a tecla <Leader> como espaço (prefixo para atalhos personalizados)

" Navegação entre janelas (splits) com Ctrl + h/j/k/l
nnoremap <C-h> <C-w>h        " Ctrl+h move para a janela da esquerda
nnoremap <C-j> <C-w>j        " Ctrl+j move para a janela de baixo
nnoremap <C-k> <C-w>k        " Ctrl+k move para a janela de cima
nnoremap <C-l> <C-w>l        " Ctrl+l move para a janela da direita

" Salvar e sair rápido
nnoremap <leader>w :w<CR>    " <Leader>w salva o arquivo (:w)
nnoremap <leader>q :q<CR>    " <Leader>q fecha a janela (:q)
nnoremap <leader>x :x<CR>    " <Leader>x salva e fecha se houve alterações (:x)

" Limpar highlight de busca
nnoremap <leader><Space> :nohlsearch<CR> " <Leader><Space> limpa o destaque de buscas (nohlsearch)

" Alternar entre o buffer atual e o anterior
nnoremap <leader><Tab> <C-^> " <Leader><Tab> alterna entre o arquivo atual e o último aberto (<C-^>)

" ==========================
" Barra lateral de diretórios (netrw embutido)
" ==========================
" Configuração básica do netrw para usar como "explorer" lateral
let g:netrw_banner = 0       " Esconde o banner de ajuda do netrw
let g:netrw_liststyle = 3    " Usa visualização em árvore
let g:netrw_browse_split = 4 " Abre arquivos na janela anterior
let g:netrw_altv = 1         " Abre vertical split à direita
let g:netrw_winsize = 25     " Largura da janela lateral (percentual)

" Atalho para abrir a barra lateral na esquerda com o diretório atual
nnoremap <F2> :Lexplore<CR>

" ==========================
" Tema Dracula
" ==========================
" Tenta aplicar o tema 'dracula' (é preciso ter o tema instalado em ~/.vim/pack/themes/start/dracula)
try
  colorscheme dracula        " Define o esquema de cores para 'dracula'
catch
  colorscheme default        " Se o tema não estiver disponível, volta para o tema padrão do Vim
endtry

highlight StatusLine   cterm=NONE ctermfg=255 ctermbg=237
highlight StatusLineNC cterm=NONE ctermfg=245 ctermbg=236

