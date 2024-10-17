local function add_header_boilerplate(filename, extension)
    local define_name = '__' .. string.upper(filename) .. '_' .. string.upper(extension) .. '__'

    vim.api.nvim_buf_set_lines(0, 0, 0, false, {
        '#ifndef ' .. define_name,
        '#define ' .. define_name,
        '',
        ''
    })

    vim.api.nvim_buf_set_lines(0, -1, -1, false, {
        '',
        '',
        '#endif //' .. define_name
    })
end

local function boilerplate()
    local filename = vim.fn.expand('%:t:r')
    local extension = vim.fn.expand('%:e')

    add_header_boilerplate(filename, extension)
end

return boilerplate
