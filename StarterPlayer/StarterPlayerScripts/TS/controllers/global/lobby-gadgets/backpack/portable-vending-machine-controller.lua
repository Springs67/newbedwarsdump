local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "backpack-knit-controller").BackpackKnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "TreasureChestBackpackController"
    end,
    ["__index"] = u7
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    u7.constructor(p19)
    p19.Name = "TreasureChestBackpackController"
    p19.abilityMaid = u4.new()
end
function u16.isRelevantItem(_, p20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p20.itemType == u14.PORTABLE_VENDING_MACHINE
end
function u16.onEnable(u21, _, _) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
        [3] = u13
        [4] = u14
    --]]
    local u22 = true
    u21.abilityMaid:GiveTask(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22 = false
        return u22
    end)
    task.spawn(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
            [3] = u13
            [4] = u14
            [5] = u22
            [6] = u21
        --]]
        local v23 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v24 = u9.TREASURE_BACKPACK
        local v25 = {}
        local v26 = {}
        local v27 = u13(u14.PORTABLE_VENDING_MACHINE).image
        v26.icon = v27 == nil and "" or v27
        v25.abilityButton = v26
        v25.abilityType = "MiscPrimary"
        local v28 = v23:enableAbility(v24, v25):expect()
        if u22 then
            u21.abilityMaid:GiveTask(v28)
        else
            v28.Destroy()
        end
    end)
end
function u16.onDisable(p29) --[[ Line: 67 ]]
    p29.abilityMaid:DoCleaning()
end
function u16.KnitStart(p30) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u9
        [4] = u5
        [5] = u12
        [6] = u14
        [7] = u2
        [8] = u8
        [9] = u15
        [10] = u11
        [11] = u10
    --]]
    u7.KnitStart(p30)
    u6.AbilityUsed:connect(function(p31) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u5
            [3] = u12
            [4] = u14
            [5] = u2
            [6] = u8
        --]]
        local v32
        if p31.ability == u9.TREASURE_BACKPACK then
            v32 = p31.userCharacter == u5.LocalPlayer.Character
        else
            v32 = false
        end
        if v32 then
            local v33 = u12.getInventory(u5.LocalPlayer).backpack
            if v33 ~= nil then
                v33 = v33.itemType
            end
            v32 = v33 == u14.PORTABLE_VENDING_MACHINE
        end
        if v32 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.BEDWARS_ITEM_SHOP, {})
        end
    end)
    u15.Client:Get("PurchaseFromVendingMachine"):Connect(function() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
            [3] = u10
        --]]
        if not u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u11.BACKPACK) then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u11.BACKPACK, u10.VENDING_MACHINE_COOLDOWN)
        end
    end)
end
v3.CreateController(u16.new())
return nil