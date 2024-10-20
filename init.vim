" This fil should be at ~/.config/nvim/init.vim
call plug#begin('~/.local/share/nvim/plugged')
" Autocomplete list functionality
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Autocomplete with tern for JavaScript
Plug 'carlitux/deoplete-ternjs'
" Automatically handle swapfiles
Plug 'gioele/vim-autoswap'
" Keep list of yanks, use Ctrl-p to scroll through
Plug 'vim-scripts/YankRing.vim'
" Use tab for insert mode completions
Plug 'ervandew/supertab'
" Async live linter
Plug 'w0rp/ale'
" Change syntax surroundings like parens or quotes
Plug 'tpope/vim-surround'
" Git gutter
Plug 'airblade/vim-gitgutter'
" Git commands
Plug 'tpope/vim-fugitive'
" Undo tree with leader-u
Plug 'sjl/gundo.vim'
" Project tree
Plug 'preservim/nerdtree'
" Easy code commenting
Plug 'preservim/nerdcommenter'
" For showing where the indents line up
Plug 'Yggdroot/indentLine'
" Match the tmu status line to the lightline settings
Plug 'edkolev/tmuxline.vim'
" Beautiful minimal simple status line that doesn't suck at all
Plug 'itchyny/lightline.vim'
" update lightline with linter status
Plug 'maximbaz/lightline-ale'
" Autocomplete html tags
Plug 'mattn/emmet-vim'
" Webapi is required for gist below
Plug 'mattn/webapi-vim'
" Create gists with :Gist
Plug 'mattn/gist-vim'
" Better JS highlighting
Plug 'pangloss/vim-javascript'
" Better JS libraries highlighting
Plug 'othree/javascript-libraries-syntax.vim'
" JSX highlighting
Plug 'mxw/vim-jsx'
" Fuzzy file finder - includes Ag for ack-like functionality
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Better tabbing - required for vim-markdown
Plug 'godlygeek/tabular'
" Markdown highlighting and folding
Plug 'preservim/vim-markdown'
" For prose, soft vs hard line breaks, sane wrapping and undos, etc
Plug 'preservim/vim-pencil'
" Autocorrect common spelling errors
Plug 'preservim/vim-litecorrect'
" Distraction free writing - required for zenroom
Plug 'junegunn/goyo.vim'
" Works with goyo for the distraction-free writing in markdown
Plug 'amix/vim-zenroom2'
" Highlights current paragraph/snippet, use with goyo for prose
Plug 'junegunn/limelight.vim'
" Customized vim startup screen
Plug 'mhinz/vim-startify'
" Highlighting for styled-components like css in js files
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Better JSON support
Plug 'elzr/vim-json'
" Auto pair delimiters
Plug 'Raimondi/delimitMate'
" Make '.' be more better
Plug 'tpope/vim-repeat'
" Supposedly better CSS highlighting
Plug 'hail2u/vim-css3-syntax'
" CSS colors highlighted that very color
Plug 'ap/vim-css-color'
" Use s{firstletter,secondletter} to move
Plug 'justinmk/vim-sneak'
" GraphQL support in js templates
Plug 'jparise/vim-graphql'
" Wiki behavior
Plug 'vimwiki/vimwiki'
" Prose linter, need lua and snap packages
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'mustache/vim-mustache-handlebars'
call plug#end()
" favorite colorscheme
colorscheme molokai
" for proper scrolling/mouse behavior
set mouse=a
" don't look at these filetypes
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.mov,*.pdf,*.psd,*.ai
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xls,*.xlsx
" be able to copy from neovim to clipboard on mac and ubuntu
set clipboard=unnamedplus
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, u/0) | endif
  augroup END
