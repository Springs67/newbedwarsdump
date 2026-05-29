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
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v88 = v12.new(u11)(function(u20, p21) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
        [3] = u16
        [4] = u15
        [5] = u18
        [6] = u17
        [7] = u3
        [8] = u5
        [9] = u9
        [10] = u19
        [11] = u7
        [12] = u4
        [13] = u6
        [14] = u8
    --]]
    local v22 = p21.useState
    local v23 = p21.useEffect
    local u24 = u11.createRef()
    local v25, u26 = v22(32)
    local v27, u28 = v22(0)
    v23(function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u24
            [3] = u26
            [4] = u16
            [5] = u28
            [6] = u20
            [7] = u15
        --]]
        local u29 = u10.new()
        local u30 = u24:getValue()
        if u30 then
            u29:GiveTask(u30:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u26
                --]]
                local v31 = u26
                local v32 = u30.AbsoluteSize.Y / 544 * 32
                v31((math.round(v32)))
            end))
        end
        u29:GiveTask(u16.Heartbeat:Connect(function(u33) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28(function(p34) --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                return p34 + u33
            end)
        end))
        local u35 = true
        u29:GiveTask(function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            u35 = false
        end)
        task.delay(15, function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u20
            --]]
            if not u35 then
                return nil
            end
            u20.closeMenu()
        end)
        u15:BindAction("close-item-catalog-popup", function(_, p36, _) --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            if p36 ~= Enum.UserInputState.Begin then
                return nil
            end
            u20.closeMenu()
        end, false, Enum.KeyCode.ButtonB)
        u29:GiveTask(function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            u15:UnbindAction("close-item-catalog-popup")
        end)
        return function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29:DoCleaning()
        end
    end, {})
    local v37 = u18(u20.itemType)
    local v38 = v37.tierUpgradeElements[u20.tierLevel].tierDescription
    local v39 = u17.STAR_SOLID
    local v40 = false
    local v41 = 0
    local v42 = {}
    while true do
        if v40 then
            v41 = v41 + 1
        else
            v40 = true
        end
        if v41 >= u20.tierLevel then
            break
        end
        local v43 = u11.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Image"] = v39,
            ["Size"] = UDim2.fromScale(0.5, 1)
        })
        table.insert(v42, v43)
    end
    local v44 = false
    local v45 = 0
    local v46 = {}
    while true do
        if v44 then
            v45 = v45 + 1
        else
            v44 = true
        end
        if v45 >= #v38 then
            local v47 = {}
            local v48 = #v47
            local v49 = {
                ["StartPosition"] = UDim2.fromScale(0.1, 0)
            }
            local v50 = {}
            local v51 = #v50
            local v52 = {
                ["Size"] = UDim2.fromScale(0.25751421608448416, 0.35393623942745606),
                ["Position"] = UDim2.fromScale(0.9853777416734363, 0.5),
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Image"] = "rbxassetid://15114739252",
                ["ImageTransparency"] = 0.8,
                ["BackgroundTransparency"] = 0.25,
                ["BackgroundColor3"] = u3.BLACK,
                ["ScaleType"] = Enum.ScaleType.Crop,
                [u11.Ref] = u24
            }
            local v53 = {
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
                        ["Text"] = "Tier Upgrade",
                        ["Size"] = UDim2.fromScale(0.5446985446985447, 0.5789473684210527),
                        ["TextColor3"] = u3.hexColor(16771765),
                        ["Font"] = Enum.Font.ArialBold,
                        ["Position"] = UDim2.fromScale(0.5, 0.05263157894736842),
                        ["AnchorPoint"] = Vector2.new(0.5, 0)
                    }) })
            }
            local v54 = #v53
            local v55 = {
                ["LayoutOrder"] = 2,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3602941176470588)
            }
            local v56 = {}
            local v57 = #v56
            local v58 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.7760252365930599, 0.8520408163265306),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }
            local v59 = { u11.createElement("UIListLayout", {
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
                            ["Color"] = Color3.fromRGB(64, 186, 235)
                        }) }),
                    u11.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["ImageTransparency"] = 0.5,
                        ["Image"] = v37.image,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Position"] = UDim2.fromScale(0.02, 0.02),
                        ["ImageColor3"] = u3.BLACK
                    }),
                    u11.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Image"] = v37.image,
                        ["Size"] = UDim2.fromScale(1, 1)
                    })
                }) }
            local v60 = #v59
            local v61 = {
                ["LayoutOrder"] = 2,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.7032520325203252, 0.718562874251497)
            }
            local v62 = { u11.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Text"] = v37.displayName,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["Size"] = UDim2.fromScale(1, 0.2833333333333333),
                    ["TextColor3"] = u3.hexColor(16318462),
                    ["Font"] = Enum.Font.ArialBold
                }) }
            local v63 = #v62
            local v64 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }
            local v65 = { u11.createElement("UIGridLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Center",
                    ["CellSize"] = UDim2.fromScale(0.18, 0.9),
                    ["CellPadding"] = UDim2.fromScale(0.02)
                }) }
            local v66 = #v65
            for v67, v68 in v42 do
                v65[v66 + v67] = v68
            end
            v62[v63 + 1] = u11.createElement("Frame", v64, v65)
            v59[v60 + 1] = u11.createElement("Frame", v61, v62)
            v56[v57 + 1] = u11.createElement("Frame", v58, v59)
            v53[v54 + 1] = u11.createElement("Frame", v55, v56)
            local v69 = {
                ["LayoutOrder"] = 3,
                ["TextWrap"] = true,
                ["Text"] = "",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 0.4),
                ["TextSize"] = v25,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Top,
                ["TextColor3"] = u3.hexColor(16318462),
                ["Font"] = Enum.Font.Arial
            }
            local v70 = { u11.createElement("UIGridLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Left",
                    ["FillDirectionMaxCells"] = 3,
                    ["CellSize"] = UDim2.fromScale(1, 0.3),
                    ["CellPadding"] = UDim2.fromScale(0.5)
                }) }
            local v71 = #v70
            for v72, v73 in v46 do
                v70[v71 + v72] = v73
            end
            v53[v54 + 2] = u11.createElement("TextLabel", v69, v70)
            local v74 = {
                ["LayoutOrder"] = 3,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.07352941176470588)
            }
            local v75 = { u11.createElement("UIListLayout", {
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["Padding"] = UDim.new(0.02050473186119874)
                }) }
            local v76 = #v75
            local v77 = {
                ["Size"] = UDim2.fromScale(0.1719242902208202, 1),
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.7,
                ["TextColor3"] = u3.hexColor(16318462),
                ["Text"] = "CLOSE",
                ["TextScaled"] = true,
                [u11.Event.Activated] = function() --[[ Line: 326 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u9
                        [3] = u19
                    --]]
                    u20.closeMenu()
                    u9:playSound(u19.UI_CLOSE_2)
                end
            }
            local v78 = {}
            local v79 = #v78
            local v80
            if v27 > 5 then
                local v81 = u11.createElement
                local v82 = u7
                local v83 = {
                    ["AcceptZero"] = true,
                    ["BarColor"] = u3.hexColor(5329233),
                    ["BarBackgroundColor"] = u3.hexColor(2630435)
                }
                local v84 = v27 - 5
                local v85 = 1 - math.max(v84, 0) / 10
                v83.Progress = math.clamp(v85, 0, 1)
                v83.Size = UDim2.fromScale(1, 0.08823529411764706)
                v83.Position = UDim2.fromScale(0.5, 1.02)
                v83.AnchorPoint = Vector2.new(0.5, 0)
                v80 = v81(v82, v83)
            else
                v80 = false
            end
            if v80 then
                v78[v79 + 1] = v80
            end
            v75[v76 + 1] = u11.createElement("TextButton", v77, v78)
            local v86 = u4.isGamepadControls()
            if v86 then
                v86 = u11.createElement("ImageLabel", {
                    ["LayoutOrder"] = 1,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.08990536277602523, 1),
                    ["Image"] = u6:getIconForKeycode(Enum.KeyCode.ButtonB)
                }, { u11.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            end
            if v86 then
                v75[v76 + 2] = v86
            end
            v53[v54 + 3] = u11.createElement("Frame", v74, v75)
            v50[v51 + 1] = u11.createElement("ImageLabel", v52, v53)
            v47[v48 + 1] = u11.createElement(u8, v49, v50)
            return u11.createElement("ScreenGui", {}, v47)
        end
        local v87 = u11.createElement("TextLabel", {
            ["LayoutOrder"] = 3,
            ["TextWrap"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["TextSize"] = v25,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextColor3"] = u3.hexColor(16318462),
            ["Text"] = "- " .. v38[v45 + 1],
            ["Font"] = Enum.Font.Arial
        })
        table.insert(v46, v87)
    end
end)
return {
    ["TierUpgradeNotificationPopup"] = v13.connect(function(_, p89) --[[ Line: 365 ]]
        local v90 = {}
        for v91, v92 in p89 do
            v90[v91] = v92
        end
        return v90
    end)(v88)
}