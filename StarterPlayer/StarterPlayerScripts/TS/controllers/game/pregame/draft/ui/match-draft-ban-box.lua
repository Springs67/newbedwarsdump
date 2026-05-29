local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.Empty
local u5 = v2.StringUtil
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutCubic
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["MatchDraftBanBox"] = v9.new(u8)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u10
            [3] = u7
            [4] = u5
            [5] = u6
            [6] = u3
            [7] = u11
            [8] = u12
            [9] = u4
        --]]
        local _ = p14.useState
        local v15 = p14.useEffect
        local u16 = u8.createRef()
        local function v19() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u10
                [3] = u7
            --]]
            local u17 = u16:getValue()
            if u17 then
                u10(0.2, u7, function(p18) --[[ Line: 21 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                    --]]
                    u17.Position = p18
                end, UDim2.fromScale(1, -0.4), UDim2.fromScale(1, 0))
            end
        end
        local v20 = p13.BanData
        if v20 ~= nil then
            v20 = v20.Kit
        end
        v15(v19, { v20 })
        local v21 = p13.BanData
        if v21 ~= nil then
            v21 = v21.Probability
        end
        local v22 = v21 ~= nil
        if v22 then
            local v23 = {
                ["Size"] = UDim2.fromScale(1, 0.25)
            }
            local v24 = u5
            local v25 = p13.BanData
            if v25 ~= nil then
                v25 = v25.Probability
            end
            local v26 = v25 == nil and 0 or v25
            v23.Text = v24.roundNumber(v26 * 100, 1) .. "%"
            v23.TextColor3 = Color3.fromRGB(255, 255, 255)
            v23.TextXAlignment = "Center"
            v23.TextScaled = true
            v23.Font = Enum.Font.SourceSansBold
            v23.AutoLocalize = false
            v23.BorderSizePixel = 0
            v23.BackgroundTransparency = 1
            v23.LayoutOrder = 1
            v22 = u8.createFragment({
                ["Probability"] = u8.createElement("TextLabel", v23)
            })
        end
        local v27 = {
            ["Size"] = p13.Size or UDim2.fromScale(1, 1),
            ["Position"] = p13.Position,
            ["AnchorPoint"] = p13.AnchorPoint
        }
        local v28 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Bottom",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.9
            }) }
        local v29 = #v28
        if v22 then
            v28[v29 + 1] = v22
        end
        local _ = #v28
        local v30 = {}
        local v31 = UDim2
        local v32 = p13.BanData
        if v32 ~= nil then
            v32 = v32.Probability
        end
        v30.Size = v31.fromScale(1, v32 == nil and 1 or 0.7)
        v30.SizeConstraint = "RelativeYY"
        v30.BackgroundColor3 = Color3.fromRGB(159, 49, 49)
        v30.BorderColor3 = p13.TeamColor or Color3.fromRGB(28, 28, 28)
        v30.LayoutOrder = 2
        local v33 = p13.BanData
        if v33 ~= nil then
            v33 = v33.Kit
        end
        if v33 then
            v33 = u8.createElement(u6, {}, { u8.createElement(u3, {
                    ["TextSize"] = 16,
                    ["Text"] = u11[p13.BanData.Kit].name,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) })
        end
        local v34 = { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) }
        local v35 = #v34
        if v33 then
            v34[v35 + 1] = v33
        end
        local v36 = #v34
        local v37 = p13.BanData
        if v37 ~= nil then
            v37 = v37.Kit
        end
        if v37 then
            v37 = u8.createFragment({
                ["KitImage"] = u8.createElement("ImageLabel", {
                    ["Image"] = u11[p13.BanData.Kit].renderImage,
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = "Crop",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["SizeConstraint"] = "RelativeYY",
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.fromScale(1, 0),
                    [u8.Ref] = u16
                })
            })
        end
        if v37 then
            v34[v36 + 1] = v37
        end
        local v38 = #v34
        local v39 = p13.BanData
        if v39 ~= nil then
            v39 = v39.LockedIn
        end
        if v39 then
            v39 = u8.createFragment({
                ["BanIcon"] = u8.createElement("ImageLabel", {
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = "Crop",
                    ["BackgroundTransparency"] = 1,
                    ["SizeConstraint"] = "RelativeYY",
                    ["Image"] = u12.BLOCK_ICON,
                    ["Size"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(1, 1),
                    ["Position"] = UDim2.fromScale(1, 1)
                }, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        end
        if v39 then
            v34[v38 + 1] = v39
        end
        local v40 = #v34
        local v41 = p13[u8.Children]
        if v41 then
            for v42, v43 in v41 do
                if type(v42) == "number" then
                    v34[v40 + v42] = v43
                else
                    v34[v42] = v43
                end
            end
        end
        v28.Box = u8.createElement("Frame", v30, v34)
        return u8.createFragment({
            ["MatchDraftBanBox"] = u8.createElement(u4, v27, v28)
        })
    end)
}