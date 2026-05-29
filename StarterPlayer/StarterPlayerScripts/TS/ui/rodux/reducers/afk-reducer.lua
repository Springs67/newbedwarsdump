local u1 = {
    ["profileData"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-profile-utils").AfkProfileUtil.makeStarterAfkData()
}
return {
    ["AfkReducer"] = function(p2, p3) --[[ Name: AfkReducer, Line 7 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == nil then
            p2 = u1
        end
        if p3.type == "SetAfkDataAll" then
            local v4 = {}
            for v5, v6 in p2 do
                v4[v5] = v6
            end
            v4.profileData = p3.afkData
            return v4
        end
        if p3.type ~= "SetAfkDataSome" then
            if p3.type ~= "SetAfkPartial" then
                return p2
            end
            local v7 = {}
            for v8, v9 in p2 do
                v7[v8] = v9
            end
            for v10, v11 in p3.afkdata do
                v7[v10] = v11
            end
            return v7
        end
        local v12 = {}
        for v13, v14 in p2 do
            v12[v13] = v14
        end
        local v15 = {}
        for v16, v17 in p2.profileData do
            v15[v16] = v17
        end
        for v18, v19 in p3.afkData do
            v15[v18] = v19
        end
        v12.profileData = v15
        return v12
    end
}