endif
" reload buffer on changes
set autoread
" show regular line numbers and not that silly relative number shit
set number
" if your search contains uppercase, search for it, otherwise ignore caseing
set smartcase
set ignorecase
" don't show mode switching in the status bar
set noshowmode
" tab == 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" indent automatically by syntax
set smartindent
set autoindent
" use characters to show real tabs and trailing spaces
set list
set listchars=tab:--,trail:·
" scroll offset to start scroll at the number of lines set
set scrolloff=8
" auto completion from spelling dictionary
set complete+=kspell
" dictionary location
set dictionary="/usr/dict/words"
" directory for temp files
set directory=~/.config/nvim/tmp//
" backup directory
set backupdir=~/.config/nvim/tmp/backup//
" record undos in corresponding files
set undofile
" undo files directory
set undodir=~/.config/nvim/tmp/undo//
" keep history of 200 undos
set history=200
" persistent undos
set undolevels=200
" max # of lines per undo on buffer reload
set undoreload=5000
"show the column line at col 80
set colorcolumn=80
"don't hide characters, like json quotes wtf
let g:vim_json_syntax_conceal = 0
" Heredoc highlighting
let g:vimsyn_embed = 'lPr'  " support embedded lua, python and ruby
"space is leader key
let mapleader = "\<Space>"
"faster normal mode from insert mode
inoremap jj <ESC>
"faster saving
nnoremap <leader>w :w<CR>
"Ale go to def -- use this more often
nnoremap <leader>d :ALEGoToDefinition<CR>
"open NERDTree
map <C-o> :NERDTreeToggle %:p:h<CR>
"open Gundo
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
nnoremap <leader>u :GundoToggle<CR>
"tab with visual mode
vmap <Tab> >gv
"back tab with visual mode
vmap <S-Tab> <gv
"edit this file in a new window
nnoremap <leader>ev :vsp $MYVIMRC<CR>
"edit zshrc in a new window
nnoremap <leader>ez :vsp ~/.zshrc<CR>
"edit tmux.conf in a new window
nnoremap <leader>et :vsp ~/.tmux.conf<CR>
"fuzzy find file in project with FZF
nnoremap F :FZF<CR>
"search project for word under cursor with Ag
nnoremap <silent> <leader>f :Ag <C-R><C-W><CR>
"start Ag search
nnoremap <leader>ag :Ag<space>
" sorting selection shortcut
vnoremap <leader>ab :sort<CR>
"git status
nnoremap <leader>gs :Gstatus<CR>
"make a gist of the file
nnoremap <leader>gt :Gist<CR>
"git commit
nnoremap <leader>gcm :Gcommit -m<space>
"moves line down in normal mode
nnoremap <C-j> :m .+1<CR>==
"moves line up in normal mode
nnoremap <C-k> :m .-2<CR>==
"moves cursor down line in insert mode "
inoremap <C-j> <Esc>:m .+1<CR>==gi
"moves cursor up line in insert mode "
inoremap <C-k> <Esc>:m .-2<CR>==gi
"moves selected block down line visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
"moves selected block up line visual mode
vnoremap <C-k> :m '<-2<CR>gv=gv
"distraction-free mode
nnoremap <silent> <leader>z :Goyo<CR>
" Clear search
nmap <silent> // :nohlsearch<CR>
"use the startified screen on startup
autocmd User Startified setlocal cursorline
" close popup window when cursor leaves or leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"strip all trailing whitespace in file on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
"markdown spellcheck, wrap text, auto-correct words, and enable pencil
autocmd bufread,bufnewfile *.md,*.markdown inoremap . .<c-g>u
autocmd bufread,bufnewfile *.md,*.markdown inoremap ? ?<c-g>u
autocmd bufread,bufnewfile *.md,*.markdown inoremap ! !<c-g>u
autocmd bufread,bufnewfile *.md,*.markdown inoremap , ,<c-g>u
autocmd bufread,bufnewfile *.md,*.markdown setlocal spell
autocmd bufread,bufnewfile *.md,*.markdown setlocal wrap
autocmd bufread,bufnewfile *.md,*.markdown call litecorrect#init()
autocmd bufread,bufnewfile *.md,*.markdown call pencil#init({'wrap': 'soft'})
"enable deoplete for code completion
let g:deoplete#enable_at_startup = 1
" one space per level in NERDTree
let g:NERDSpaceDelims = 1
let g:ale_fixers = {'typescript': ['prettier'], 'javascript': ['prettier']}
" ale settings for linting and statusline
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
" go to next lint error
nmap <silent> <leader>e <Plug>(ale_next_wrap)
"lightline settings for status bar
let g:tmuxline_powerline_separators = 0
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ],
      \  'right': [ [ 'lineinfo' ],
      \             [ 'filetype' ],
      \             [ 'linter_checking',
      \               'linter_warnings',
      \               'linter_errors',
      \               'linter_ok'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
let g:lightline#ale#indicator_checking = "✓"
let g:lightline#ale#indicator_warnings = "◆"
let g:lightline#ale#indicator_errors = "✗"
let g:lightline#ale#indicator_ok = "✓"
" key map to expand emmet completion
let g:user_emmet_expandabbr_key = '<c-y>'
" don't conceal any syntax in markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" highlight frontmatter in markdown
let g:vim_markdown_frontmatter = 1
" don't fold headers in markdown
let g:vim_markdown_folding_disabled = 1
" don't take too long for tern js completion
let g:tern_request_timeout = 1
" show indents lined up
let g:indentLine_char = '┆'
let g:indentLine_conceallevel = 0
" always show hidden files in nerdtree
let NERDTreeShowHidden = 1
" scroll through auto completions
let g:SuperTabDefaultCompletionType = "<c-n>"
" let .js files be seen as jsx
let g:jsx_ext_required = 0
" where to keep yankring history for copying
let g:yankring_history_dir = '~/.config/nvim/tmp/yank'
" let emmet Autocomplete jsx
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
" startify start screen config
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header =
        \ map(split(system('fortune -s | cowsay'), '\n'), '"   ". v:val') + ['']
"gist creation settings
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
"use wiki behavior in md files
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
lua << EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.vale,
    },
})
EOF

" match open/closing things like parens and quotes and tags
runtime macros/matchit.vim
"distraction free mode limelight and goyo settings
function! s:goyo_enter()
  silent !tmux set status off
  Goyo 100x90%
  Limelight
endfun
function! s:goyo_leave()
  silent !tmux set status on
  Limelight!
endfun
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()e
