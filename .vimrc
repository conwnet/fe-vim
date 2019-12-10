call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-scripts/BufOnly.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
"Plug 'scrooloose/nerdcommenter'
"Plug 'itchyny/lightline.vim'
"Plug 'fholgado/minibufexpl.vim'

" colorschemes
Plug 'tomasiser/vim-code-dark'

" JavaScript plugins
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
" Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => basic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set leader key to ','
let mapleader = ','

" Show line number
set number
" Scroll off
set scrolloff=7
" Set to auto read when a file is changed from the outside
set autoread
" Sets how many lines of history VIM has to remember
set history=500
" Height of the command bar
set cmdheight=1

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" A buffer becomes hidden when it is abandoned
set hidden
" Ignore case when searching
set ignorecase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch 
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" key maps
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

command W w !sudo tee % > /dev/null

" color scheme
syntax on
let g:airline_theme = 'codedark'
colorscheme codedark
highlight Normal ctermbg=None
highlight Directory ctermbg=None
highlight LineNr ctermbg=None
highlight CursorLineNr ctermbg=None
highlight NonText ctermfg=None
highlight VertSplit ctermbg=None
highlight Visual cterm=reverse
highlight SignColumn ctermbg=None
highlight EndOfBuffer ctermbg=None
set cursorline
highlight CursorLine guibg=#303000 ctermbg=236


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git']
let g:NERDTreeWinSize=35
nnoremap <silent> <leader>nn :NERDTreeToggle<cr>
"nnoremap <silent> <c-n> :NERDTreeToggle<cr>
nnoremap <silent> <leader>nf :NERDTreeFind<cr>
nnoremap <silent> <c-m> :NERDTreeFind<cr>
" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> <leader>c  :<C-u>CocList<cr>
nnoremap <silent> <leader>s  :<C-u>CocList grep<cr>
nnoremap <silent> <leader>r  :<C-u>CocList mru<cr>
nnoremap <silent> <leader>f  :<C-u>CocList files<cr>

nmap <leader>gf :<C-u>CocList gfiles<CR>
nmap <leader>gs :<C-u>CocList gstatus<CR>
" show chunk diff at current position
nmap <leader>gd <Plug>(coc-git-chunkinfo)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> gh :call <SID>show_documentation()<CR>


" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')


""""""""""""""""""""""""""""""
" => easymotion
""""""""""""""""""""""""""""""
nmap <silent> <Leader>w <Plug>(easymotion-w)
nmap <silent> <Leader>b <Plug>(easymotion-b)

""""""""""""""""""""""""""""""
" => MEB
""""""""""""""""""""""""""""""
nmap <silent> <C-b> :MBEFocus<cr>
nmap <silent> <leader>d :MBEbd<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
nnoremap <silent> <leader>gg :GitGutterToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => buffers and buffer-kill
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:BufKillCreateMappings = 0
nmap <silent> <leader>h :bp<cr>
nmap <silent> <leader>l :bn<cr>
nmap <silent> <leader>d :BD<cr>
nmap <silent> <leader>o :BufOnly<cr>
