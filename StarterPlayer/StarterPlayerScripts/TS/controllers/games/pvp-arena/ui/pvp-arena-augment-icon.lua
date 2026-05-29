local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.Empty
local u5 = v2.TooltipContainer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-category-meta").getPvpArenaAugmentCategoryMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-class").PvPArenaAugmentClass
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-class-meta").getPvpArenaAugmentClassMeta
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-meta")
local u14 = v13.getPvPArenaAugmentDescription
local u15 = v13.getPvPArenaAugmentMeta
return {
    ["PvPArenaAugmentIcon"] = v8.new(u7)(function(p16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u10
            [3] = u11
            [4] = u12
            [5] = u6
            [6] = u9
            [7] = u7
            [8] = u3
            [9] = u14
            [10] = u5
            [11] = u4
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local v20 = u15(p16.Augment)
        local v21 = u10(v20.augmentCategory)
        local v22 = v20.augmentClass
        if v22 == nil then
            v22 = u11.STAT
        end
        local v23 = u12(v22)
        local v24, u25 = v18(0)
        v19(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u9
                [3] = u25
            --]]
            local u26 = u6.new()
            local u27 = math.random() * 30
            local u28 = math.random() * 0.2 + 0.9
            u26:GiveTask(u9.Heartbeat:Connect(function(p29) --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u28
                    [3] = u25
                --]]
                u27 = u27 + p29 * u28
                u25(u27)
            end))
            return function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:DoCleaning()
            end
        end, {})
        local v30 = {}
        local v31 = p16.FrameProps
        if v31 then
            for v32, v33 in v31 do
                v30[v32] = v33
            end
        end
        local v34 = {}
        local v35 = #v34
        local v36 = {
            ["BackgroundTransparency"] = 1,
            ["Image"] = "rbxassetid://10899316316",
            ["Size"] = UDim2.fromScale(0.915, 0.915),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v37 = p16.FrameProps
        if v37 ~= nil then
            v37 = v37.ZIndex
        end
        v36.ZIndex = v37 == nil and 2 or v37
        v36.Rotation = 90
        v34.OuterHexagon = u7.createElement("ImageLabel", v36, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.1504424778761062
            }), u7.createElement("UIGradient", {
                ["Color"] = v21.hexagonOutlineGradient,
                ["Rotation"] = 45 + v24 * 150
            }) })
        local v38 = {
            ["BackgroundTransparency"] = 1,
            ["Image"] = "rbxassetid://10899316316",
            ["Size"] = UDim2.fromScale(0.815, 0.815),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v39 = p16.FrameProps
        if v39 ~= nil then
            v39 = v39.ZIndex
        end
        v38.ZIndex = (v39 == nil and 3 or v39) + 1
        v38.Rotation = 90
        v34.InnerHexagon = u7.createElement("ImageLabel", v38, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.1497584541062802
            }), u7.createElement("UIGradient", {
                ["Rotation"] = -45,
                ["Color"] = ColorSequence.new(Color3.fromRGB(23, 23, 23), Color3.fromRGB(97, 97, 97)),
                ["Offset"] = Vector2.new(0.5, 0)
            }) })
        local v40 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.4, 0.4),
            ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Image"] = v23.image
        }
        local v41 = p16.FrameProps
        if v41 ~= nil then
            v41 = v41.ZIndex
        end
        v40.ZIndex = (v41 == nil and 4 or v41) + 2
        v34.CutoutImageIcon = u7.createElement("ImageLabel", v40, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.1497584541062802
            }) })
        local v42 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.3233333333333333, 0.3233333333333333),
            ["Position"] = UDim2.new(0.85, 0, 0.85, 0),
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Image"] = v20.image
        }
        local v43 = p16.FrameProps
        if v43 ~= nil then
            v43 = v43.ZIndex
        end
        v42.ZIndex = (v43 == nil and 5 or v43) + 3
        v34.CutoutImageSubIcon = u7.createElement("ImageLabel", v42, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.1497584541062802
            }) })
        local v44 = p16.EnableTooltip
        if v44 then
            local v45 = { u7.createElement(u3, {
                    ["TextSize"] = 16,
                    ["Text"] = v20.displayName,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }
            local v46 = #v45
            local v47
            if v21.title == nil then
                v47 = false
            else
                v47 = u7.createElement(u3, {
                    ["TextSize"] = 14,
                    ["Text"] = v21.title.displayName .. " Relic",
                    ["Font"] = Enum.Font.SourceSans,
                    ["TextColor3"] = v21.title.color,
                    ["Limits"] = Vector2.new(300, 60)
                })
            end
            if v47 then
                v45[v46 + 1] = v47
            end
            v45[#v45 + 1] = u7.createElement(u3, {
                ["TextSize"] = 14,
                ["Text"] = u14(p16.Augment, true),
                ["Font"] = Enum.Font.SourceSans,
                ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                ["Limits"] = Vector2.new(300, 60)
            })
            v44 = u7.createElement(u5, {}, v45)
        end
        if v44 then
            v34[v35 + 1] = v44
        end
        return u7.createFragment({
            ["AugmentIcon"] = u7.createElement(u4, v30, v34)
        })
    end)
}