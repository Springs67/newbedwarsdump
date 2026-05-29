local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
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
        return "VillainWandController"
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
    p21.Name = "VillainWandController"
    p21.maid = u4.new()
    p21.targetIcon = u10.VILLAIN_TARGET_ICON
    p21.targetIconColor = u10.VILLAIN_TARGET_COLOR
    p21.targetIconSize = u10.VILLAIN_TARGET_ICON_SIZE
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
        [12] = u3
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
            local v30 = u7.VILLAIN_WAND_BUBBLE
            local v31 = {
                ["abilityType"] = "ItemPrimary",
                ["abilityButton"] = {
                    ["icon"] = u11.WAND_BUBBLE
                }
            }
            v28.bubbleAbilityRef = v29:enableAbility(v30, v31):expect()
        end
    end)
    u3.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(_) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        local v32 = u22:getHandItem()
        if not v32 then
            return nil
        end
        if not u22:isRelevantItem(v32) then
            return nil
        end
        u22:enableWand(v32)
    end)
end
function u18.isRelevantItem(_, p33) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return p33.itemType == u13.VILLAIN_PROTECTOR_WAND
end
function u18.enableWand(u34, u35) --[[ Line: 88 ]]
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
    u34:endAutoTargeting(u34.maid)
    if u34.healAbilityRef then
        u34.healAbilityRef.Destroy()
    end
    if u34.bubbleAbilityRef then
        u34.bubbleAbilityRef.Destroy()
    end
    local v36 = u16(u35.tool, u8)
    u34:beginAutoTargeting(u34.maid, u35, u34.targetIcon, u34.targetIconColor, u34.targetIconSize)
    u34.healAbilityRef = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u7.VILLAIN_WAND_HEAL, nil):expect()
    if v36 ~= 0 and (v36 == v36 and v36) then
        v36 = v36 >= 1
    end
    if v36 ~= 0 and (v36 == v36 and v36) then
        u34.bubbleAbilityRef = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u7.VILLAIN_WAND_BUBBLE, {
            ["abilityType"] = "ItemPrimary",
            ["abilityButton"] = {
                ["icon"] = u11.WAND_BUBBLE
            }
        }):expect()
    end
    local v38 = {
        ["action"] = "Attack",
        ["actionId"] = "villain_wand_heal",
        ["boundFunction"] = function(_, p37, _) --[[ Name: boundFunction, Line 116 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u7
            --]]
            if p37 == Enum.UserInputState.Begin then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u7.VILLAIN_WAND_HEAL)
            end
        end
    }
    u34.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v38))
    u34.maid:GiveTask(u6.AbilityUsed:connect(function(p39) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u34
            [3] = u35
            [4] = u7
            [5] = u9
        --]]
        if p39.userCharacter ~= u5.LocalPlayer.Character then
            return nil
        end
        if not u34:isRelevantItem(u35) then
            return nil
        end
        if p39.ability == u7.VILLAIN_WAND_HEAL then
            u34:castToTarget(u35, p39.ability, u34.randomCastingSound, u9.VILLAIN_WAND_HEAL, 5, u34.targetIconColor)
        end
        if p39.ability == u7.VILLAIN_WAND_BUBBLE then
            u34:castToTarget(u35, p39.ability, u34.randomCastingSound)
        end
    end))
end
function u18.onEnable(p40, p41, _) --[[ Line: 138 ]]
    p40:enableWand(p41)
    p40:setUpAnimations()
end
function u18.onDisable(p42) --[[ Line: 142 ]]
    if p42.healAbilityRef then
        p42.healAbilityRef.Destroy()
    end
    if p42.bubbleAbilityRef then
        p42.bubbleAbilityRef.Destroy()
    end
    p42:endAutoTargeting(p42.maid)
    p42:cleanUpAnimations()
end
u3.CreateController(u18.new())
return nil