local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u4 = {}
local u5 = {}
local u6 = nil
local function v13(p7, p8) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
    --]]
    local v9 = u2.resolveDependency("modules/anticheat/server/data/physics@PhysicsDataService"):getLastPhysicsData(p7)
    if v9 ~= nil then
        v9 = v9.cframe.Position
    end
    if not v9 then
        return false
    end
    local v10 = false
    for v11, v12 in u6(p8) do
        local _ = v11 - 1
        if (v9 - v12.Position).Magnitude < 20 then
            v10 = true
            break
        end
    end
    return v10
end
u6 = function(u14) --[[ Name: getTaggedShops, Line 43 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u5
    --]]
    if u4[u14] ~= nil then
        return u4[u14]
    end
    local v15 = u3:GetTagged(u14)
    u4[u14] = v15
    u5[u14] = { u3:GetInstanceAddedSignal(u14):Connect(function(p16) --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u4
            --]]
            local v17 = u4[u14]
            if v17 ~= nil then
                table.insert(v17, p16)
            end
        end), (u3:GetInstanceRemovedSignal(u14):Connect(function(p18) --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u4
            --]]
            local v19 = u4[u14]
            if v19 and #v19 ~= 0 then
                local v20 = -1
                for v21, v22 in v19 do
                    local _ = v21 - 1
                    if v22 == p18 == true then
                        v20 = v21 - 1
                        break
                    end
                end
                if v20 >= 0 then
                    local v23 = v20 + 1
                    local v24 = #v19
                    if v19[v23] ~= nil then
                        v19[v23] = v19[v24]
                        v19[v24] = nil
                    end
                end
            end
        end)) }
    return v15
end
return {
    ["CollectionTagAdded"] = function(p25, u26) --[[ Name: CollectionTagAdded, Line 7 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        u3:GetInstanceAddedSignal(p25):Connect(function(p27) --[[ Line: 8 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26(p27)
        end)
        for _, v28 in u3:GetTagged(p25) do
            u26(v28)
        end
    end,
    ["PlayerInRange"] = v13
}