local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.EmptyButton
local u9 = v3.SlideIn
local u10 = v3.SoundManager
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "chest-constants").ChestConstants
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = u1.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader
local u19 = u1.import(script, script.Parent.Parent.Parent, "ui", "inventory-tile").InventoryTile
local u20 = u1.import(script, script.Parent, "inventory-chest").InventoryChest
local u21 = u1.import(script, script.Parent, "smelter-header").SmelterHeader
local v22 = u11.Component:extend("ChestInventoryAppBase")
function v22.init(p23) --[[ Line: 31 ]]
    p23.alive = true
end
function v22.didMount(u24) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u17
        [3] = u6
        [4] = u13
        [5] = u1
        [6] = u15
        [7] = u2
    --]]
    u10:playSound(u17.UI_OPEN)
    local v25 = not u6.isHoarceKat()
    if v25 then
        v25 = u13.LocalPlayer
        if v25 ~= nil then
            v25 = v25.Character
        end
    end
    if v25 then
        u1.Promise.defer(function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u13
                [3] = u15
                [4] = u2
            --]]
            while true do
                local v26 = task.wait(0.2)
                if v26 ~= 0 and (v26 == v26 and v26) then
                    v26 = u24.alive
                    if v26 then
                        v26 = u24.props.chestBlock
                    end
                end
                if v26 == 0 or (v26 ~= v26 or not v26) then
                    return
                end
                local v27 = u13.LocalPlayer.Character
                if v27 ~= nil then
                    v27 = v27:GetPivot().Position
                end
                if v27 == nil then
                    v27 = Vector3.new()
                end
                if (v27 - u24.props.chestBlock.Position).Magnitude > u15.MAX_DISTANCE_FROM_CHEST then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u24.props.AppId)
                end
            end
        end)
    end
    local u28 = u13.LocalPlayer.Character
    if u28 ~= nil then
        u28 = u28:FindFirstChild("ObservedChestFolder")
    end
    if u28 then
        u24.smelterConnection = u28.Changed:Connect(function(p29) --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u24
            --]]
            local u30 = p29 and u28.Value
            if u30 then
                u24:setState({
                    ["isSmelter"] = u30:GetAttribute("Smelter") ~= nil
                })
                if not u24.smelterPointsConnection then
                    u24.smelterPointsConnection = u30:GetAttributeChangedSignal("SmeltPoints"):Connect(function() --[[ Line: 85 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                            [2] = u30
                        --]]
                        local v31 = u24
                        local v32 = {}
                        local v33 = u30:GetAttribute("SmeltPoints")
                        v32.progress = v33 == nil and 0 or v33
                        v31:setState(v32)
                    end)
                end
            end
        end)
    end
