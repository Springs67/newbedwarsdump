local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.CooldownBar
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.TweenService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip
local u20 = v1.import(script, script.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport
local u21 = v1.import(script, script.Parent.Parent.Parent, "item-durability", "item-durability-bar").ItemDurabilityBar
local v22 = u11.Component:extend("HotbarTile")
function v22.init(p23) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
    --]]
    p23.frameRef = u11.createRef()
    p23.arrowRef = u11.createRef()
    p23.positionMaid = u10.new()
    p23.maid = u10.new()
    p23.cooldownMaid = u10.new()
end
function v22.didMount(u24) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
    --]]
    u24:tweenPosition()
    u24:tweenArrowPosition()
    local v25 = u24.frameRef:getValue()
    if v25 and not u6.isHoarceKat() then
        u24.draggingScreenSinkInfo = u2.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):registerScreenSink(v25.AbsolutePosition, v25.AbsoluteSize, function(p26, p27) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u24
            --]]
            if p26 == "began" then
                u2.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):dragItem(u24.props.SlotNumber, p27, true)
            elseif p26 == "ended" then
                u2.resolveDependency("client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController"):dragItemOntoSlot(u24.props.SlotNumber, p27, true)
            end
        end)
        if u24.draggingScreenSinkInfo then
            u24.maid:GiveTask(u24.draggingScreenSinkInfo.maid)
        end
    end
    local v28 = u24.maid
    local v29 = u24.frameRef:getValue()
    if v29 ~= nil then
        v29 = v29.Changed
    end
    v28:GiveTask(v29:Connect(function(p30) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        if p30 == "AbsoluteSize" or p30 == "AbsolutePosition" then
            local v31 = u24.frameRef:getValue()
            if not (v31 and u24.draggingScreenSinkInfo) then
                return nil
            end
            u24.draggingScreenSinkInfo.position = v31.AbsolutePosition
            u24.draggingScreenSinkInfo.size = v31.AbsoluteSize
        end
    end))
end
function v22.willUnmount(p32) --[[ Line: 65 ]]
    p32.maid:DoCleaning()
end
function v22.didUpdate(u33, p34) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u17
        [3] = u2
        [4] = u15
    --]]
    if p34.HighlightedSlot ~= u33.props.HighlightedSlot then
        u33:tweenArrowPosition()
    end
    if p34.Selected ~= u33.props.Selected then
        u33:tweenPosition()
    end
    local v35 = p34.HotbarSlot.item
    if v35 ~= nil then
        v35 = v35.itemType
    end
    local v36 = u33.props.HotbarSlot.item
    if v36 ~= nil then
        v36 = v36.itemType
    end
    if v35 ~= v36 then
        u33.cooldownMaid:DoCleaning()
        local u37 = u33.props.HotbarSlot.item
        if u37 ~= nil then
            u37 = u37.itemType
        end
        if u37 and table.find(u9.values(u17), u37) ~= nil then
            if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getCooldownData(u37) then
                u33:setState({
                    ["onCooldown"] = true
                })
            end
            u33.cooldownMaid:GiveTask(u15.CooldownStarted:connect(function(p38) --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u33
                    [3] = u2
                --]]
                if p38.cooldownId ~= u37 then
                    return nil
                end
                u33:setState({
                    ["onCooldown"] = true
                })
                u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(p38.cooldownId, "hotbar-tile_" .. p38.cooldownId, function() --[[ Line: 108 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                    --]]
                    u33:setState({
                        ["onCooldown"] = false
                    })
                end)
            end))
            u33.cooldownMaid:GiveTask(function() --[[ Line: 114 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33:setState({
                    ["onCooldown"] = false
                })
            end)
        end
    end
end
function v22.tweenPosition(p39) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    p39.positionMaid:DoCleaning()
    local v40 = p39.frameRef:getValue()
    if not v40 then
        return nil
    end
    local u41
    if p39.props.Selected then
        u41 = u14:Create(v40, TweenInfo.new(0.12), {
            ["Position"] = UDim2.fromScale(0, -0.075)
        })
    else
        u41 = u14:Create(v40, TweenInfo.new(0.12), {
            ["Position"] = UDim2.fromScale(0, 0)
        })
    end
    u41:Play()
    p39.positionMaid:GiveTask(function() --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41:Cancel()
    end)
end
function v22.tweenArrowPosition(p42) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p42.props.HighlightedSlot then
        local u43 = u14:Create(p42.arrowRef:getValue(), TweenInfo.new(0.5), {
            ["Position"] = UDim2.fromScale(0.5, -0.8)
        })
        local u44 = u14:Create(p42.arrowRef:getValue(), TweenInfo.new(0.5), {
            ["Position"] = UDim2.fromScale(0.5, -0.45)
        })
        u43:Play()
        p42.positionMaid:GiveTask(u43.Completed:Connect(function() --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            u44:Play()
        end))
        p42.positionMaid:GiveTask(u44.Completed:Connect(function() --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u43
            --]]
            u43:Play()
        end))
    end
