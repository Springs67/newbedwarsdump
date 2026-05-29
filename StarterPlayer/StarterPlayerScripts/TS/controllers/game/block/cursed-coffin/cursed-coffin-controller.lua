local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cursed-coffin-balance").CursedCoffinBalance
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-follow-util").PartFollowUtil
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "CursedCoffinController"
    end,
    ["__index"] = u18
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.constructor(p29)
    p29.Name = "CursedCoffinController"
    p29.playersWithCoffin = {}
end
function u26.KnitStart(u30) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u17
        [3] = u10
        [4] = u22
        [5] = u2
        [6] = u13
        [7] = u5
        [8] = u24
        [9] = u6
        [10] = u23
    --]]
    u18.KnitStart(u30)
    u17.PlaceBlock:setPriority(u10.HIGHEST):connect(function(p31) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u2
        --]]
        if p31.blockType ~= u22.CURSED_COFFIN then
            return nil
        end
        local v32 = u2:getStore():getBlockAt(p31.blockPosition - Vector3.new(0, 1, 0))
        local v33 = u2:getStore():getBlockAt(p31.blockPosition - Vector3.new(1, 0, 0))
        if not v32 then
            p31:setCancelled(true)
            return nil
        end
        if v33 then
            p31:setCancelled(true)
            return nil
        end
    end)
    u13:GetInstanceRemovedSignal("cursed-coffin"):Connect(function(p34) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u24
        --]]
        local v35 = {
            ["position"] = p34.Position
        }
        u5:playSound(u24.CURSED_COFFIN_DESTROY, v35)
    end)
    u6("cursed-coffin", function(u36) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        if not u30:isClientPrediction(u36) then
            local u37 = nil
            u37 = u36.Destroying:Connect(function() --[[ Line: 80 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u36
                    [3] = u37
                --]]
                u30:playCoffinDestroyEffect(u36)
                u37:Disconnect()
            end)
        end
    end)
    u23.Client:OnEvent("CursedCoffinPlayRespawnAnimation", function(p38) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:playCoffinRespawnAnimation(p38.coffin)
    end)
    u23.Client:OnEvent("CursedCoffinPlaceEvent", function(p39) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:playCoffinActivateEffect(p39.player)
    end)
    u23.Client:OnEvent("CursedCoffinBreakEvent", function(p40) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:playCoffinDeactivateEffect(p40.player, p40.coffinInstance)
    end)
    u23.Client:OnEvent("CursedCoffinValidateMap", function(p41) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        if p41.shouldDelete then
            u30.playersWithCoffin[p41.player] = nil
        else
            u30.playersWithCoffin[p41.player] = true
        end
    end)
end
function u26.playCoffinActivateEffect(_, p42) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u16
        [3] = u25
        [4] = u5
        [5] = u24
        [6] = u21
    --]]
    local v43 = p42.Character
    if not v43 then
        return nil
    end
    local u44 = u15.Assets.Effects.CursedCoffinEffect:Clone()
    if not p42.Character then
        return nil
    end
    u44.Parent = u16
    u44.Massless = true
    u44.CFrame = v43.HumanoidRootPart.CFrame
    u25.startFollowing(u44, v43.HumanoidRootPart, Vector3.new(0, 0, 0), true)
    u5:playSound(u24.CURSED_COFFIN_ACTIVATE, {})
    task.delay(u21.VAMPIRISM_EFFECT_ANIMATION_DURATION, function() --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44:Destroy()
    end)
