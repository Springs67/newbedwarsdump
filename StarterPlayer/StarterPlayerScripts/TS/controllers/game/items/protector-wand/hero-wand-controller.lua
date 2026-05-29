local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").ItemUpgradeTierAttr
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "protector-wand", "protector-wand-constants").ProtectorWandConstants
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u17 = v1.import(script, script.Parent, "protector-wand-controller").ProtectorWandController
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "HeroWandController"
    end,
    ["__index"] = u17
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u4
        [3] = u10
    --]]
    u17.constructor(p21)
    p21.Name = "HeroWandController"
    p21.maid = u4.new()
    p21.targetIcon = u10.HERO_TARGET_ICON
    p21.targetIconColor = u10.HERO_TARGET_COLOR
    p21.targetIconSize = u10.HERO_TARGET_ICON_SIZE
end
function u18.KnitStart(u22) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u6
        [3] = u14
        [4] = u15
        [5] = u12
        [6] = u5
        [7] = u16
        [8] = u8
        [9] = u2
        [10] = u7
        [11] = u11
    --]]
    u17.KnitStart(u22)
    u6.MatchStateChange:connect(function(p23) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        if p23.matchState ~= u14.RUNNING then
            return nil
        end
    end)
    u15.Client:OnEvent("ItemUpgraded", function(p24) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u22
            [4] = u16
            [5] = u8
            [6] = u2
            [7] = u7
            [8] = u11
        --]]
        local v25 = u12.getToolFromInventory(u5.LocalPlayer, p24.item)
        if not v25 then
            return nil
        end
        if not u22:isRelevantItem(v25) then
            return nil
        end
        local v26 = u22:getHandItem()
        if not v26 then
            return nil
        end
        local v27 = u16(v25.tool, u8)
        if v26.itemType == v25.itemType and v27 == 1 then
            local v28 = u22
            local v29 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v30 = u7.HERO_WAND_BUBBLE
            local v31 = {
                ["abilityType"] = "ItemPrimary",
                ["abilityButton"] = {
                    ["icon"] = u11.WAND_BUBBLE
                }
            }
            v28.bubbleAbilityRef = v29:enableAbility(v30, v31):expect()
        end
    end)
end
function u18.isRelevantItem(_, p32) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return p32.itemType == u13.HERO_PROTECTOR_WAND
end
function u18.enableWand(u33, u34) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u8
        [3] = u2
        [4] = u7
        [5] = u11
        [6] = u6
        [7] = u5
        [8] = u9
    --]]
    u33:endAutoTargeting(u33.maid)
    if u33.healAbilityRef then
        u33.healAbilityRef.Destroy()
    end
    if u33.bubbleAbilityRef then
        u33.bubbleAbilityRef.Destroy()
    end
    local v35 = u16(u34.tool, u8)
    u33:beginAutoTargeting(u33.maid, u34, u33.targetIcon, u33.targetIconColor, u33.targetIconSize)
    u33.healAbilityRef = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u7.HERO_WAND_HEAL, nil):expect()
    if v35 ~= 0 and (v35 == v35 and v35) then
        v35 = v35 >= 1
    end
    if v35 ~= 0 and (v35 == v35 and v35) then
        u33.bubbleAbilityRef = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u7.HERO_WAND_BUBBLE, {
            ["abilityType"] = "ItemPrimary",
            ["abilityButton"] = {
                ["icon"] = u11.WAND_BUBBLE
            }
        }):expect()
    end
    local v37 = {
        ["action"] = "Attack",
        ["actionId"] = "hero_wand_heal",
        ["boundFunction"] = function(_, p36, _) --[[ Name: boundFunction, Line 106 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u7
            --]]
            if p36 == Enum.UserInputState.Begin then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u7.HERO_WAND_HEAL)
            end
        end
    }
    u33.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v37))
    u33.maid:GiveTask(u6.AbilityUsed:connect(function(p38) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u33
            [3] = u34
            [4] = u7
            [5] = u9
        --]]
        if p38.userCharacter ~= u5.LocalPlayer.Character then
            return nil
        end
        if not u33:isRelevantItem(u34) then
            return nil
        end
        if p38.ability == u7.HERO_WAND_HEAL then
            u33:castToTarget(u34, p38.ability, u33.randomCastingSound, u9.HERO_WAND_HEAL, 5, u33.targetIconColor)
        end
        if p38.ability == u7.HERO_WAND_BUBBLE then
            u33:castToTarget(u34, p38.ability, u33.randomCastingSound)
        end
    end))
end
function u18.onEnable(p39, p40, _) --[[ Line: 128 ]]
    p39:enableWand(p40)
    p39:setUpAnimations()
end
function u18.onDisable(p41) --[[ Line: 132 ]]
    if p41.healAbilityRef then
        p41.healAbilityRef.Destroy()
    end
    if p41.bubbleAbilityRef then
        p41.bubbleAbilityRef.Destroy()
    end
    p41:endAutoTargeting(p41.maid)
    p41:cleanUpAnimations()
end
v3.CreateController(u18.new())
return nil