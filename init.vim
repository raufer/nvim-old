set runtimepath+=~/.vim_runtime
set nocompatible
"
"  imports
lua require('user.options')
lua require('user.keymaps')
lua require('user.plugins')
lua require('user.devicons')
lua require('user.lsp')
lua require('user.cmp')
lua require('user.nvimtree')
"  lua require('user.treesitter')
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
nnoremap <silent> <leader>l :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <leader>l :exe "tabn ".g:lasttab<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

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
"  highlight NvimTreeFolderIcon guibg=blue

colorscheme duskfox

set completeopt=menu,menuone,noselect
set clipboard+=unnamedplus

