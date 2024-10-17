local function require_boilerplate(name)
    return require('boilerplate_code.' .. name)
end

return {
    cpp=require_boilerplate('cheader'),
    c=require_boilerplate('cheader')
}
