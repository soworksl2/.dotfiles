local general = {}


general._SCAPE_KEY = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)


function general.change_to_normal_mode(current_mode)
    current_mode = current_mode or vim.fn.mode()

    if current_mode ~= 'n' then
        vim.fn.feedkeys(general._SCAPE_KEY, 'n')
    end
end


return general
