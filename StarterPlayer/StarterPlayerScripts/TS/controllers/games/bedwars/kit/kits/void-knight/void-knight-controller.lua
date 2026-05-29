local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.AnimationUtil
local v6 = v3.ConstantManager
local u7 = v3.GameQueryUtil
local u8 = v3.SoundManager
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.Players
local u17 = v15.ReplicatedStorage
local u18 = v15.TweenService
local u19 = v15.Workspace
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-knight-balance")
local u27 = v26.getVoidKnightDefinitionForTier
local u28 = v26.VoidKnightBalance
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u35 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u36 = v1.import(script, script.Parent, "ui", "void-knight-notification").VoidKnightNotification
local u37 = v1.import(script, script.Parent, "ui", "void-knight-progression-ui").VoidKnightSidebar
local u38 = v6.registerConstants(script, {
    ["P1XRange"] = NumberRange.new(-30, 30),
    ["P1YRange"] = NumberRange.new(-15, 15),
    ["P1ZRange"] = NumberRange.new(0, 0)
})
local u39 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 48 ]]
        return "VoidKnightController"
    end,
    ["__index"] = u35
})
u39.__index = u39
function u39.new(...) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u39
    --]]
    local v40 = u39
    local v41 = setmetatable({}, v40)
    return v41:constructor(...) or v41
end
function u39.constructor(p42) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u30
        [3] = u28
    --]]
    u35.constructor(p42, u30.VOID_KNIGHT)
    p42.Name = "VoidKnightController"
    p42.random = Random.new()
    p42.currentProgress = 0
    p42.currentKills = 0
    p42.currentTier = u28.ProgressTiers.BASE
