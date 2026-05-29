local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.ImageId
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
return {
    ["TournamentCreateTeamPage"] = v8.new(u7)(function(_, p13) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u10
            [4] = u6
            [5] = u4
            [6] = u3
            [7] = u5
            [8] = u11
            [9] = u12
        --]]
        local v14, u15 = p13.useState(false)
        local u16 = u7.createRef()
        local u17 = u7.createRef()
        local function u19(p18) --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u10
            --]]
            if not p18 then
                return nil
            end
            u9:Create(p18, TweenInfo.new(u10.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["ImageTransparency"] = 0
            }):Play()
        end
        local function u21(p20) --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u10
            --]]
            if not p20 then
                return nil
            end
            u9:Create(p20, TweenInfo.new(u10.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["TextTransparency"] = 0
            }):Play()
        end
        local function u23(p22) --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            if not p22 then
                return nil
            end
            u9:Create(p22, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
                ["Rotation"] = 360
            }):Play()
        end
        local v24 = u7.createFragment
        local v25 = {}
        local v26 = u7.createElement
        local v27 = {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["BackgroundColor3"] = Color3.fromHex("403E74")
        }
        local v28 = {
            ["Gradient"] = u7.createElement("UIGradient", {
                ["Rotation"] = 60,
                ["Transparency"] = NumberSequence.new(0.6, 1),
                ["Color"] = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
            }),
            ["CreateTeamHeader"] = u7.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["Text"] = "You aren\226\128\153t in a team right now. Create a team or accept an invitation on the INVITES page.",
                ["Size"] = UDim2.fromScale(0.7, 0.1),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0.08),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            ["CreateTeamButton"] = u7.createElement("TextButton", {
                ["Text"] = "Create Team",
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Font"] = Enum.Font.ArialBold,
                ["BackgroundColor3"] = Color3.fromHex("30CE5C"),
                ["Position"] = UDim2.fromScale(0.5, 0.35),
                ["Size"] = UDim2.fromScale(0.3, 0.2),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextSize"] = 26,
                [u7.Event.Activated] = function(_) --[[ Line: 78 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u19
                        [3] = u16
                        [4] = u23
                        [5] = u21
                        [6] = u17
                        [7] = u6
                    --]]
                    u15(true)
                    task.spawn(function() --[[ Line: 80 ]]
                        --[[
                        Upvalues:
                            [1] = u19
                            [2] = u16
                            [3] = u23
                            [4] = u21
                            [5] = u17
                        --]]
                        u19(u16:getValue())
                        u23(u16:getValue())
                        u21(u17:getValue())
                    end)
                    if not u6.Controllers.TournamentTeamController:createTournamentTeam() then
                        u15(false)
                    end
                end,
                ["ZIndex"] = 4
            }, { u7.createElement("UIGradient", {
                    ["Color"] = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                }), u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }) })
        }
        local v29 = u7.createElement
        local v30 = u4
        local v31 = {
            ["Size"] = UDim2.fromScale(0.3, 0.3),
            ["Position"] = UDim2.fromScale(0.5, 0.65),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v32 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.03, 0),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u7.createElement("TextLabel", {
                [u7.Ref] = u17,
                ["Text"] = "<i>Creating a new team...</i>",
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Size"] = UDim2.fromScale(1, 0.12),
                ["TextColor3"] = u3.WHITE,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["TextStrokeTransparency"] = 1,
                ["TextTransparency"] = v14 and 0 or 1,
                ["TextYAlignment"] = "Center",
                ["Font"] = Enum.Font.Roboto,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 5,
                ["LayoutOrder"] = 2
            }),
            ["LoadingSpinner"] = u7.createElement("ImageLabel", {
                [u7.Ref] = u16,
                ["Image"] = u5.LOADING_SPINNER,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.35, 0.35),
                ["ImageTransparency"] = v14 and 0 or 1,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["ZIndex"] = 5,
                ["LayoutOrder"] = 1
            })
        }
        __set_list(v28, 1, {(v29(v30, v31, v32))})
        v28.DecorativeBackgroundImage = u7.createElement("ImageLabel", {
            ["ImageTransparency"] = 0.8,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 2,
            ["Image"] = u11[u12.PENGUIN_SLEEP].image,
            ["Size"] = UDim2.fromScale(0.5, 0.7),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["Position"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(1, 1)
        })
        v25["App Content - Create Team Page"] = v26("Frame", v27, v28)
        return v24(v25)
    end)
}