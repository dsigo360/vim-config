" Plugin Initialization
call plug#begin('~/.vim/plugged')

  " Vim Linting / Autocomplete
  Plug 'dense-analysis/ale'

  " Plug 'ervandew/supertab'
  Plug 'mattn/emmet-vim'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
  Plug 'jiangmiao/auto-pairs'
  Plug 'Valloric/YouCompleteMe'

  " File Navigation / Status bars
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'

  " C++ / CTags / TagList
  Plug 'vim-scripts/taglist.vim'

  " JavaScript Functionality
  Plug 'pangloss/vim-javascript'
  Plug 'crusoexia/vim-javascript-lib'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'elzr/vim-json'
  Plug 'mxw/vim-jsx'
  Plug 'moll/vim-node'

  " Markdown Functionality
  Plug 'shime/vim-livedown'
  Plug 'tpope/vim-markdown'

  " SASS/CSS Functionality
  Plug 'ap/vim-css-color'

  " Vim Extra Features
  Plug 'tpope/vim-surround'
  Plug 'reedes/vim-lexical'
  Plug 'tpope/vim-commentary'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'mikewest/vimroom'

  " Vim Themes
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'tomasr/molokai'
  Plug 'DemonCloud/J'
  Plug 'crusoexia/vim-monokai'
  Plug 'hhsnopek/vim-firewatch'
  Plug 'reedes/vim-colors-pencil'

call plug#end()

" Basic Vim Configuration
filetype plugin indent on
syntax on
set history=1000
set ruler
set showcmd
set wildmenu
set scrolloff=5
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set updatetime=100

" Update files if changed by outside command
set autoread
au CursorHold * checktime

set termguicolors

set bg=dark
colorscheme pencil
hi Normal guibg=NONE

" Environment Setup
set directory=~/swpFiles/

" Font Styles
set encoding=utf-8
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" Line Numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Vertical Column (Char Limit)
if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

" gVim specific
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set guioptions-=r guioptions-=L "Prevents window from moving (scrollbar workaround)
set belloff=all " Windows ding sound

" set lines=999 columns=999

" Plugin - Airline (Status Bar)
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#ale#enabled = 1

  " Pencil Airline
  let g:airline_theme = 'pencil'
  let g:pencil_terminal_italics = 1
  let g:pencil_spell_undercurl = 1
  let g:pencil_gutter_color = 1

" Plugin - Ale
let g:ale_completion_enabled = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 1
let g:ale_linters = {'javascript': ['eslint'], 'jsx': ['stylelint', 'eslint']}
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_open_vertical = 1
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier', 'eslint'],
      \}
let g:ale_fix_on_save = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Replace executable with regular eslint if it fails
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint'

" Plugin - TagList
let s:Tlist_def_fgl_settings = 'fgl;f:function;c:cursor;s:prepared;v:variable'
let s:Tlist_Inc_Winwidth=25

" Plugin - ctrlP (File Search)
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = '~/documents'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_open_multiple_files = 'ij'
let g:ctrlp_cmd='CtrlP :pwd'

" Plugin - NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinSize=25

" Plugin - Vim Indent Lines
let g:indentLine_char = '|'

" Plugin - Vim JSON
let g:vim_json_syntax_conceal = 0

" Plugin - Vim Livedown
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1234
let g:livedown_browser = 'firefox'

" Plugin Vim Markdown
let g:markdown_syntax_conceal = 0

" Plugin - Vim Lexical
let g:lexical#spell = 1
let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add']
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt']
let g:lexical#thesaurus_key = '<leader>t'

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType vim call lexical#init()
  autocmd FileType javascript,js call lexical#init()
  autocmd FileType javascript.jsx,jsx call lexical#init()
  autocmd FileType text,txt call lexical#init()
  autocmd FileType html call lexical#init()
  autocmd FileType c,cpp call lexical#init()
  autocmd FileType java call lexical#init()
augroup END

" Plugin - Vim Room
let g:vimroom_sidebar_height = 0

" Plugin - Vim Prettier
let g:prettier#config#bracket_spacing = get(g:,'prettier#config#bracket_spacing', 'true')

" Setup for neovim and clipboard
let g:clipboard = {
      \   'name': 'myClipster',
      \   'copy': {
      \      '+': 'clipster -c',
      \      '*': 'clipster -c',
      \
      \   },
      \   'paste': {
      \      '+': 'clipster -o -p',
      \      '*': 'clipster -o -p',
      \
      \   },
      \   'cache_enabled': 1,
      \ }

" Map Keybindings

  " NERDTree
  map <F2> :NERDTreeToggle<CR>

  " Ale
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)

  " Emmet
    " Stop it from triggering in non-related files
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,js,jsx EmmetInstall

  imap hh <C-y>,
  "imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>") just for testing


  " Livedown
  map <F3> :LivedownToggle<CR>

  " Paste
  set pastetoggle=<F9>

  " TagList
	nmap <silent> <F8> :TlistToggle<CR>


" Custom Pencil Theme Javascript Highlighting
highlight jsFuncCall guifg=#E32791
highlight jsObjectKey guifg=#2C81FB
highlight jsTemplateString guifg=#19F9D8
highlight jsObject guifg=#F3E430
highlight jsNumber guifg=#30FFFC
highlight jsBooleanTrue guifg=#30FFFC
highlight jsBooleanFalse guifg=#30FFFC

" Custom Error Colors
highlight ALEError guifg=#E32791 guibg=#FFA726
highlight ALEErrorSign guifg=#cccccc
highlight ALEWarningSign guifg=#cccccc

highlight SpellBad guibg=#cccccc cterm=underline
