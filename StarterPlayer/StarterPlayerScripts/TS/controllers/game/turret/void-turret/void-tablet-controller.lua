local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, script.Parent, "ui", "void-turret-view").VoidTurretViewWrapper
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "VoidTabletController"
    end,
    ["__index"] = u11
})
u21.__index = u21
function u21.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
    --]]
    u11.constructor(p24)
    p24.Name = "VoidTabletController"
    p24.nextAllowActivation = -1
    p24.maid = u6.new()
end
function u21.KnitStart(p25) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
    --]]
    u11.KnitStart(p25)
    u14.changed:connect(function(p26, p27) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        local v28 = p26.Game.selectedTurret
        local v29 = p27.Game.selectedTurret
        if v28 == nil and v28 ~= v29 then
            u14:dispatch({
                ["type"] = "InventorySelectHotbarSlot",
                ["slot"] = 0
            })
        end
    end)
end
function u21.attemptToActivate(u30) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u9
        [3] = u17
        [4] = u10
        [5] = u2
        [6] = u5
        [7] = u16
        [8] = u15
        [9] = u4
        [10] = u13
        [11] = u20
        [12] = u7
        [13] = u12
    --]]
    if time() < u30.nextAllowActivation then
        return false
    end
    u30.nextAllowActivation = time() + 1
    if u18:getLocalPlayerEntity() == nil then
        warn("Could not find entity for localplayer")
        return false
    end
    local v31 = 0
    local v32 = {}
    for v33, v34 in u9:GetTagged(u17.VOID_TURRET) do
        local _ = v33 - 1
        if v34:GetAttribute("PlacedByUserId") == u10.LocalPlayer.UserId == true then
            v31 = v31 + 1
            v32[v31] = v34
        end
    end
    if #v32 == 0 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "You do not have any void turrets placed yet."
        })
        return false
    end
    local u35 = u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["blockSprint"] = true,
        ["moveSpeedMultiplier"] = 0
    })
    u30.maid:GiveTask(function() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35.Destroy()
    end)
    local u36 = u16:playAnimation(u10.LocalPlayer, u15.USE_TABLET, {
        ["looped"] = true
    })
    u30.maid:GiveTask(function() --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        local v37 = u36
        if v37 ~= nil then
            v37:Stop()
        end
    end)
    local u38 = u4.Controllers.ViewmodelController:addDisabler()
    u30.maid:GiveTask(function() --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u38
        --]]
        u4.Controllers.ViewmodelController:removeDisabler(u38)
    end)
    u30:setupYield(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u20
            [3] = u7
        --]]
        local u39 = u13("VoidCameraView", u20)
        return function() --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u39
            --]]
            u7.unmount(u39)
        end
    end)
    local u41 = u12.On(function(p40, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u30
        --]]
        if u10.LocalPlayer.Character and p40 == u10.LocalPlayer.Character then
            u30.maid:DoCleaning()
        end
    end)
    u30.maid:GiveTask(function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41()
    end)
    return true
end
function u21.onEnable(p42) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p42:attemptToActivate() == false then
        u14:dispatch({
            ["type"] = "InventorySelectHotbarSlot",
            ["slot"] = 0
        })
    end
end
function u21.isRelevantItem(_, p43) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    return p43.itemType == u19.VOID_TURRET_TABLET
end
function u21.onDisable(p44) --[[ Line: 137 ]]
    p44.maid:DoCleaning()
end
return {
    ["VoidTabletController"] = u4.CreateController(u21.new())
}