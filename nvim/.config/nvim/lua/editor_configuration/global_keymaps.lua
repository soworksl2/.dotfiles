local buffer = require('utilities.buffer')
local util_general = require('utilities.general')

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
-- Utils spanish keymaps
--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

vim.keymap.set('n', 'Ñ', ':', {
    desc='set the : key in spanish layout in the same place as US layout keyboard'
})

--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-



-- subtitution keymaps

_G._text_to_substitute_unescaped = ''
_G.text_to_substitute = ''

---@param mode string
---@return {error_message: string, text: string}
local function _get_text_to_substitute(mode)
    if mode == 'n' then
        return {
            error_message = '',
            text = vim.fn.expand('<cword>')
        }
    elseif mode == 'v' then
        local selection_range = buffer.get_realtime_selection_range()
        local lines = buffer.get_lines(0, selection_range)

        if #lines > 1 then
            return {
                error_message = 'the text to substitute cannot be multiline',
                text = ''
            }
        end

        return {
            error_message = '',
            text = lines[1]
        }
    else
        return {
            error_message = 'mode not supported',
            text = ''
        }
    end
end

local function _set_text_to_substitute(text)
    _G._text_to_substitute_unescaped = text
    _G.text_to_substitute = string.gsub(text, '/', '\\/')
end

vim.keymap.set(
    {'n', 'v'},
    '<C-s>',
    function ()
        local current_mode = vim.fn.mode()
        local text_to_substitute_result = _get_text_to_substitute(current_mode)

        util_general.change_to_normal_mode(current_mode)

        if text_to_substitute_result.error_message ~= '' then
            _set_text_to_substitute('')
            print('ERROR: ' .. text_to_substitute_result.error_message)
            return
        end

        _set_text_to_substitute(text_to_substitute_result.text)

        if _G.text_to_substitute == '' then
            print('text to substitute is empty')
        else
            print('text to substitute updated')
        end
    end,
    {
        desc = 'get a text to replace'
    }
)

vim.keymap.set(
    {'n', 'v'},
    's',
    function ()
        local current_mode = vim.fn.mode()

        local subtitution_command = ':'

        if current_mode == 'n' then
            subtitution_command = subtitution_command .. '%'
        end

        subtitution_command = subtitution_command .. 's/' .. _G.text_to_substitute

        vim.fn.feedkeys(subtitution_command, 'n')
    end,
    {
        desc = 'enter in substitute command'
    }
)

function HA()
    print(vim.fn.mode())
end
