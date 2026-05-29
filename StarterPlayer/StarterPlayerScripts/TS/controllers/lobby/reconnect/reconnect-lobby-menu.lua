local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SlideIn
local u7 = v2.TimedProgressBar
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = UDim2.fromScale(0.55, 0.75)
local u15 = UDim2.fromScale(0.5, 0.46)
local u16 = Vector2.new(0.5, 0.5)
return {
    ["ReconnectingMenu"] = v10.new(u9)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u1
            [3] = u8
            [4] = u11
            [5] = u4
            [6] = u6
            [7] = u14
            [8] = u15
            [9] = u16
            [10] = u13
            [11] = u5
            [12] = u12
            [13] = u7
            [14] = u3
        --]]
        local _ = p18.useState
        local v19 = p18.useEffect
        local u20 = u9.createRef()
        local v21 = u9.createRef()
        local v22 = u9.createRef()
        v19(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u17
                [3] = u8
            --]]
            local u24 = u1.Promise.defer(function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u8
                --]]
                while true do
                    local v23 = task.wait(0.5)
                    if v23 == 0 or (v23 ~= v23 or not v23) then
                        break
                    end
                    if os.time() >= u17.ResponseEndTime then
                        u8.Controllers.ReconnectLobbyController:cancelReconnectToMatch()
                    end
                end
            end)
            return function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:cancel()
            end
        end, { u17.ResponseEndTime })
        v19(function() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u11
            --]]
            local v25 = u20:getValue()
            if not v25 then
                return nil
            end
            local u26 = u11:Create(v25, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Position"] = UDim2.fromScale(0.5, 0.51)
            })
            local u27 = u11:Create(v25, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Position"] = UDim2.fromScale(0.5, 0.49)
            })
            u26:Play()
            u26.Completed:Connect(function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27:Play()
            end)
            u27.Completed:Connect(function() --[[ Line: 64 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:Play()
            end)
            return function() --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u27
                --]]
                u26:Destroy()
                u27:Destroy()
            end
        end, {})
        local v28 = u9.createElement
        local v29 = {
            ["DisplayOrder"] = 20,
            ["IgnoreGuiInset"] = u4.isSmallScreen()
        }
        local v30 = {}
        local v31 = u9.createElement
        local v32 = u6
        local v33 = {}
        local v34 = u9.createElement
        local v35 = {
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["Size"] = u14,
            ["Position"] = u15,
            ["AnchorPoint"] = u16,
            ["BackgroundColor3"] = u13.backgroundSecondary
        }
        local v36 = {}
        local v37 = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        local v38 = u9.createElement
        local v39 = u5
        local v40 = {
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v41 = { (u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.015, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            })) }
        local v42 = u9.createElement
        local v43 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.38, 0.42)
        }
        local v44 = {
            ["MascotImage"] = u9.createElement("ImageLabel", {
                [u9.Ref] = u20,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = "rbxassetid://16820928725",
                ["BackgroundTransparency"] = 1,
                ["ScaleType"] = Enum.ScaleType.Fit
            })
        }
        v41.ImageWrapper = v42("Frame", v43, v44)
        local v45 = u9.createElement
        local v46 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.8, 0.25),
            ["BackgroundColor3"] = u13.backgroundPrimary
        }
        local v47 = {
            u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            ["TextWrapper"] = u9.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.92, 0.92),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                }), u9.createElement("TextLabel", {
                    ["Text"] = "Existing match found!",
                    ["RichText"] = true,
                    ["LineHeight"] = 1.05,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }), u9.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["LineHeight"] = 1.05,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.5),
                    ["Text"] = "Attempting to reconnect you to your recent " .. u12(u17.QueueType).title .. " match.",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }) })
        }
        v41.Textbox = v45("Frame", v46, v47)
        local v48 = u9.createElement
        local v49 = u7
        local v50 = {
            ["LayoutOrder"] = 3,
            ["HideOnComplete"] = true,
            ["Size"] = UDim2.fromScale(0.6, 0.04),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["EndTime"] = u17.ResponseEndTime,
            ["ProgressBarConfig"] = {
                ["Flip"] = true,
                ["GradientRotation"] = 180,
                ["BarGradient"] = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
            }
        }
        local v51 = v48(v49, v50)
        local v52 = u9.createElement
        local v53 = u5
        local v54 = {
            ["LayoutOrder"] = 4,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(0.6, 0.1)
        }
        local v55 = { (u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.015, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            })) }
        local v56 = u9.createElement
        local v57 = u3
        local v58 = {
            [u9.Ref] = v21,
            ["CornerRadius"] = UDim.new(0.2, 0),
            ["Size"] = UDim2.fromScale(0.5, 0.9),
            ["TextLabel"] = {
                ["ZIndex"] = 4,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(0.9, 0.65),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            },
            ["Text"] = "Abandon",
            ["BackgroundColor3"] = u13.backgroundError,
            ["OnClick"] = function() --[[ Name: OnClick, Line 202 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                u8.Controllers.ReconnectLobbyController:cancelReconnectToMatch()
            end,
            ["ZIndex"] = 3,
            ["LayoutOrder"] = 1
        }
        v55.CancelReconnect = v56(v57, v58)
        local v59 = u9.createElement
        local v60 = u3
        local v61 = {
            [u9.Ref] = v22,
            ["CornerRadius"] = UDim.new(0.2, 0),
            ["Size"] = UDim2.fromScale(0.5, 0.9),
            ["TextLabel"] = {
                ["ZIndex"] = 4,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(0.9, 0.65),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            },
            ["Text"] = "Confirm",
            ["BackgroundColor3"] = u13.mcGreen,
            ["OnClick"] = function() --[[ Name: OnClick, Line 221 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                u8.Controllers.ReconnectLobbyController:confirmReconnectToMatch()
            end,
            ["ZIndex"] = 3,
            ["LayoutOrder"] = 2
        }
        v55.ConfirmReconnect = v59(v60, v61)
        __set_list(v41, 2, {v51, v52(v53, v54, v55)})
        __set_list(v36, 1, {v37, v38(v39, v40, v41)})
        __set_list(v33, 1, {v34("Frame", v35, v36)})
        __set_list(v30, 1, {v31(v32, {}, v33)})
        return v28("ScreenGui", v29, v30)
    end)
}