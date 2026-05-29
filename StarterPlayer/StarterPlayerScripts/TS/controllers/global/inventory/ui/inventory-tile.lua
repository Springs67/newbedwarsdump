local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CircularProgress
local u4 = v2.ColorUtil
local u5 = v2.ExpireList
local u6 = v2.SoundManager
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip
local u13 = v1.import(script, script.Parent.Parent.Parent, "hotbar", "lib", "hotbar-keyboard-numbers").HotbarKeyboardNumbers
local u14 = v1.import(script, script.Parent.Parent.Parent, "item-durability", "item-durability-bar").ItemDurabilityBar
local u15 = v1.import(script, script.Parent, "item-viewport").ItemViewport
local v16 = u9.Component:extend("InventoryTile")
function v16.init(p17, _) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u5
    --]]
    p17.maid = u8.new()
    p17.ref = u9.createRef()
    p17.hotbarSwapCooldown = u5.new(0.1)
    p17:setState({
        ["hovered"] = false,
        ["loading"] = false
    })
end
function v16.didMount(u18) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u13
        [3] = u7
    --]]
    u18.maid:GiveTask(u10.InputBegan:Connect(function(p19, p20) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u13
        --]]
        if u18.hotbarSwapCooldown:has("lock") then
            return nil
        end
        u18.hotbarSwapCooldown:add("lock")
        if p20 then
            return nil
        end
        local v21 = p19.KeyCode
        if table.find(u13, v21) ~= nil then
            local v22 = p19.KeyCode
            if table.find(u13, v22) ~= nil and u18.state.hovered then
                local v23 = p19.KeyCode.Value - 49
                u18.props.SendToHotbarSlot(v23)
            end
        end
    end))
    if u10.GamepadEnabled and (not u10.MouseEnabled and u18.props.AutoSelect) then
        u7:selectGui(u18.ref:getValue())
    end
end
function v16.willUnmount(p24) --[[ Line: 56 ]]
    p24.maid:DoCleaning()
end
function v16.render(u25) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u6
        [4] = u11
        [5] = u12
        [6] = u3
        [7] = u15
        [8] = u14
    --]]
    local v26 = u25.props.TileColor or u4.hexColor(4016991)
    local v27 = u25.props.TileBorderColor or u4.brighten(v26, 0.1)
    local v28 = u25.props.InvItem
    if v28 ~= nil then
        v28 = v28.tool:GetAttribute("Durability")
    end
    local v29 = v28 ~= nil
    local v30 = {
        [u9.Ref] = u25.ref,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = v26,
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = u25.props.LayoutOrder,
        ["Modal"] = true,
        [u9.Event.MouseButton1Click] = function() --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u6
                [3] = u11
            --]]
            if u25.props.InvItem and u25.props.ItemClickLoadingProgress then
                u25:setState({
                    ["loading"] = true
                })
                u6:playSound(u11.UI_CLICK, {
                    ["volumeMultiplier"] = 0.1
                })
            end
            u25.props.OnClick():andThen(function(_) --[[ Line: 85 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:setState({
                    ["loading"] = false
                })
            end)
        end,
        [u9.Event.MouseEnter] = function() --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u11
                [3] = u25
            --]]
            u6:playSound(u11.UI_HOVER)
            u25:setState({
                ["hovered"] = true
            })
        end,
        [u9.Event.MouseLeave] = function() --[[ Line: 98 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25:setState({
                ["hovered"] = false
            })
        end
    }
    local v31 = { u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        }), u9.createElement("UIStroke", {
            ["Thickness"] = 1.5,
            ["Color"] = v27
        }) }
    local v32 = #v31
    local v33 = {}
    local v34 = u25.props.InvItem
    if v34 ~= nil then
        v34 = v34.itemType
    end
    v33.item = v34
    v31[v32 + 1] = u9.createElement(u12, v33)
    local v35 = u25.state.loading
    if v35 then
        v35 = u9.createElement(u3, {
            ["Duration"] = 0.2,
            ["Transparency"] = 0.3,
            ["Size"] = UDim2.fromScale(0.45, 0.45),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        })
    end
    if v35 then
        v31[v32 + 2] = v35
    end
    local v36 = #v31
    local v37
    if u25.props.InvItem == nil then
        v37 = false
    else
        v37 = u9.createElement(u15, {
            ["ItemType"] = u25.props.InvItem.itemType,
            ["Amount"] = u25.props.InvItem.amount,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        })
    end
    if v37 then
        v31[v36 + 1] = v37
    end
    local v38 = #v31
    if v29 then
        v29 = u9.createElement(u14, {
            ["ZIndex"] = 3,
            ["inventoryItem"] = u25.props.InvItem,
            ["Position"] = UDim2.fromScale(0.5, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Size"] = UDim2.fromScale(0.8, 0.07),
            ["uiStrokeColor"] = Color3.fromRGB(27, 42, 53)
        })
    end
    if v29 then
        v31[v38 + 1] = v29
    end
    return u9.createElement("ImageButton", v30, v31)
end
return {
    ["InventoryTile"] = v16
}