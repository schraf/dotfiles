"------------------------------------------------------------------------------
" General Settings
"------------------------------------------------------------------------------
set nocompatible               " Use Vim's features, not Vi's defaults
set backspace=indent,eol,start " Allow backspace on all characters in insert mode
set history=1000               " Remember more commands and search history
set undolevels=1000            " Maximum number of changes that can be undone
set undofile                   " Persist undo history between sessions

set ruler                      " Always show cursor position
set showcmd                    " Display incomplete commands
set wildmenu                   " Visual autocomplete for command-line completion
set lazyredraw                 " Don't redraw screen during macros
set showmatch                  " Briefly jump to matching bracket
set visualbell                 " Use a visual bell instead of a beep
set mouse=a                    " Enable mouse support

"------------------------------------------------------------------------------
" Filetype, Syntax, and Colors
"------------------------------------------------------------------------------
filetype on                    " Enable filetype detection
filetype plugin on             " Load filetype-specific plugins
filetype indent on             " Load filetype-specific indent settings
syntax on                      " Enable syntax highlighting

set termguicolors              " Enable 24-bit RGB colors for a better look
set background=dark            " Use a dark background
color base16-google-dark       " Set the colorscheme

"------------------------------------------------------------------------------
" UI Appearance
"------------------------------------------------------------------------------
set number                     " Show line numbers
set cursorline                 " Highlight the current line
set showbreak=+++              " Show '+++' when a line breaks
set nowrap                     " Do not wrap lines by default

"------------------------------------------------------------------------------
" Searching
"------------------------------------------------------------------------------
set hlsearch                   " Highlight all matches
set incsearch                  " Show matches as you type
set ignorecase                 " Ignore case in search patterns
set smartcase                  " Override ignorecase if search pattern has uppercase letters

"------------------------------------------------------------------------------
" Indentation and Tabs
"------------------------------------------------------------------------------
set autoindent                 " Copy indent from current line when starting a new line
set smartindent                " Insert indentation automatically on new lines
set expandtab                  " Use spaces instead of tabs
set smarttab                   " Insert tabs at the start of a line respecting 'shiftwidth'
set shiftwidth=4               " Set number of spaces for indentation
set tabstop=4                  " Set number of spaces for a tab character
set softtabstop=4              " Set number of spaces for a tab in insert mode

"------------------------------------------------------------------------------
" Backup and Swap Files
" Note: These directories must be created manually.
"------------------------------------------------------------------------------
set backupdir=~/.vim/backup//  " Directory to store backup files (// preserves directory structure)
set directory=~/.vim/swap//    " Directory to store swap files (// preserves directory structure)
set undodir=~/.vim/undo//      " Directory to store persistent undo files (// preserves directory structure)
set backup
set backupext=.bak

"------------------------------------------------------------------------------
" Code Folding
"------------------------------------------------------------------------------
set foldmethod=indent          " Fold based on indentation
set foldlevelstart=99          " Start with all folds open

"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------
set rtp+=~/.fzf

"------------------------------------------------------------------------------
" Auto Commands
"------------------------------------------------------------------------------
autocmd BufWritePre * let &bex = '-' .. strftime("%Y%m%d%H%M%S") .. '.bak'

"------------------------------------------------------------------------------
" Keyboard Shortcuts
"------------------------------------------------------------------------------
nnoremap <C-p> :FZF<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <F4> :make clean<CR>
nnoremap <F5> :make lint<CR>
nnoremap <F6> :make test<CR>
nnoremap <F7> :make build<CR>
nnoremap <F8> :make debug<CR>
nnoremap <F9> :make run<CR>


