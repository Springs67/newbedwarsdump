local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.HttpService
local u7 = v4.Players
local u8 = v4.ReplicatedStorage
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "armor-item-skin-util").ArmorItemSkinUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").AccessoriesCovered
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").Entity
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "hand-item-cache-util").HandItemCacheUtil
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "InventoryEntity"
    end,
    ["__index"] = u17
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22, p23) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p22, p23)
end
function u19.onServerSetup(u24) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u6
        [3] = u7
        [4] = u19
        [5] = u8
        [6] = u3
        [7] = u5
    --]]
    u17.onServerSetup(u24)
    local v25 = u6:GenerateGUID(false)
    local v26 = u7:GetPlayerFromCharacter(u24.instance)
    if v26 then
        v25 = u19:getInventoryFolderName(v26)
    end
    u24.inventoryFolder = u8:WaitForChild("Inventories"):FindFirstChild(v25) or u3("Folder", {
        ["Name"] = v25,
        ["Parent"] = u8:WaitForChild("Inventories")
    })
    u24.inventoryFolderLink = u3("ObjectValue", {
        ["Name"] = "InventoryFolder",
        ["Value"] = u24.inventoryFolder,
        ["Parent"] = u24.instance
    })
    u24.handItemLink = u3("ObjectValue", {
        ["Name"] = "HandInvItem",
        ["Value"] = nil,
        ["Parent"] = u24.instance
    })
    u24.armorItemsLink = {}
    local v27 = false
    local v28 = 0
    while true do
        if v27 then
            v28 = v28 + 1
        else
            v27 = true
        end
        if v28 >= 3 then
            u24.backbackLink = u3("ObjectValue", {
                ["Name"] = "BedWarsBackpackSlot",
                ["Value"] = nil,
                ["Parent"] = u24.instance
            })
            u3("ObjectValue", {
                ["Name"] = "ObservedChestFolder",
                ["Value"] = nil,
                ["Parent"] = u24.instance
            })
            u5:AddTag(u24.instance, "inventory-entity")
            task.spawn(function() --[[ Line: 91 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                local v29 = u24.instance:WaitForChild("InventoryFolder", 10)
                if v29 ~= nil then
                    v29 = v29.Value
                end
                u24.inventoryFolder = v29
            end)
            u24.newInvFolderConn = u24.instance.ChildAdded:Connect(function(p30) --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                local v31
                if p30.Name == "InventoryFolder" then
                    v31 = p30:IsA("ObjectValue")
                else
                    v31 = false
                end
                if v31 then
                    v31 = p30.Value
                    if v31 ~= nil then
                        v31 = v31:IsA("Folder")
                    end
                end
                if v31 then
                    u24.inventoryFolder = p30.Value
                end
            end)
            u24.removedInvFolderConn = u24.instance.ChildRemoved:Connect(function(p32) --[[ Line: 113 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                if p32.Name == "InventoryFolder" and p32:IsA("ObjectValue") then
                    u24.inventoryFolder = nil
                end
            end)
            return
        end
        local v33 = u24.armorItemsLink
        local v34 = u3("ObjectValue", {
            ["Value"] = nil,
            ["Name"] = "ArmorInvItem_" .. tostring(v28),
            ["Parent"] = u24.instance
        })
        table.insert(v33, v34)
    end
end
function u19.getInventoryFolderName(_, p35) --[[ Line: 119 ]]
    return p35.Name
end
function u19.kill(p36) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.kill(p36)
    p36:cleanup()
end
function u19.cleanup(p37) --[[ Line: 126 ]]
    if p37.inventoryFolderLink then
        p37.inventoryFolderLink.Value = nil
    end
    if p37.handItemLink then
        p37.handItemLink.Value = nil
    end
    if p37.backbackLink then
        p37.backbackLink.Value = nil
    end
    local v38 = p37.armorItemsLink
    if v38 ~= nil then
        table.clear(v38)
    end
    p37.inventoryFolder = nil
    local v39 = p37.newInvFolderConn
    if v39 ~= nil then
        v39:Disconnect()
    end
    local v40 = p37.removedInvFolderConn
    if v40 ~= nil then
        v40:Disconnect()
    end
end
function u19.waitForInventoryFolder(p41, p42) --[[ Line: 152 ]]
    if not p41.inventoryFolder then
        p41.inventoryFolder = p41.instance:WaitForChild("InventoryFolder", p42 == nil and 6 or p42).Value
    end
    return p41.inventoryFolder
end
function u19.getInventoryFolder(p43) --[[ Line: 164 ]]
    if not p43.inventoryFolder then
        local v44 = p43.instance:FindFirstChild("InventoryFolder")
        if v44 ~= nil then
            v44 = v44.Value
        end
        p43.inventoryFolder = v44
    end
    return p43.inventoryFolder
end
function u19.inventoryFolderAddedEvent(p45, u46) --[[ Line: 175 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local u47 = u2.new()
    u47:GiveTask(p45.instance.ChildAdded:Connect(function(p48) --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u47
        --]]
        if p48.Name == "InventoryFolder" and p48:IsA("ObjectValue") then
            local v49 = p48.Value
            if v49 then
                u46(v49)
            end
            u47:GiveTask(p48.Changed:Connect(function(p50) --[[ Line: 183 ]]
                --[[
                Upvalues:
                    [1] = u46
                --]]
                if p50 then
                    u46(p50)
                end
            end))
        end
    end))
    return u47
end
function u19.getItemInHandClient(p51) --[[ Line: 192 ]]
    local v52 = nil
    for v53, v54 in p51.instance:GetChildren() do
        local _ = v53 - 1
        local v55
        if v54:GetAttribute("InvItem") == true and v54:GetAttribute("ArmorSlot") == nil then
            v55 = v54:GetAttribute("IsBackpack") == nil
        else
            v55 = false
        end
        if v55 == true then
            return v54
        end
    end
    return v52
end
function u19.getItemInHand(p56) --[[ Line: 208 ]]
    if p56.instance:FindFirstChild("HandInvItem") then
        return p56.instance.HandInvItem.Value
    else
        return nil
    end
end
function u19.getItemTypeInHand(p57) --[[ Line: 214 ]]
    if not p57.instance:FindFirstChild("HandInvItem") then
        return nil
    end
    local v58 = p57.instance.HandInvItem.Value
    if v58 ~= nil then
        v58 = v58.Name
    end
    return v58
end
function u19.getItemsFromArmorSlot(p59, p60) --[[ Line: 224 ]]
    local v61 = 0
    local v62 = {}
    for v63, v64 in p59.instance:GetChildren() do
        local _ = v63 - 1
        if v64:GetAttribute("ArmorSlot") == p60 == true then
            v61 = v61 + 1
            v62[v61] = v64
        end
    end
    return v62
end
function u19.getBackpack(p65) --[[ Line: 241 ]]
    local v66 = 0
    local v67 = {}
    for v68, v69 in p65.instance:GetChildren() do
        local _ = v68 - 1
        if v69:GetAttribute("IsBackpack") == true == true then
            v66 = v66 + 1
            v67[v66] = v69
        end
    end
    return v67
end
function u19.getHandItemInstanceFromCharacter(p70) --[[ Line: 258 ]]
    local v71 = p70:getItemInHand()
    if v71 then
        local v72 = p70.instance:FindFirstChild(v71.Name)
        if v72 and v72:IsA("Accessory") then
            return v72
        else
            return nil
        end
    else
        return nil
    end
end
function u19.getItemInstanceFromCharacter(p73, p74) --[[ Line: 269 ]]
    local v75 = p73.instance:FindFirstChild(p74)
    if v75 and v75:IsA("Accessory") then
        return v75
    else
        return nil
    end
end
function u19.getItemInstanceFromArmorSlot(p76, p77) --[[ Line: 276 ]]
    return p76:getInstance():WaitForChild("ArmorInvItem_" .. tostring(p77)).Value
end
function u19.getAllDisplayedInventoryItems(p78) --[[ Line: 280 ]]
    local v79 = 0
    local v80 = {}
    for v81, v82 in p78.instance:GetChildren() do
        local _ = v81 - 1
        if v82:GetAttribute("InvItem") == true == true then
            v79 = v79 + 1
            v80[v79] = v82
        end
    end
    return v80
end
function u19.setAccessoryVisibility(p83, p84, p85) --[[ Line: 297 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
    --]]
    local v86 = p83:getHumanoid()
    if v86 ~= nil then
        v86 = v86:GetAccessories()
    end
    for _, v87 in v86 == nil and {} or v86 do
        local v88 = v87:FindFirstChild("Handle")
        local v89
        if v88 == nil then
            v89 = v88
        else
            v89 = v88:FindFirstChildOfClass("Attachment")
        end
        if v88 and (v89 and (not u8.Assets.Armor:FindFirstChild(v87.Name, true) and (not u8.Assets.ArmorTrims:FindFirstChild(v87.Name, true) and v87:GetAttribute("NoArmorHide") ~= true))) then
            local v90 = false
            for _, v91 in u11[p84] do
                local v92 = string.lower(v89.Name)
                local v93 = string.lower(v91)
                v90 = string.match(v92, v93) ~= nil
                if v90 then
                    break
                end
            end
            if v90 then
                v88.Transparency = p85 and 0 or 1
            end
        end
    end
end
function u19.equipArmorTrim(p94, p95, p96, p97) --[[ Line: 346 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u15
        [4] = u16
    --]]
    if not u8:WaitForChild("Assets"):WaitForChild("ArmorTrims"):WaitForChild(p97.type) then
        return nil
    end
    local v98 = u9.createArmorTrims(p97.type, p97.color, p97.effectRank)
    local v99 = {}
    for _, v100 in v98 do
        for _, v101 in { "helmet", "chestplate", "boots" } do
            if table.find(string.split(p95.Name, "_"), v101) ~= nil and table.find(string.split(v100.Name, "_"), v101) ~= nil then
                v100:SetAttribute("ArmorSlot", p96)
                u15:addAccessory(p94.instance, v100)
                table.insert(v99, v100)
            end
        end
    end
    u16:weldCharacterAccessories(p94.instance)
    local v102 = 0
    local v103 = {}
    for v104, v105 in v98 do
        local _ = v104 - 1
        if table.find(v99, v105) == nil == true then
            v102 = v102 + 1
            v103[v102] = v105
        end
    end
    for v106, v107 in v103 do
        local _ = v106 - 1
        v107:Destroy()
    end
end
function u19.equipArmorItem(p108, p109, p110, p111) --[[ Line: 386 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
        [3] = u10
        [4] = u8
        [5] = u15
        [6] = u16
        [7] = u13
    --]]
    local v112 = u14.EntityEquipArmorVisuals:fire(p108, p109, p110)
    for v113, v114 in p108:getItemsFromArmorSlot(p110) do
        local _ = v113 - 1
        v114:Destroy()
    end
    p108:setAccessoryVisibility(p110, false)
    if p111 then
        p108:equipArmorTrim(p109, p110, p111)
    end
    local v115 = u7:GetPlayerFromCharacter(p108.instance)
    if v115 ~= nil then
        v115 = v115:GetAttribute("HasArmorEnchant")
    end
    local v116 = u10.getArmorFolderName(p109.Name, p109:GetAttribute("ItemSkin"), p110, v115 == true)
    if not v112.hideArmor then
        for _, v117 in u8:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(v116):GetChildren() do
            local v118 = v117:Clone()
            v118:SetAttribute("ArmorSlot", p110)
            u15:addAccessory(p108.instance, v118)
            v118:AddTag("armor")
        end
        u16:weldCharacterAccessories(p108.instance)
    end
    local v119 = p108:isAlive() and (u7.LocalPlayer.Character == p108.instance and p108.instance:FindFirstChild("ArmorInvItem_" .. tostring(p110)))
    if v119 then
        v119.Value = p109
        u13.Client:Get("SetArmorInvItem"):CallServerAsync({
            ["item"] = p109,
            ["armorSlot"] = p110
        }):andThen(function() --[[ Line: 426 ]] end)
    end
end
function u19.unequipArmorSlot(p120, p121) --[[ Line: 432 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
    --]]
    for v122, v123 in p120:getItemsFromArmorSlot(p121) do
        local _ = v122 - 1
        v123:Destroy()
    end
    p120:setAccessoryVisibility(p121, true)
    local v124 = p120:isAlive() and (u7.LocalPlayer.Character == p120.instance and p120.instance:FindFirstChild("ArmorInvItem_" .. tostring(p121)))
    if v124 then
        v124.Value = nil
        u13.Client:Get("SetArmorInvItem"):CallServerAsync({
            ["item"] = false,
            ["armorSlot"] = p121
        }):andThen(function() --[[ Line: 451 ]] end)
    end
end
function u19.equipBackpack(p125, p126) --[[ Line: 457 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u15
        [3] = u16
        [4] = u7
        [5] = u13
    --]]
    for v127, v128 in p125:getBackpack() do
        local _ = v127 - 1
        v128:Destroy()
    end
    local v129 = u8:WaitForChild("Items"):WaitForChild(p126.Name):Clone()
    v129:SetAttribute("IsBackpack", true)
    u15:addAccessory(p125.instance, v129)
    u16:weldCharacterAccessories(p125.instance)
    local v130 = p125:isAlive() and (u7.LocalPlayer.Character == p125.instance and p125.instance:FindFirstChild("BedWarsBackpackSlot"))
    if v130 then
        v130.Value = p126
        u13.Client:Get("SetBackpackInvItem"):CallServerAsync({
            ["item"] = p126
        }):andThen(function() --[[ Line: 477 ]] end)
    end
end
function u19.unequipBackpackSlot(p131) --[[ Line: 483 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
    --]]
    for v132, v133 in p131:getBackpack() do
        local _ = v132 - 1
        v133:Destroy()
    end
    local v134 = p131:isAlive() and (u7.LocalPlayer.Character == p131.instance and p131.instance:FindFirstChild("BedWarsBackpackSlot"))
    if v134 then
        v134.Value = nil
        u13.Client:Get("SetBackpackInvItem"):CallServerAsync({
            ["item"] = false
        }):andThen(function() --[[ Line: 499 ]] end)
    end
end
function u19.equipItem(p135, u136) --[[ Line: 505 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
        [3] = u8
        [4] = u14
        [5] = u7
        [6] = u13
    --]]
    for v137, v138 in p135:getAllDisplayedInventoryItems() do
        local _ = v137 - 1
        v138:Destroy()
    end
    local v139 = u12(u136.Name)
    local u140 = u136:Clone()
    u136.AttributeChanged:Connect(function(p141) --[[ Line: 517 ]]
        --[[
        Upvalues:
            [1] = u140
            [2] = u136
        --]]
        u140:SetAttribute(p141, u136:GetAttribute(p141))
    end)
    if v139.armor then
        for v142, v143 in u140:GetDescendants() do
            local _ = v142 - 1
            if v143:IsA("Attachment") then
                v143.Name = "RightGripAttachment"
            end
        end
    end
    u16:weldAccessory(p135.instance, u140)
    if v139.additionalAccessories then
        for _, v144 in v139.additionalAccessories do
            local v145 = u8:FindFirstChild("Items")
            if v145 ~= nil then
                v145 = v145:FindFirstChild(v144)
                if v145 ~= nil then
                    v145 = v145:Clone()
                end
            end
            if v145 then
                u16:weldAccessory(p135.instance, u140)
            end
        end
    end
    u14.HandItemRendered:fire(u140, u136.Name, p135.instance)
    if p135:isAlive() and (u7.LocalPlayer.Character == p135.instance and p135.instance:FindFirstChild("HandInvItem")) then
        p135.instance.HandInvItem.Value = u136
        task.spawn(function() --[[ Line: 556 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u136
            --]]
            local v146 = {
                ["hand"] = u136
            }
            u13.Client:Get("SetInvItem"):CallServerAsync(v146):andThen(function() --[[ Line: 560 ]] end)
        end)
    end
end
function u19.unequipItemInHand(p147) --[[ Line: 567 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u18
        [3] = u13
    --]]
    local v148 = p147:getItemInHandClient()
    local v149 = u7:GetPlayerFromCharacter(p147.instance)
    if v149 and v148 then
        u18:cacheItem(v149, v148)
    elseif v148 then
        v148:Destroy()
    end
    if p147:isAlive() and (u7.LocalPlayer.Character == p147.instance and p147.instance:FindFirstChild("HandInvItem")) then
        p147.instance.HandInvItem.Value = nil
        task.spawn(function() --[[ Line: 581 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.Client:Get("SetInvItem"):CallServerAsync({
                ["hand"] = false
            }):andThen(function() --[[ Line: 585 ]] end)
        end)
    end
end
function u19.hideHandItem(p150) --[[ Line: 592 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v151 = u2.new()
    local v152 = p150:getHandItemInstanceFromCharacter()
    if not v152 then
        return v151
    end
    local u153 = {}
    local u154 = {}
    local v155 = v152:GetDescendants()
    local function v157(p156) --[[ Line: 601 ]]
        --[[
        Upvalues:
            [1] = u153
            [2] = u154
        --]]
        if p156:IsA("Part") or p156:IsA("MeshPart") then
            u153[p156] = p156.Transparency
            p156.Transparency = 1
        elseif p156:IsA("ParticleEmitter") or (p156:IsA("Smoke") or (p156:IsA("Fire") or (p156:IsA("Sparkles") or (p156:IsA("Trail") or p156:IsA("Beam"))))) then
            u154[p156] = p156.Enabled
            p156.Enabled = false
        end
    end
    for v158, v159 in v155 do
        v157(v159, v158 - 1, v155)
    end
    v151:GiveTask(function() --[[ Line: 617 ]]
        --[[
        Upvalues:
            [1] = u153
            [2] = u154
        --]]
        for v160, v161 in u153 do
            if (v160:IsA("Part") or v160:IsA("MeshPart")) and (v160 and v160.Parent ~= nil) then
                v160.Transparency = v161
            end
        end
        table.clear(u153)
        local function v164(p162, p163) --[[ Line: 629 ]]
            if (p163:IsA("ParticleEmitter") or (p163:IsA("Smoke") or (p163:IsA("Fire") or (p163:IsA("Sparkles") or (p163:IsA("Trail") or p163:IsA("Beam")))))) and (p163 and p163.Parent ~= nil) then
                p163.Enabled = p162
            end
        end
        for v165, v166 in u154 do
            v164(v166, v165, u154)
        end
        table.clear(u154)
    end)
    return v151
end
return {
    ["InventoryEntity"] = u19
}