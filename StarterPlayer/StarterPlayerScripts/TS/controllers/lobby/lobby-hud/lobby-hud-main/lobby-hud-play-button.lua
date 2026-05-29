local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.Padding
local u7 = v2.ShineEffect
local u8 = v2.ShineEffectVariation
local u9 = v2.SoundManager
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.TweenService
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["LobbyHudPlayButton"] = v12.new(u11)(function(p18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u10
            [4] = u15
            [5] = u5
            [6] = u3
            [7] = u16
            [8] = u14
            [9] = u9
            [10] = u17
            [11] = u7
            [12] = u8
            [13] = u6
        --]]
        local _ = p19.useState
        local v20 = p19.useEffect
        local u21 = u11.createRef()
        local u22 = u11.createRef()
        local v23
        if u4.isHoarceKat() then
            v23 = true
        else
            v23 = u10.Controllers.LobbyTutorialController:isFirstTimePlayer()
            if v23 == nil then
                v23 = false
            end
        end
        v20(function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u15
                [3] = u22
            --]]
            local u24 = u21:getValue()
            if u24 then
                local u25 = u15:Create(u24, TweenInfo.new(5, Enum.EasingStyle.Linear), {
                    ["Offset"] = Vector2.new(-1, 0)
                })
                u25:Play()
                u25.Completed:Connect(function() --[[ Line: 42 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u25
                    --]]
                    if u24.Rotation == 180 then
                        u24.Rotation = 0
                        u24.Offset = Vector2.new(1, 0)
                    else
                        u24.Rotation = 180
                        u24.Offset = Vector2.new(1, 0)
                    end
                    u25:Play()
                end)
            end
            local v26 = u22:getValue()
            if v26 then
                u15:Create(v26, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true, 1), {
                    ["Position"] = UDim2.new(0.5, 0, 0.7, -4)
                }):Play()
            end
        end, {})
        local v27 = {
            ["Size"] = UDim2.fromScale(0.3, 1)
        }
        local v28 = p18.FrameProps
        if v28 then
            for v29, v30 in v28 do
                v27[v29] = v30
            end
        end
        local v31 = {}
        local v32 = #v31
        if v23 then
            local v33 = u11.createFragment
            local v34 = {
                ["NewPlayerHint"] = u11.createElement(u5, {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, -0.2),
                    ["AnchorPoint"] = Vector2.new(0.5, 1)
                }, {
                    ["HelperText"] = u11.createElement("TextLabel", {
                        ["Text"] = "Play your first match!",
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.35),
                        ["TextColor3"] = u3.WHITE,
                        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
                    }, { u11.createElement("UIStroke", {
                            ["Thickness"] = 1
                        }) }),
                    ["DownArrowImage"] = u11.createElement("ImageLabel", {
                        ["Position"] = UDim2.fromScale(0.5, 0.7),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["SizeConstraint"] = "RelativeYY",
                        ["Image"] = u16.ARROW_DOWN_1,
                        ["BackgroundTransparency"] = 1,
                        [u11.Ref] = u22,
                        ["LayoutOrder"] = 2
                    })
                })
            }
            v23 = v33(v34)
        end
        if v23 then
            v31[v32 + 1] = v23
        end
        local v35 = #v31
        local v36 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.WHITE
        }
        local v37 = p18.ButtonProps
        if v37 then
            for v38, v39 in v37 do
                v36[v38] = v39
            end
        end
        v36[u11.Event.Activated] = function() --[[ Line: 118 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u10
                [3] = u9
                [4] = u17
            --]]
            local v40 = u14.LocalPlayer:GetAttribute("ResolvingMatchDisconnect")
            if v40 ~= 0 and (v40 == v40 and (v40 ~= "" and v40)) then
                return nil
            end
            u10.Controllers.LobbyHudController:openLobbyPlayMenu()
            u9:playSound(u17.UI_CLICK_2)
        end
        local v41 = {
            u11.createElement(u7, {
                ["Loop"] = false,
                ["OnHover"] = true,
                ["Color"] = u3.WHITE,
                ["Variation"] = u8.solid
            }),
            u11.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            u11.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromRGB(114, 255, 120)
            }, { u11.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                }) }),
            u11.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new(Color3.fromRGB(35, 218, 53), Color3.fromRGB(54, 235, 94)),
                [u11.Ref] = u21
            })
        }
        local _ = #v41
        local v42 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v43 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center"
            }), u11.createElement(u6, {
                ["Padding"] = UDim.new(0, 6)
            }), u11.createElement("TextLabel", {
                ["Text"] = "PLAY",
                ["TextSize"] = 26,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.7, 1),
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }) }
        local v44 = #v43
        local v45 = p18[u11.Children]
        if v45 then
            for v46, v47 in v45 do
                if type(v46) == "number" then
                    v43[v44 + v46] = v47
                else
                    v43[v46] = v47
                end
            end
        end
        v41.Content = u11.createElement(u5, v42, v43)
        v31[v35 + 1] = u11.createElement("ImageButton", v36, v41)
        return u11.createElement(u5, v27, v31)
    end)
}