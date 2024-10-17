local boilerplate = require('boilerplate_code')

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- Utils spanish keymaps
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

vim.keymap.set('n', 'Ñ', ':', {
    desc='set the : key in spanish layout in the same place as US layout keyboard'
})

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

local function add_boilerplate()
    local filetype = vim.bo.filetype

    local make_boilerplate_func = nil
    for k, v in pairs(boilerplate) do 
        if k == filetype then
            make_boilerplate_func = v
            break
        end
    end

    if make_boilerplate_func == nil then
        vim.api.nvim_err_writeln('The filetype "' .. filetype '" does not have a boilerplate generator')
        return
    end

    make_boilerplate_func()
end
vim.keymap.set('n', '<leader><leader><leader>', add_boilerplate, {
    desc='add boilerplate code depending of the filetype'
})
