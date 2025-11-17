# vimfiles – Vim config do Rapha ;D

Configuração **minimalista de Vim**, pensada para funcionar em qualquer distro Linux, com:

- Tema **Dracula** (opcional, via git).
- Destaque de linha/coluna do cursor.
- Barra lateral de navegação de diretórios usando **netrw** (sem plugins externos).
- Atalhos básicos para salvar, sair, navegar entre splits e buffers.

> Este repositório existe para versionar o seu `.vimrc` e reaplicá-lo facilmente em qualquer máquina.

---

## Arquivos

- `.vimrc` – arquivo principal de configuração do Vim.

---

## Requisitos

- Vim 8+ (a maioria das distros atuais já atende).
- Git (para clonar este repositório e o tema Dracula, se desejar).
- Um terminal com suporte a cores verdadeiras (*true color*) é recomendado.

---

## Instalação rápida em uma nova máquina

```bash
# 1. Clonar o repositório
git clone https://github.com/raphamaster/vimfiles.git ~/.vimfiles

# 2. Usar o .vimrc deste repo como configuração principal
cp ~/.vimfiles/.vimrc ~/.vimrc
# ou, se preferir, criar um symlink:
# ln -s ~/.vimfiles/.vimrc ~/.vimrc
```

Abra o Vim normalmente:

```bash
vim
```

Se o tema Dracula estiver instalado (veja a próxima seção), ele será aplicado automaticamente.  
Caso contrário, o Vim usa o tema `default`.

---

## Instalando o tema Dracula para Vim

O `.vimrc` está preparado para usar o esquema de cores **Dracula**, se ele estiver disponível.

### 1. Criar a pasta de temas (Vim 8 – packages)

```bash
mkdir -p ~/.vim/pack/themes/start
```

### 2. Clonar o tema Dracula

```bash
cd ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula
```

Na próxima vez que você abrir o Vim, o comando `colorscheme dracula` do `.vimrc` vai funcionar.  
Se o tema não estiver instalado, o próprio `.vimrc` faz *fallback* para `colorscheme default`.

---

## O que está configurado no .vimrc

### Básico

- Compatibilidade com vi antigo desativada (`set nocompatible`).
- UTF-8 como codificação padrão (`scriptencoding utf-8`, `set encoding=utf-8`).
- `syntax on` / `syntax enable` – realce de sintaxe para todos os tipos de arquivo.
- `set background=dark` e `set termguicolors` (se disponível) para cores escuras modernas.

### Destaque de cursor e seleção

- `set cursorline` e `set cursorcolumn` – linha e coluna do cursor destacadas.
- Autocommands ajustam a cor de:
  - `CursorLine`
  - `CursorColumn`
  - `Visual` (seleção visual)
  deixando a navegação mais confortável em temas escuros.

### Comportamento geral

- `filetype plugin indent on` – plugins e indentação específicos por tipo de arquivo.
- `set number` – mostra números de linha.
- `set history=1000` – histórico de comandos e buscas.
- `set autoread` – recarrega o arquivo se mudar no disco.
- Clipboard: se existir `unnamedplus`, usa o clipboard do sistema (`"+` / `"*`).
- `wildmenu` e `wildmode` – melhor experiência na linha de comando.
- `set ruler` e `set cmdheight=1` – informações do cursor e linha de comando mais limpa.
- Backspace “decente” e movimento *wrap* com `<,>,h,l`.
- Busca “inteligente”:
  - `hlsearch`, `ignorecase`, `smartcase`, `magic`.
- `set showmatch` – destaca parênteses/colchetes/chaves correspondentes.
- Sem quebra de linha visual (`nowrap`, `nolinebreak`).
- Indentação com espaços:
  - `expandtab`, `smarttab`, `shiftwidth=4`, `tabstop=4`.
- Statusline simples sempre visível (`laststatus=2` e `statusline=...`).

---

## Atalhos básicos

A tecla **Leader** é o **espaço**:

```vim
let mapleader = " "
```

### Navegação entre splits

- `Ctrl + h` – janela da esquerda.
- `Ctrl + j` – janela de baixo.
- `Ctrl + k` – janela de cima.
- `Ctrl + l` – janela da direita.

### Salvar / sair

- `<Leader>w` – salva (`:w`).
- `<Leader>q` – fecha a janela (`:q`).
- `<Leader>x` – salva e fecha se houve alterações (`:x`).

### Busca

- `<Leader><Space>` – limpa o destaque da última busca (`:nohlsearch`).

### Buffers

- `<Leader><Tab>` – alterna entre o buffer atual e o anterior (`<C-^>`).

---

## Barra lateral de diretórios (netrw)

O `.vimrc` usa o **netrw**, que já vem embutido no Vim, configurado como um “explorer” lateral simples.

Configurações principais:

- `g:netrw_banner = 0` – esconde o banner de ajuda.
- `g:netrw_liststyle = 3` – exibição em árvore.
- `g:netrw_browse_split = 4` e `g:netrw_altv = 1` – abre arquivos na janela à direita.
- `g:netrw_winsize = 25` – largura da janela lateral (percentual).

### Atalho

- `<F2>` – abre o explorer lateral (barra de diretórios) com `:Lexplore`.

Passos típicos:

1. Abra o Vim no diretório do projeto:
   ```bash
   cd /caminho/do/projeto
   vim .
   ```
2. No Vim, pressione:
   ```text
   <F2>
   ```
3. Use `j` / `k` ou as setas para navegar; `Enter` abre o arquivo na janela da direita.

