local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "rotatable-greedy-block-handler").getBlockRotationNormalsList
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "RotatableBlockController"
    end,
    ["__index"] = u5
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p11)
    p11.Name = "RotatableBlockController"
end
function u8.KnitStart(p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u6
        [4] = u3
        [5] = u7
    --]]
    u5.KnitStart(p12)
    u4.PlaceBlock:connect(function(p13) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u7
        --]]
        local v14 = u6(p13.blockType).block
        if v14 ~= nil then
            v14 = v14.greedyMesh
            if v14 ~= nil then
                v14 = v14.rotation
            end
        end
        if not v14 then
            return nil
        end
        local v15 = u3.CurrentCamera.CFrame.LookVector.Unit
        local v16 = u7()
        local v17 = false
        local v18 = 0
        local v19 = -1
        while true do
            if v17 then
                v18 = v18 + 1
            else
                v17 = true
            end
            if v18 >= #v16 then
                if v19 ~= -1 then
                    p13.blockData = v19
                end
                return
            end
            local v20 = v16[v18 + 1]
            local v21 = v14.disallowedRotationDirections
            if v21 ~= nil then
                v21 = table.find(v21, v20) ~= nil
            end
            if not v21 then
                if v19 == -1 then
                    v19 = v18
                else
                    local v22 = v16[v18 + 1]
                    if v22 == Enum.NormalId.Top then
                        v22 = Enum.NormalId.Bottom
                    elseif v22 == Enum.NormalId.Bottom then
                        v22 = Enum.NormalId.Top
                    end
                    local v23 = (v15 - Vector3.FromNormalId(v22) * Vector3.new(1, 2, 1)).Magnitude
                    local v24 = v16[v19 + 1]
                    if v24 == Enum.NormalId.Top then
                        v24 = Enum.NormalId.Bottom
                    elseif v24 == Enum.NormalId.Bottom then
                        v24 = Enum.NormalId.Top
                    end
                    if v23 < (v15 - Vector3.FromNormalId(v24) * Vector3.new(1, 2, 1)).Magnitude then
                        v19 = v18
                    end
                end
            end
        end
    end)
end
v2.CreateController(u8.new())
return nil