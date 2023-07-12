--[[ local ale = require("nim-ale") ]]
--[[]]
--[[ ale.setup { ]]
--[[   ale_lint_on_enter = 0, ]]
--[[   ale_lint_on_save = 1, ]]
--[[   ale_sign_error = '●', ]]
--[[   ale_sign_warning = '.' ]]
--[[ } ]]

vim.g.ale_lint_on_enter = 0
vim.g.ale_lint_on_save = 1
vim.g.ale_sign_error = '●'
vim.g.ale_sign_warning = '.'
