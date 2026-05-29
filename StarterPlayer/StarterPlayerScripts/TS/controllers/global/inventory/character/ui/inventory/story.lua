local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "hotbar", "ui", "hotbar-app").HotbarApp
local u9 = v1.import(script, script.Parent, "inventory-app").InventoryApp
local function u14(p10, p11) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    local v12 = p11 == nil and 1 or p11
    local v13 = u2("Accessory", {
        ["Name"] = p10,
        ["Children"] = { u2("Part", {
                ["Name"] = "Handle",
                ["Size"] = Vector3.new(0.8, 0.8, 0.8),
                ["Material"] = Enum.Material.SmoothPlastic,
                ["CFrame"] = CFrame.new(),
                ["Children"] = { u2("Attachment", {
                        ["Name"] = "RightGripAttachment",
                        ["CFrame"] = CFrame.new()
                    }) }
            }) }
    })
    v13:SetAttribute("InvItem", true)
    v13:SetAttribute("Amount", v12)
    v13:SetAttribute("AddedToBackpackTime", u4:GetServerTimeNow())
    return v13
end
return function(p15) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u8
        [4] = u6
        [5] = u14
        [6] = u7
        [7] = u3
    --]]
    local u16 = u5("Inventory", u9, {}, {}, {
        ["Parent"] = p15
    })
    local u17 = u5("Hotbar", u8, {}, {}, {
        ["Parent"] = p15
    })
    u6:dispatch({
        ["type"] = "InventoryAddItem",
        ["tool"] = u14(u7.STONE)
    })
    u6:dispatch({
        ["type"] = "InventoryAddItem",
        ["tool"] = u14(u7.STONE_BRICK, 5)
    })
    u6:dispatch({
        ["type"] = "InventoryAddItem",
        ["tool"] = u14(u7.WOOL_RED, 4)
    })
    u6:dispatch({
        ["type"] = "InventoryAddItem",
        ["tool"] = u14(u7.WOOL_WHITE, 20)
    })
    u6:dispatch({
        ["type"] = "InventoryAddItem",
        ["tool"] = u14(u7.WOOL_BLUE, 45)
    })
    return function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u16
            [3] = u17
        --]]
        u3.unmount(u16)
        u3.unmount(u17)
    end
end