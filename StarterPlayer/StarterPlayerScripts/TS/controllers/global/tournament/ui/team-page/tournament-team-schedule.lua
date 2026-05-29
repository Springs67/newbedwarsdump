local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Countdown
local u5 = v2.Empty
local u6 = v2.RandomUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-queue-util").TournamentQueueUtil
return {
    ["TournamentTeamSchedule"] = v9.new(u8)(function(p14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u7
            [3] = u11
            [4] = u10
            [5] = u8
            [6] = u6
            [7] = u5
            [8] = u4
            [9] = u3
            [10] = u12
        --]]
        local _ = p15.useState
        local v16 = u13.isTournamentQueueOpen(p14.region)
        local v17 = u11(u13.ActiveQueue).maps
        local v18 = table.create(#v17)
        for v19, v20 in v17 do
            local _ = v19 - 1
            v18[v19] = v20.mapName
        end
        table.sort(v18)
        local v21 = 0
        local v22 = {}
        for v23, v24 in v18 do
            local _ = v23 - 1
            local v25 = string.split(v24, "_")[1]
            local v26 = u10(v24)
            if v26 ~= nil then
                v26 = v26.mapImage
            end
            local v27
            if v25 == "" then
                v27 = v25
            elseif v25 then
                v27 = v26
            else
                v27 = v25
            end
            local v28
            if v27 == "" or not v27 then
                v28 = nil
            else
                v28 = v26[v25]
                if v28 ~= nil then
                    v28 = v28.Image
                end
            end
            if v28 ~= nil then
                v21 = v21 + 1
                v22[v21] = v28
            end
        end
        local v29 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v30 = {}
        local _ = #v30
        local v31 = {
            ["LayoutOrder"] = 2,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromHex("6467A7")
        }
        local v32 = {}
        local _ = #v32
        local v33 = {
            ["Size"] = UDim2.fromScale(0.9, 0.95),
            ["Position"] = UDim2.fromScale(0.05, 0.025)
        }
        local v34 = {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.01, 0)
            }),
            ["MapImage"] = u8.createElement("ImageLabel", {
                ["AutomaticSize"] = "Y",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Image"] = u6.fromList(unpack(v22)),
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["ScaleType"] = Enum.ScaleType.Fit
            }),
            ["Title"] = u8.createElement("TextLabel", {
                ["Text"] = "<b>Tournament BETA</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.07),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            ["Schedule Title"] = u8.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.05),
                ["Text"] = "<b>Next Tournament (" .. u13.convertRegionToText(p14.region) .. ")</b>",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            ["Schedule Content"] = u8.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.fromScale(1, 0.07),
                ["Text"] = u13.getTournamentTimeRangesFormatted(p14.region),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }
        local v35 = u8.createElement
        local v36 = u5
        local v37 = {
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(1, 0.09)
        }
        local v38 = {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }),
            ["Queue Text"] = u8.createElement(u5, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 1)
            }, {
                u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder"
                }),
                ["Queue Title"] = u8.createElement("TextLabel", {
                    ["Text"] = "<b>Queue</b>",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }),
                ["Queue Content"] = u8.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Text"] = u11(u13.ActiveQueue).title,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                })
            })
        }
        local v39 = u8.createElement
        local v40 = u5
        local v41 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v42 = {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder"
            }),
            ["Matches Title"] = u8.createElement("TextLabel", {
                ["Text"] = "<b>Matches</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }
        local v43 = u8.createElement
        local v44 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v45 = u13.TotalMatchesForBracket
        v44.Text = tostring(v45)
        v44.TextColor3 = Color3.fromRGB(255, 255, 255)
        v42["Matches Content"] = v43("TextLabel", v44)
        v38["Matches Text"] = v39(v40, v41, v42)
        v34.QueueMatchesText = v35(v36, v37, v38)
        v34.Spacer1 = u8.createElement(u5, {
            ["LayoutOrder"] = 6,
            ["Size"] = UDim2.fromScale(1, 0.05)
        })
        __set_list(v34, 2, {(u8.createElement("Frame", {
    ["BackgroundTransparency"] = 0.75,
    ["BorderSizePixel"] = 0,
    ["LayoutOrder"] = 7,
    ["Size"] = UDim2.fromScale(1, 0.004),
    ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
}))})
        v34.Spacer2 = u8.createElement(u5, {
            ["LayoutOrder"] = 8,
            ["Size"] = UDim2.fromScale(1, 0.03)
        })
        local _ = #v34
        local v46 = {
            ["LayoutOrder"] = 9,
            ["Size"] = UDim2.fromScale(1, 0.25)
        }
        local v47 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }) }
        local v48 = #v47
        local v49 = not v16
        if v49 then
            v49 = u8.createElement(u4, {
                ["PreText"] = "Next Tournament In: ",
                ["EndTime"] = u13.getNextQueueOpenTime(p14.region),
                ["TextLabel"] = {
                    ["TextTransparency"] = 0.3,
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["ZIndex"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.2),
                    ["Position"] = UDim2.fromScale(0.1, 0),
                    ["AnchorPoint"] = Vector2.new(0, 0)
                }
            }, { u8.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        end
        if v49 then
            v47[v48 + 1] = v49
        end
        local v50 = #v47 + 1
        local v51 = u8.createElement
        local v52 = "ImageButton"
        local v53 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.65, 0.6),
            ["BackgroundColor3"] = u3.WHITE,
            ["BorderSizePixel"] = 0,
            [u8.Event.Activated] = function() --[[ Line: 270 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u13
                --]]
                u7.Controllers.QueueController:joinQueue(u13.ActiveQueue)
            end,
            ["ZIndex"] = 2
        }
        local v54 = {}
        local v55 = u8.createElement
        local v56 = "UIGradient"
        local v57 = {
            ["Rotation"] = 45
        }
        local v58
        if v16 then
            v58 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#48a878")), ColorSequenceKeypoint.new(1, Color3.fromHex("#6AC4A4")) })
        else
            v58 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#8D8D8D")), ColorSequenceKeypoint.new(1, Color3.fromHex("#333333")) })
        end
        v57.Color = v58
        local v59 = v55(v56, v57)
        local v60 = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.04, 0)
        })
        local v61 = u8.createElement
        local v62 = "UIStroke"
        local v63 = {}
        local v64
        if v16 then
            v64 = Color3.fromHex("#63FF8F")
        else
            v64 = Color3.fromHex("#717171")
        end
        v63.Color = v64
        __set_list(v54, 1, {v59, v60, v61(v62, v63), u8.createElement(u5, {
    ["ZIndex"] = 2,
    ["Position"] = UDim2.fromScale(0, 0.5),
    ["AnchorPoint"] = Vector2.new(0, 0.5),
    ["Size"] = UDim2.fromScale(1, 0.75)
}, { u8.createElement("UIListLayout", {
        ["FillDirection"] = "Vertical",
        ["VerticalAlignment"] = "Center"
    }), u8.createElement("TextLabel", {
        ["Text"] = "QUEUE",
        ["TextScaled"] = true,
        ["TextXAlignment"] = "Center",
        ["TextYAlignment"] = "Center",
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["ZIndex"] = 3,
        ["Size"] = UDim2.fromScale(1, 0.6),
        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
        ["TextColor3"] = u3.WHITE
    }, { u8.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 36
        }) }) }), u8.createElement("ImageLabel", {
    ["SizeConstraint"] = "RelativeYY",
    ["ImageTransparency"] = 0.7,
    ["BackgroundTransparency"] = 1,
    ["ZIndex"] = 2,
    ["Position"] = UDim2.fromScale(0.925, 0.5),
    ["AnchorPoint"] = Vector2.new(1, 0.5),
    ["Size"] = UDim2.fromScale(1, 1),
    ["Image"] = u12.TOURNAMENT_QUEUE_ICON,
    ["ScaleType"] = Enum.ScaleType.Crop
})})
        v47[v50] = v51(v52, v53, v54)
        v34["Tournament Queue Button"] = u8.createElement(u5, v46, v47)
        v32.Content = u8.createElement(u5, v33, v34)
        v30.TournamentScheduleBG = u8.createElement("Frame", v31, v32)
        return u8.createFragment({
            ["Right Side - Tournament Schedule"] = u8.createElement(u5, v29, v30)
        })
    end)
}