end
function v22.render(p34) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u11
        [3] = u19
        [4] = u1
        [5] = u16
        [6] = u14
        [7] = u4
        [8] = u7
        [9] = u5
        [10] = u6
        [11] = u21
        [12] = u20
        [13] = u18
        [14] = u8
        [15] = u9
    --]]
    local v35 = {}
    local v36 = {}
    local v37 = u13.LocalPlayer.Character
    if v37 ~= nil then
        v37 = v37:FindFirstChild("ObservedChestFolder")
    end
    local v38 = nil
    local v39
    if v37 == nil then
        v39 = v37
    else
        v39 = v37.Value
    end
    if v39 then
        v38 = v37.Value
    end
    local v40
    if v38 == nil then
        v40 = v38
    else
        v40 = v38:GetAttribute("Smelter")
    end
    local v41 = v40 ~= nil
    if v38 ~= nil then
        v38 = v38:GetAttribute("SmeltPoints")
    end
    local v42 = v38 == nil and 0 or v38
    local v43 = false
    local v44 = 0
    while true do
        if true then
            if v43 then
                v44 = v44 + 1
            else
                v43 = true
            end
        end
        if v44 >= 32 then
            table.sort(v36, function(p45, p46) --[[ Line: 173 ]]
                return p45.addedToBackpackTime < p46.addedToBackpackTime
            end)
            local v47 = false
            local v48 = 0
            while true do
                if v47 then
                    v48 = v48 + 1
                else
                    v47 = true
                end
                if v48 >= 24 then
                    local v49 = {
                        ["DisplayOrder"] = 1
                    }
                    local v50 = { u11.createElement(u5, {
                            ["Transparent"] = false,
                            ["AppId"] = p34.props.AppId
                        }) }
                    local v51 = #v50
                    local v52 = {}
                    local v53 = #v52
                    local v54 = {
                        ["BorderSizePixel"] = 0,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(u6.isSmallScreen() and 0.45 or 0.5, u6.isSmallScreen() and 0.5 or 0.4),
                        ["Position"] = UDim2.fromScale(0.5, u6.isSmallScreen() and 0.68 or 0.72),
                        ["AnchorPoint"] = Vector2.new(0.5, 1)
                    }
                    local v55 = { u11.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1.5
                        }), u11.createElement("UIListLayout", {
                            ["FillDirection"] = "Vertical",
                            ["HorizontalAlignment"] = "Center",
                            ["VerticalAlignment"] = "Center",
                            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                            ["Padding"] = UDim.new(0.03, 0)
                        }) }
                    local v56 = #v55
                    if v41 then
                        v41 = u11.createElement(u21, {
                            ["SmeltPoints"] = v42
                        })
                    end
                    if v41 then
                        v55[v56 + 1] = v41
                    end
                    local v57 = #v55
                    local v58 = {
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1)
                    }
                    local v59 = { u11.createElement("UIListLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["HorizontalAlignment"] = "Center",
                            ["VerticalAlignment"] = "Center"
                        }), u11.createElement(u20, {
                            ["ObservedChest"] = p34.props.Inventory.observedInventory.observedChest
                        }), u11.createElement(u7, {
                            ["Size"] = UDim2.fromScale(0.08, 0)
                        }) }
                    local v60 = #v59
                    local v61 = {
                        ["Size"] = UDim2.fromScale(1, 1)
                    }
                    local v62 = { u11.createElement("UIListLayout", {
                            ["FillDirection"] = "Vertical"
                        }), u11.createElement(u18, {
                            ["Title"] = "Inventory"
                        }), u11.createElement(u7, {
                            ["Size"] = UDim2.fromScale(0, 0.01)
                        }) }
                    local v63 = #v62
                    local v64 = {
                        ["Size"] = UDim2.fromScale(1, 1)
                    }
                    local v65 = {}
                    local v66 = #v65
                    local v67 = {
                        ["BackgroundTransparency"] = 0,
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["BackgroundColor3"] = u4.hexColor(1713718)
                    }
                    local v68 = { u11.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0, 6)
                        }), u11.createElement("UIPadding", {
                            ["PaddingLeft"] = UDim.new(0.02, 0),
                            ["PaddingRight"] = UDim.new(0.02, 0),
                            ["PaddingTop"] = UDim.new(0.03, 0),
                            ["PaddingBottom"] = UDim.new(0.03, 0)
                        }), u11.createElement("UIGridLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["HorizontalAlignment"] = "Center",
                            ["VerticalAlignment"] = "Center",
                            ["SortOrder"] = "LayoutOrder",
                            ["CellSize"] = UDim2.fromScale(0.14666666666666667, 0.23),
                            ["CellPadding"] = UDim2.fromScale(0.02, 0.02)
                        }) }
                    local v69 = #v68
                    for v70, v71 in v35 do
                        v68[v69 + v70] = v71
                    end
                    v65[v66 + 1] = u11.createElement("Frame", v67, v68)
                    v62[v63 + 1] = u11.createElement(u8, v64, v65)
                    v59[v60 + 1] = u11.createElement(u7, v61, v62)
                    v55[v57 + 1] = u11.createElement(u7, v58, v59)
                    v52[v53 + 1] = u11.createElement("Frame", v54, v55)
                    v50[v51 + 1] = u11.createElement(u9, {}, v52)
                    return u11.createElement("ScreenGui", v49, v50)
                end
                local u72
                if v48 < #v36 then
                    u72 = v36[v48 + 1]
                else
                    u72 = nil
                end
                if u72 ~= nil then
                    local v73 = u72.tool:GetAttribute("Smeltable")
                end
                local v74 = v73 == true
                local v75 = {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["LayoutOrder"] = v48
                }
                local v80 = { u11.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.025),
                        ["PaddingBottom"] = UDim.new(0.025),
                        ["PaddingLeft"] = UDim.new(0.025),
                        ["PaddingRight"] = UDim.new(0.025)
                    }), u11.createElement(u19, {
                        ["ItemClickLoadingProgress"] = true,
                        ["InvItem"] = u72,
                        ["AutoSelect"] = v48 == 0,
                        ["LayoutOrder"] = v48,
                        ["OnClick"] = u1.async(function() --[[ Line: 214 ]]
                            --[[
                            Upvalues:
                                [1] = u72
                                [2] = u13
                                [3] = u1
                                [4] = u16
                            --]]
                            if u72 and u72.tool then
                                local v76 = u13.LocalPlayer.Character
                                if v76 ~= nil then
                                    v76 = v76:FindFirstChild("ObservedChestFolder")
                                end
                                local v77 = u1.await(v76)
                                local v78
                                if v77 == nil then
                                    v78 = v77
                                else
                                    v78 = v77.Value
                                end
                                if v78 then
                                    return u1.await(u16.Client:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(v77.Value, u72.tool))
                                end
                            end
                        end),
                        ["SendToHotbarSlot"] = function(p79) --[[ Name: SendToHotbarSlot, Line 233 ]]
                            --[[
                            Upvalues:
                                [1] = u72
                                [2] = u14
                            --]]
                            if u72 then
                                u14:dispatch({
                                    ["type"] = "InventoryAddToHotbar",
                                    ["slot"] = p79,
                                    ["item"] = u72
                                })
                            end
                        end,
                        ["TileBorderColor"] = u4.hexColor(5331056)
                    }) }
                local v81 = #v80
                local v82 = v41 and not v74
                if v82 then
                    v82 = u11.createFragment({
                        ["Overlay"] = u11.createElement("Frame", {
                            ["BorderSizePixel"] = 0,
                            ["BackgroundTransparency"] = 0.5,
                            ["ZIndex"] = 50,
                            ["Visible"] = true,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["BackgroundColor3"] = u4.BLACK
                        })
                    })
                end
                if v82 then
                    v80[v81 + 1] = v82
                end
                local v83 = u11.createElement(u7, v75, v80)
                table.insert(v35, v83)
            end
        end
        local v84
        if v44 < #p34.props.Inventory.observedInventory.inventory.items then
            v84 = p34.props.Inventory.observedInventory.inventory.items[v44 + 1]
            local v85 = nil
            for v86, v87 in p34.props.Inventory.observedInventory.hotbar do
                local _ = v86 - 1
                if v87.item == v84 == true then
                    v85 = v87
                    break
                end
            end
            if v85 then
                v84 = nil
            end
        else
            v84 = nil
        end
        if v84 then
            local v88 = v84
            table.insert(v36, v88)
        end
    end
end
function v22.willUnmount(u89) --[[ Line: 378 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    task.spawn(function() --[[ Line: 379 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u89
        --]]
        u16.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil)
        u89.alive = false
        local v90 = u89.smelterConnection
        if v90 ~= nil then
            v90:Disconnect()
        end
        local v91 = u89.smelterPointsConnection
        if v91 ~= nil then
            v91:Disconnect()
        end
    end)
end
return {
    ["ChestInventoryApp"] = v12.connect(function(p92, p93) --[[ Line: 393 ]]
        local v94 = {
            ["Inventory"] = p92.Inventory
        }
        for v95, v96 in p93 do
            v94[v95] = v96
        end
        return v94
    end)(v22)
}