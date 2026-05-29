local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Countdown
local u5 = v3.Empty
local u6 = v3.Padding
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.RunService
local u12 = v10.TweenService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["BundleSideButton"] = v9.new(u8)(function(p16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
            [3] = u7
            [4] = u11
            [5] = u12
            [6] = u2
            [7] = u13
            [8] = u6
            [9] = u5
            [10] = u15
            [11] = u4
        --]]
        local _ = p17.useState
        local v18 = p17.useEffect
        local u19 = u8.createRef()
        local u20 = u8.createRef()
        local u21 = u8.createRef()
        local u22 = u8.createRef()
        local v23 = u14[p16.BundleType]
        v18(function() --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
                [3] = u7
                [4] = u11
            --]]
            local u24 = u19:getValue()
            local u25 = u20:getValue()
            if not (u24 and u25) then
                return nil
            end
            local u26 = u7.new()
            u26:GiveTask(u11.Heartbeat:Connect(function(_) --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u25
                --]]
                u24.Rotation = u24.Rotation + 0.5
                u25.Rotation = u25.Rotation - 0.25
            end))
            return function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:DoCleaning()
            end
        end, {})
        v18(function() --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u22
                [3] = u7
                [4] = u12
            --]]
            local v27 = u21:getValue()
            if not (v27 and u22:getValue()) then
                return nil
            end
            local u28 = u7.new()
            local u29 = u12:Create(v27, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Rotation"] = 5,
                ["Size"] = UDim2.fromScale(1.1, 1.1),
                ["Position"] = UDim2.new(0.5, 0, 0.3, 0)
            })
            local u30 = u12:Create(v27, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ["Rotation"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.35)
            })
            u28:GiveTask(v27.MouseEnter:Connect(function() --[[ Line: 73 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29:Play()
            end))
            u28:GiveTask(v27.MouseLeave:Connect(function() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30:Play()
            end))
            return function() --[[ Line: 89 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:DoCleaning()
            end
        end, {})
        local v31 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v32 = {}
        local v33 = u8.createElement
        local v34 = {
            [u8.Ref] = u21,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.35),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            [u8.Event.Activated] = function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u13
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u13.STORE_MENU_APP, {})
            end,
            ["BackgroundTransparency"] = 1
        }
        local v35 = {
            u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }),
            u8.createElement(u6, {
                ["Padding"] = UDim.new(0.1, 0)
            }),
            ["Image"] = u8.createElement(u5, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 1,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = v23.image
                }) }),
            ["BackgroundEffectsContainer"] = u8.createElement(u5, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 0,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1.5, 1.5),
                    ["Image"] = u15.SOLID_BLURRED_CIRCLE
                }), u8.createElement("ImageLabel", {
                    [u8.Ref] = u19,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(2.2, 2.2),
                    ["Image"] = u15.SOLID_BLURRED_12_POINT_STAR,
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 0
                }), u8.createElement("ImageLabel", {
                    [u8.Ref] = u20,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(2.2, 2.2),
                    ["Image"] = u15.SOLID_BLURRED_7_POINT_STAR,
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 0
                }) })
        }
        __set_list(v32, 1, {(v33("ImageButton", v34, v35))})
        v32.TextContainer = u8.createElement("Frame", {
            [u8.Ref] = u22,
            ["Position"] = UDim2.fromScale(0.5, 0.7),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.7, 0.25),
            ["BackgroundColor3"] = Color3.fromRGB(255, 55, 6),
            ["ZIndex"] = 2
        }, {
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            }),
            u8.createElement("UIStroke", {
                ["Color"] = Color3.fromRGB(255, 179, 52)
            }),
            u8.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0),
                ["PaddingTop"] = UDim.new(0.05, 0)
            }),
            u8.createElement("TextLabel", {
                ["ZIndex"] = 2,
                ["BackgroundTransparency"] = 1,
                ["Text"] = "Limited Offer!",
                ["TextScaled"] = true,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.FredokaOne).Family, Enum.FontWeight.Bold)
            })
        })
        local v36 = #v32
        local v37
        if p16.EndTime == nil then
            v37 = false
        else
            local v38 = u8.createElement
            local v39 = u4
            local v40 = {
                ["EndTime"] = p16.EndTime,
                ["TextLabel"] = {
                    ["ZIndex"] = 3,
                    ["TextStrokeTransparency"] = 0.3,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(1.25, 0.22),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextStrokeColor3"] = Color3.fromRGB(20, 0, 28),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["Position"] = UDim2.fromScale(0.5, 0.8)
                },
                ["CountdownConfig"] = {
                    ["seconds"] = false,
                    ["minutes"] = true,
                    ["hours"] = true,
                    ["days"] = true
                }
            }
            v37 = v38(v39, v40)
        end
        if v37 then
            v32[v36 + 1] = v37
        end
        return u8.createFragment({
            ["BundleSideButton"] = u8.createElement(u5, v31, v32)
        })
    end)
}