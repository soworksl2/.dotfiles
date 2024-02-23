local extra_math = {}


extra_math._decadics_numbers = {
    10,
    100,
    1000,
    10000,
    100000,
    1000000,
    10000000,
    100000000,
    1000000000,
    10000000000,
    100000000000,
    1000000000000,
    10000000000000,
    100000000000000,
    1000000000000000,
    10000000000000000,
    100000000000000000,
    1000000000000000000,
}

extra_math.i64_MAX_VALUE_DIGITS_COUNT = 18


---@param int integer
function extra_math.count_int_digits(int)
    if int == 0 then
        return 1
    end

    if int < 0 then
        int = int * -1
    end

    for i, decadic_limit in ipairs(extra_math._decadics_numbers) do
        if i >= extra_math.i64_MAX_VALUE_DIGITS_COUNT then
            return extra_math.i64_MAX_VALUE_DIGITS_COUNT
        end

        if int < decadic_limit then
            return i
        end
    end
end

---@param left integer
---@param right integer
function extra_math.join_int_digits(left, right)
    left = math.abs(left)
    right = math.abs(right)

    local right_digits = extra_math.count_int_digits(right)

    local left_multiplier = 10 ^ right_digits
    return (left*left_multiplier) + right
end


return extra_math
