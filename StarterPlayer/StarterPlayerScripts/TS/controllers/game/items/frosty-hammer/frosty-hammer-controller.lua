local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-upgrades").FrostyHammerUpgrade
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-util").FrostyHammerUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "FrostyHammerController"
    end,
    ["__index"] = u13
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
    --]]
    u13.constructor(p31)
    p31.Name = "FrostyHammerController"
    p31.maid = u7.new()
    p31.abilityMaid = u7.new()
    p31.isPreloaded = false
end
function u28.isRelevantItem(_, p32) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return p32.itemType == u23.FROSTY_HAMMER
end
function u28.onEnable(u33, _, _) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
        [3] = u12
        [4] = u9
        [5] = u21
        [6] = u20
    --]]
    u33:setupYield(function() --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
            [3] = u12
            [4] = u9
            [5] = u33
        --]]
        local u34 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u15.FROST_HAMMER_MENU, {
            ["abilityType"] = "KitPrimary",
            ["abilityButton"] = {
                ["icon"] = "rbxassetid://11831565831"
            }
        }):expect()
        local u36 = u12.AbilityUsed:connect(function(p35) --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u15
                [3] = u33
            --]]
            if p35.userCharacter ~= u9.LocalPlayer.Character then
                return nil
            end
            if p35.ability ~= u15.FROST_HAMMER_MENU then
                return nil
            end
            u33:openUpgradeMenu()
        end)
        return function() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u36
            --]]
            u34.Destroy()
            u36:Destroy()
        end
    end)
    local v37 = u21.getUpgradesFromHammer(u9.LocalPlayer)
    local v38 = v37[u20.STRENGTH]
    local v39 = v38 == nil and 0 or v38
    local v40 = v37[u20.SHIELD]
    if (v40 == nil and 0 or v40) >= 3 then
        u33:mountShieldAbility()
    end
    if v39 >= 3 then
        u33:mountSlamAbility()
    end
end
function u28.onDisable(p41) --[[ Line: 99 ]]
    p41:unmountAbility()
    p41.maid:DoCleaning()
end
function u28.KnitStart(u42) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u24
        [3] = u9
        [4] = u22
        [5] = u23
        [6] = u21
        [7] = u20
        [8] = u4
        [9] = u25
        [10] = u5
        [11] = u6
    --]]
    u13.KnitStart(u42)
    u24.Client:Get("FrostyHammerUpgrade"):Connect(function(p43) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u9
            [3] = u22
            [4] = u23
            [5] = u21
            [6] = u20
        --]]
        u42:upgradeEffect(p43.player)
        if p43.player == u9.LocalPlayer then
            local v44 = u22.getInventory(u9.LocalPlayer).hand
            if v44 ~= nil then
                v44 = v44.itemType
            end
            if v44 ~= u23.FROSTY_HAMMER then
                return nil
            end
            local v45 = u21.getUpgradesFromHammer(p43.player)
            local v46 = v45[u20.STRENGTH]
            local v47 = v46 == nil and 0 or v46
            local v48 = v45[u20.SHIELD]
            local v49 = v48 == nil and 0 or v48
            u42:unmountAbility()
            if v49 >= 3 then
                u42:mountShieldAbility()
            end
            if v47 >= 3 then
                u42:mountSlamAbility()
            end
        end
    end)
    u24.Client:Get("CollectCrystalIce"):Connect(function(u50, p51) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u25
            [3] = u5
            [4] = u6
            [5] = u23
            [6] = u9
        --]]
        local u52 = u50.Character
        u4.fromList({ u25.ICICLE_BREAK_1, u25.ICICLE_BREAK_2 })
        local v53 = u5
        local v54 = u6.Controllers.KitSkinController:getPlayerKitSkinMeta(u50)
        if v54 ~= nil then
            v54 = v54.adetunde
            if v54 ~= nil then
                v54 = v54.shieldSound
            end
        end
        if v54 == nil then
            v54 = u25.FROST_SHIELD_SUMMON
        end
        v53:playSound(v54, {
            ["rollOffMaxDistance"] = 220,
            ["position"] = p51
        })
        u6.Controllers.ReceiveItemEffectController:playEffectForItems({
            {
                ["amount"] = 1,
                ["itemType"] = u23.FROST_CRYSTAL
            }
        }, p51, function() --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u52
            --]]
            local v55 = u50.Character
            if v55 ~= u52 then
                return nil
            end
            if v55 ~= nil then
                v55 = v55.PrimaryPart
                if v55 ~= nil then
                    v55 = v55.CFrame
                end
            end
            return v55
        end, u50 == u9.LocalPlayer and "PlayLocally" or "PlayGlobally")
    end)
end
function u28.openUpgradeMenu(_) --[[ Line: 178 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.FROSTY_HAMMER_UPGRADES, {})
end
function u28.mountShieldAbility(p56) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
        [3] = u16
    --]]
    local u57 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u15.FROST_SHIELD, u16[u15.FROST_SHIELD].triggerConfig):expect()
    p56.abilityMaid:GiveTask(function() --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        u57.Destroy()
    end)
