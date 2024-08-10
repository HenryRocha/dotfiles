-- Disabling netrw.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Makes the built-in neovim file explorer into a tree style.
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
opt.relativenumber = true -- Relative line numbers base on current cursor position.
opt.number = true -- Shows the absolute line number on current cursor position.

-- Tabs and Indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting a new one
opt.wrap = false -- disable line wraping

-- Search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitve

-- Color settings
opt.cursorline = true -- highlight current line
opt.termguicolors = true
opt.background = "dark" -- coloschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- Clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

