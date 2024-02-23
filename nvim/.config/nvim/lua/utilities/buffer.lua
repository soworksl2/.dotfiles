local BufferRange = require('utilities.BufferRange')
local Vector2 = require('utilities.Vector2')


local buffer = {}


function buffer.get_last_selection_range()
    local start_pos = vim.fn.getpos("'<")
    start_pos = Vector2.from_getpos_format(start_pos)
    start_pos.x = start_pos.x - 1
    start_pos.y = start_pos.y - 1

    local end_pos = vim.fn.getpos("'>")
    end_pos = Vector2.from_getpos_format(end_pos)
    end_pos.x = end_pos.x - 1
    end_pos.y = end_pos.y - 1

    return BufferRange.new(start_pos, end_pos)
end

function buffer.get_realtime_selection_range()
    local start_pos = vim.fn.getpos('v')
    start_pos = Vector2.from_getpos_format(start_pos)
    start_pos.x = start_pos.x - 1
    start_pos.y = start_pos.y - 1

    local end_pos = vim.fn.getcurpos()
    end_pos = Vector2.from_getpos_format(end_pos)
    end_pos.x = end_pos.x - 1
    end_pos.y = end_pos.y - 1

    return BufferRange.new(start_pos, end_pos)
end

---@param bufferid number
---@param range BufferRange
---@return string
function buffer.extract_text(bufferid, range)
    local start_pos = range:get_first_pos()
    local end_pos = range:get_last_pos()

    local lines = vim.api.nvim_buf_get_text(
        bufferid,
        start_pos.y,
        start_pos.x,
        end_pos.y,
        end_pos.x + 1,
        {}
    )

    return table.concat(lines, '\n')
end

---@param bufferid number
---@param range BufferRange
---@return {[integer]: string}
function buffer.get_lines(bufferid, range)
    local start_pos = range:get_first_pos()
    local end_pos = range:get_last_pos()

    return vim.api.nvim_buf_get_text(
        bufferid,
        start_pos.y,
        start_pos.x,
        end_pos.y,
        end_pos.x + 1,
        {}
    )
end

return buffer
