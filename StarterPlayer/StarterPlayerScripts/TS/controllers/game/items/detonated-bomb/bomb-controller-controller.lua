local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "BombControllerController"
    end,
    ["__index"] = u7
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    u7.constructor(p16)
    p16.abilityMaid = u4.new()
    p16.Name = "BombControllerController"
end
function u13.isRelevantItem(_, p17) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return p17.itemType == u11.BOMB_CONTROLLER
end
function u13.onEnable(p18, _, _) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u10
        [4] = u11
    --]]
    p18:setupDestroyableYield(function() --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u10
            [4] = u11
        --]]
        local v19 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v20 = u8.DETONATE_BOMB
        local v21 = {}
        local v22 = {}
        local v23 = u10(u11.BOMB_CONTROLLER).image
        v22.icon = v23 == nil and "" or v23
        v21.abilityButton = v22
        v21.abilityType = "ItemPrimary"
        return v19:enableAbility(v20, v21):expect()
    end)
end
function u13.onDisable(p24) --[[ Line: 54 ]]
    p24.abilityMaid:DoCleaning()
end
function u13.KnitStart(p25) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u8
        [4] = u5
        [5] = u9
        [6] = u11
        [7] = u12
    --]]
    u7.KnitStart(p25)
    u6.AbilityUsed:connect(function(p26) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u9
            [4] = u11
            [5] = u12
        --]]
        local v27
        if p26.ability == u8.DETONATE_BOMB then
            v27 = p26.userCharacter == u5.LocalPlayer.Character
        else
            v27 = false
        end
        if v27 then
            local v28 = u9.getInventory(u5.LocalPlayer).hand
            if v28 ~= nil then
                v28 = v28.itemType
            end
            v27 = v28 == u11.BOMB_CONTROLLER
        end
        if v27 then
            u12.Client:Get("DetonateBomb"):CallServer()
        end
    end)
end
v3.CreateController(u13.new())
return nil