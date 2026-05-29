local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "RocketBeltController"
    end,
    ["__index"] = u13
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
    --]]
    u13.constructor(p25)
    p25.Name = "RocketBeltController"
    p25.rocketMaid = u7.new()
end
function u22.isRelevantItem(_, p26) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    return p26.itemType == u19.ROCKET_BELT
end
function u22.equip(u27) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u21
        [3] = u2
        [4] = u14
        [5] = u18
        [6] = u19
    --]]
    u5:playSound(u21.EQUIP_JET_PACK)
    local u28 = true
    u27.rocketMaid:GiveTask(function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28 = false
        return u28
    end)
    task.spawn(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
            [3] = u18
            [4] = u19
            [5] = u28
            [6] = u27
        --]]
        local v29 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v30 = u14.ROCKET_BELT
        local v31 = {}
        local v32 = {}
        local v33 = u18(u19.ROCKET_BELT).image
        v32.icon = v33 == nil and "" or v33
        v31.abilityButton = v32
        v31.abilityType = "MiscPrimary"
        local v34 = v29:enableAbility(v30, v31):expect()
        if u28 then
            u27.rocketMaid:GiveTask(v34)
        else
            v34.Destroy()
        end
    end)
end
function u22.unequip(p35) --[[ Line: 74 ]]
    p35.rocketMaid:DoCleaning()
end
function u22.KnitStart(u36) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u14
        [4] = u9
        [5] = u17
        [6] = u19
        [7] = u20
        [8] = u15
        [9] = u5
        [10] = u21
    --]]
    u13.KnitStart(u36)
    u12.AbilityUsed:connect(function(p37) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u9
            [3] = u17
            [4] = u19
            [5] = u20
        --]]
        local v38
        if p37.ability == u14.ROCKET_BELT then
            v38 = p37.userCharacter == u9.LocalPlayer.Character
        else
            v38 = false
        end
        if v38 then
            local v39 = u17.getInventory(u9.LocalPlayer).backpack
            if v39 ~= nil then
                v39 = v39.itemType
            end
            v38 = v39 == u19.ROCKET_BELT
        end
        if v38 then
            u20.Client:Get("RocktBeltUsed"):SendToServer({
                ["player"] = u9.LocalPlayer
            })
            local v40 = u9.LocalPlayer.Character
            if v40 ~= nil then
                v40 = v40.PrimaryPart
            end
            local v41 = v40.AssemblyMass
            local v42 = u9.LocalPlayer.Character
            if v42 ~= nil then
                v42 = v42:FindFirstChild("Humanoid")
            end
            local v43 = u9.LocalPlayer.Character
            if v43 ~= nil then
                v43 = v43:GetPrimaryPartCFrame().LookVector * 100
            end
            if v40 ~= nil then
                v40:ApplyImpulse((Vector3.new(0, 65, 0) + v43) * (v41 * 1.2))
            end
        end
    end)
    u12.CooldownExpired:connect(function(p44) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u17
            [3] = u9
            [4] = u19
            [5] = u5
            [6] = u21
        --]]
        local v45 = p44.cooldownId == u15.ROCKET_BELT
        if v45 then
            local v46 = u17.getInventory(u9.LocalPlayer).backpack
            if v46 ~= nil then
                v46 = v46.itemType
            end
            v45 = v46 == u19.ROCKET_BELT
        end
        if v45 then
            u5:playSound(u21.JETPACK_COOLDOWN_READY)
        end
    end)
    u20.Client:Get("RocketBeltLaunch"):Connect(function(p47) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u36
        --]]
        u36:playEffect(p47.player)
    end)
    u12.BackpackEquipEvent:connect(function(p48) --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u19
            [3] = u36
        --]]
        if p48.player == u9.LocalPlayer then
            if p48.item == u19.ROCKET_BELT then
                u36:equip()
                return
            end
            u36:unequip()
        end
    end)
end
function u22.playEffect(p49, p50) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
    --]]
    u16:getEntity(p50)
    local v51 = p50.Character
    if v51 ~= nil then
        v51 = v51:WaitForChild(u19.ROCKET_BELT)
    end
    local v52
    if v51 == nil then
        v52 = v51
    else
        v52 = v51.Name
    end
    if v52 ~= u19.ROCKET_BELT then
        return nil
    end
    local u53 = v51:WaitForChild("Handle"):WaitForChild("LeftEffectAttachment"):WaitForChild("Effect")
    local u54 = v51:WaitForChild("Handle"):WaitForChild("RightEffectAttachment"):WaitForChild("Effect")
    if not (u53 and u54) then
        return nil
    end
    u53.Enabled = true
    u54.Enabled = true
    local v55 = p50.Character
    if v55 ~= nil then
        v55 = v55:GetPrimaryPartCFrame().Position
    end
    p49:playLaunchEffect(v55)
    task.delay(0.5, function() --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u53
            [2] = u54
        --]]
        if u53 then
            u53.Enabled = false
        end
        if u54 then
            u54.Enabled = false
        end
    end)
end
function u22.playLaunchEffect(_, p56) --[[ Line: 178 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u21
        [3] = u10
        [4] = u11
        [5] = u4
    --]]
    if not p56 then
        return nil
    end
    u5:playSound(u21.JETPACK_LAUNCH, {
        ["rollOffMaxDistance"] = 45,
        ["volumeMultiplier"] = 0.5,
        ["position"] = p56
    })
    local v57 = p56 - Vector3.new(0, 2, 0)
    local u58 = u10.Assets.Effects.RocketLaunchEffect:Clone()
    u58:PivotTo(CFrame.new(v57))
    u58.Parent = u11
    u4:setQueryIgnored(u58, true)
    task.delay(0.5, function() --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u58
        --]]
        u58:Destroy()
    end)
end
v6.CreateController(u22.new())
return nil