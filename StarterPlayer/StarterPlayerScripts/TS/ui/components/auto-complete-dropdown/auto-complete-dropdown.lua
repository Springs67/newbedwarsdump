local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.UserInputService
local u13 = v11.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u16 = v1.import(script, script.Parent.Parent, "auto-complete-searchbar").AutoCompleteSearchbar
local v95 = v9.new(u8)(function(u17, p18) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u6
        [4] = u12
        [5] = u4
        [6] = u15
        [7] = u8
        [8] = u5
        [9] = u14
        [10] = u16
        [11] = u3
    --]]
    local v19 = p18.useState
    local v20 = p18.useEffect
    local u21, u22 = v19({})
    local u23, u24 = v19(0)
    local u25, u26 = v19(0)
    local u27 = u7.new()
    local u28 = nil
    local v29 = u13.CurrentCamera
    if v29 ~= nil then
        v29 = v29.ViewportSize.Y
    end
    local u30 = v29 == nil and 1500 or v29
    v20(function() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u12
            [3] = u24
            [4] = u21
            [5] = u23
        --]]
        u27:GiveTask(u12.InputBegan:Connect(function(p31) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u21
                [3] = u23
            --]]
            if p31.KeyCode == Enum.KeyCode.Down then
                local v32 = u24
                local v33 = #u21 - 1
                local v34 = u23 + 1
                v32((math.min(v33, v34)))
            end
            if p31.KeyCode == Enum.KeyCode.Up then
                local v35 = u24
                local v36 = u23 - 1
                v35((math.max(0, v36)))
            end
        end))
        return function() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            u27:DoCleaning()
        end
    end)
    local v37 = {
        ["DisplayOrder"] = 30,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u4.isSmallScreen()
    }
    local v38 = {}
    local v39 = #v38
    local v40 = {
        ["BackgroundTransparency"] = 1,
        ["ImageTransparency"] = 1,
        ["Modal"] = true,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v41 = {}
    local v42 = #v41
    local v43 = u17.AdditionalElements
    if v43 then
        v41[v42 + 1] = v43
    end
    local v44 = #v41
    local v45 = {
        ["BackgroundTransparency"] = 0.5,
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = u15.backgroundPrimary,
        ["Size"] = UDim2.fromScale(0.3363119415109667, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.Y,
        ["Position"] = UDim2.fromScale(0.5, 0.25),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v46 = {
        u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }),
        u8.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["Padding"] = UDim.new(0, 12 * (u30 / 1537))
        }),
        u8.createElement(u5, {
            ["LayoutOrder"] = 0
        }),
        u8.createElement(u5, {
            ["LayoutOrder"] = 10000
        })
    }
    local v47 = #v46
    local v48 = {
        ["LayoutOrder"] = 1,
        ["Transparency"] = 0.5,
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = u15.backgroundSecondary,
        ["Size"] = UDim2.new(0.9830917874396136, 0, 0, 0.06506180871828236 * u30)
    }
    local v49 = {
        u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.25, 0)
        }),
        u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["Padding"] = UDim.new(0.02, 0)
        }),
        u8.createElement(u5, {
            ["LayoutOrder"] = 0
        }),
        u8.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ImageTransparency"] = 0.5,
            ["LayoutOrder"] = 1,
            ["Image"] = u14.SEARCH_SOLID,
            ["Size"] = UDim2.fromScale(0.08108108108108109, 0.66)
        }, { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    }
    local v50 = #v49
    local v51 = {
        ["LayoutOrder"] = 2,
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.773955773955774, 0.8)
    }
    local v52 = {}
    local v53 = #v52
    local v54 = {
        ["BackgroundTransparency"] = 1,
        ["HideSearchIcon"] = true,
        ["AutoFocus"] = true
    }
    local v55
    if #u21 > 0 then
        v55 = u21[u23 + 1]
    else
        v55 = nil
    end
    v54.PredictionTarget = v55
    v54.Size = UDim2.new(1, 0, 1, 0)
    v54.Position = UDim2.fromScale(0.5, 0.5)
    v54.AnchorPoint = Vector2.new(0.5, 0.5)
    local v56 = u17.Items
    local v57 = table.create(#v56)
    for v58, v59 in v56 do
        local _ = v58 - 1
        local v60 = u17.DescribeItem(v59)
        local v61 = {
            ["key"] = v59
        }
        if v60 ~= nil then
            v60 = v60.aliases
        end
        v61.aliases = v60
        v57[v58] = v61
    end
    v54.Items = v57
    v54.InputText = ""
    function v54.OnTextChange(p62, p63) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u24
            [3] = u26
        --]]
        u22(p63)
        u24(0)
        u26(#p62)
    end
    v54.PlaceHolderText = "Name"
    function v54.OnFocused() --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        local v64 = u28
        if v64 ~= nil then
            v64:Disconnect()
        end
    end
    function v54.OnFocusLost(p65, u66) --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u6
            [3] = u17
            [4] = u28
            [5] = u12
            [6] = u27
            [7] = u21
            [8] = u23
        --]]
        if u25 == 0 then
            u6.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu()
            u17.OnSelect(nil)
        end
        if not p65 then
            if u28 and u28.Connected then
                return nil
            end
            local u67 = false
            u28 = u12.InputBegan:Connect(function(p68) --[[ Line: 194 ]]
                --[[
                Upvalues:
                    [1] = u67
                    [2] = u6
                    [3] = u17
                    [4] = u28
                --]]
                if not u67 then
                    u67 = true
                    return nil
                end
                if p68.KeyCode == Enum.KeyCode.KeypadEnter or p68.UserInputType == Enum.UserInputType.MouseButton1 then
                    u6.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu()
                    u17.OnSelect(nil)
                    local v69 = u28
                    if v69 ~= nil then
                        v69:Disconnect()
                    end
                end
            end)
            u27:GiveTask(u28)
            return nil
        end
        if u25 > 0 and #u21 > 0 then
            local v70 = u21
            local v71 = #u21 - 1
            local v72 = u23
            local v73 = v70[math.min(v71, v72) + 1]
            u6.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu()
            u17.OnSelect(v73)
        end
        task.delay(0, function() --[[ Line: 213 ]]
            --[[
            Upvalues:
                [1] = u66
            --]]
            local v74 = u66
            if v74 ~= nil then
                v74:CaptureFocus()
            end
        end)
    end
    v52[v53 + 1] = u8.createElement(u16, v54)
    v49[v50 + 1] = u8.createElement("Frame", v51, v52)
    local v75
    if #u21 > 0 then
        v75 = u23 >= 0
    else
        v75 = false
    end
    if v75 then
        local v76 = {}
        local v77
        if u23 < #u21 then
            v77 = u17.DescribeItem(u21[u23 + 1])
            if v77 ~= nil then
                v77 = v77.image
            end
        else
            v77 = nil
        end
        v76.Image = v77
        v76.BackgroundTransparency = 1
        v76.LayoutOrder = 3
        v76.Size = UDim2.fromScale(0.08108108108108109, 0.66)
        v75 = u8.createElement("ImageLabel", v76, { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end
    if v75 then
        v49[v50 + 2] = v75
    end
    v46.Searchbar = u8.createElement("Frame", v48, v49)
    local v78 = 0
    local v79 = {}
    for v80, v81 in u21 do
        if v80 - 1 <= 15 == true then
            v78 = v78 + 1
            v79[v78] = v81
        end
    end
    local function v89(p82, u83) --[[ Line: 262 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u8
            [3] = u23
            [4] = u3
            [5] = u30
            [6] = u21
            [7] = u6
        --]]
        local v84 = u17.DescribeItem(p82)
        if not v84 then
            return u8.createFragment()
        end
        local v85 = u83 == u23
        local v86 = u8.createFragment
        local v88 = {
            ["DropdownElement"] = u8.createElement("Frame", {
                ["LayoutOrder"] = 2 + u83,
                ["BackgroundColor3"] = u3.hexColor(848127),
                ["BackgroundTransparency"] = v85 and 0.8 or 1,
                ["Size"] = UDim2.new(0.9830917874396136, 0, 0, 0.048796356538711776 * u30)
            }, { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.25, 0)
                }), u8.createElement("ImageButton", {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["ImageTransparency"] = 1,
                    ["BackgroundTransparency"] = 1,
                    [u8.Event.Activated] = function() --[[ Line: 282 ]]
                        --[[
                        Upvalues:
                            [1] = u21
                            [2] = u83
                            [3] = u6
                            [4] = u17
                        --]]
                        local v87 = u21[u83 + 1]
                        u6.Controllers.AutoCompleteDropdownController:closeAutoCompleteDropdownMenu()
                        u17.OnSelect(v87)
                    end
                }, { u8.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["Padding"] = UDim.new(0.03, 0)
                    }), u8.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Image"] = v84.image,
                        ["Size"] = UDim2.fromScale(0.08108108108108109, 0.9538461538461539)
                    }, { u8.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) }), u8.createElement("TextLabel", {
                        ["LayoutOrder"] = 2,
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = v84.displayName,
                        ["Size"] = UDim2.fromScale(0.8464373464373465, 0.6153846153846154),
                        ["TextColor3"] = u3.WHITE,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["FontFace"] = Font.new("Roboto")
                    }) }) })
        }
        return v86(v88)
    end
    local v90 = table.create(#v79)
    for v91, v92 in v79 do
        v90[v91] = v89(v92, v91 - 1, v79)
    end
    for v93, v94 in v90 do
        v46[v47 + v93] = v94
    end
    v41[v44 + 1] = u8.createElement("Frame", v45, v46)
    v38[v39 + 1] = u8.createElement("ImageButton", v40, v41)
    return u8.createElement("ScreenGui", v37, v38)
end)
return {
    ["AutoCompleteDropdown"] = v10.connect(function(_, p96) --[[ Line: 331 ]]
        local v97 = {}
        for v98, v99 in p96 do
            v97[v98] = v99
        end
        return v97
    end)(v95)
}