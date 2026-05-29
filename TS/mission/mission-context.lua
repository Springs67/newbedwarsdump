local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
return {
    ["MissionContext"] = (function(...) --[[ Name: registerMissions, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local u2 = {}
        local u3 = {}
        for v4, v5 in { ... } do
            local _ = v4 - 1
            local v6 = v5.id
            u2[v6] = v5
            local _ = u2[v6]
        end
        return {
            ["register"] = function(p7) --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u2
                --]]
                if u2[p7.id] then
                    return u2[p7.id]
                end
                u2[p7.id] = p7
                return p7
            end,
            ["unregister"] = function(p8) --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u2
                --]]
                if not u2[p8] then
                    return false
                end
                u2[p8] = nil
                return true
            end,
            ["registerGeneratorClass"] = function(p9) --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u3
                --]]
                if u3[p9.missionGenerator] ~= nil then
                    return p9
                end
                u3[p9.missionGenerator] = p9
                return p9
            end,
            ["getMission"] = function(p10) --[[ Name: getMission, Line 49 ]]
                --[[
                Upvalues:
                    [1] = u2
                --]]
                return u2[p10]
            end,
            ["getMissionGeneratorClass"] = function(p11) --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u3
                --]]
                return u3[p11]
            end,
            ["values"] = function() --[[ Name: values, Line 53 ]]
                --[[
                Upvalues:
                    [1] = u1
                    [2] = u2
                --]]
                return u1.values(u2)
            end
        }
    end)()
}