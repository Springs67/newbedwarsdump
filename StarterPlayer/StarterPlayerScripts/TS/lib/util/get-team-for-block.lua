local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u3 = v1.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore
return {
    ["default"] = function(p4) --[[ Name: getTeamForBlock, Line 5 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local v5 = u2:GetPlayerByUserId((p4:GetAttribute("PlacedByUserId")))
        if v5 == nil then
            return nil
        end
        local v6 = nil
        for v7, v8 in u3:getState().Game.teams do
            local _ = v7 - 1
            local v9 = v8.name
            local v10 = v5.Team
            if v10 ~= nil then
                v10 = v10.Name
            end
            if v9 == v10 == true then
                v6 = v8
                break
            end
        end
        return v6
    end
}