end
function u28.mountSlamAbility(p58) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
        [3] = u16
    --]]
    local u59 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u15.FROST_HAMMER_SLAM, u16[u15.FROST_HAMMER_SLAM].triggerConfig):expect()
    p58.abilityMaid:GiveTask(function() --[[ Line: 189 ]]
        --[[
        Upvalues:
            [1] = u59
        --]]
        u59.Destroy()
    end)
end
function u28.unmountAbility(p60) --[[ Line: 193 ]]
    p60.abilityMaid:DoCleaning()
end
function u28.upgradeEffect(_, p61) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u11
        [4] = u9
        [5] = u19
        [6] = u27
        [7] = u18
        [8] = u17
        [9] = u26
        [10] = u5
        [11] = u25
    --]]
    local u62 = u6.Controllers.KitSkinController:getPlayerKitSkinMeta(p61)
    if u62 ~= nil then
        u62 = u62.adetunde
    end
    if u62 ~= nil then
        u62 = u62.frostHammerUpgradeModel
        if u62 ~= nil then
            u62 = u62:Clone()
        end
    end
    if u62 == nil then
        u62 = u10.Assets.Effects.FrostHammerUpgrade:Clone()
    end
    local u63 = p61.Character
    if u63 ~= nil then
        u63 = u63:GetPrimaryPartCFrame()
    end
    if u63 ~= nil then
        u63 = u63 + u63.LookVector.Unit * 3 - Vector3.new(0, 2, 0)
    end
    if not u63 then
        return nil
    end
    u62:PivotTo(u63)
    u62.Parent = u11
    local u64 = p61 == u9.LocalPlayer
    local u65 = u19:getEntity(p61)
    if u65 ~= nil then
        u65 = u65:getHandItemInstanceFromCharacter()
        if u65 ~= nil then
            u65 = u65:FindFirstChild("Handle")
        end
    end
    if u65 then
        u65.Transparency = 1
        local v66 = u65:FindFirstChild("Ice")
        local v67 = u65:FindFirstChild("Neon")
        if v66 then
            v66.Transparency = 1
        end
        if v67 then
            v67.Transparency = 1
        end
        if u65 then
            u65.Transparency = 1
        end
        if v66 then
            for v68, v69 in v66:GetChildren() do
                local _ = v68 - 1
                if v69:IsA("Decal") then
                    v69.Transparency = 1
                end
            end
        end
    end
    local u70 = u10.Assets.Effects.RepairEnchantTableHammer:Clone()
    u70.Parent = p61.Character
    u27:weldCharacterAccessories(p61.Character)
    local u71 = u18:playAnimation(p61, u17.FROSTY_HAMMER_UPGRADE)
    local u72 = u62:FindFirstChild("Root"):FindFirstChild("HammerEffect")
    local u73 = nil
    local v74
    if u71 == nil then
        v74 = u71
    else
        v74 = u71:GetMarkerReachedSignal("hammer_1"):Connect(function() --[[ Line: 277 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u26
                [3] = u5
                [4] = u25
                [5] = u64
                [6] = u63
                [7] = u73
            --]]
            if u72 then
                u26:playEffects(u72:GetChildren(), nil)
            end
            local v75 = u5
            local v76 = u25.ENCHANT_TABLE_REPAIR_HAMMER_1
            local v77 = {}
            local v78
            if u64 then
                v78 = nil
            else
                v78 = u63
                if v78 ~= nil then
                    v78 = v78.Position
                end
            end
            v77.position = v78
            v75:playSound(v76, v77)
            local v79 = u73
            if v79 ~= nil then
                v79:Disconnect()
            end
        end)
    end
    local u80 = nil
    local v81
    if u71 == nil then
        v81 = u71
    else
        v81 = u71:GetMarkerReachedSignal("hammer_2"):Connect(function() --[[ Line: 307 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u26
                [3] = u5
                [4] = u25
                [5] = u64
                [6] = u63
                [7] = u80
            --]]
            if u72 then
                u26:playEffects(u72:GetChildren(), nil)
            end
            local v82 = u5
            local v83 = u25.ENCHANT_TABLE_REPAIR_HAMMER_2
            local v84 = {}
            local v85
            if u64 then
                v85 = nil
            else
                v85 = u63
                if v85 ~= nil then
                    v85 = v85.Position
                end
            end
            v84.position = v85
            v82:playSound(v83, v84)
            local v86 = u80
            if v86 ~= nil then
                v86:Disconnect()
            end
        end)
    end
    task.delay(2, function() --[[ Line: 335 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u62
            [3] = u70
            [4] = u65
        --]]
        local v87 = u71
        if v87 ~= nil then
            v87:Stop()
        end
        local v88 = u71
        if v88 ~= nil then
            v88:Destroy()
        end
        u62:Destroy()
        u70:Destroy()
        if u65 then
            local v89 = u65:FindFirstChild("Ice")
            local v90 = u65:FindFirstChild("Neon")
            if v89 then
                v89.Transparency = 0
            end
            if v90 then
                v90.Transparency = 0
            end
            if u65 then
                u65.Transparency = 0
            end
            if v89 then
                for v91, v92 in v89:GetChildren() do
                    local _ = v91 - 1
                    if v92:IsA("Decal") then
                        v92.Transparency = 0
                    end
                end
            end
        end
    end)
end
u6.CreateController(u28.new())
return nil