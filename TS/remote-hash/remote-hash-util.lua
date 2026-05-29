return {
    ["RemoteHashUtil"] = {
        ["prepareHashVector3"] = function(p1) --[[ Name: prepareHashVector3, Line 5 ]]
            local v2 = p1.X
            local v3 = tostring(v2)
            local v4 = p1.Y
            local v5 = tostring(v4)
            local v6 = p1.Z
            local v7 = v3 .. "," .. v5 .. "," .. tostring(v6)
            local v8 = #v7
            local v9 = {}
            for v10, v11 in { string.byte(v7, 1, v8) } do
                local _ = v10 - 1
                table.insert(v9, v11)
                local _ = #v9
            end
            return v9
        end
    }
}