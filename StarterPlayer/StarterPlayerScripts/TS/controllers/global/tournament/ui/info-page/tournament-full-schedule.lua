local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.RandomUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").RegionValues
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-meta").getMapMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-queue-util").TournamentQueueUtil
return {
    ["TournamentFullSchedule"] = v8.new(u7)(function(_, p12) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u5
            [3] = u10
            [4] = u9
            [5] = u6
            [6] = u7
            [7] = u3
            [8] = u4
        --]]
        local _ = p12.useState
        u11.isTournamentQueueOpen(u5.NA)
        local v13 = u10(u11.ActiveQueue).maps
        local v14 = table.create(#v13)
        for v15, v16 in v13 do
            local _ = v15 - 1
            v14[v15] = v16.mapName
        end
        table.sort(v14)
        local v17 = 0
        local v18 = {}
        for v19, v20 in v14 do
            local _ = v19 - 1
            local v21 = string.split(v20, "_")[1]
            local v22 = u9(v20)
            if v22 ~= nil then
                v22 = v22.mapImage
            end
            local v23
            if v21 == "" then
                v23 = v21
            elseif v21 then
                v23 = v22
            else
                v23 = v21
            end
            local v24
            if v23 == "" or not v23 then
                v24 = nil
            else
                v24 = v22[v21]
                if v24 ~= nil then
                    v24 = v24.Image
                end
            end
            if v24 ~= nil then
                v17 = v17 + 1
                v18[v17] = v24
            end
        end
        local v25 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v26 = {}
        local _ = #v26
        local v27 = {
            ["LayoutOrder"] = 2,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromHex("6467A7")
        }
        local v28 = {}
        local _ = #v28
        local v29 = u6.values(u5)
        local function v39(p30, p31) --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u3
                [3] = u11
            --]]
            local v32 = u7.createFragment
            local v33 = {}
            local v34 = tostring(p30) .. " Schedule"
            local v35 = u7.createElement
            local v36 = u3
            local v37 = {
                ["Size"] = UDim2.fromScale(1, 0.12),
                ["LayoutOrder"] = 3 + p31
            }
            local v38 = {
                u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder"
                }),
                [tostring(p30) .. " Schedule Title"] = u7.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["Text"] = "<b>Next Tournament (" .. u11.convertRegionToText(p30) .. ")</b>",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }),
                [tostring(p30) .. " Schedule Content"] = u7.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.6),
                    ["Text"] = u11.getTournamentTimeRangesFormatted(p30),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                })
            }
            v33[v34] = v35(v36, v37, v38)
            return v32(v33)
        end
        local v40 = table.create(#v29)
        for v41, v42 in v29 do
            v40[v41] = v39(v42, v41 - 1, v29)
        end
        local v43 = {
            ["Size"] = UDim2.fromScale(0.9, 0.95),
            ["Position"] = UDim2.fromScale(0.05, 0.025)
        }
        local v44 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.02, 0)
            }),
            ["MapImage"] = u7.createElement("ImageLabel", {
                ["AutomaticSize"] = "Y",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Image"] = u4.fromList(unpack(v18)),
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["ScaleType"] = Enum.ScaleType.Fit
            }),
            ["Title"] = u7.createElement("TextLabel", {
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
            })
        }
        local v45 = #v44
        for v46, v47 in v40 do
            v44[v45 + v46] = v47
        end
        local _ = #v44
        v44.Spacer1 = u7.createElement(u3, {
            ["Size"] = UDim2.fromScale(1, 0.03),
            ["LayoutOrder"] = #u6.values(u5) + 3
        })
        local v48 = u7.createElement
        local v49 = u3
        local v50 = {
            ["Size"] = UDim2.fromScale(1, 0.09),
            ["LayoutOrder"] = #u6.values(u5) + 4
        }
        local v51 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }),
            ["Queue Text"] = u7.createElement(u3, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 1)
            }, {
                u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder"
                }),
                ["Queue Title"] = u7.createElement("TextLabel", {
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
                ["Queue Content"] = u7.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Text"] = u10(u11.ActiveQueue).title,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                })
            })
        }
        local v52 = u7.createElement
        local v53 = u3
        local v54 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v55 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder"
            }),
            ["Matches Title"] = u7.createElement("TextLabel", {
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
        local v56 = u7.createElement
        local v57 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v58 = u11.TotalMatchesForBracket
        v57.Text = tostring(v58)
        v57.TextColor3 = Color3.fromRGB(255, 255, 255)
        v55["Matches Content"] = v56("TextLabel", v57)
        v51["Matches Text"] = v52(v53, v54, v55)
        v44.QueueMatchesText = v48(v49, v50, v51)
        v28.Content = u7.createElement(u3, v43, v44)
        v26.TournamentScheduleBG = u7.createElement("Frame", v27, v28)
        return u7.createFragment({
            ["Right Side - Tournament Schedule"] = u7.createElement(u3, v25, v26)
        })
    end)
}