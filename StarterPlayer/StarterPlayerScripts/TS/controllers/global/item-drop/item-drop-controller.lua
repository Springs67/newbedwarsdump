local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v4 = v3.ConstantManager
local u5 = v3.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.Players
local u10 = v7.Workspace
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "apps").AppConfiguration
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-util").ShopUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v4.registerConstants(script, {
    ["PickupPerItemCooldown"] = 0.3
})
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "ItemDropController"
    end,
    ["__index"] = u11
})
u21.__index = u21
function u21.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p24)
    p24.Name = "ItemDropController"
end
function u21.KnitStart(u25) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
        [3] = u12
    --]]
    u1.Promise.defer(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u25
        --]]
        while true do
            local v26 = task.wait(0.2)
            if v26 == 0 or (v26 ~= v26 or not v26) then
                break
            end
            u1.Promise.defer(function() --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:checkForPickup()
            end)
        end
    end)
    local v28 = {
        ["actionId"] = "drop-item",
        ["action"] = "DropItem",
        ["boundFunction"] = function(_, p27, _) --[[ Name: boundFunction, Line 58 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u12
                [3] = u25
            --]]
            if p27 == Enum.UserInputState.Begin and not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u12.INVENTORY) then
                u25:dropItemInHand()
            end
        end
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v28)
end
function u21.dropItemInHand(_) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u17
        [3] = u5
        [4] = u19
    --]]
    local v29 = u13:getState().Inventory.observedInventory.inventory.hand
    local v30 = v29 ~= nil and u17.Client:Get("DropItem"):CallServer({
        ["item"] = v29.tool
    })
    if v30 then
        u5:playSound(u19.DROP_ITEM)
        v30:SetAttribute("ClientDropTime", tick())
    end
end
function u21.dropHotbarItem(_, p31) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u17
        [3] = u5
        [4] = u19
    --]]
    local v32 = u13:getState().Inventory.observedInventory.hotbar[p31 + 1].item
    if not v32 then
        return false
    end
    local v33 = u17.Client:Get("DropItem"):CallServer({
        ["item"] = v32.tool,
        ["amount"] = v32.amount
    })
    if v33 then
        u5:playSound(u19.DROP_ITEM)
        v33:SetAttribute("ClientDropTime", tick())
    end
    return v33 ~= nil
end
function u21.checkForPickup(_) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u16
        [4] = u10
        [5] = u20
        [6] = u15
        [7] = u18
        [8] = u14
        [9] = u17
        [10] = u5
        [11] = u19
    --]]
    if u9.LocalPlayer:GetAttribute("BlockItemPickup") == true then
        return nil
    end
    local u34 = u9.LocalPlayer.Character and u9.LocalPlayer.Character.PrimaryPart
    if u34 then
        local v35 = u8:GetTagged("ItemDrop")
        local u36 = u9.LocalPlayer:GetAttribute("ResourcePickupRange")
        local function v40(p37) --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u36
                [3] = u34
            --]]
            local v38
            if (p37.Name == u16.DIAMOND or p37.Name == u16.EMERALD) and u36 ~= nil then
                v38 = p37:GetAttribute("OreGenDrop") == true
            else
                v38 = false
            end
            if v38 then
                local v39 = p37:GetAttribute("TeamGeneratorItemDrop")
                if v39 == 0 or v39 ~= v39 then
                    v39 = false
                elseif v39 == "" then
                    v39 = false
                end
                v38 = not v39
            end
            if v38 then
                return (u34.Position - p37.Position).Magnitude <= u36
            else
                return (u34.Position - p37.Position).Magnitude <= 6
            end
        end
        local v41 = 0
        local v42 = {}
        for v43, v44 in v35 do
            if v40(v44, v43 - 1, v35) == true then
                v41 = v41 + 1
                v42[v41] = v44
            end
        end
        local v45 = 0
        local v46 = {}
        for v47, v48 in v42 do
            local _ = v47 - 1
            if u10:GetServerTimeNow() > v48:GetAttribute("PickupReadyTime") == true then
                v45 = v45 + 1
                v46[v45] = v48
            end
        end
        local v49 = 0
        local v50 = {}
        for v51, v52 in v46 do
            local _ = v51 - 1
            local v53 = v52:GetAttribute("ClientPickupAttemptTime")
            if (v53 == nil and true or tick() - v53 > u20.PickupPerItemCooldown) == true then
                v49 = v49 + 1
                v50[v49] = v52
            end
        end
        local v54 = 0
        local v55 = {}
        for v56, v57 in v50 do
            local _ = v56 - 1
            u15(v57.Name)
            local v58 = u18:getMaxStackForPlayer(u9.LocalPlayer, v57.Name)
            local v59
            if v58 == nil then
                v59 = true
            else
                local v60 = u14.getToolFromInventory(u9.LocalPlayer, v57.Name)
                local v61
                if v60 == nil then
                    v61 = v60
                else
                    v61 = v60.amount
                end
                v59 = v61 == nil or v58 > v60.amount
            end
            if v59 == true then
                v54 = v54 + 1
                v55[v54] = v57
            end
        end
        local v62 = false
        local v63 = 0
        local u64 = false
        while true do
            if true then
                if v62 then
                    v63 = v63 + 1
                else
                    v62 = true
                end
            end
            local v65 = #v55
            if v63 >= math.min(5, v65) then
                break
            end
            local u66 = v55[v63 + 1]
            u66:SetAttribute("ClientPickupAttemptTime", tick())
            u17.Client:Get("PickupItemDrop"):CallServerAsync({
                ["itemDrop"] = u66
            }):andThen(function(p67) --[[ Line: 245 ]]
                --[[
                Upvalues:
                    [1] = u64
                    [2] = u5
                    [3] = u19
                    [4] = u15
                    [5] = u66
                    [6] = u34
                --]]
                if p67 and not u64 then
                    u5:playSound(u19.PICKUP_ITEM_DROP)
                    local v68 = u15(u66.Name).pickUpOverlaySound
                    if v68 ~= "" and v68 then
                        u5:playSound(v68, {
                            ["volumeMultiplier"] = 0.9,
                            ["position"] = u34.Position
                        })
                    end
                    u64 = true
                end
            end)
        end
    end
end
return {
    ["ItemDropController"] = v6.CreateController(u21.new())
}