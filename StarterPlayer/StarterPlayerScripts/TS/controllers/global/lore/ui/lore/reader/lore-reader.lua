local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["LoreReader"] = v8.new(u7)(function(p12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u9
            [4] = u6
            [5] = u11
            [6] = u5
            [7] = u10
            [8] = u3
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local u16 = u7.createRef()
        local u17 = u7.createRef()
        local u18 = u7.createRef()
        local _, u19 = v14(0)
        local v20, u21 = v14(0)
        local v22, u23 = v14(0)
        local v24, u25 = v14(0)
        local v26 = u4.isSmallScreen() and 0.8 or 1
        local v27 = u9(p12.SelectedKit)
        if not v27.lore then
            return u7.createFragment()
        end
        local v28 = v27.lore.subtitle
        local v29 = v28 ~= "" and v28 and true or false
        v15(function() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u17
                [3] = u18
                [4] = u6
                [5] = u19
                [6] = u21
                [7] = u23
                [8] = u25
            --]]
            local u30 = u16:getValue()
            local u31 = u17:getValue()
            if not (u30 and (u31 and u18:getValue())) then
                return nil
            end
            local u32 = u6.new()
            u32:GiveTask(u30:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u30
                    [3] = u21
                --]]
                local v33 = u19
                local v34 = u30.CanvasPosition.Y
                local v35 = math.ceil(v34)
                local v36 = u30.CanvasSize.Y.Offset - u30.AbsoluteSize.Y
                v33(v35 / math.ceil(v36))
                local v37 = u21
                local v38 = u30.CanvasPosition.Y / u30.AbsoluteSize.Y
                v37((math.clamp(v38, 0, 1)))
            end))
            u32:GiveTask(u30:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u30
                --]]
                u23(u30.AbsoluteSize.Y)
            end))
            u32:GiveTask(u31:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 48 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u31
                --]]
                u25(u31.AbsoluteSize.Y)
            end))
            return function() --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u32
                --]]
                u32:DoCleaning()
            end
        end, {})
        local v39 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = -10,
            ["Size"] = p12.Size,
            ["BackgroundColor3"] = u11.backgroundPrimary
        }
        local v40 = {}
        local _ = #v40
        local v41 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v42 = {}
        local v43 = #v42
        local v44 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v45 = v27.lore.backgroundImage
        v44.Image = v45 == nil and "rbxassetid://10983634478" or v45
        v44.ScaleType = Enum.ScaleType.Crop
        v44.ZIndex = -4
        v42.BackgroundImage = u7.createElement("ImageLabel", v44, {
            ["BackgroundImageTint"] = u7.createElement("Frame", {
                ["BackgroundTransparency"] = 0.5,
                ["ZIndex"] = -3,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            })
        })
        local v46
        if v27.lore.disableKitImage == true then
            v46 = false
        else
            v46 = u7.createFragment({
                ["KitRender"] = u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = -2,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = v27.renderImage,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            })
        end
        if v46 then
            v42[v43 + 1] = v46
        end
        local _ = #v42
        v42.AlphaGradient = u7.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://13882686635",
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = -1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["ImageTransparency"] = 0.5 + v20,
            ["ScaleType"] = Enum.ScaleType.Stretch
        })
        local v47 = u7.createElement
        local v48 = {
            ["ZIndex"] = 0,
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v49 = 1 - v20
        v48.BackgroundTransparency = math.clamp(v49, 0.4, 1)
        v48.Size = UDim2.fromScale(1, 1)
        v42.Fade = v47("Frame", v48)
        v40.Background = u7.createElement(u5, v41, v42)
        local v50 = {
            ["WaitForAbsoluteSize"] = true,
            ["ScrollingFrameRef"] = u16
        }
        local v51 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }),
            u7.createElement("UIPadding", {
                ["PaddingBottom"] = UDim.new(0, 30)
            }),
            ["Box"] = u7.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, v22 - v24)
            })
        }
        local v52 = #v51
        local v53 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            [u7.Ref] = u17
        }
        local v54 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 30),
                ["PaddingBottom"] = UDim.new(0, 30)
            }),
            ["Title"] = u7.createElement("TextLabel", {
                ["LayoutOrder"] = 1,
                ["Font"] = "GothamBold",
                ["BackgroundTransparency"] = 1,
                ["AutomaticSize"] = Enum.AutomaticSize.XY,
                ["Text"] = v27.name,
                ["TextColor3"] = Color3.fromRGB(227, 212, 191),
                ["TextSize"] = v26 * 40,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        }
        local v55 = #v54
        if v29 then
            v29 = u7.createFragment({
                ["Subtitle"] = u7.createElement("TextLabel", {
                    ["LayoutOrder"] = 2,
                    ["Font"] = "GothamBold",
                    ["BackgroundTransparency"] = 1,
                    ["AutomaticSize"] = Enum.AutomaticSize.XY,
                    ["Text"] = v27.lore.subtitle,
                    ["TextColor3"] = Color3.fromRGB(222, 204, 176),
                    ["TextSize"] = v26 * 15,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            })
        end
        if v29 then
            v54[v55 + 1] = v29
        end
        local _ = #v54
        v54.StoryTitle = u7.createElement("TextLabel", {
            ["LayoutOrder"] = 2,
            ["Font"] = "GothamBold",
            ["BackgroundTransparency"] = 1,
            ["AutomaticSize"] = Enum.AutomaticSize.XY,
            ["Text"] = v27.lore.storyTitle,
            ["TextColor3"] = Color3.fromRGB(205, 164, 103),
            ["TextSize"] = v26 * 23,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
        v54.Scroll = u7.createElement(u5, {
            ["LayoutOrder"] = 3,
            ["AutomaticSize"] = Enum.AutomaticSize.XY
        }, {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 10),
                ["PaddingBottom"] = UDim.new(0, -20)
            }),
            ["ScrollText"] = u7.createElement("TextLabel", {
                ["LayoutOrder"] = 1,
                ["Text"] = "SCROLL TO BEGIN",
                ["Font"] = "GothamBold",
                ["BackgroundTransparency"] = 1,
                ["AutomaticSize"] = Enum.AutomaticSize.XY,
                ["TextColor3"] = Color3.fromRGB(224, 212, 196),
                ["TextSize"] = v26 * 12.5,
                ["TextTransparency"] = v20 * 2,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }),
            ["ScrollArrow"] = u7.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromOffset(35, 35),
                ["Image"] = u10.ARROW_DOWN_1,
                ["ImageColor3"] = Color3.fromRGB(224, 212, 196),
                ["ImageTransparency"] = v20 * 2,
                ["ScaleType"] = Enum.ScaleType.Fit
            })
        })
        v51.Header = u7.createElement(u5, v53, v54)
        v51.Body = u7.createElement("TextLabel", {
            ["LayoutOrder"] = 3,
            [u7.Ref] = u18,
            ["Size"] = UDim2.new(0.75, 0, 1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["TextColor3"] = Color3.fromRGB(245, 229, 206),
            ["Font"] = "Gotham",
            ["TextSize"] = v26 * 25,
            ["RichText"] = true,
            ["TextWrapped"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Top,
            ["Text"] = v27.lore.story,
            ["LineHeight"] = 1.1
        })
        local v56
        if v27.lore.author == nil then
            v56 = false
        else
            v56 = u7.createFragment({
                ["Credits"] = u7.createElement("TextLabel", {
                    ["LayoutOrder"] = 4,
                    ["Font"] = "Gotham",
                    ["BackgroundTransparency"] = 1,
                    ["AutomaticSize"] = Enum.AutomaticSize.XY,
                    ["Text"] = "by " .. v27.lore.author,
                    ["TextColor3"] = Color3.fromRGB(222, 204, 176),
                    ["TextSize"] = v26 * 15,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            })
        end
        if v56 then
            v51[v52 + 1] = v56
        end
        v51[#v51 + 1] = u7.createElement("Frame", {
            ["BackgroundTransparency"] = 0.25,
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.new(0.6, 0, 0, 5),
            ["BackgroundColor3"] = Color3.fromRGB(205, 164, 103)
        }, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }) })
        v40.Reader = u7.createElement(u3, v50, v51)
        return u7.createFragment({
            ["LoreReader"] = u7.createElement("Frame", v39, v40)
        })
    end)
}