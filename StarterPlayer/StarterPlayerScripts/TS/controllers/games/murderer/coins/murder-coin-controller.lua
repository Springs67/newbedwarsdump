local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.ReplicatedStorage
local u11 = v7.RunService
local u12 = v7.Workspace
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = u1.import(script, script.Parent.Parent.Parent, "bedwars", "collectable-entity", "collectable-entity-controller").CollectableEntityController
local u24 = u1.import(script, script.Parent, "ui", "murder-coin-display").MurderCoinDisplay
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "MurderCoinController"
    end,
    ["__index"] = u23
})
u25.__index = u25
function u25.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28, ...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.constructor(p28, ...)
    p28.Name = "MurderCoinController"
    p28.pickupListenerActive = false
end
function u25.KnitStart(u29) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u5
        [3] = u19
        [4] = u18
        [5] = u14
        [6] = u20
        [7] = u13
    --]]
    u23.KnitStart(u29)
    u5.Controllers.MatchController:getQueueTypeAsync():andThen(function(p30) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u18
            [3] = u29
            [4] = u14
            [5] = u20
            [6] = u13
        --]]
        if u19(p30).game ~= u18.MURDERER_GAME then
            return nil
        end
        u29:setupCoinUI()
        if u14:getState().Game.matchState == u20.RUNNING then
            u29:listenToPickup()
        end
        u13.MatchStateChange:connect(function(p31) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u29
            --]]
            if p31.matchState == u20.RUNNING then
                u29:listenToPickup()
            elseif p31.matchState == u20.POST then
                u29.pickupListenerActive = false
            end
        end)
    end)
end
function u25.validCollectableEntityTypes(_) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    return { u17.MURDER_COIN }
end
function u25.pickDisplayModel(_, p32, _) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return {
        ["repStorageModel"] = u10.Assets.Misc.CoinModel,
        ["collectionTag"] = p32
    }
end
function u25.onWillRemoveEntity(_, _, _, p33, u34) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u16
        [4] = u15
        [5] = u2
        [6] = u22
    --]]
    if not (u34.PrimaryPart and p33) then
        return nil
    end
    local v35 = u5.Controllers.PickupEffectController:playEffect(u34.PrimaryPart, p33.Character)
    if v35 then
        v35:GiveTask(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            u34:Destroy()
        end)
    else
        u34:Destroy()
    end
    if p33 == u9.LocalPlayer then
        u16:playAnimation(u9.LocalPlayer, u15.PUNCH)
        u2:playSound(u22.COIN_COLLECT)
    end
    return nil
end
function u25.onCreatedEntity(p36, p37, _, u38) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v39 = p36:getEntityMaid(p37)
    if not v39 then
        return nil
    end
    local u40 = 0
    if not u38.PrimaryPart then
        return nil
    end
    v39:GiveTask(u11.Heartbeat:Connect(function(p41) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u38
        --]]
        u40 = u40 + p41
        u38:PivotTo(CFrame.new(u38.PrimaryPart.Position) * CFrame.Angles(-1.5707963267948966, 0, 6.283185307179586 * u40 * 0.3))
    end))
    return nil
end
function u25.setupCoinUI(u42) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u24
        [4] = u21
    --]]
    u42.coinCountTree = u4.Controllers.StatusInfoListController:waitForSetupAddElement(u6.createElement(u24, {
        ["coins"] = 0
    }))
    u21.Client:Get("MurderCoinUpdate"):Connect(function(p43) --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u4
            [3] = u6
            [4] = u24
        --]]
        if u42.coinCountTree then
            u6.update(u42.coinCountTree, u6.createElement(u24, {
                ["coins"] = p43.coins
            }))
        else
            u42.coinCountTree = u4.Controllers.StatusInfoListController:waitForSetupAddElement(u6.createElement(u24, {
                ["coins"] = p43.coins
            }))
        end
    end)
end
function u25.listenToPickup(u44) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if u44.pickupListenerActive then
        return nil
    end
    u44.pickupListenerActive = true
    u1.Promise.defer(function() --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u1
        --]]
        while true do
            local v45 = task.wait(0.2)
            if v45 ~= 0 and (v45 == v45 and v45) then
                v45 = u44.pickupListenerActive
            end
            if v45 == 0 or (v45 ~= v45 or not v45) then
                return
            end
            u1.Promise.defer(function() --[[ Line: 144 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                u44:checkForPickup()
            end)
        end
    end)
end
function u25.checkForPickup(u46) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u17
        [4] = u12
    --]]
    local u47 = u9.LocalPlayer.Character
    if u47 ~= nil then
        u47 = u47.PrimaryPart
    end
    if not u47 then
        return nil
    end
    local v48 = u8:GetTagged(u17.MURDER_COIN)
    local function v51(p49) --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u47
            [3] = u46
            [4] = u9
            [5] = u17
        --]]
        local v50 = p49:GetAttribute("SpawnTime")
        if u12:GetServerTimeNow() - v50 < 1 then
            return nil
        end
        if (u47.Position - p49:GetPivot().Position).Magnitude <= 4 then
            u46:collectEntity(u9.LocalPlayer, p49, u17.MURDER_COIN)
        end
    end
    for v52, v53 in v48 do
        v51(v53, v52 - 1, v48)
    end
end
u4.CreateController(u25.new())
return nil