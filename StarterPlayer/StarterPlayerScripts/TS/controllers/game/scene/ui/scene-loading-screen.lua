local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CircularSpinner
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
return {
    ["SceneLoadingScreen"] = v10.new(u9)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u7
            [4] = u4
            [5] = u11
            [6] = u12
            [7] = u5
            [8] = u6
            [9] = u3
        --]]
        local _ = p14.useState
        local v15 = p14.useEffect
        local u16 = u9.createRef()
        local u17 = u9.createRef()
        local u18 = u9.createRef()
        v15(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u17
                [3] = u16
                [4] = u8
                [5] = u13
                [6] = u7
                [7] = u4
                [8] = u11
                [9] = u12
            --]]
            local u19 = u18:getValue()
            local u20 = u17:getValue()
            local v21 = u16:getValue()
            local u22 = u8.new()
            local u23 = false
            if u19 and u20 then
                if u13.DisableEnterFade then
                    u20.Transparency = 1
                else
                    local u24 = u7:setContainerTransparency(u19, 1, {
                        ["onCleanUpTweenInfo"] = TweenInfo.new(0.5)
                    })
                    u20.BackgroundColor3 = u4.BLACK
                    u20.Transparency = 1
                    local v25 = u11:Create(u20, TweenInfo.new(1), {
                        ["BackgroundTransparency"] = 0
                    })
                    v25:Play()
                    u22:GiveTask(v25.Completed:Connect(function() --[[ Line: 41 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u20
                            [3] = u24
                        --]]
                        u11:Create(u20, TweenInfo.new(1), {
                            ["BackgroundTransparency"] = 1
                        }):Play()
                        u24:DoCleaning()
                    end))
                end
            end
            if v21 then
                u11:Create(v21, TweenInfo.new(30), {
                    ["Offset"] = Vector2.new(0.15, 0)
                }):Play()
            end
            if u19 then
                u12.SceneLoadingScreenEnd:connect(function(p26) --[[ Line: 60 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                        [2] = u20
                        [3] = u19
                        [4] = u4
                        [5] = u11
                        [6] = u7
                    --]]
                    if u23 then
                        return nil
                    end
                    u23 = true
                    p26:setEndAnimationLength(3)
                    if u20 and u19 then
                        u20.BackgroundColor3 = u4.BLACK
                        u11:Create(u20, TweenInfo.new(1), {
                            ["BackgroundTransparency"] = 0
                        }):Play()
                        task.delay(1, function() --[[ Line: 72 ]]
                            --[[
                            Upvalues:
                                [1] = u7
                                [2] = u19
                                [3] = u11
                                [4] = u20
                            --]]
                            u7:setContainerTransparency(u19, 1, {})
                            u11:Create(u20, TweenInfo.new(1), {
                                ["BackgroundTransparency"] = 1
                            }):Play()
                        end)
                    end
                end)
            end
            return function() --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                u22:DoCleaning()
            end
        end)
        local v27 = {
            ["DisplayOrder"] = 1000,
            ["IgnoreGuiInset"] = true,
            ["ResetOnSpawn"] = false
        }
        local v28 = {}
        local v29 = #v28
        local v30 = {
            ["BlackOverlay"] = u9.createFragment({
                ["BlackOverlay"] = u9.createElement("Frame", {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = u4.BLACK,
                    ["BackgroundTransparency"] = 0,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 20,
                    [u9.Ref] = u17
                })
            })
        }
        local _ = #v30
        local v31 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u13.BackgroundImage,
            ["BackgroundTransparency"] = 1,
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["ScaleType"] = "Crop",
            ["ZIndex"] = 1,
            [u9.Ref] = u18
        }
        local v32 = {
            ["BlackOverlay"] = u9.createElement("Frame", {
                ["BackgroundTransparency"] = 0.7,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u4.BLACK
            })
        }
        local _ = #v32
        local v33 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u4.WHITE
        }
        local v34 = {}
        local v35 = #v34
        local v36 = {
            ["Rotation"] = -30,
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.BLACK), ColorSequenceKeypoint.new(1, u4.BLACK) }),
            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(0.3, 0.3), NumberSequenceKeypoint.new(1, 1) })
        }
        local v37 = u13.BackgroundGradient
        if v37 then
            for v38, v39 in v37 do
                v36[v38] = v39
            end
        end
        v36.Offset = Vector2.new(-0.1, 0)
        v36[u9.Ref] = u16
        v34[v35 + 1] = u9.createElement("UIGradient", v36)
        v32.OverlayGradient = u9.createElement("Frame", v33, v34)
        local v40 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v41 = {}
        local v42 = u9.createElement
        local v43 = "UIPadding"
        local v44 = {}
        local v45
        if u5.isSmallScreen() then
            v45 = UDim.new(0.05, 0)
        else
            v45 = UDim.new(0.05, 0)
        end
        v44.PaddingTop = v45
        local v46
        if u5.isSmallScreen() then
            v46 = UDim.new(0.05, 0)
        else
            v46 = UDim.new(0.05, 0)
        end
        v44.PaddingBottom = v46
        local v47
        if u5.isSmallScreen() then
            v47 = UDim.new(0.03, 0)
        else
            v47 = UDim.new(0.03, 0)
        end
        v44.PaddingLeft = v47
        local v48
        if u5.isSmallScreen() then
            v48 = UDim.new(0.03, 0)
        else
            v48 = UDim.new(0.03, 0)
        end
        v44.PaddingRight = v48
        __set_list(v41, 1, {v42(v43, v44)})
        local v49 = #v41
        local v50 = {
            ["ZIndex"] = 3,
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["Size"] = UDim2.fromScale(0.4, 0.4)
        }
        local v51 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u9.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["Text"] = "<b>TRAVELING TO</b>",
                ["TextXAlignment"] = "Left",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0),
                ["Font"] = Enum.Font.Roboto,
                ["TextColor3"] = u4.WHITE
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u5.isSmallScreen() and 18 or 24
                }) }), u9.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["TextXAlignment"] = "Left",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0),
                ["Text"] = "<b>" .. string.upper(u13.Title) .. "</b>",
                ["Font"] = Enum.Font.Roboto,
                ["TextColor3"] = u13.TitleColor or u4.WHITE
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u5.isSmallScreen() and 40 or 60
                }) }) }
        local v52 = #v51
        local v53
        if u13.Description == nil then
            v53 = false
        else
            v53 = u9.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Top",
                ["TextTransparency"] = 0.3,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["Text"] = u13.Description,
                ["Font"] = Enum.Font.Roboto,
                ["TextColor3"] = u4.WHITE
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u5.isSmallScreen() and 18 or 24
                }) })
        end
        if v53 then
            v51[v52 + 1] = v53
        end
        v41.TextContainer = u9.createElement(u6, v50, v51)
        v41[v49 + 1] = u9.createElement(u3, {
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromOffset(u5.isSmallScreen() and 36 or 54, u5.isSmallScreen() and 36 or 54),
            ["Position"] = UDim2.new(1, 0, 1, 0),
            ["AnchorPoint"] = Vector2.new(1, 1)
        })
        v32.Container = u9.createElement(u6, v40, v41)
        v30.LoadingSceneScreenUI = u9.createFragment({
            ["LoadingSceneScreenUI"] = u9.createElement("ImageLabel", v31, v32)
        })
        v28[v29 + 1] = u9.createFragment(v30)
        return u9.createFragment({
            ["LoadingSceneScreenGui"] = u9.createElement("ScreenGui", v27, v28)
        })
    end)
}