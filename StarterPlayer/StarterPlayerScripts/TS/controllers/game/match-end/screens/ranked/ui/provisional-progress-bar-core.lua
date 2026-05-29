local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.NumberSpinner
local u6 = v2.SlideIn
local u7 = v2.SoundManager
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v11.NUM_PROVISIONAL_MATCHES
return {
    ["ProvisionalProgressBarCore"] = v9.new(u8)(function(p14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u10
            [4] = u13
            [5] = u7
            [6] = u12
            [7] = u1
            [8] = u6
            [9] = u4
            [10] = u3
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local u18, u19 = v16(p14.RankedMatchesPlayed - 1)
        local u20 = u8.createRef()
        local u21 = u8.createRef()
        v17(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u21
                [3] = u5
                [4] = u18
                [5] = u19
                [6] = u10
                [7] = u13
                [8] = u7
                [9] = u12
                [10] = u1
            --]]
            local v22 = u20:getValue()
            local u23 = u21:getValue()
            local u24 = u5.fromGuiObject(v22)
            u24.Duration = 0
            u24.Decimals = 0
            u24.Prefix = ""
            u24.Value = u18
            local function u32() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u19
                    [3] = u24
                    [4] = u10
                    [5] = u23
                    [6] = u13
                    [7] = u7
                    [8] = u12
                --]]
                local v25 = u18 + 1
                u19(v25)
                u24.Duration = 0.5
                u24.Value = v25
                local v26 = u10
                local v27 = u23
                local v28 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
                local v29 = {}
                local v30 = UDim2.fromScale
                local v31 = v25 / u13
                v29.Size = v30(math.min(v31, 1), 1)
                v26:Create(v27, v28, v29):Play()
                u7:playSound(u12.BATTLE_PASS_PROGRESS_EXP_GAIN)
            end
            u1.Promise.defer(function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u32
                --]]
                task.wait(1)
                u32()
            end)
        end, {})
        local v33 = u8.createElement
        local v34 = u6
        local v35 = {}
        local v36 = u8.createElement
        local v37 = u4
        local v38 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = p14.AnchorPoint or Vector2.new(0.5, 0.5),
            ["Position"] = p14.Position or UDim2.fromScale(0.5, 0.4),
            ["Size"] = UDim2.fromScale(0.6, 0.6)
        }
        local v39 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Bottom",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }), (u8.createElement(u4, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.4, 0, 0.15, 0)
            }, {
                u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Center",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.05, 0)
                }),
                ["ProgressNumber"] = u8.createElement("TextLabel", {
                    ["Size"] = UDim2.new(0, 0, 1, 0),
                    ["AutomaticSize"] = "X",
                    ["Text"] = "<b>" .. tostring(u18) .. "</b>",
                    ["TextColor3"] = u3.hexColor(16773227),
                    ["Font"] = "Roboto",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    [u8.Ref] = u20
                }, { u8.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 24
                    }) }),
                u8.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["Text"] = "<b>PLACEMENT MATCHES PLAYED</b>",
                    ["Font"] = "Roboto",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(0, 0, 1, 0),
                    ["TextColor3"] = u3.WHITE
                }, { u8.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 24
                    }) })
            })) }
        local v40 = u8.createElement
        local v41 = u4
        local v42 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0.22, 0)
        }
        local v43 = {}
        local v44 = u8.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Right",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 8)
        })
        local v45 = u8.createElement
        local v46 = u4
        local v47 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.3, 0)
        }
        local v48 = {}
        local v49 = u8.createElement("TextLabel", {
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(0.5, 0, 1, 0),
            ["Text"] = "<b>" .. tostring(0) .. "</b>",
            ["TextColor3"] = u3.WHITE
        })
        local v50 = u8.createElement
        local v51 = {
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Right",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextTransparency"] = 0.4,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(0.5, 0, 1, 0),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(1, 0)
        }
        local v52 = u13
        v51.Text = "<b>" .. tostring(v52) .. "</b>"
        v51.TextColor3 = u3.WHITE
        __set_list(v48, 1, {v49, v50("TextLabel", v51)})
        __set_list(v43, 1, {v44, (v45(v46, v47, v48))})
        v43.ProgressBarBackground = u8.createElement("Frame", {
            ["BackgroundTransparency"] = 0.3,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0.4, 0),
            ["BackgroundColor3"] = u3.BLACK
        }, {
            ["ProgressBar"] = u8.createElement("Frame", {
                ["Size"] = UDim2.new((p14.RankedMatchesPlayed - 1) / u13, 0, 1, 0),
                ["BackgroundColor3"] = u3.WHITE,
                ["BorderSizePixel"] = 0,
                [u8.Ref] = u21
            })
        })
        v39.ProgressContainer = v40(v41, v42, v43)
        local v53 = u8.createElement
        local v54 = u4
        local v55 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(1, 0, 0.15, 0)
        }
        local v56 = { (u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            })) }
        local v57 = u8.createElement
        local v58 = {
            ["Font"] = "Roboto",
            ["TextTransparency"] = 0.35,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0.4, 0)
        }
        local v59 = u13
        v58.Text = "<b>Complete " .. tostring(v59) .. " placement matches to unlock your rank</b>"
        v58.TextColor3 = u3.WHITE
        v56.MetricDescription = v57("TextLabel", v58)
        __set_list(v39, 3, {v53(v54, v55, v56)})
        __set_list(v35, 1, {v36(v37, v38, v39)})
        return v33(v34, {}, v35)
    end)
}