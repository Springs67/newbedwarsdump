local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Players
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "game-knit-controller").GameKnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "PickaxeSwordController"
    end,
    ["__index"] = u9
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
    --]]
    u9.constructor(p19, { u12.HALLOWEEN_2024_EVENT, u12.HALLOWEEN_2025_EVENT_PVE })
    p19.Name = "PickaxeSwordController"
    p19.nextReadyTime = -1
end
function u16.KnitStart(p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p20)
end
function u16.onGameInit(u21) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u7
        [4] = u11
        [5] = u6
        [6] = u10
        [7] = u3
        [8] = u2
        [9] = u15
        [10] = u14
        [11] = u5
    --]]
    u8.SwordSwing:connect(function(p22) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u21
            [3] = u7
            [4] = u11
            [5] = u6
            [6] = u10
            [7] = u3
            [8] = u2
            [9] = u15
        --]]
        if p22.swordType == u13.IRON_PICKAXE_SWORD then
            if u21.nextReadyTime > u7:GetServerTimeNow() then
                return nil
            end
            u21.nextReadyTime = u7:GetServerTimeNow() + p22.attackSpeed - 0.05
            u11:playAnimation(u6.LocalPlayer, u10.MINING)
            u3.Controllers.ViewmodelController:playAnimation(u10.MINING_FP)
            task.delay(0.3, function() --[[ Line: 48 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u15
                --]]
                u2:playSound(u15.GAUNTLETS_JAB_SWING_4)
            end)
        end
    end)
    u14.Client:Get("EntityDeathEvent"):Connect(function(p23) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u15
        --]]
        if u5:HasTag(p23.entityInstance, "Crystal") then
            u2:playSound(u15.MINER_STONE_BREAK, {
                ["position"] = p23.cframe.Position
            })
            local v24 = p23.entityInstance:WaitForChild("RootPart", 3)
            if v24 ~= nil then
                for v25, v26 in v24:GetChildren() do
                    local _ = v25 - 1
                    if v26:IsA("MeshPart") then
                        v26.Anchored = false
                    end
                end
            end
        end
    end)
end
u3.CreateController(u16.new())
return nil