end
function v22.render(u45) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u11
        [4] = u4
        [5] = u16
        [6] = u8
        [7] = u18
        [8] = u5
        [9] = u21
        [10] = u19
        [11] = u20
        [12] = u7
    --]]
    local v46
    if u6.isHoarceKat() then
        v46 = nil
    else
        v46 = u13.LocalPlayer.Character
        if v46 ~= nil then
            v46 = v46:FindFirstChild("ObservedChestFolder")
        end
    end
    local v47 = nil
    local v48
    if v46 == nil then
        v48 = v46
    else
        v48 = v46.Value
    end
    if v48 then
        v47 = v46.Value
    end
    if v47 ~= nil then
        v47 = v47:GetAttribute("Smelter")
    end
    local v49 = v47 ~= nil
    local v50 = u45.props.HotbarSlot.item
    if v50 ~= nil then
        v50 = v50.tool:GetAttribute("Smeltable")
    end
    local v51 = v50 == true
    local v52 = u45.props.HotbarSlot.item
    if v52 ~= nil then
        v52 = v52.tool:GetAttribute("Durability")
    end
    local v53 = v52 ~= nil
    local v54 = {
        ["SizeConstraint"] = "RelativeYY",
        ["Size"] = UDim2.fromScale(1, 1),
        ["LayoutOrder"] = u45.props.LayoutOrder
    }
    local v55 = {}
    local v56 = #v55
    local v57 = u45.props.HighlightedSlot
    if v57 then
        v57 = u11.createFragment({
            ["HighlightedSlotArrow"] = u11.createElement("ImageLabel", {
                [u11.Ref] = u45.arrowRef,
                ["Size"] = UDim2.fromScale(0.9, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, -0.7),
                ["Image"] = "rbxassetid://16809397532",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 2,
                ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
            })
        })
    end
    if v57 then
        v55[v56 + 1] = v57
    end
    local v58 = #v55
    local v59 = {
        [u11.Ref] = u45.frameRef,
        ["Size"] = UDim2.fromScale(1, 1),
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundColor3"] = u4.hexColor(1909806),
        ["BackgroundTransparency"] = u45.props.Selected and 0.2 or 0.4,
        ["BorderMode"] = "Inset"
    }
    local _ = u45.props.Selected
    local v60 = 1
    v59.BorderSizePixel = v60
    local v61
    if u45.props.Selected then
        v61 = Color3.fromRGB(255, 255, 255)
    else
        v61 = u4.hexColor(7503788)
    end
    v59.BorderColor3 = v61
    v59.Image = nil
    local v62 = u45.props.store.AppInfo.openApps
    local v63 = u16.INVENTORY
    v59.Selectable = table.find(v62, v63) ~= nil
    v59[u11.Event.MouseButton1Click] = function() --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45.props.OnClick()
    end
    v59[u11.Event.MouseEnter] = function(_) --[[ Line: 238 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u18
        --]]
        u8:playSound(u18.UI_HOVER)
    end
    local v64 = u45.state.onCooldown
    if v64 then
        v64 = u45.props.HotbarSlot.item
        if v64 ~= nil then
            v64 = v64.itemType
        end
        if v64 then
            v64 = u11.createElement(u5, {
                ["ZIndex"] = 3,
                ["cooldownId"] = u45.props.HotbarSlot.item.itemType,
                ["Position"] = UDim2.fromScale(0.5, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Size"] = UDim2.fromScale(0.8, 0.1)
            })
        end
    end
    local v65 = {}
    local v66 = #v65
    if v64 then
        v65[v66 + 1] = v64
    end
    local v67 = #v65
    if v53 then
        v53 = u11.createElement(u21, {
            ["ZIndex"] = 3,
            ["uiStrokeTransparency"] = 0.5,
            ["inventoryItem"] = u45.props.HotbarSlot.item,
            ["Position"] = UDim2.fromScale(0.5, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Size"] = UDim2.fromScale(0.8, 0.1),
            ["uiStrokeColor"] = Color3.fromRGB(29, 36, 46)
        })
    end
    if v53 then
        v65[v67 + 1] = v53
    end
    local v68 = #v65
    local v69 = v68 + 1
    local v70 = u11.createElement
    local v71 = "TextLabel"
    local v72 = {
        ["BorderSizePixel"] = 0,
        ["TextScaled"] = true,
        ["ZIndex"] = 10,
        ["Text"] = u45.props.Keybind,
        ["Size"] = UDim2.fromScale(0.23, 0.23),
        ["Position"] = UDim2.fromScale(0, 0)
    }
    local v73
    if u45.props.Selected then
        v73 = Color3.fromRGB(255, 255, 255)
    else
        v73 = u4.hexColor(7503788)
    end
    v72.BackgroundColor3 = v73
    local v74
    if u45.props.Selected then
        v74 = Color3.fromRGB(0, 0, 0)
    else
        v74 = Color3.fromRGB(255, 255, 255)
    end
    v72.TextColor3 = v74
    v72.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v65[v69] = v70(v71, v72, { u11.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        }), u11.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.15, 0),
            ["PaddingBottom"] = UDim.new(0.15, 0)
        }) })
    local v75 = {}
    local v76 = u45.props.HotbarSlot.item
    if v76 ~= nil then
        v76 = v76.itemType
    end
    v75.item = v76
    v65[v68 + 2] = u11.createElement(u19, v75)
    local v77
    if u45.props.HotbarSlot.item == nil then
        v77 = false
    else
        v77 = u11.createElement(u20, {
            ["ItemType"] = u45.props.HotbarSlot.item.itemType,
            ["Amount"] = u45.props.HotbarSlot.item.amount,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.15),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        })
    end
    if v77 then
        v65[v68 + 3] = v77
    end
    v55[v58 + 1] = u11.createElement("ImageButton", v59, v65)
    local v78 = v49 and not v51
    if v78 then
        local v79 = u11.createFragment
        local v80 = {}
        local v81 = u11.createElement
        local v82 = "Frame"
        local v83 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0.5,
            ["ZIndex"] = 50,
            ["Visible"] = true,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v84
        if u45.props.Selected then
            v84 = UDim2.fromScale(0, -0.075)
        else
            v84 = UDim2.fromScale(0, 0)
        end
        v83.Position = v84
        v83.BackgroundColor3 = u4.BLACK
        v80.Overlay = v81(v82, v83)
        v78 = v79(v80)
    end
    if v78 then
        v55[v58 + 2] = v78
    end
    return u11.createElement(u7, v54, v55)
end
return {
    ["HotbarTile"] = v22
}