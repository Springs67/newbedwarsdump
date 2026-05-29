local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "DebrisComponent"
    end
})
u1.__index = u1
function u1.new(...) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    return v3:constructor(...) or v3
end
function u1.constructor(_, u4) --[[ Line: 14 ]]
    local v5 = u4:GetAttribute("DestroyAfter")
    local v6 = v5 == nil and 300 or v5
    task.delay(v6, function() --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        u4:Destroy()
    end)
end
function u1.Destroy(_) --[[ Line: 25 ]] end
u1.Tag = "DebrisComponent"
return u1