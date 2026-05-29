local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Countdown
local u4 = v2.Empty
local u5 = v2.ProgressBar
local u6 = v2.TimedProgressBar
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants")
local u11 = v10.MurderBedState
local u12 = v10.MurderGameConstants
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
return {
    ["MurderBed"] = v8.new(u7)(function(p14, p15) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u11
            [4] = u5
            [5] = u4
            [6] = u13
            [7] = u6
            [8] = u9
            [9] = u3
        --]]
        local _ = p15.useState
        local v16 = u12:getBedStageInfo(p14.BedStage)
        local v17 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 4.5, 1.5),
            ["ResetOnSpawn"] = false,
            ["MaxDistance"] = 200,
            ["Adornee"] = p14.Adornee,
            ["Size"] = UDim2.fromScale(6, 3.5)
        }
        local v18 = {}
        local _ = #v18
        local v19 = {
            ["Image"] = "rbxassetid://10667281451",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["ImageColor3"] = Color3.fromRGB(255, 18, 87)
        }
        local v20 = {}
        local _ = #v20
        local v21 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.6),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.68)
        }
        local v22 = {}
        local v23
        if p14.BedStage > #u12.BED_REPAIR_STAGES then
            local v24 = u7.createFragment
            local v25 = {
                ["Title"] = u7.createElement("TextLabel", {
                    ["Text"] = "<b>BED REPAIRED!</b>",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(1, 0.25),
                    ["Font"] = Enum.Font.RobotoMono,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                })
            }
            v23 = v24(v25)
        else
            local v26 = u7.createFragment
            local v27 = {}
            local v28 = u7.createElement
            local v29 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["RichText"] = true,
                ["TextScaled"] = true
            }
            local v30 = p14.BedStage
            local v31 = tostring(v30)
            local v32 = #u12.BED_REPAIR_STAGES
            v29.Text = "<b>Repair Bed (Stage " .. v31 .. " of " .. tostring(v32) .. ")</b>"
            v29.Size = UDim2.fromScale(1, 0.25)
            v29.Font = Enum.Font.RobotoMono
            v29.TextColor3 = Color3.fromRGB(255, 255, 255)
            v27.Title = v28("TextLabel", v29)
            v23 = v26(v27)
        end
        __set_list(v22, 1, {v23})
        local _ = #v22
        local v33 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.75),
            ["Position"] = UDim2.fromScale(0, 0.35)
        }
        local v34 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }) }
        local v35 = #v34
        local v36
        if p14.BedState == u11.IDLE then
            if v16 then
                local v37 = u7.createFragment
                local v38 = {}
                local v39 = u7.createElement(u5, {
                    ["AcceptZero"] = true,
                    ["Size"] = UDim2.fromScale(1, 0.3),
                    ["Progress"] = p14.Progress / v16.cost,
                    ["BarColor"] = Color3.fromRGB(255, 179, 64)
                })
                local v40 = u7.createElement
                local v41 = u4
                local v42 = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.6)
                }
                local v43 = { u7.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Center",
                        ["VerticalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0.03, 0)
                    }), (u7.createElement("ImageLabel", {
                        ["ScaleType"] = "Fit",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(0.2, 0.8),
                        ["Image"] = u13(v16.currency).image
                    })) }
                local v44 = u7.createElement
                local v45 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["LayoutOrder"] = 3
                }
                local v46 = p14.Progress
                local v47 = tostring(v46)
                local v48 = v16.cost
                v45.Text = "<b>(" .. v47 .. "/" .. tostring(v48) .. ") " .. u13(v16.currency).displayName .. "</b>"
                v45.Size = UDim2.fromScale(0.77, 0.8)
                v45.Font = Enum.Font.RobotoMono
                v45.TextColor3 = Color3.fromRGB(255, 255, 255)
                v43.ProgressText = v44("TextLabel", v45)
                __set_list(v38, 1, {v39, v40(v41, v42, v43)})
                v36 = v37(v38)
            else
                v36 = v16
            end
        else
            v36 = false
        end
        if v36 then
            v34[v35 + 1] = v36
        end
        local v49 = #v34
        if p14.BedState == u11.REPAIRING then
            if v16 then
                local v50 = u7.createFragment
                local v51 = {}
                local v52 = u7.createElement(u6, {
                    ["Size"] = UDim2.fromScale(1, 0.35),
                    ["EndTime"] = u9:GetServerTimeNow() + v16.repairDuration
                })
                local v53 = u7.createElement
                local v54 = u3
                local v55 = {
                    ["PreText"] = "Repairing ",
                    ["PostText"] = "s",
                    ["EndTime"] = u9:GetServerTimeNow() + v16.repairDuration,
                    ["CountdownConfig"] = {
                        ["days"] = false,
                        ["hours"] = false,
                        ["minutes"] = false
                    },
                    ["TextLabel"] = {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(1, 0.3),
                        ["Font"] = Enum.Font.RobotoMono,
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                    }
                }
                __set_list(v51, 1, {v52, v53(v54, v55)})
                v16 = v50(v51)
            end
        else
            v16 = false
        end
        if v16 then
            v34[v49 + 1] = v16
        end
        v22.Body = u7.createElement("Frame", v33, v34)
        v20.UsableArea = u7.createElement("Frame", v21, v22)
        v18.BillboardFrame = u7.createElement("ImageLabel", v19, v20)
        return u7.createElement("BillboardGui", v17, v18)
    end)
}