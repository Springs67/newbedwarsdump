local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.ContextActionService
local u5 = v3.Players
local u6 = v1.import(script, script.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "ActionUtil"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 20 ]] end
function u7.disableActions(_, u10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
    --]]
    local v11 = u2.new()
    if u10.disableSword then
        v11:GiveTask(u6.BeforeSwordSwing:connect(function(p12) --[[ Line: 25 ]]
            p12:setCancelled(true)
        end))
        v11:GiveTask(u6.SwordCharge:connect(function(p13) --[[ Line: 28 ]]
            p13:setCancelled(true)
        end))
    end
    if u10.disableAbilities then
        v11:GiveTask(u6.CanUseLocalAbility:connect(function(p14) --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            local v15 = u10.enabledAbilityOverrides
            if v15 ~= nil then
                local v16 = p14.ability
                v15 = table.find(v15, v16) ~= nil
            end
            if v15 then
                return nil
            end
            p14:setCancelled(true)
        end))
        v11:GiveTask(u6.AbilityUsed:connect(function(p17) --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            local v18 = u10.enabledAbilityOverrides
            if v18 ~= nil then
                local v19 = p17.ability
                v18 = table.find(v18, v19) ~= nil
            end
            if v18 then
                return nil
            end
            p17:setCancelled(true)
        end))
    end
    if u10.disableBlockPlacement then
        v11:GiveTask(u6.PlaceBlock:connect(function(p20) --[[ Line: 57 ]]
            p20:setCancelled(true)
        end))
    end
    if u10.disableBlockBreaking then
        v11:GiveTask(u6.DamageBlock:connect(function(p21) --[[ Line: 62 ]]
            p21:setCancelled(true)
        end))
        v11:GiveTask(u6.DamageBlockEffect:connect(function(p22) --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            if p22.fromPlayer == u10.player then
                p22:setCancelled(true)
            end
        end))
    end
    if u10.disableAiming then
        v11:GiveTask(u6.BeginProjectileTargeting:connect(function(p23) --[[ Line: 72 ]]
            p23:setCancelled(true)
        end))
    end
    if u10.disableConsumingItems then
        v11:GiveTask(u6.StartConsuming:connect(function(p24) --[[ Line: 77 ]]
            p24:setCancelled(true)
        end))
    end
    return v11
end
function u7.disableMovementInput(_) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    for v25, v26 in Enum.PlayerActions:GetEnumItems() do
        local _ = v25 - 1
        u4:BindAction("DisableMovement-" .. v26.Name, function() --[[ Line: 86 ]]
            return Enum.ContextActionResult.Sink
        end, false, v26)
    end
    return function() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        for v27, v28 in Enum.PlayerActions:GetEnumItems() do
            local _ = v27 - 1
            u4:UnbindAction("DisableMovement-" .. v28.Name)
        end
    end
end
function u7.freezePlayer(_) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v29 = u5.LocalPlayer.Character
    if v29 ~= nil then
        v29 = v29.PrimaryPart
    end
    if v29 then
        u5.LocalPlayer.Character.PrimaryPart.Anchored = true
    end
    return function() --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local v30 = u5.LocalPlayer.Character
        if v30 ~= nil then
            v30 = v30.PrimaryPart
        end
        if v30 then
            u5.LocalPlayer.Character.PrimaryPart.Anchored = false
        end
    end
end
return {
    ["ActionUtil"] = u7
}