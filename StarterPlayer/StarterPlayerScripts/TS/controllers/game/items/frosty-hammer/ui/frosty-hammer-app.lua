local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.DeviceUtil
local u5 = v2.SlideIn
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = v1.import(script, script.Parent, "frosty-hammer-component").FrostyHammerComponent
local v12 = u6.Component:extend("FrostyHammerUpgradeAppBase")
function v12.init(_) --[[ Line: 16 ]] end
function v12.render(p13) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u10
        [4] = u6
        [5] = u3
        [6] = u5
        [7] = u4
        [8] = u11
    --]]
    local v14 = u9.getToolFromInventory(u8.LocalPlayer, u10.FROSTY_HAMMER)
    if v14 ~= nil then
        v14 = v14.tool
    end
    local v15 = u6.createElement
    local v16 = "ScreenGui"
    local v17 = {
        ["DisplayOrder"] = 20
    }
    local v18 = {}
    local v19 = u6.createElement(u3, {
        ["AppId"] = p13.props.AppId
    })
    local v20 = u6.createElement
    local v21 = u5
    local v22 = {}
    local v23 = {}
    local v24 = u6.createElement
    local v25 = "ImageButton"
    local v26 = {
        ["BackgroundTransparency"] = 1,
        ["AutoButtonColor"] = false,
        ["Active"] = true,
        ["Modal"] = true,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v27
    if u4.isSmallScreen() then
        v27 = UDim2.fromScale(0.9, 0.9)
    else
        v27 = UDim2.fromScale(0.7, 0.7)
    end
    v26.Size = v27
    __set_list(v23, 1, {v24(v25, v26, { u6.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1.7735849056603774
    }), u6.createElement(u11, {
        ["tool"] = v14
    }) })})
    __set_list(v18, 1, {v19, v20(v21, v22, v23)})
    return v15(v16, v17, v18)
end
return {
    ["FrostyHammerUpgradeApp"] = v7.connect(function(_, p28) --[[ Line: 51 ]]
        return p28
    end)(v12)
}