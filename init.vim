set runtimepath+=~/.vim_runtime
set nocompatible
"
"  imports
lua require('user.options')
lua require('user.ale')
lua require('user.pykeymaps')
lua require('user.keymaps')
lua require('user.plugins')
lua require('user.devicons')
lua require('user.lsp')
lua require('user.cmp')
lua require('user.copilot')
lua require('user.nvimtree')
lua require('user.treesitter')
lua require('user.alpha')
lua require('user.gitsigns')
lua require('user.toggleterm')
lua require('user.telescope')
lua require('user.autopairs')
lua require('user.bufferline')
lua require('user.whichkey')
lua require('user.project')
lua require('user.impatient')
lua require('user.autosave')
lua require('user.autosession')
lua require('user.lspstatus')
lua require('user.lualine')
lua require('user.comment')
lua require('user.trouble')
lua require('user.hop')
lua require('user.grapple')
lua require('user.nightfox')
lua require('user.coc')
lua require('user.dressing')
lua require('user.ufo')
" lua require('user.vscode')
" lua require('user.noice')

try
source ~/.vim_runtime/my_configs.vim
catch
endtry


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
"  nnoremap <silent> <leader>l :exe "tabn ".g:lasttab<cr>
" vnoremap <silent> <leader>l :exe "tabn ".g:lasttab<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==================== Editor behavior ====================
"set clipboard=unnamedplus
let &t_ut=''
" set autochdir
set exrc
set secure
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
" set colorcolumn=100
" set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" for python files, 4 spaces
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
" autocmd FileType dart setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
"
"
" Mappings
"inside next parentheses", and it will perform the operator on the text inside the next set of parentheses on the current line.
:onoremap in( :<c-u>normal! f(vi(<cr>
" Let's make a companion "inside last parentheses" ("previous" would be a better word, but it would shadow the "paragraph" movement).
:onoremap il( :<c-u>normal! F)vi(<cr>


" ==================== Terminal Behaviors ====================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>


" ==================== Basic Mappings ====================
" let mapleader=" "



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
"
"  highlight NvimTreeFolderIcon guibg=blue

" colorscheme duskfox
colorscheme nightfox
" colorscheme kanagawa
" colorscheme kanagawa-wave
" colorscheme kanagawa-dragon
" colorscheme onedark


set completeopt=menu,menuone,noselect
set clipboard+=unnamedplus

" let g:dart_style_guide = 2
let g:dart_trailing_comma_indent = v:true

" if you are using init.vim. Essentially, you would need to actually make a selection with <C-n> or <C-p>for it to autocomplete,<CR> should create newlines if you don't make a selection.
set completeopt = "menu,menuone,noselect"


