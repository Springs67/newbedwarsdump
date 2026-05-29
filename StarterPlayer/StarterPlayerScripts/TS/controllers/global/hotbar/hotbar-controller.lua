local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GamepadAction
local u5 = v3.WatchPlayer
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ContextActionService
local u12 = v10.Players
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "apps").AppConfiguration
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u20 = u1.import(script, script.Parent, "ui", "hotbar-app").HotbarApp
local u21 = {
    "HotbarSlot1",
    "HotbarSlot2",
    "HotbarSlot3",
    "HotbarSlot4",
    "HotbarSlot5",
    "HotbarSlot6",
    "HotbarSlot7",
    "HotbarSlot8",
    "HotbarSlot9"
}
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "HotbarController"
    end,
    ["__index"] = u14
})
u22.__index = u22
function u22.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
    --]]
    u14.constructor(p25)
    p25.Name = "HotbarController"
    p25.maid = u8.new()
    p25.hotbarHiddenIds = {}
end
function u22.KnitStart(u26) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u12
        [3] = u2
        [4] = u15
        [5] = u17
        [6] = u21
        [7] = u11
        [8] = u4
        [9] = u18
        [10] = u1
        [11] = u7
        [12] = u19
        [13] = u13
    --]]
    u5(function(p27) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u26
        --]]
        if p27.UserId == u12.LocalPlayer.UserId then
            u26:mountHotbar()
        end
    end)
    u12.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26:mountHotbar()
    end)
    local function v34(p28) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
            [3] = u17
            [4] = u26
        --]]
        local v33 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            ["action"] = p28,
            ["actionId"] = "keyboard-" .. p28,
            ["boundFunction"] = function(p29, p30, _) --[[ Name: boundFunction, Line 60 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u15
                    [3] = u17
                --]]
                if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u15.INVENTORY) then
                    return Enum.ContextActionResult.Pass
                end
                if p30 == Enum.UserInputState.Begin then
                    local v31 = string.split(p29, "HotbarSlot")[2]
                    local v32 = tonumber(v31)
                    u17:dispatch({
                        ["type"] = "InventorySelectHotbarSlot",
                        ["slot"] = (v32 == nil and 1 or v32) - 1
                    })
                    return Enum.ContextActionResult.Sink
                end
            end,
            ["priority"] = Enum.ContextActionPriority.High.Value
        })
        u26.maid:GiveTask(v33)
    end
    for v35, v36 in u21 do
        v34(v36, v35 - 1, u21)
    end
    u11:BindAction("hotbar-gamepad", function(_, p37, p38) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u4
        --]]
        if p37 == Enum.UserInputState.Begin then
            local v39 = u17:getState().Inventory.observedInventory.hotbarSlot
            if p38.KeyCode == u4.HotbarRight then
                local v40 = v39 + 1
                v39 = math.clamp(v40, 0, 8)
            elseif p38.KeyCode == u4.HotbarLeft then
                local v41 = v39 - 1
                v39 = math.clamp(v41, 0, 8)
            end
            u17:dispatch({
                ["type"] = "InventorySelectHotbarSlot",
                ["slot"] = v39
            })
        end
    end, false, u4.HotbarRight, u4.HotbarLeft)
    u26.maid:GiveTask(function() --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:UnbindAction("hotbar-gamepad")
    end)
    local function u45(p42) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u18
        --]]
        if p42.Inventory.observedPlayer == u12.LocalPlayer and p42.Inventory.observedPlayer.Character then
            local v43 = u18:getEntity(p42.Inventory.observedPlayer)
            if v43 and v43:isAlive() then
                local v44 = p42.Inventory.observedInventory.hotbar[p42.Inventory.observedInventory.hotbarSlot + 1]
                if v44.item then
                    v43:equipItem(v44.item.tool)
                    return
                end
                v43:unequipItemInHand()
            end
        end
    end
    local function u53(p46, u47) --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u18
            [3] = u1
        --]]
        if p46.Inventory.observedPlayer == u12.LocalPlayer and p46.Inventory.observedPlayer.Character then
            local u48 = u18:getEntity(p46.Inventory.observedPlayer)
            if u48 and u48:isAlive() then
                local u49 = p46.Inventory.observedInventory.inventory.armor[u47 + 1]
                if u49 ~= "empty" then
                    u1.Promise.defer(function() --[[ Line: 124 ]]
                        --[[
                        Upvalues:
                            [1] = u48
                            [2] = u49
                            [3] = u47
                        --]]
                        local v50 = u48:getPlayer()
                        if v50 ~= nil then
                            v50 = v50:GetAttribute("ArmorTrimType")
                        end
                        local v51 = u48:getPlayer()
                        if v51 ~= nil then
                            v51 = v51:GetAttribute("ArmorTrimColor")
                        end
                        local v52 = u48:getPlayer()
                        if v52 ~= nil then
                            v52 = v52:GetAttribute("ArmorTrimEffectRank")
                        end
                        u48:equipArmorItem(u49.tool, u47, v50 and (v51 ~= nil and v52 ~= nil) and {
                            ["type"] = v50,
                            ["color"] = v51,
                            ["effectRank"] = v52
                        } or nil)
                    end)
                    return
                end
                u1.Promise.defer(function() --[[ Line: 148 ]]
                    --[[
                    Upvalues:
                        [1] = u48
                        [2] = u47
                    --]]
                    u48:unequipArmorSlot(u47)
                end)
            end
        end
    end
    local function u57(p54) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u18
            [3] = u1
        --]]
        if p54.Inventory.observedPlayer == u12.LocalPlayer and p54.Inventory.observedPlayer.Character then
            local u55 = u18:getEntity(p54.Inventory.observedPlayer)
            if u55 and u55:isAlive() then
                local u56 = p54.Inventory.observedInventory.inventory.backpack
                if u56 then
                    u1.Promise.defer(function() --[[ Line: 163 ]]
                        --[[
                        Upvalues:
                            [1] = u55
                            [2] = u56
                        --]]
                        u55:equipBackpack(u56.tool)
                    end)
                    return
                end
                u1.Promise.defer(function() --[[ Line: 167 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                    --]]
                    u55:unequipBackpackSlot()
                end)
            end
        end
    end
    u17.changed:connect(function(p58, p59) --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u7
            [3] = u19
            [4] = u53
            [5] = u57
            [6] = u13
            [7] = u12
        --]]
        local v60, v61
        if p58.Inventory.observedInventory.inventory.hand == p59.Inventory.observedInventory.inventory.hand then
            v60 = false
            v61 = 0
        else
            u45(p58)
            v60 = false
            v61 = 0
        end
        while true do
            if v60 then
                v61 = v61 + 1
            else
                v60 = true
            end
            if v61 >= #u7.values(u19) then
                if p58.Inventory.observedInventory.inventory.backpack ~= p59.Inventory.observedInventory.inventory.backpack then
                    u57(p58)
                    local v62 = u13.BackpackEquipEvent
                    local v63 = p58.Inventory.observedInventory.inventory.backpack
                    if v63 ~= nil then
                        v63 = v63.itemType
                    end
                    v62:fire(v63, u12.LocalPlayer, p58.Inventory.observedInventory.inventory.backpack)
                end
                return
            end
            if p58.Inventory.observedInventory.inventory.armor[v61 + 1] ~= p59.Inventory.observedInventory.inventory.armor[v61 + 1] then
                u53(p58, v61)
            end
        end
    end)
    u12.LocalPlayer.CharacterAdded:Connect(function(p64) --[[ Line: 206 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u17
            [3] = u7
            [4] = u19
            [5] = u53
        --]]
        p64:WaitForChild("HandInvItem", 1)
        u45(u17:getState())
        local v65 = false
        local v66 = 0
        while true do
            if v65 then
                v66 = v66 + 1
            else
                v65 = true
            end
            if v66 >= #u7.values(u19) then
                return
            end
            u53(u17:getState(), v66)
        end
    end)
    if u12.LocalPlayer.Character then
        task.wait(0.2)
        u45(u17:getState())
        local v67 = false
        local v68 = 0
        while true do
            if true then
                if v67 then
                    v68 = v68 + 1
                else
                    v67 = true
                end
            end
            if v68 >= #u7.values(u19) then
                break
            end
            u53(u17:getState(), v68)
        end
    end
end
function u22.mountHotbar(p69) --[[ Line: 245 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u20
    --]]
    p69:unmountHotbar()
    p69.hotbar = u16("hotbar", u20)
end
function u22.unmountHotbar(p70) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p70.hotbar then
        u9.unmount(p70.hotbar)
        p70.hotbar = nil
    end
end
function u22.selectHotbarItemGroup(_, p71) --[[ Line: 255 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17:dispatch({
        ["type"] = "InventorySelectHotbarItemGroup",
        ["itemGroup"] = p71
    })
end
function u22.hideHotbar(p72, p73) --[[ Line: 261 ]]
    local v74 = p72.hotbarHiddenIds
    table.insert(v74, p73)
    p72:unmountHotbar()
end
function u22.unhideHotbar(p75, p76) --[[ Line: 267 ]]
    local v77 = p75.hotbarHiddenIds
    local v78 = (table.find(v77, p76) or 0) - 1
    if v78 ~= -1 then
        table.remove(p75.hotbarHiddenIds, v78 + 1)
    end
    if #p75.hotbarHiddenIds == 0 then
        p75:mountHotbar()
    end
end
return {
    ["HotbarController"] = v6.CreateController(u22.new())
}