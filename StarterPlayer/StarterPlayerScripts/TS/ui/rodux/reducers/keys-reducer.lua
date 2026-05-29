local u1 = {
    ["keysData"] = {}
}
return {
    ["KeysReducer"] = function(p2, p3) --[[ Name: KeysReducer, Line 5 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == nil then
            p2 = u1
        end
        if p3.type ~= "SetKeysPartial" then
            return p2
        end
        local v4 = {}
        for v5, v6 in p2 do
            v4[v5] = v6
        end
        for v7, v8 in p3.data do
            v4[v7] = v8
        end
        return v4
    end
}