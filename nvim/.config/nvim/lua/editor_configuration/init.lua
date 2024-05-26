local o = vim.o


vim.g.mapleader = ' '

-- disable netrw file explorer to replace it with another better file browser
local disable_netrw = true

if disable_netrw then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
end

-- setting the timeout lenght for write maps
o.timeoutlen = 10000

-- tabulations and automatic indentation
o.tabstop = 4
o.softtabstop = 0
o.shiftwidth = 0

o.expandtab = true
o.autoindent = true

-- set lines numbers
o.number = true
o.relativenumber = true


require('editor_configuration.global_commands')
require('editor_configuration.global_keymaps')
