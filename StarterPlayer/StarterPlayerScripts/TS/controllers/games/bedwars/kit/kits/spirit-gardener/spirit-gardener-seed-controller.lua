local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.HttpService
local u7 = v4.Players
local u8 = v4.ReplicatedStorage
local u9 = v4.RunService
local u10 = v4.Workspace
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent, "collectable-entity", "collectable-entity-controller").CollectableEntityController
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SpiritGardenerSeedController"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p18)
    p18.Name = "SpiritGardenerSeedController"
    p18.pickupListenerActive = false
end
function u15.KnitStart(p19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p19)
end
function u15.validCollectableEntityTypes(_) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return { u11.SPIRIT_GARDENER_ENERGY }
end
function u15.pickDisplayModel(_, p20, _) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return {
        ["repStorageModel"] = u8.Assets.Misc.SpiritGardenerEnergy,
        ["collectionTag"] = p20
    }
end
function u15.onWillRemoveEntity(_, _, _, p21, p22) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u3
        [3] = u12
        [4] = u2
        [5] = u10
        [6] = u6
        [7] = u9
    --]]
    if not p21 then
        return nil
    end
    local v23 = u13.SPIRIT_GARDENER_SPIRIT_ORB_START_COLLECT
    local _ = u13.SPIRIT_GARDENER_SPIRIT_ORB_COLLECTED
    if p21 then
        local v24 = u12[u3.Controllers.KitSkinController:getKitSkin(p21)].grove
        if v24 then
            v23 = v24.collectStartSound
            local _ = v24.collectedSound
        end
    end
    u2:playSound(v23, {
        ["volumeMultiplier"] = 0.5
    })
    local u25 = p22:Clone()
    u25.Parent = u10
    u25:PivotTo(p22:GetPivot())
    if not u25.PrimaryPart then
        return nil
    end
    local u26 = 0
    local u27 = p21.Character
    if u27 ~= nil then
        u27 = u27:FindFirstChild("UpperTorso")
    end
    if u27 == nil then
        return nil
    end
    local u28 = u6:GenerateGUID(false)
    u9:BindToRenderStep(u28, Enum.RenderPriority.Last.Value, function(p29) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u25
            [3] = u26
            [4] = u9
            [5] = u28
        --]]
        if u27.Parent == nil then
            return nil
        end
        if u25.PrimaryPart == nil then
            return nil
        end
        u26 = u26 + p29
        local v30 = u26 / 2
        local v31 = math.clamp(v30, 0, 1)
        local v32 = (1 - v31) * 5 + v31 * 1
        local v33 = 6.283185307179586 * u26
        local v34 = math.cos(v33) * v32
        local v35 = v31 * 3.141592653589793 * 2
        local v36 = math.sin(v35) * 2
        local v37 = math.sin(v33) * v32
        local v38 = Vector3.new(v34, v36, v37)
        local v39 = u25.PrimaryPart.Position:Lerp(u27.Position + v38, v31)
        local v40 = CFrame.Angles(0, v33, 0)
        u25:PivotTo(CFrame.new(v39) * v40)
        if v31 >= 1 then
            u9:UnbindFromRenderStep(u28)
            u25:Destroy()
        end
    end)
    task.delay(2, function() --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u13
        --]]
        u2:playSound(u13.SPIRIT_GARDENER_SPIRIT_ORB_COLLECTED, {
            ["volumeMultiplier"] = 0.5
        })
    end)
end
function u15.onCreatedEntity(_, _, _, p41) --[[ Line: 112 ]]
    p41:PivotTo(CFrame.new(p41:GetPivot().Position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, math.random(0, 3) / 2 * 3.141592653589793, 0))
end
function u15.listenToPickup(u42) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if u42.pickupListenerActive then
        return nil
    end
    u42.pickupListenerActive = true
    u1.Promise.defer(function() --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u1
        --]]
        while true do
            local v43 = task.wait(0.2)
            if v43 ~= 0 and (v43 == v43 and v43) then
                v43 = u42.pickupListenerActive
            end
            if v43 == 0 or (v43 ~= v43 or not v43) then
                return
            end
            u1.Promise.defer(function() --[[ Line: 133 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42:checkForPickup()
            end)
        end
    end)
    return {
        ["Destroy"] = function() --[[ Name: Destroy, Line 139 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            u42.pickupListenerActive = false
        end
    }
end
function u15.checkForPickup(u44) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u10
    --]]
    local u45 = u7.LocalPlayer.Character
    if u45 ~= nil then
        u45 = u45.PrimaryPart
    end
    if not u45 then
        return nil
    end
    local v46 = u44:validCollectableEntityTypes()
    local function v54(u47) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u10
            [3] = u45
            [4] = u44
            [5] = u7
        --]]
        local v48 = u5:GetTagged(u47)
        local function v51(p49) --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u45
                [3] = u44
                [4] = u7
                [5] = u47
            --]]
            local v50 = p49:GetAttribute("SpawnTime")
            if u10:GetServerTimeNow() - v50 < 1 then
                return nil
            end
            if (u45.Position - p49:GetPivot().Position).Magnitude <= 5.5 then
                u44:collectEntity(u7.LocalPlayer, p49, u47)
            end
        end
        for v52, v53 in v48 do
            v51(v53, v52 - 1, v48)
        end
    end
    for v55, v56 in v46 do
        v54(v56, v55 - 1, v46)
    end
end
u3.CreateController(u15.new())
return nil