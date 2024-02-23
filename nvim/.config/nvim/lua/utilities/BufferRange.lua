local extra_math = require('utilities.extra_math')
local Vector2 = require('utilities.Vector2')


---@class BufferRange
---@field start_pos Vector2
---@field end_pos Vector2
local BufferRange = {}
BufferRange.__index = BufferRange


---@param start_pos Vector2
---@param end_pos Vector2
function BufferRange.new(start_pos, end_pos)
    local instance = {}

    instance.start_pos = start_pos or Vector2.new()
    instance.end_pos = end_pos or Vector2.new()

    return setmetatable(instance, BufferRange)
end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return BufferRange
function BufferRange.from_numbers(x1, y1, x2, y2)
    local start_pos = Vector2.new(x1, y1)
    local end_pos = Vector2.new(x2, y2)

    return BufferRange.new(start_pos, end_pos)
end

---@return Vector2
function BufferRange:get_first_pos()
    local start_pos_index = extra_math.join_int_digits(self.start_pos.x, self.start_pos.y)
    local end_pos_index = extra_math.join_int_digits(self.end_pos.x, self.end_pos.y)

    if start_pos_index <= end_pos_index then
        return self.start_pos
    else
        return self.end_pos
    end
end

---@return Vector2
function BufferRange:get_last_pos()
    local start_pos_index = extra_math.join_int_digits(self.start_pos.x, self.start_pos.y)
    local end_pos_index = extra_math.join_int_digits(self.end_pos.x, self.end_pos.y)

    if start_pos_index > end_pos_index then
        return self.start_pos
    else
        return self.end_pos
    end
end


return BufferRange
