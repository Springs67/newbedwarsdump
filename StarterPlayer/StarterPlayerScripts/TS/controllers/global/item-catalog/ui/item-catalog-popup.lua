local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.GamepadUIUtil
local u7 = v2.ProgressBar
local u8 = v2.SlideIn
local u9 = v2.SoundManager
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.ContextActionService
local u16 = v14.RunService
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item-catalog", "item-catalog-collection").ItemCatalogCollection
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item-catalog", "item-catalog-collection-meta").ItemCatalogMetaCollectionMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item-catalog", "item-catalog-util").ItemCatalogUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v81 = v12.new(u11)(function(u22, p23) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u16
        [4] = u15
        [5] = u20
        [6] = u17
        [7] = u18
        [8] = u19
        [9] = u3
        [10] = u5
        [11] = u9
        [12] = u21
        [13] = u7
        [14] = u4
        [15] = u6
        [16] = u8
    --]]
    local v24 = p23.useState
    local v25 = p23.useEffect
    local u26 = u11.createRef()
    local v27, u28 = v24(32)
    local v29, u30 = v24(0)
    v25(function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u26
            [3] = u28
            [4] = u16
            [5] = u30
            [6] = u22
            [7] = u15
        --]]
        local u31 = u10.new()
        local u32 = u26:getValue()
        if u32 then
            u31:GiveTask(u32:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u28
                --]]
                local v33 = u28
                local v34 = u32.AbsoluteSize.Y / 544 * 32
                v33((math.round(v34)))
            end))
        end
        u31:GiveTask(u16.Heartbeat:Connect(function(u35) --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30(function(p36) --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u35
                --]]
                return p36 + u35
            end)
        end))
        local u37 = true
        u31:GiveTask(function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u37
            --]]
            u37 = false
        end)
        task.delay(15, function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u22
            --]]
            if not u37 then
                return nil
            end
            u22.closeMenu()
        end)
        u15:BindAction("close-item-catalog-popup", function(_, p38, _) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            if p38 ~= Enum.UserInputState.Begin then
                return nil
            end
            u22.closeMenu()
        end, false, Enum.KeyCode.ButtonB)
        u31:GiveTask(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            u15:UnbindAction("close-item-catalog-popup")
        end)
        return function() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            u31:DoCleaning()
        end
    end, {})
    local v39 = u20(u22.itemType)
    local v40 = v39.itemCatalog
    local v41
    if v40 == nil then
        v41 = v40
    else
        v41 = v40.summary
    end
    if v41 == nil then
        local v42 = v39.description
        v41 = v42 == nil and "" or v42
    end
    if v40 ~= nil then
        v40 = v40.collection
    end
    if v40 == nil then
        v40 = u17.DEFAULT
    end
    local v43 = u18[v40]
    local v44 = 0
    for _ in u19:getAllCollectionElements(v40) do
        v44 = v44 + 1
    end
    local v45 = {}
    local v46 = #v45
    local v47 = {
        ["StartPosition"] = UDim2.fromScale(0.1, 0)
    }
    local v48 = {}
    local v49 = #v48
    local v50 = {
        ["Size"] = UDim2.fromScale(0.25751421608448416, 0.35393623942745606),
        ["Position"] = UDim2.fromScale(0.9853777416734363, 0.5),
        ["AnchorPoint"] = Vector2.new(1, 0.5),
        ["Image"] = "rbxassetid://15114739252",
        ["ImageTransparency"] = 0.8,
        ["BackgroundTransparency"] = 0.25,
        ["BackgroundColor3"] = u3.BLACK,
        ["ScaleType"] = Enum.ScaleType.Crop,
        [u11.Ref] = u26
    }
    local v51 = {
        u11.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1.1654411764705883
        }),
        u11.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.04, 0)
        }),
        u11.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.007886435331230283, 0)
        }),
        u11.createElement(u5, {
            ["LayoutOrder"] = 0
        }),
        u11.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://15114724417",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.7586750788643533, 0.17463235294117646)
        }, { u11.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 5.063157894736842
            }), u11.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Text"] = "Item Catalog",
                ["Size"] = UDim2.fromScale(0.5446985446985447, 0.5789473684210527),
                ["TextColor3"] = u3.hexColor(16771765),
                ["Font"] = Enum.Font.ArialBold,
                ["Position"] = UDim2.fromScale(0.5, 0.05263157894736842),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }) })
    }
    local v52 = #v51
    local v53 = {
        ["LayoutOrder"] = 2,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.3602941176470588)
    }
    local v54 = {}
    local v55 = #v54
    local v56 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.7760252365930599, 0.8520408163265306),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v57 = { u11.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.026813880126182965),
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        }), u11.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.3394308943089431, 1),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }, {
            u11.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }),
            u11.createElement("Frame", {
                ["BackgroundTransparency"] = 0.85,
                ["Size"] = UDim2.fromScale(0.718562874251497, 0.718562874251497),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = u3.BLACK
            }, { u11.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Color"] = u3.hexColor(16758784)
                }) }),
            u11.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ImageTransparency"] = 0.5,
                ["Image"] = v39.image,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.02, 0.02),
                ["ImageColor3"] = u3.BLACK
            }),
            u11.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = v39.image,
                ["Size"] = UDim2.fromScale(1, 1)
            })
        }) }
    local v58 = #v57
    local v59 = {
        ["LayoutOrder"] = 2,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.7032520325203252, 0.718562874251497)
    }
    local v60 = { u11.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Text"] = v39.displayName,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Size"] = UDim2.fromScale(1, 0.2833333333333333),
            ["TextColor3"] = u3.hexColor(16318462),
            ["Font"] = Enum.Font.ArialBold
        }) }
    local v61 = #v60
    local v62 = v43.displayLabel
    if v62 then
        local v63 = u11.createElement
        local v64 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true
        }
        local v65 = v43.displayLabel.name
        local v66 = 100 * (u22.collectionProgress / v44)
        local v67 = math.round(v66)
        v64.Text = v65 .. " (" .. tostring(v67) .. "%)"
        v64.TextXAlignment = Enum.TextXAlignment.Left
        v64.Size = UDim2.fromScale(1, 0.2)
        v64.TextColor3 = v43.displayLabel.color
        v64.Font = Enum.Font.ArialBold
        v64.Position = UDim2.fromScale(0, 1)
        v64.AnchorPoint = Vector2.new(0, 1)
        v62 = v63("TextLabel", v64)
    end
    if v62 then
        v60[v61 + 1] = v62
    end
    v57[v58 + 1] = u11.createElement("Frame", v59, v60)
    v54[v55 + 1] = u11.createElement("Frame", v56, v57)
    v51[v52 + 1] = u11.createElement("Frame", v53, v54)
    v51[v52 + 2] = u11.createElement("TextLabel", {
        ["LayoutOrder"] = 3,
        ["TextWrap"] = true,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.9353312302839116, 0.3088235294117647),
        ["TextSize"] = v27,
        ["TextXAlignment"] = Enum.TextXAlignment.Center,
        ["TextYAlignment"] = Enum.TextYAlignment.Top,
        ["TextColor3"] = u3.hexColor(16318462),
        ["Text"] = v41,
        ["Font"] = Enum.Font.Arial
    })
    local v68 = {
        ["LayoutOrder"] = 3,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.07352941176470588)
    }
    local v69 = { u11.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["Padding"] = UDim.new(0.02050473186119874)
        }) }
    local v70 = #v69
    local v71 = {
        ["Size"] = UDim2.fromScale(0.1719242902208202, 1),
        ["LayoutOrder"] = 1,
        ["BackgroundTransparency"] = 1,
        ["TextTransparency"] = 0.7,
        ["TextColor3"] = u3.hexColor(16318462),
        ["Text"] = "CLOSE",
        ["TextScaled"] = true,
        [u11.Event.Activated] = function() --[[ Line: 287 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u9
                [3] = u21
            --]]
            u22.closeMenu()
            u9:playSound(u21.UI_CLOSE_2)
        end
    }
    local v72 = {}
    local v73 = #v72
    local v74
    if v29 > 5 then
        local v75 = u11.createElement
        local v76 = u7
        local v77 = {
            ["AcceptZero"] = true,
            ["BarColor"] = u3.hexColor(5329233),
            ["BarBackgroundColor"] = u3.hexColor(2630435)
        }
        local v78 = v29 - 5
        local v79 = 1 - math.max(v78, 0) / 10
        v77.Progress = math.clamp(v79, 0, 1)
        v77.Size = UDim2.fromScale(1, 0.08823529411764706)
        v77.Position = UDim2.fromScale(0.5, 1.02)
        v77.AnchorPoint = Vector2.new(0.5, 0)
        v74 = v75(v76, v77)
    else
        v74 = false
    end
    if v74 then
        v72[v73 + 1] = v74
    end
    v69[v70 + 1] = u11.createElement("TextButton", v71, v72)
    local v80 = u4.isGamepadControls()
    if v80 then
        v80 = u11.createElement("ImageLabel", {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.08990536277602523, 1),
            ["Image"] = u6:getIconForKeycode(Enum.KeyCode.ButtonB)
        }, { u11.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end
    if v80 then
        v69[v70 + 2] = v80
    end
    v51[v52 + 3] = u11.createElement("Frame", v68, v69)
    v48[v49 + 1] = u11.createElement("ImageLabel", v50, v51)
    v45[v46 + 1] = u11.createElement(u8, v47, v48)
    return u11.createElement("ScreenGui", {}, v45)
end)
return {
    ["ItemCatalogPopup"] = v13.connect(function(_, p82) --[[ Line: 326 ]]
        local v83 = {}
        for v84, v85 in p82 do
            v83[v84] = v85
        end
        return v83
    end)(v81)
}