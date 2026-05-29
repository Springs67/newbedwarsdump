local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CircularProgress
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-level-config").HalloweenLevelConfig
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-type").HalloweenUpgradeType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, script.Parent, "halloween-ability-tree-choice-area").HalloweenAbilityTreeChoiceArea
local v34 = v6.new(u5)(function(_, p14) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
        [3] = u4
        [4] = u12
        [5] = u5
        [6] = u10
        [7] = u8
        [8] = u3
        [9] = u13
    --]]
    local v15 = p14.useState
    local v16 = p14.useEffect
    local v17, u18 = v15(1)
    local v19, u20 = v15(0)
    local v21, u22 = v15(false)
    local v23, u24 = v15(u9.DAMAGE_INCREASE)
    local v25, u26 = v15(u9.DAMAGE_INCREASE)
    v16(function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u12
            [4] = u18
            [5] = u24
            [6] = u26
            [7] = u22
            [8] = u20
        --]]
        u11.Client:GetNamespace("Halloween2025Remotes"):Get("PlayerLevelUp"):Connect(function(p27) --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u12
                [3] = u18
                [4] = u24
                [5] = u26
                [6] = u22
            --]]
            u4:playSound(u12.MATCH_LEVEL_UP_2)
            u18(p27.level)
            if p27.ability1 ~= nil then
                u24(p27.ability1)
            end
            if p27.ability2 ~= nil then
                u26(p27.ability2)
            end
            u22(true)
        end)
        u11.Client:GetNamespace("Halloween2025Remotes"):Get("ExperienceProgress"):Connect(function(p28) --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20(p28.experience)
        end)
    end, { v19 })
    local v29 = {
        ["DisplayOrder"] = 10,
        ["ResetOnSpawn"] = false
    }
    local v30 = {}
    local _ = #v30
    local v31 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.99),
        ["Size"] = UDim2.fromScale(0.6, 0.08)
    }
    local v32 = {
        u5.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 9
        }),
        u5.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 7,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.2, 1.7),
            ["Position"] = UDim2.fromScale(1.2, 0.5),
            ["Image"] = u10.MISSION_TICKET_GLOW,
            ["ImageTransparency"] = 1 - v19 / u8.EXPERIENCE_NEEDED_PER_LEVEL
        }),
        ["BackgroundCircle"] = u5.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ScaleType"] = "Fit",
            ["ZIndex"] = 9,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Size"] = UDim2.fromScale(0.1, 0.8),
            ["Position"] = UDim2.fromScale(1.2, 0),
            ["Image"] = u10.CIRCLE_PROGRESS_BAR,
            ["ImageColor3"] = Color3.fromHex("#1d1a1e")
        }),
        ["LevelBackground"] = u5.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ScaleType"] = "Fit",
            ["ZIndex"] = 8,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Size"] = UDim2.fromScale(0.1, 0.8),
            ["Position"] = UDim2.fromScale(1.2, 0),
            ["Image"] = u10.CIRCLE_SOILD,
            ["ImageColor3"] = Color3.fromHex("#2f2f2d")
        }, { u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextStrokeTransparency"] = 0,
                ["TextScaled"] = true,
                ["ZIndex"] = 11,
                ["Text"] = tostring(v17),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.4, 0.4),
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["Font"] = Enum.Font.ArialBold,
                ["TextStrokeColor3"] = Color3.fromHex("#aa7c47"),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextColor3"] = Color3.fromHex("#f6cd8e")
            }) }),
        u5.createElement(u3, {
            ["ZIndex"] = 10,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Size"] = UDim2.fromScale(0.1, 0.8),
            ["Position"] = UDim2.fromScale(1.2, 0),
            ["Progress"] = v19,
            ["Color"] = Color3.fromHex("#aa7c47")
        })
    }
    local v33 = #v32
    if v21 then
        v21 = u5.createElement(u13, {
            ["level"] = v17,
            ["halloweenAbilityOne"] = v23,
            ["halloweenAbilityTwo"] = v25,
            ["onSelected"] = function() --[[ Name: onSelected, Line 117 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                return u22(false)
            end
        })
    end
    if v21 then
        v32[v33 + 1] = v21
    end
    v30.HalloweenTreeArea = u5.createElement("Frame", v31, v32)
    return u5.createElement("ScreenGui", v29, v30)
end)
return {
    ["HalloweenAbilityTreeApp"] = v7.connect(function(_, p35) --[[ Line: 128 ]]
        local v36 = {}
        for v37, v38 in p35 do
            v36[v37] = v38
        end
        return v36
    end)(v34)
}