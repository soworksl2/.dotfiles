vim.api.nvim_create_user_command('W', 'w', {
    desc='command for prevent errors when fast typing and save with :W'
})

vim.api.nvim_create_user_command('Copycwd', function ()
    local cwd = vim.fn.getcwd()
    vim.fn.setreg('+', cwd)
end, {
    desc='command to copy the cwd where the nvim instance is located'
})
