local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<leader>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "Q", ":q<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
--[[ keymap("x", "J", ":move '>+1<CR>gv-gv", opts) ]]
--[[ keymap("x", "K", ":move '<-2<CR>gv-gv", opts) ]]
--[[ keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) ]]
--[[ keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts) ]]

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)

-- Execution
--[[ keymap("n", "<leader>r", ":write <Bar> :TermExec cmd=\"export PYTHONPATH=$(pwd) && python %\"<cr>", term_opts) ]]
--[[ keymap("n", "<leader>t", ":write <Bar> :TermExec cmd=\"export PYTHONPATH=$(pwd) && pytest %\"<cr>", term_opts) ]]

--  turn off highlit mechanism
keymap("n", "<CR>", ":noh<CR>", opts)

-- Quickly insert an empty new line without entering insert mode

-- line break at current position
--keymap("n", "K", "i<enter><Esc>", opts)
-- align your current paragraph
keymap("n", "<leader>a", "=ip", opts)

-- telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
-- noremap <leader>gb <cmd>Telescope buffers<cr>
-- noremap <leader>gh <cmd>Telescope help_tags<cr>

-- nvim tree
keymap("n", "<leader>T", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>R", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeFindFile<CR>", opts)

-- Tab navigation
--[[ keymap("n", "<leader>1", "1gt", opts) ]]
--[[ keymap("n", "<leader>2", "2gt", opts) ]]
--[[ keymap("n", "<leader>3", "3gt", opts) ]]
--[[ keymap("n", "<leader>4", "4gt", opts) ]]
--[[ keymap("n", "<leader>5", "5gt", opts) ]]
--[[ keymap("n", "<leader>8", "6gt", opts) ]]
--[[ keymap("n", "<leader>7", "7gt", opts) ]]
--[[ keymap("n", "<leader>8", "8gt", opts) ]]
--[[ keymap("n", "<leader>9", "9gt", opts) ]]
--[[ keymap("n", "<leader>0", ":tablast<cr>", opts) ]]

-- trouble diagnosis
--[[ keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts) ]]
--[[ keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts) ]]
--[[ keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts) ]]
--[[ keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts) ]]
--[[ keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts) ]]
--[[ keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts) ]]

-- Linter
--[[ keymap("n", "<leader>n", "<cmd>ALENextWrap<cr>", opts) ]]

-- Grapple
keymap("n", "<leader>gt", "<cmd>GrapplePopup tags<cr>", opts)
keymap("n", "<leader>ga", "<cmd>GrappleTag<cr>", opts)
keymap("n", "<leader>gu", "<cmd>GrappleUntag<cr>", opts)

-- ALE
--[[ keymap("n", "<C-f>", "<cmd>ALEFix<cr>", opts) ]]
-- LSP
--[[ keymap("n", "<leader>1", "<cmd>LspRestart<cr>", term_opts) ]]
