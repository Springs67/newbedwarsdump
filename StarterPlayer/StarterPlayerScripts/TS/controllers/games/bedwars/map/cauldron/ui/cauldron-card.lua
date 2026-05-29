local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.SoundManager
local u6 = v2.UIUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v14 = u8.Component:extend("CauldronCard")
function v14.init(p15) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    p15.ref = u8.createRef()
    p15.maid = u7.new()
end
function v14.didMount(u16) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u5
        [4] = u12
    --]]
    local v17 = u9.GamepadEnabled and (not u9.MouseEnabled and u16.ref:getValue())
    if v17 then
        u6:selectGui(v17)
        u16.maid:GiveTask(v17.MouseButton1Down:Connect(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u5
                [3] = u12
            --]]
            if u16:hasEnough() then
                u16:purchase()
            else
                u5:playSound(u12.UI_CLICK)
            end
        end))
    end
end
function v14.willUnmount(p18) --[[ Line: 37 ]]
    p18.maid:DoCleaning()
end
function v14.purchase(p19) --[[ Line: 40 ]]
    p19.props.Purchased()
end
function v14.hasEnough(p20) --[[ Line: 43 ]]
    local v21 = nil
    for v22, v23 in p20.props.ObservedInventory.inventory.items do
        local _ = v22 - 1
        if v23.itemType == p20.props.Currency == true then
            v21 = v23
            break
        end
    end
    if v21 ~= nil then
        v21 = v21.amount
    end
    return (v21 == nil and 0 or v21) >= p20.props.Price
end
function v14.render(u24) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u4
        [4] = u3
        [5] = u10
        [6] = u11
        [7] = u5
        [8] = u12
    --]]
    local v25 = u24:hasEnough()
    local v26 = {
        [u8.Ref] = u24.ref,
        ["Size"] = u24.props.Size or UDim2.fromScale(0.2, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.15),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["BackgroundColor3"] = u13.backgroundPrimary,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = u24.props.LayoutOrder,
        ["AutoButtonColor"] = false,
        ["Selectable"] = true,
        ["Modal"] = true
    }
    local v27 = { u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.01, 0)
        }) }
    local v28 = #v27
    local v29 = {}
    local v30 = u24.props.AspectRatio
    v29.AspectRatio = v30 == nil and 0.8275862068965517 or v30
    v29.DominantAxis = "Height"
    v27[v28 + 1] = u8.createElement("UIAspectRatioConstraint", v29)
    v27[v28 + 2] = u8.createElement("Frame", {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.95, 0.12),
        ["Position"] = UDim2.fromScale(0.5, 0.015),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["BackgroundColor3"] = u13.backgroundSecondary
    }, { u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.01, 0)
        }), u8.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["Text"] = "<b>" .. u24.props.Name .. "</b>",
            ["Size"] = UDim2.fromScale(0.95, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }) })
    v27[v28 + 3] = u8.createElement("TextLabel", {
        ["Text"] = "",
        ["TextScaled"] = true,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["RichText"] = true,
        ["Font"] = "Roboto",
        ["TextXAlignment"] = "Center",
        ["TextYAlignment"] = "Top",
        ["Size"] = UDim2.fromScale(0.94, 0.325),
        ["Position"] = UDim2.fromScale(0.5, 0.42),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["TextColor3"] = u4.hexColor(13948390)
    })
    local v31
    if v25 then
        local v32 = {
            ["Size"] = UDim2.fromScale(0.92, 0.78),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = u13.backgroundSuccess
        }
        local v33 = u24.props.ButtonTextOverride
        v32.Text = v33 == nil and "" or v33
        v32.Selectable = false
        function v32.OnClick() --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:purchase()
        end
        v32[u8.Event.MouseButton2Click] = function() --[[ Line: 160 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:purchase()
        end
        v32.TextLabel = {
            ["Size"] = UDim2.fromScale(0.8, 0.85)
        }
        v31 = u8.createElement(u3, v32)
    else
        local v34 = u8.createElement
        local v35 = u3
        local v36 = {
            ["Selectable"] = false,
            ["Size"] = UDim2.fromScale(0.92, 0.78),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = u13.backgroundError
        }
        local v37 = u4.richTextColor(u10(u24.props.Currency).displayNameColor or Color3.fromRGB(255, 255, 255))
        local v38 = u24.props.Price
        v36.Text = "<b>Not Enough Items</b>\n<font color=\"" .. v37 .. "\"><b>" .. tostring(v38) .. " " .. u11.getDisplayName(u24.props.Currency) .. "</b></font>"
        function v36.OnClick() --[[ Line: 175 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u12
            --]]
            u5:playSound(u12.UI_CLICK)
        end
        v36.TextLabel = {
            ["Size"] = UDim2.fromScale(0.8, 0.85)
        }
        v31 = v34(v35, v36)
    end
    local v39 = {
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0, 1),
        ["Size"] = UDim2.fromScale(1, 0.15),
        ["BackgroundColor3"] = u13.backgroundTertiary
    }
    local v40 = {
        u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        }),
        [#v40 + 1] = v31
    }
    v27.ActionsSection = u8.createElement("Frame", v39, v40)
    return u8.createElement("ImageButton", v26, v27)
end
return {
    ["CauldronCard"] = v14
}