end
function u39.KnitStart(p43) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    u35.KnitStart(p43)
end
function u39.onKitLocalActivated(u44, p45) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u28
        [3] = u2
        [4] = u4
        [5] = u27
        [6] = u32
        [7] = u31
        [8] = u11
        [9] = u29
        [10] = u34
        [11] = u8
        [12] = u22
        [13] = u23
        [14] = u21
    --]]
    u44:mountSidebarUI(p45)
    p45:GiveTask(u16.LocalPlayer:GetAttributeChangedSignal(u28.HaltedProgressAttribute):Connect(function() --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u28
            [3] = u44
            [4] = u2
            [5] = u4
            [6] = u27
            [7] = u32
            [8] = u31
        --]]
        local v46 = u16.LocalPlayer:GetAttribute(u28.HaltedProgressAttribute)
        if u44.enabledConsumeAbility then
            if v46 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u44.enabledConsumeAbility, u4.DISABLED)
                return
            else
                local v47 = u27((u16.LocalPlayer:GetAttribute(u28.TierAttribute))).progressionRequirements
                if v47 ~= nil then
                    v47 = v47.resourceType
                end
                local v48
                if v47 == u32.IRON and u31.getAmount(u16.LocalPlayer, u32.IRON) >= u28.IronPerConsume then
                    v48 = true
                elseif v47 == u32.EMERALD then
                    v48 = u31.getAmount(u16.LocalPlayer, u32.EMERALD) >= u28.EmeraldPerConsume
                else
                    v48 = false
                end
                if v48 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u44.enabledConsumeAbility, u4.READY)
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u44.enabledConsumeAbility, u4.DISABLED)
                end
            end
        else
            return nil
        end
    end))
    p45:GiveTask(u16.LocalPlayer:GetAttributeChangedSignal(u28.TierAttribute):Connect(function() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u28
            [3] = u11
            [4] = u29
            [5] = u34
            [6] = u8
            [7] = u44
            [8] = u27
            [9] = u32
            [10] = u2
            [11] = u22
            [12] = u23
        --]]
        local v49 = u16.LocalPlayer:GetAttribute(u28.TierAttribute)
        if not u16.LocalPlayer.Character then
            return nil
        end
        local v50 = u29[u11.Controllers.KitSkinController:getKitSkin(u16.LocalPlayer.Character)].void_knight
        local v51
        if v50 then
            v51 = v50.levelUpSounds
        else
            v51 = {
                u34.VOID_KNIGHT_LEVEL_UP_1,
                u34.VOID_KNIGHT_LEVEL_UP_2,
                u34.VOID_KNIGHT_LEVEL_UP_3,
                u34.VOID_KNIGHT_LEVEL_UP_4
            }
        end
        u8:playSound(v51[v49 - 1 + 1], {
            ["position"] = nil,
            ["volumeMultiplier"] = 1.2
        })
        u44:sendTierNotifications(u27(v49), v49)
        local v52 = u27(v49).progressionRequirements
        if v52 and v52.resourceType == u32.EMERALD then
            local v53 = u44.consumeIronRef
            if v53 ~= nil then
                v53.Destroy()
            end
            if u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbilities()[u22.VOID_KNIGHT_CONSUME_EMERALD] ~= nil then
                return nil
            end
            local v54 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v55 = u22.VOID_KNIGHT_CONSUME_EMERALD
            local v56 = {}
            for v57, v58 in u23[u22.VOID_KNIGHT_CONSUME_EMERALD].triggerConfig do
                v56[v57] = v58
            end
            v54:enableAbility(v55, v56):andThen(function(p59) --[[ Line: 126 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                u44.consumeEmeraldRef = p59
            end)
            u44.enabledConsumeAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u22.VOID_KNIGHT_CONSUME_EMERALD)
        end
        if u27(u44.currentTier).unlocksAscendancy then
            local v60 = u44.consumeIronRef
            if v60 ~= nil then
                v60.Destroy()
            end
            local v61 = u44.consumeEmeraldRef
            if v61 ~= nil then
                v61.Destroy()
            end
            local v62 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v63 = u22.VOID_KNIGHT_ASCEND
            local v64 = {}
            for v65, v66 in u23[u22.VOID_KNIGHT_ASCEND].triggerConfig do
                v64[v65] = v66
            end
            v62:enableAbility(v63, v64)
        end
    end))
    local u77 = u21.changed:connect(function(p67, p68) --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u28
            [3] = u32
            [4] = u31
            [5] = u2
            [6] = u22
            [7] = u4
        --]]
        if u16.LocalPlayer:GetAttribute(u28.HaltedProgressAttribute) == true then
            return nil
        end
        local v69 = nil
        for v70, v71 in p68.Inventory.observedInventory.inventory.items do
            local _ = v70 - 1
            if v71.itemType == u32.IRON == true then
                v69 = v71
                break
            end
        end
        local v72 = nil
        for v73, v74 in p67.Inventory.observedInventory.inventory.items do
            local _ = v73 - 1
            if v74.itemType == u32.IRON == true then
                v72 = v74
                break
            end
        end
        if v69 == v72 then
            return nil
        else
            local v75 = u31.getAmount(u16.LocalPlayer, u32.IRON)
            local v76 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u22.VOID_KNIGHT_CONSUME_IRON)
            if v76 then
                if u28.IronPerConsume <= v75 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v76, u4.READY)
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v76, u4.DISABLED)
                end
            else
                return nil
            end
        end
    end)
    p45:GiveTask(function() --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u77
        --]]
        u77:disconnect()
    end)
    local u88 = u21.changed:connect(function(p78, p79) --[[ Line: 204 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u28
            [3] = u32
            [4] = u31
            [5] = u2
            [6] = u22
            [7] = u4
        --]]
        if u16.LocalPlayer:GetAttribute(u28.HaltedProgressAttribute) == true then
            return nil
        end
        local v80 = nil
        for v81, v82 in p79.Inventory.observedInventory.inventory.items do
            local _ = v81 - 1
            if v82.itemType == u32.EMERALD == true then
                v80 = v82
                break
            end
        end
        local v83 = nil
        for v84, v85 in p78.Inventory.observedInventory.inventory.items do
            local _ = v84 - 1
            if v85.itemType == u32.EMERALD == true then
                v83 = v85
                break
            end
        end
        if v80 == v83 then
            return nil
        else
            local v86 = u31.getAmount(u16.LocalPlayer, u32.EMERALD)
            local v87 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u22.VOID_KNIGHT_CONSUME_EMERALD)
            if v87 then
                if u28.EmeraldPerConsume <= v86 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v87, u4.READY)
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v87, u4.DISABLED)
                end
            else
                return nil
            end
        end
    end)
    p45:GiveTask(function() --[[ Line: 252 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        return u88:disconnect()
    end)
end
function u39.onAbilityUsed(p89, p90, p91) --[[ Line: 256 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u22
    --]]
    if p91:isCancelled() then
        return nil
    elseif p90 == u16.LocalPlayer.Character then
        local v92 = p91.ability
        if v92 == u22.VOID_KNIGHT_CONSUME_IRON then
            p89:onConsumeIron(p90, p91)
            return
        elseif v92 == u22.VOID_KNIGHT_CONSUME_EMERALD then
            p89:onConsumeEmerald(p90, p91)
            return
        elseif v92 == u22.VOID_KNIGHT_ASCEND then
            p89:onAscend(p90, true)
        end
    else
        p89:onAbilityUsedByNonLocalPlayer(p90, p91.ability)
        return nil
    end
end
function u39.onKitLocalDeactivated(_) --[[ Line: 280 ]] end
function u39.onKitReplicationActivated(_, _) --[[ Line: 282 ]] end
function u39.onKitReplicationDeactivated(_) --[[ Line: 284 ]] end
function u39.onInnateAbilityEnabled(p93, _, p94) --[[ Line: 286 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
    --]]
    p93.consumeIronRef = p94
    p93.enabledConsumeAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u22.VOID_KNIGHT_CONSUME_IRON)
end
function u39.onAbilityUsedByNonLocalPlayer(p95, p96, p97) --[[ Line: 290 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u5
        [3] = u25
        [4] = u24
    --]]
    if p97 == u22.VOID_KNIGHT_CONSUME_IRON or p97 == u22.VOID_KNIGHT_CONSUME_EMERALD then
        u5:playAnimation(p96, u25:getAssetId(u24.USE_GRAVESTONE), {
            ["looped"] = false
        })
        return
    elseif p97 == u22.VOID_KNIGHT_ASCEND then
        p95:onAscend(p96, false)
    end
end
function u39.enableAscensionParticles(_, p98, p99) --[[ Line: 308 ]]
    local v100 = p98:WaitForChild("UpperTorso"):WaitForChild("AscensionEffect")
    if v100 then
        local v101 = 0
        local v102 = {}
        for v103, v105 in v100:GetDescendants() do
            local _ = v103 - 1
            if not v105:IsA("ParticleEmitter") then
                local v105 = nil
            end
            if v105 ~= nil then
                v101 = v101 + 1
                v102[v101] = v105
            end
        end
        for v106, v107 in v102 do
            local _ = v106 - 1
            v107.Enabled = p99
        end
    end
end
function u39.onAscend(_, p108, p109) --[[ Line: 337 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u29
        [3] = u8
        [4] = u34
    --]]
    local v110 = u29[u11.Controllers.KitSkinController:getKitSkin(p108)].void_knight
    local v111 = u8
    local v112
    if v110 then
        v112 = v110.ascendSound
    else
        v112 = u34.VOID_KNIGHT_ASCEND
    end
    local v113 = {
        ["volumeMultiplier"] = 1.3
    }
    local v114
    if p109 then
        v114 = nil
    else
        v114 = p108:GetPivot().Position
    end
    v113.position = v114
    v111:playSound(v112, v113)
end
function u39.onConsumeIron(u115, p116, u117) --[[ Line: 346 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u16
        [3] = u32
        [4] = u28
        [5] = u17
        [6] = u33
    --]]
    if u31.getAmount(u16.LocalPlayer, u32.IRON) < u28.IronPerConsume then
        u117:setCancelled(true)
        return nil
    end
    if u16.LocalPlayer:GetAttribute(u28.HaltedProgressAttribute) == true then
        u117:setCancelled(true)
        return nil
    end
    u115:playConsumeEffectsOnCharacter(p116)
    local u118 = u117.userCharacter:GetPivot().Position
    task.spawn(function() --[[ Line: 358 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u17
            [3] = u32
            [4] = u33
            [5] = u115
            [6] = u118
            [7] = u117
        --]]
        local v119 = false
        local v120 = 0
        while true do
            if v119 then
                v120 = v120 + 1
            else
                v119 = true
            end
            if v120 >= u28.IronPerConsume then
                return
            end
            local v121 = u17:WaitForChild("Items"):WaitForChild(u32.IRON)
            local u122 = u33.cloneItemIntoModel(v121)
            task.spawn(function() --[[ Line: 373 ]]
                --[[
                Upvalues:
                    [1] = u115
                    [2] = u122
                    [3] = u118
                    [4] = u117
                --]]
                u115:playItemConsumeEffect(u122, u118, function() --[[ Line: 374 ]]
                    --[[
                    Upvalues:
                        [1] = u117
                    --]]
                    return u117.userCharacter:GetPivot()
                end, 1)
            end)
        end
    end)
end
function u39.playConsumeEffectsOnCharacter(_, p123) --[[ Line: 382 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u29
        [3] = u5
        [4] = u25
        [5] = u24
        [6] = u8
        [7] = u34
    --]]
    local v124 = u29[u11.Controllers.KitSkinController:getKitSkin(p123)].void_knight
    u5:playAnimation(p123, u25:getAssetId(u24.USE_GRAVESTONE), {
        ["looped"] = false
    })
    local v125 = u8
    local v126
    if v124 then
        v126 = v124.consumeSound
    else
        v126 = u34.VOID_KNIGHT_CONSUME
    end
    v125:playSound(v126, {
        ["position"] = nil
    })
end
function u39.onConsumeEmerald(u127, p128, u129) --[[ Line: 392 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u16
        [3] = u32
        [4] = u28
        [5] = u17
        [6] = u33
    --]]
    if u31.getAmount(u16.LocalPlayer, u32.EMERALD) < u28.EmeraldPerConsume then
        u129:setCancelled(true)
        return nil
    end
    if u16.LocalPlayer:GetAttribute(u28.HaltedProgressAttribute) == true then
        u129:setCancelled(true)
        return nil
    end
    u127:playConsumeEffectsOnCharacter(p128)
    local u130 = u129.userCharacter:GetPivot().Position
    task.spawn(function() --[[ Line: 404 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u17
            [3] = u32
            [4] = u33
            [5] = u127
            [6] = u130
            [7] = u129
        --]]
        local v131 = false
        local v132 = 0
        while true do
            if v131 then
                v132 = v132 + 1
            else
                v131 = true
            end
            if v132 >= u28.EmeraldPerConsume then
                return
            end
            local v133 = u17:WaitForChild("Items"):WaitForChild(u32.EMERALD)
            local u134 = u33.cloneItemIntoModel(v133)
            task.spawn(function() --[[ Line: 419 ]]
                --[[
                Upvalues:
                    [1] = u127
                    [2] = u134
                    [3] = u130
                    [4] = u129
                --]]
                u127:playItemConsumeEffect(u134, u130, function() --[[ Line: 420 ]]
                    --[[
                    Upvalues:
                        [1] = u129
                    --]]
                    return u129.userCharacter:GetPivot()
                end, 1)
            end)
        end
    end)
end
function u39.sendTierNotifications(_, p135, p136) --[[ Line: 428 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u28
        [3] = u2
        [4] = u14
        [5] = u36
    --]]
    for _, v137 in u12.entries(p135) do
        local v138 = v137[1]
        if v137[2] ~= false then
            local v139 = Color3.fromRGB(181, 89, 237)
            local v140 = Color3.fromRGB(140, 23, 237)
            if p136 == u28.ProgressTiers.CHOSEN then
                v139 = Color3.fromRGB(240, 148, 82)
                v140 = Color3.fromRGB(237, 143, 23)
            end
            local v141 = nil
            local v142
            if v138 == "armorValues" then
                v142 = "- Increased Armor Strength"
            elseif v138 == "swordItem" then
                v142 = p136 ~= u28.ProgressTiers.CHOSEN and "- Increased Sword Damage" or v141
            elseif v138 == "unlocksDecay" then
                v142 = p136 == u28.ProgressTiers.EMPOWERED and "- Unlocked Void Decay" or v141
            elseif v138 == "unlocksShield" then
                v142 = p136 == u28.ProgressTiers.CORRUPTED and "- Unlocked Void Shield" or v141
            else
                v142 = v138 == "unlocksAscendancy" and p136 == u28.ProgressTiers.CHOSEN and "- Unlocked Void Ascendance" or v141
            end
            if v142 ~= "" and v142 then
                local u143 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u14.createElement(u36, {
                    ["fadeTime"] = 1.25,
                    ["duration"] = 3,
                    ["text"] = v142,
                    ["textColor3"] = v139,
                    ["textStrokeColor3"] = v140
                }))
                task.delay(6, function() --[[ Line: 485 ]]
                    --[[
                    Upvalues:
                        [1] = u143
                    --]]
                    u143:DoCleaning()
                end)
                task.wait(0.5)
            end
        end
    end
