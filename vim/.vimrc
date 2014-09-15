execute pathogen#infect()
set modeline
syntax on
set omnifunc=syntaxcomplete#Complete
filetype plugin indent on
colorscheme badwolf  " my awesome dark color schemes
set number           " set line numbers on
set showcmd          " show commands in the bottom bar
set cursorline       " highlight current line
set wildmenu         " visual autocomplete for command
set lazyredraw       " only redraw when we need to
set showmatch        " highlight matching [{()}]
set incsearch        " search as charecters are entered.
set hlsearch         " highlight matches
set foldenable       "  enable folding
set foldlevelstart=10   " open most folds by default
set mouse=a
set autoindent
set ts=4 sts=4 sw=4 expandtab
filetype plugin indent on     " required!
filetype plugin on

" Gundo is a plugin to make browsing this ridiculousley powerful undo tree less
" painful.
nnoremap <F5> :GundoToggle<CR>
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
