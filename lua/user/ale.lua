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

vim.g.ale_fix_on_save = 1
vim.g.ale_linters_explicit = 1

--vim.g.ale_linters = { python = { "flake8", "pylint", "mypy" } }
vim.g.ale_linters = {
    python = { "flake8", "pylint", "mypy" },
    dart = { "dartanalyzer" }
}

vim.g.ale_fixers = {
    ['*'] = {},
    python = {'black', 'isort'},
    sh = {'shfmt'},
    zsh = {'shfmt'},
    html = {'prettier'},
    dart = {'dartfmt'},
}

vim.g.ale_python_isort_options = "--profile black"

