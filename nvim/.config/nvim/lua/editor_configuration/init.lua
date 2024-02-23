local go = vim.go


vim.g.mapleader = ' '

-- disable netrw file explorer to replace it with another better file browser
local disable_netrw = true

if disable_netrw then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
end

-- setting the timeout lenght for write maps
go.timeoutlen = 10000

-- tabulations and automatic indentation
go.tabstop = 4
go.softtabstop = 0
go.shiftwidth = 0

go.expandtab = true
go.autoindent = true

-- set lines numbers
go.number = true
go.relativenumber = true

-- treat the initial buffer as scratch buffer if it has no name
-- this is to prevent reuse that buffer and get undefined behaviour with globals and buffers options
local current_buffer_name = vim.api.nvim_buf_get_name(0)

if current_buffer_name == '' then
    vim.api.nvim_buf_set_name(0, 'scratch')
    vim.api.nvim_buf_set_option(0, 'buftype', 'nofile')
end


require('editor_configuration.global_commands')
require('editor_configuration.global_keymaps')
