local hop = require('hop')
local directions = require('hop.hint').HintDirection

--[[ vim.keymap.set('', ' h', function() ]]
--[[   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) ]]
--[[ end, {remap=true}) ]]

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--keymap("", "<leader>", "<Nop>", opts)
--[[ vim.g.mapleader = " " ]]
--[[ vim.g.maplocalleader = " " ]]

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- key commands 
keymap("n", "<leader>j", ":HopWord<CR>", opts)
keymap("n", "<leader>T", ":HopPattern<CR>", opts)
