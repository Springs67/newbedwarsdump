local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.ShineEffect
local u8 = v2.ShineEffectVariation
local u9 = v2.SlideIn
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = UDim2.fromScale(0.6, 0.9)
local u16 = UDim2.fromScale(0.5, 0.46)
local u17 = Vector2.new(0.5, 0.5)
return {
    ["TutorialPromptMenu"] = v12.new(u11)(function(_, p18) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u13
            [3] = u5
            [4] = u9
            [5] = u15
            [6] = u16
            [7] = u17
            [8] = u14
            [9] = u6
            [10] = u4
            [11] = u3
            [12] = u10
            [13] = u7
            [14] = u8
        --]]
        local _ = p18.useState
        local v19 = p18.useEffect
        local u20 = u11.createRef()
        v19(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u13
            --]]
            local v21 = u20:getValue()
            if not v21 then
                return nil
            end
            local u22 = u13:Create(v21, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Position"] = UDim2.fromScale(0.5, 0.51)
            })
            local u23 = u13:Create(v21, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Position"] = UDim2.fromScale(0.5, 0.49)
            })
            u22:Play()
            u22.Completed:Connect(function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:Play()
            end)
            u23.Completed:Connect(function() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                u22:Play()
            end)
            return function() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u23
                --]]
                u22:Destroy()
                u23:Destroy()
            end
        end, {})
        local v24 = u11.createElement
        local v25 = {
            ["DisplayOrder"] = 30,
            ["IgnoreGuiInset"] = u5.isSmallScreen()
        }
        local v26 = {}
        local v27 = u11.createElement
        local v28 = u9
        local v29 = {}
        local v30 = u11.createElement
        local v31 = {
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["Size"] = u15,
            ["Position"] = u16,
            ["AnchorPoint"] = u17,
            ["BackgroundColor3"] = u14.backgroundSecondary
        }
        local v32 = {}
        local v33 = u11.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        local v34 = u11.createElement
        local v35 = u6
        local v36 = {
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v37 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.015, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }), (u11.createElement("TextLabel", {
                ["RichText"] = true,
                ["LineHeight"] = 1.05,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.8, 0.06),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = "Welcome to <font color=\"" .. u4.richTextColor(Color3.fromRGB(97, 222, 254)) .. "\">Bed</font><font color=\"" .. u4.richTextColor(Color3.fromRGB(255, 84, 98)) .. "\">Wars</font>!",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Font"] = Enum.Font.LuckiestGuy,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })) }
        local v38 = u11.createElement
        local v39 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.38, 0.42)
        }
        local v40 = {
            ["MascotImage"] = u11.createElement("ImageLabel", {
                [u11.Ref] = u20,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = "rbxassetid://16820928725",
                ["BackgroundTransparency"] = 1,
                ["ScaleType"] = Enum.ScaleType.Fit
            })
        }
        v37.ImageWrapper = v38("Frame", v39, v40)
        local v41 = u11.createElement
        local v42 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.8, 0.25),
            ["BackgroundColor3"] = u14.backgroundPrimary
        }
        local v43 = {
            u11.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            ["TextWrapper"] = u11.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.92, 0.92),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u11.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                }), u11.createElement("TextLabel", {
                    ["Text"] = "Complete the BedWars Tutorial for <b>FREE</b> rewards!",
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
                }), u11.createElement("TextLabel", {
                    ["Text"] = "\226\128\162 Choose a beginner kit to try out!\n\226\128\162 Get the [\240\159\142\147 Scholar] title",
                    ["RichText"] = true,
                    ["LineHeight"] = 1.05,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.5),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Top
                }) })
        }
        v37.Textbox = v41("Frame", v42, v43)
        local v44 = u11.createElement
        local v45 = u3
        local v46 = {
            ["Text"] = "Begin Tutorial",
            ["LayoutOrder"] = 3,
            ["CornerRadius"] = UDim.new(0.1, 0),
            ["Size"] = UDim2.fromScale(0.4, 0.1),
            ["TextLabel"] = {
                ["ZIndex"] = 2,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(0.9, 0.65),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            },
            ["BackgroundColor3"] = Color3.fromRGB(44, 184, 96),
            ["OnClick"] = function() --[[ Name: OnClick, Line 167 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10.Controllers.LobbyTutorialController:respondToTutorialPrompt(true)
            end
        }
        v37.BeginTutorialButton = v44(v45, v46, { u11.createElement(u7, {
                ["Loop"] = false,
                ["OnHover"] = true,
                ["Variation"] = u8.gradientLarge
            }) })
        local v47 = u11.createElement
        local v48 = u3
        local v49 = {
            ["Text"] = "Return to Lobby",
            ["ZIndex"] = 2,
            ["LayoutOrder"] = 4,
            ["CornerRadius"] = UDim.new(0.2, 0),
            ["Size"] = UDim2.fromScale(0.3, 0.06),
            ["TextLabel"] = {
                ["ZIndex"] = 2,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(0.9, 0.65),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            },
            ["BackgroundColor3"] = u14.backgroundTertiary,
            ["OnClick"] = function() --[[ Name: OnClick, Line 190 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10.Controllers.LobbyTutorialController:respondToTutorialPrompt(false)
            end
        }
        v37.ReturnToLobbyButton = v47(v48, v49)
        __set_list(v37, 3, {u11.createElement("TextLabel", {
    ["Text"] = "(You will be able to complete the tutorial at a later time.)",
    ["RichText"] = true,
    ["LineHeight"] = 1.05,
    ["TextScaled"] = true,
    ["TextTransparency"] = 0.3,
    ["BackgroundTransparency"] = 1,
    ["LayoutOrder"] = 5,
    ["Size"] = UDim2.fromScale(0.8, 0.035),
    ["Position"] = UDim2.fromScale(0.5, 0),
    ["AnchorPoint"] = Vector2.new(0.5, 0),
    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
    ["Font"] = Enum.Font.Arial,
    ["TextXAlignment"] = Enum.TextXAlignment.Center,
    ["TextYAlignment"] = Enum.TextYAlignment.Top
})})
        __set_list(v32, 1, {v33, v34(v35, v36, v37)})
        __set_list(v29, 1, {v30("Frame", v31, v32)})
        __set_list(v26, 1, {v27(v28, {}, v29)})
        return v24("ScreenGui", v25, v26)
    end)
}