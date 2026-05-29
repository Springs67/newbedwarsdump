local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "alchemist", "alchemist-flask-stage")
local u14 = v13.ALCHEMIST_FLASK_BREW_SEQ_ATTR
local u15 = v13.ALCHEMIST_FLASK_STAGE_ATTR
local u16 = v13.countStagedIngredient
local u17 = v13.parseAlchemistFlaskStage
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, script.Parent, "ui", "alchemist-recipe-sidebar").AlchemistRecipeSidebar
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "AlchemistFlaskController"
    end,
    ["__index"] = u11
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
    --]]
    u11.constructor(p26)
    p26.Name = "AlchemistFlaskController"
    p26.maid = u7.new()
end
function u23.KnitStart(p27) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p27)
end
function u23.isRelevantItem(_, p28) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    return p28.itemType == u20.ALCHEMIST_FLASK and true or p28.tool.Name == u20.ALCHEMIST_FLASK
end
function u23.onEnable(u29, _, _) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u17
        [3] = u15
        [4] = u14
        [5] = u18
        [6] = u20
        [7] = u5
        [8] = u21
        [9] = u8
        [10] = u22
        [11] = u10
        [12] = u19
        [13] = u2
        [14] = u12
        [15] = u4
        [16] = u16
    --]]
    u29:setupYield(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u17
            [3] = u15
            [4] = u14
            [5] = u18
            [6] = u20
            [7] = u5
            [8] = u21
            [9] = u8
            [10] = u22
            [11] = u10
            [12] = u19
            [13] = u29
            [14] = u2
            [15] = u12
            [16] = u4
            [17] = u16
        --]]
        local v30 = u9.LocalPlayer:WaitForChild("PlayerGui")
        local function u31() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u9
                [3] = u20
            --]]
            return {
                ["wildFlowerCount"] = u18.getAmount(u9.LocalPlayer, u20.WILD_FLOWER),
                ["mushroomsCount"] = u18.getAmount(u9.LocalPlayer, u20.MUSHROOMS),
                ["thornsCount"] = u18.getAmount(u9.LocalPlayer, u20.THORNS)
            }
        end
        u5:playSound(u21.UI_OPEN)
        local u32 = #u17(u9.LocalPlayer:GetAttribute(u15))
        local v33 = u9.LocalPlayer:GetAttribute(u14)
        local u34 = type(v33) ~= "number" and 0 or v33
        local v35 = u8
        local v36 = {
            ["stagedIngredients"] = u17(u9.LocalPlayer:GetAttribute(u15))
        }
        for v37, v38 in u31() do
            v36[v37] = v38
        end
        local u39 = v35.mount(u8.createElement(u22, v36), v30)
        local function u44() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u17
                [3] = u9
                [4] = u15
                [5] = u31
                [6] = u39
                [7] = u22
            --]]
            local v40 = u8
            local v41 = {
                ["stagedIngredients"] = u17(u9.LocalPlayer:GetAttribute(u15))
            }
            for v42, v43 in u31() do
                v41[v42] = v43
            end
            v40.update(u39, u8.createElement(u22, v41))
        end
        local u46 = u9.LocalPlayer:GetAttributeChangedSignal(u15):Connect(function() --[[ Line: 87 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u9
                [3] = u15
                [4] = u32
                [5] = u5
                [6] = u21
                [7] = u44
            --]]
            local v45 = u17(u9.LocalPlayer:GetAttribute(u15))
            if u32 < #v45 then
                u5:playSound(u21.DEPOSIT_BEE)
            end
            u32 = #v45
            u44()
        end)
        local u49 = u9.LocalPlayer:GetAttributeChangedSignal(u14):Connect(function() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u14
                [3] = u34
                [4] = u5
                [5] = u21
                [6] = u44
            --]]
            local v47 = u9.LocalPlayer:GetAttribute(u14)
            local v48 = type(v47) ~= "number" and 0 or v47
            if u34 < v48 then
                u5:playSound(u21.WAND_BUBBLE_SPAWN)
            end
            u34 = v48
            u44()
        end)
        local u50 = u10.ItemAdded:connect(function() --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            return u44()
        end)
        local u51 = u10.ItemRemoved:connect(function() --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            return u44()
        end)
        local u52 = u10.NewHandItem:connect(function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            return u44()
        end)
        local v53 = u19(u20.WILD_FLOWER).image
        local v54 = v53 == nil and "" or v53
        local v55 = u19(u20.MUSHROOMS).image
        local v56 = v55 == nil and "" or v55
        local v57 = u19(u20.THORNS).image
        local v58 = v57 == nil and "" or v57
        u29.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u12.ALCHEMIST_ADD_FLOWER, {
            ["abilityType"] = "KitPrimary",
            ["abilityButton"] = {
                ["icon"] = v54,
                ["stateColors"] = {
                    [u4.READY] = Color3.fromRGB(72, 120, 168)
                }
            }
        }):expect())
        u29.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u12.ALCHEMIST_ADD_MUSHROOMS, {
            ["abilityType"] = "KitSecondary",
            ["abilityButton"] = {
                ["icon"] = v56,
                ["stateColors"] = {
                    [u4.READY] = Color3.fromRGB(72, 120, 168)
                }
            }
        }):expect())
        u29.maid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u12.ALCHEMIST_ADD_THORNS, {
            ["abilityType"] = "KitTertiary",
            ["abilityButton"] = {
                ["icon"] = v58,
                ["stateColors"] = {
                    [u4.READY] = Color3.fromRGB(72, 120, 168)
                }
            }
        }):expect())
        local function u60(p59) --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u20
            --]]
            if p59 == u12.ALCHEMIST_ADD_FLOWER then
                return u20.WILD_FLOWER
            elseif p59 == u12.ALCHEMIST_ADD_MUSHROOMS then
                return u20.MUSHROOMS
            elseif p59 == u12.ALCHEMIST_ADD_THORNS then
                return u20.THORNS
            else
                return nil
            end
        end
        u29.maid:GiveTask(u10.CanUseLocalAbility:connect(function(p61) --[[ Line: 168 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u9
                [3] = u60
                [4] = u18
                [5] = u20
                [6] = u17
                [7] = u15
                [8] = u16
            --]]
            if p61.ability ~= u12.ALCHEMIST_ADD_FLOWER and (p61.ability ~= u12.ALCHEMIST_ADD_MUSHROOMS and p61.ability ~= u12.ALCHEMIST_ADD_THORNS) then
                return nil
            end
            if p61.userCharacter ~= u9.LocalPlayer.Character then
                return nil
            end
            local v62 = u60(p61.ability)
            if v62 == nil then
                return nil
            end
            local v63 = u18.getInventory(u9.LocalPlayer).hand
            if v63 ~= nil then
                v63 = v63.itemType
            end
            if v63 ~= u20.ALCHEMIST_FLASK then
                p61:setCancelled(true)
                return nil
            end
            local v64 = u16(u17(u9.LocalPlayer:GetAttribute(u15)), v62)
            if not u18.hasEnough(u9.LocalPlayer, v62, v64 + 1) then
                p61:setCancelled(true)
            end
        end))
        return function() --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u49
                [3] = u50
                [4] = u51
                [5] = u52
                [6] = u8
                [7] = u39
            --]]
            u46:Disconnect()
            u49:Disconnect()
            u50:Destroy()
            u51:Destroy()
            u52:Destroy()
            u8.unmount(u39)
        end
    end)
end
function u23.onDisable(p65) --[[ Line: 204 ]]
    p65.maid:DoCleaning()
end
v6.CreateController(u23.new())
return nil