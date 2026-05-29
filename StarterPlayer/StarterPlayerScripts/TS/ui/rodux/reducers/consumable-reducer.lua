local u1 = {
    ["inventory"] = {},
    ["record"] = {}
}
return {
    ["ConsumableReducer"] = function(p2, p3) --[[ Name: ConsumableReducer, Line 6 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == nil then
            p2 = u1
        end
        if p3.type == "ConsumableSetSome" then
            local v4 = {}
            for v5, v6 in p2 do
                v4[v5] = v6
            end
            for v7, v8 in p3.data do
                v4[v7] = v8
            end
            return v4
        end
        if p3.type == "ConsumableSetInventory" then
            local v9 = {}
            for v10, v11 in p2 do
                v9[v10] = v11
            end
            v9.inventory = p3.inventory
            return v9
        end
        if p3.type ~= "ConsumableSetRecord" then
            return p2
        end
        local v12 = {}
        for v13, v14 in p2 do
            v12[v13] = v14
        end
        v12.record = p3.record
        return v12
    end
}