end
u39.playItemConsumeEffect = v1.async(function(p144, p145, u146, u147, p148, p149) --[[ Line: 492 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u38
        [3] = u18
        [4] = u7
        [5] = u20
        [6] = u13
    --]]
    local v150 = u19:GetServerTimeNow()
    if p149 == 0 or (p149 ~= p149 or not p149) then
        p149 = v150
    end
    local v151 = v150 - p149
    local v152 = u147()
    if not v152 then
        return false
    end
    local u153 = (v152 * CFrame.new(p144.random:NextNumber(u38.P1XRange.Min, u38.P1XRange.Max), p144.random:NextNumber(u38.P1YRange.Min, u38.P1YRange.Max), p144.random:NextNumber(u38.P1ZRange.Min, u38.P1ZRange.Max))):Lerp(v152, 0.5).Position
    local u154 = p145:Clone()
    task.delay(0.2, function() --[[ Line: 505 ]]
        --[[
        Upvalues:
            [1] = u154
            [2] = u18
        --]]
        local v155 = 0
        local v156 = {}
        for v157, v158 in u154:GetDescendants() do
            local _ = v157 - 1
            if v158:IsA("BasePart") == true then
                v155 = v155 + 1
                v156[v155] = v158
            end
        end
        local function v160(p159) --[[ Line: 521 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18:Create(p159, TweenInfo.new(0.5), {
                ["Color"] = Color3.fromRGB(0, 0, 0)
            }):Play()
        end
        for v161, v162 in v156 do
            v160(v162, v161 - 1, v156)
        end
    end)
    local u163 = u154
    for v164, v165 in u154:GetDescendants() do
        local _ = v164 - 1
        u7:setQueryIgnored(v165, true)
    end
    u163.Parent = u19
    u20(p148 - v151, u13, function(p166) --[[ Line: 538 ]]
        --[[
        Upvalues:
            [1] = u147
            [2] = u146
            [3] = u153
            [4] = u163
        --]]
        local v167 = u147()
        if v167 ~= nil then
            v167 = v167.Position
        end
        if not v167 then
            return nil
        end
        local v168 = u146:Lerp(u153, p166):Lerp(u153:Lerp(v167, p166), p166)
        u163:PivotTo(CFrame.new(v168) * CFrame.Angles(0, 6.283185307179586 * p166, 0))
    end, v151, 1):Wait()
    u163:Destroy()
    return true
end)
function u39.mountSidebarUI(u169, p170) --[[ Line: 559 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u28
        [3] = u14
        [4] = u37
    --]]
    local v171 = u16.LocalPlayer:GetAttribute(u28.ProgressAttribute)
    u169.currentProgress = v171 == nil and 0 or v171
    local v172 = u16.LocalPlayer:GetAttribute(u28.KillsAttribute)
    u169.currentKills = v172 == nil and 0 or v172
    local v173 = u16.LocalPlayer:GetAttribute(u28.TierAttribute)
    u169.currentTier = v173 == nil and 0 or v173
    local u174 = u14.mount(u14.createElement(u37, {
        ["progress"] = u169.currentProgress,
        ["kills"] = u169.currentKills,
        ["tier"] = u169.currentTier
    }), u16.LocalPlayer:WaitForChild("PlayerGui"))
    p170:GiveTask(u16.LocalPlayer:GetAttributeChangedSignal(u28.ProgressAttribute):Connect(function() --[[ Line: 580 ]]
        --[[
        Upvalues:
            [1] = u169
            [2] = u16
            [3] = u28
            [4] = u14
            [5] = u174
            [6] = u37
        --]]
        u169.currentProgress = u16.LocalPlayer:GetAttribute(u28.ProgressAttribute)
        u14.update(u174, u14.createElement(u37, {
            ["progress"] = u169.currentProgress,
            ["kills"] = u169.currentKills,
            ["tier"] = u169.currentTier
        }))
    end))
    p170:GiveTask(u16.LocalPlayer:GetAttributeChangedSignal(u28.KillsAttribute):Connect(function() --[[ Line: 589 ]]
        --[[
        Upvalues:
            [1] = u169
            [2] = u16
            [3] = u28
            [4] = u14
            [5] = u174
            [6] = u37
        --]]
        u169.currentKills = u16.LocalPlayer:GetAttribute(u28.KillsAttribute)
        u14.update(u174, u14.createElement(u37, {
            ["progress"] = u169.currentProgress,
            ["kills"] = u169.currentKills,
            ["tier"] = u169.currentTier
        }))
    end))
    p170:GiveTask(u16.LocalPlayer:GetAttributeChangedSignal(u28.TierAttribute):Connect(function() --[[ Line: 598 ]]
        --[[
        Upvalues:
            [1] = u169
            [2] = u16
            [3] = u28
            [4] = u14
            [5] = u174
            [6] = u37
        --]]
        u169.currentTier = u16.LocalPlayer:GetAttribute(u28.TierAttribute)
        u14.update(u174, u14.createElement(u37, {
            ["progress"] = u169.currentProgress,
            ["kills"] = u169.currentKills,
            ["tier"] = u169.currentTier
        }))
    end))
    p170:GiveTask(function() --[[ Line: 607 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u174
        --]]
        u14.unmount(u174)
    end)
end
v10.CreateController(u39.new())
return nil