local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Countdown
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
return {
    ["OneForAllBoard"] = v7.new(u6)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u8
            [4] = u5
            [5] = u4
        --]]
        local _ = p10.useState
        local _ = p10.useEffect
        local v11 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, -6, -4.5),
            ["ResetOnSpawn"] = false,
            ["MaxDistance"] = 200,
            ["Adornee"] = p9.Adornee,
            ["Size"] = UDim2.fromScale(6, 3)
        }
        local v12 = {}
        local _ = #v12
        local v13 = {
            ["BorderSizePixel"] = 1,
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(26, 26, 31)
        }
        local v14 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Color"] = Color3.fromRGB(6, 6, 6)
            }) }
        local v15 = #v14
        local v16
        if p9.BedwarsKit == nil then
            v16 = false
        else
            local v17 = u6.createFragment
            local v18 = {}
            local v19 = u6.createElement
            local v20 = {
                ["LayoutOrder"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["BackgroundColor3"] = u3.WHITE
            }
            local v21 = {
                u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }),
                u6.createElement("UIGradient", {
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 208, 88)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 219, 126)) })
                }),
                ["KitImage"] = u6.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(-0.15, 0.4),
                    ["Size"] = UDim2.fromScale(3, 3),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["Image"] = u8(p9.BedwarsKit).renderImage
                }),
                ["KitName"] = u6.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Right",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.fromScale(0.925, 0.5),
                    ["Size"] = UDim2.fromScale(0.85, 0.8),
                    ["Text"] = u8(p9.BedwarsKit).name,
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
                }, { u6.createElement("UIStroke", {
                        ["Transparency"] = 0.3,
                        ["Thickness"] = 2,
                        ["Color"] = u3.BLACK
                    }) })
            }
            v18.ActiveKitContainer = v19("Frame", v20, v21)
            v16 = v17(v18)
        end
        if v16 then
            v14[v15 + 1] = v16
        end
        local v22 = #v14
        local v23
        if p9.EndTime == 0 then
            v23 = false
        else
            local v24 = u6.createFragment
            local v25 = {}
            local v26 = u6.createElement
            local v27 = u5
            local v28 = {
                ["Size"] = UDim2.fromScale(0.75, 0.45),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Position"] = UDim2.fromScale(1, 0)
            }
            local v29 = {
                u6.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.1, 0),
                    ["PaddingBottom"] = UDim.new(0.1, 0),
                    ["PaddingLeft"] = UDim.new(0.075, 0),
                    ["PaddingRight"] = UDim.new(0.075, 0)
                }),
                u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Right",
                    ["SortOrder"] = "LayoutOrder"
                }),
                ["HelperLabel"] = u6.createElement("TextLabel", {
                    ["Text"] = "NEXT KIT IN",
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Right",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = Color3.fromRGB(255, 208, 88)
                })
            }
            local v30 = u6.createElement
            local v31 = u4
            local v32 = {
                ["EndTime"] = p9.EndTime,
                ["TextLabel"] = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.6),
                    ["TextXAlignment"] = Enum.TextXAlignment.Right
                },
                ["CountdownConfig"] = {
                    ["seconds"] = true,
                    ["minutes"] = true,
                    ["hours"] = true
                }
            }
            __set_list(v29, 3, {v30(v31, v32, { u6.createElement("UIStroke", {
        ["Thickness"] = 3,
        ["Color"] = Color3.fromRGB(6, 6, 6)
    }) })})
            v25.CountdownContainer = v26(v27, v28, v29)
            v23 = v24(v25)
        end
        if v23 then
            v14[v22 + 1] = v23
        end
        v12.Container = u6.createElement("Frame", v13, v14)
        return u6.createFragment({
            ["OneForAllBoard"] = u6.createElement("BillboardGui", v11, v12)
        })
    end)
}