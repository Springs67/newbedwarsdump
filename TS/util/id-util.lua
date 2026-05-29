local v12 = {
    ["generateId"] = function(p1, p2) --[[ Line: 5 ]]
        local v3 = p2 == nil and "ABCDEFGHIJKLMNPQRSTUVWXYZ123456789" or p2
        local v4 = #v3
        local v5 = false
        local v6 = 0
        local v7 = ""
        while true do
            if v5 then
                v6 = v6 + 1
            else
                v5 = true
            end
            if v6 >= p1 then
                return v7
            end
            local v8 = math.random() * v4
            local v9 = math.floor(v8)
            local v10 = v9 + 1
            local v11 = v9 + 1
            v7 = v7 .. string.sub(v3, v10, v11)
        end
    end
}
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "IncrementingId"
    end
})
u13.__index = u13
function u13.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, p17, p18, p19) --[[ Line: 44 ]]
    p16.startingNumber = p17
    p16.maxNumber = p18
    p16.rollOver = p19
    p16.id = p17
end
function u13.getCurrId(p20) --[[ Line: 50 ]]
    return p20.id
end
function u13.getNextId(p21) --[[ Line: 53 ]]
    if p21.id + 1 > p21.maxNumber then
        if p21.rollOver then
            return p21.startingNumber
        else
            return p21.id
        end
    else
        p21.id = p21.id + 1
        return p21.id
    end
end
v12.IncrementingId = u13
return {
    ["IdUtil"] = v12
}