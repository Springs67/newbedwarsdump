local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.Padding
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.TweenService
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "unlocks", "unlocks-config").UnlocksConfig
return {
    ["LobbyHudMainButton"] = v10.new(u9)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u12
            [4] = u14
            [5] = u18
            [6] = u8
            [7] = u13
            [8] = u17
            [9] = u7
            [10] = u16
            [11] = u5
            [12] = u3
            [13] = u15
            [14] = u6
        --]]
        local _ = p20.useState
        local v21 = p20.useEffect
        local u22 = u9.createRef()
        local v23 = u19.Text == "Kits"
        local v24 = v23 and (u4.isHoarceKat() and true or u12.LocalPlayer:GetAttribute("ShowKitHelper") == true)
        if v24 then
            v24 = u19.store.Bedwars.kit == u14.NONE and true or u19.store.Bedwars.kit == nil
        end
        if v23 then
            v23 = u18.isFreeKitsEventActive()
            if v23 then
                v23 = not v24
            end
        end
        v21(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u22
                [3] = u13
            --]]
            local u25 = u8.new()
            local v26 = u22:getValue()
            if v26 then
                local v27 = u13:Create(v26, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true, 1), {
                    ["Position"] = UDim2.new(0.5, 0, 0.7, -4)
                })
                v27:Play()
                u25:GiveTask(v27)
            end
            return function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:DoCleaning()
            end
        end, {})
        local v28 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.3, 1),
            ["BackgroundColor3"] = u17.backgroundPrimary
        }
        local v29 = u19.FrameProps
        if v29 then
            for v30, v31 in v29 do
                v28[v30] = v31
            end
        end
        v28[u9.Event.Activated] = function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u16
                [3] = u19
            --]]
            u7:playSound(u16.UI_CLICK_2)
            u19.OnClick()
        end
        local v32 = {}
        local v33 = #v32
        if v24 then
            v24 = u9.createFragment({
                ["NewPlayerHint"] = u9.createElement(u5, {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, -0.2),
                    ["AnchorPoint"] = Vector2.new(0.5, 1)
                }, {
                    ["HelperText"] = u9.createElement("TextLabel", {
                        ["Text"] = "Equip a kit!",
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.5),
                        ["Position"] = UDim2.fromScale(0, -0.2),
                        ["TextColor3"] = u3.WHITE,
                        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
                    }, { u9.createElement("UIStroke", {
                            ["Thickness"] = 1
                        }) }),
                    ["DownArrowImage"] = u9.createElement("ImageLabel", {
                        ["Position"] = UDim2.fromScale(0.5, 0.7),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["SizeConstraint"] = "RelativeYY",
                        ["Image"] = u15.ARROW_DOWN_1,
                        ["BackgroundTransparency"] = 1,
                        [u9.Ref] = u22,
                        ["LayoutOrder"] = 2
                    })
                })
            })
        end
        if v24 then
            v32[v33 + 1] = v24
        end
        local v34 = #v32
        v32[v34 + 1] = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        if v23 then
            v23 = u9.createElement("TextLabel", {
                ["Text"] = "\240\159\148\165 ALL KITS FREE!",
                ["TextScaled"] = true,
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 1),
                ["Position"] = UDim2.fromScale(0.5, -0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextSize"] = u4.isSmallScreen() and 12 or 14
            }, { u9.createElement("UIStroke", {
                    ["Transparency"] = 0.3,
                    ["Color"] = Color3.fromRGB(0, 0, 0)
                }) })
        end
        if v23 then
            v32[v34 + 2] = v23
        end
        local v35 = #v32
        local v36 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v37 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 3)
            }), u9.createElement(u6, {
                ["Padding"] = {
                    ["Vertical"] = 6,
                    ["Horizontal"] = 4
                }
            }) }
        local v38 = #v37
        local v39
        if u19.Icon == nil then
            v39 = false
        else
            v39 = u9.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Image"] = u19.Icon,
                ["Size"] = UDim2.fromScale(1, 0.8)
            })
        end
        if v39 then
            v37[v38 + 1] = v39
        end
        v37[#v37 + 1] = u9.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Text"] = string.upper(u19.Text),
            ["Size"] = UDim2.fromScale(0.7, 1),
            ["TextColor3"] = u3.WHITE,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextSize"] = u4.isSmallScreen() and 12 or 14
        })
        v32.Content = u9.createElement(u5, v36, v37)
        local v40 = u19[u9.Children]
        if v40 then
            for v41, v42 in v40 do
                if type(v41) == "number" then
                    v32[v35 + v41] = v42
                else
                    v32[v41] = v42
                end
            end
        end
        return u9.createElement("ImageButton", v28, v32)
    end)
}