local u1 = {
    ["costMultipliers"] = {},
    ["buffCounts"] = {},
    ["activeBuffCounts"] = {}
}
return {
    ["SnakeShrineReducer"] = function(p2, p3) --[[ Name: SnakeShrineReducer, Line 7 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == nil then
            p2 = u1
        end
        local v4 = {}
        for v5, v6 in p2 do
            v4[v5] = v6
        end
        if p3.type ~= "UpdateSnakeShrinePurchaseState" then
            return v4
        end
        v4.costMultipliers = p3.costMultipliers
        v4.buffCounts = p3.buffCounts
        v4.activeBuffCounts = p3.activeBuffCounts
        return v4
    end
}