end
function u26.playCoffinDeactivateEffect(_, p45, p46) --[[ Line: 129 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u16
        [3] = u25
        [4] = u5
        [5] = u24
        [6] = u14
        [7] = u21
        [8] = u9
    --]]
    local v47 = p45.Character
    if not v47 then
        return nil
    end
    local u48 = u15.Assets.Effects.CursedCoffinEffect:Clone()
    if not p45.Character then
        return nil
    end
    u48.Parent = u16
    u48.Massless = true
    u48.CFrame = v47.HumanoidRootPart.CFrame
    u25.startFollowing(u48, v47.HumanoidRootPart, Vector3.new(0, 0, 0), true)
    u5:playSound(u24.CURSED_COFFIN_DEACTIVATE, {})
    local v49 = p46:GetAttribute("PlacedByUserId")
    if v49 == 0 or (v49 ~= v49 or not v49) then
        return nil
    end
    local u50 = u14:GetPlayerByUserId(v49)
    task.delay(u21.VAMPIRISM_EFFECT_ANIMATION_DURATION, function() --[[ Line: 151 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u50
            [3] = u9
            [4] = u15
            [5] = u48
        --]]
        if u14.LocalPlayer == u50 then
            u9.Controllers.ScreenParticlesController:emitParticlesOnScreen({
                ["cleanupAfter"] = 1,
                ["particleEmitter"] = { u15.Assets.Effects.BedBreakParticles }
            })
        end
        u48:Destroy()
    end)
end
function u26.playCoffinDestroyEffect(_, p51) --[[ Line: 161 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
        [3] = u16
        [4] = u4
        [5] = u8
    --]]
    local v52 = u2:getHandlerRegistry():getHandler(u22.CURSED_COFFIN)
    local u53 = u2:getBlockPosition(p51.Position)
    local u54 = u53 + Vector3.new(0, 0, -1)
    local u55 = v52:place(u53, 0)
    u55.CanCollide = false
    u55.CanQuery = false
    u55.CastShadow = false
    u55.Parent = u16
    local v56 = u55:GetDescendants()
    local function v59(u57, p58) --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        if u57:IsA("BasePart") then
            u57.Anchored = false
            u57.CanCollide = true
            u57.CollisionGroup = "Players"
            u4:setQueryIgnored(u57, true)
            task.delay(0.01 * p58, function() --[[ Line: 181 ]]
                --[[
                Upvalues:
                    [1] = u57
                --]]
                return u57:Destroy()
            end)
        end
    end
    for v60, v61 in v56 do
        v59(v61, v60 - 1, v56)
    end
    task.delay(0.25, function() --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u55
            [3] = u22
            [4] = u53
            [5] = u54
        --]]
        local v62 = false
        local v63 = 0
        while true do
            if v62 then
                v63 = v63 + 1
            else
                v62 = true
            end
            if v63 >= 20 then
                u55:Destroy()
                return
            end
            if v63 % 2 == 0 then
                u8.Controllers.BlockDebrisController:convertBlockToDebris(u55, u22.CURSED_COFFIN, u53, Vector3.new(0, 0.4, 0), v63)
            else
                u8.Controllers.BlockDebrisController:convertBlockToDebris(u55, u22.CURSED_COFFIN, u54, Vector3.new(0, 0.4, 0), v63)
            end
        end
    end)
end
function u26.playCoffinRespawnAnimation(_, p64) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u20
        [3] = u19
    --]]
    if p64 ~= nil then
        p64 = p64:FindFirstChild("Rig")
        if p64 ~= nil then
            p64 = p64:FindFirstChild("AnimationController")
        end
    end
    if not p64 then
        return nil
    end
    local v65
    if p64 == nil then
        v65 = p64
    else
        v65 = p64:FindFirstChild("Animator")
    end
    local v66 = v65 or u11("Animator", {
        ["Parent"] = p64
    })
    if v66 then
        u20:playAnimation(v66, u19.CURSED_COFFIN_RESPAWN)
    end
end
function u26.isClientPrediction(_, p67) --[[ Line: 239 ]]
    return p67:GetAttribute("ClientPlaced")
end
function u26.playerHasCursedCoffin(p68, p69) --[[ Line: 242 ]]
    return p68.playersWithCoffin[p69] ~= nil
end
u8.CreateController(u26.new())
return nil