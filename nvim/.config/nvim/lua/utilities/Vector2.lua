---@class Vector2
---@field x number
---@field y number
local Vector2 = {}
Vector2.__index = Vector2


---@param x number?
---@param y number?
---@return Vector2
function Vector2.new(x, y)
    local instance = {}

    instance.x = x or 0
    instance.y = y or 0

    return setmetatable(instance, Vector2)
end

---@param pos table
---@return Vector2
function Vector2.from_getpos_format(pos)
    local x = pos[3] or 0
    local y = pos[2] or 0

    return Vector2.new(x, y)
end


---@param left Vector2
---@param right any
---@return boolean
Vector2.__eq = function (left, right)
    if type(right) ~= "table" then
        return false
    end

    return left.x == right.x and left.y == right.y
end


return Vector2
