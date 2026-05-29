local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = v1.import(script, script.Parent.Parent.Parent, "team", "team-controller").TeamController
local v10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "BreakBedEffectController"
    end,
    ["__index"] = u6
})
v10.__index = v10
function v10.constructor(p11, p12) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
    --]]
    u6.constructor(p11)
    p11.breakBedEffectType = p12
    p11.Name = "BreakBedEffectController"
    p11.Client = {}
    p11.maid = u4.new()
end
function v10.KnitStart(u13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u5
    --]]
    u6.KnitStart(u13)
    u8.Client:Get("BedBreakEffectTriggered"):Connect(function(p14) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if p14.effectType ~= u13.breakBedEffectType then
            return nil
        end
        u13:onBedBreak(p14.player, p14.cframe, p14.teamId, p14.centerBedPosition)
    end)
    u5.StartBedBreakEffectPreview:connect(function(p15) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if p15.effectType ~= u13.breakBedEffectType then
            return nil
        end
        p15.maid = u13.maid
        u13:onBedBreak(p15.player, p15.cframe, p15.teamId, p15.centerBedPosition)
    end)
end
function v10.createBedDebris(u16, u17, u18, u19) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u7
        [4] = u2
    --]]
    local v20 = math.random(0, 0.2)
    local v21 = math.random
    local u22 = Vector3.new(v20, 0.2, v21(0, 0.2))
    local v23 = u9:getTeamById(u17:GetAttribute("TeamId"))
    if v23 ~= nil then
        v23 = v23.color
    end
    local v24 = u17:GetChildren()
    local function v29(p25) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u2
            [4] = u17
            [5] = u22
            [6] = u18
            [7] = u19
            [8] = u16
        --]]
        if p25:IsA("MeshPart") then
            local v26, v27
            if p25.Name == "Legs" then
                Color3.new(0.38, 0.31, 0.21)
                v26 = false
                v27 = 0
            else
                local _ = p25.Color
                v26 = false
                v27 = 0
            end
            while true do
                if true then
                    if v26 then
                        v27 = v27 + 1
                    else
                        v26 = true
                    end
                end
                if v27 >= math.random(2, 4) then
                    break
                end
                local v28 = u3.Controllers.BlockDebrisController:convertBlockToDebris(p25, u7.BED, u2:getBlockPosition(u17.Position), u22, nil, u18, u19, 6, nil, Enum.Material.SmoothPlastic, p25.Color)
                u16.maid:GiveTask(v28)
            end
        end
    end
    for v30, v31 in v24 do
        v29(v31, v30 - 1, v24)
    end
end
return {
    ["BreakBedEffectController"] = v10
}