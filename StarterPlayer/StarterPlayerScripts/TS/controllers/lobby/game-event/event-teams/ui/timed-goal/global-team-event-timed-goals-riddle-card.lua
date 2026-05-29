local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.StringUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["GlobalTeamEventTimedGoalsRiddleCard"] = v7.new(u6)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u8
            [4] = u6
            [5] = u4
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local v13, u14 = v11(u3.isHoarceKat() and "I have keys but no locks, I have space but no room.\n You can enter, but not go outside\226\128\148what am I" or "")
        local u15 = nil
        local u16 = nil
        v12(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u16
                [3] = u3
                [4] = u5
                [5] = u14
            --]]
            local v17 = u15()
            if not v17 then
                v17 = u16()
                if v17 ~= nil then
                    v17 = v17.riddleReward
                    if v17 ~= nil then
                        v17 = v17.riddle
                    end
                end
            end
            if v17 ~= nil and not u3.isHoarceKat() then
                u5.Controllers.RiddleController:getRiddle(v17):andThen(function(p18) --[[ Line: 31 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                    --]]
                    u14(table.concat(p18, "\n"))
                end)
            end
        end, { u9.CurrentTimedGoalData })
        local u19 = nil
        u15 = function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            local v20 = u19()
            if v20 ~= nil then
                v20 = v20.riddleReward
                if v20 ~= nil then
                    v20 = v20.riddle
                end
            end
            return v20
        end
        u19 = function() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            local v21 = u9.CurrentTimedGoalData
            if v21 ~= nil then
                v21 = v21.score
            end
            local v22 = v21 == nil and 0 or v21
            local v23 = u9.CurrentTimedGoalData
            if v23 ~= nil then
                local v24 = 0
                local v25 = {}
                for v26, v27 in v23.timedGoal.rewards do
                    local _ = v26 - 1
                    local v28
                    if v27.riddleReward == nil then
                        v28 = false
                    else
                        v28 = v22 < v27.globalTeamScoreRequired
                    end
                    if v28 == true then
                        v24 = v24 + 1
                        v25[v24] = v27
                    end
                end
                table.sort(v25, function(p29, p30) --[[ Line: 74 ]]
                    return p29.globalTeamScoreRequired < p30.globalTeamScoreRequired
                end)
                v23 = v25[1]
            end
            return v23
        end
        u16 = function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            local v31 = u9.CurrentTimedGoalData
            if v31 ~= nil then
                local v32 = 0
                local v33 = {}
                for v34, v35 in v31.timedGoal.rewards do
                    local _ = v34 - 1
                    if v35.riddleReward ~= nil == true then
                        v32 = v32 + 1
                        v33[v32] = v35
                    end
                end
                table.sort(v33, function(p36, p37) --[[ Line: 99 ]]
                    return p36.globalTeamScoreRequired > p37.globalTeamScoreRequired
                end)
                v31 = v33[1]
            end
            return v31
        end
        local v38 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.35),
            ["Position"] = UDim2.fromScale(0.025, 0.05),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["BackgroundColor3"] = u8.backgroundTertiary
        }
        local v39 = u9.FrameProps
        if v39 then
            for v40, v41 in v39 do
                v38[v40] = v41
            end
        end
        local v42 = {
            u6.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingRight"] = UDim.new(0.1, 0),
                ["PaddingTop"] = UDim.new(0.075, 0),
                ["PaddingBottom"] = UDim.new(0.075, 0)
            }),
            u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.025, 0)
            }),
            ["Title"] = u6.createElement("TextLabel", {
                ["Text"] = "Riddle",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        }
        local v43 = #v42
        local v44 = {
            ["Size"] = UDim2.fromScale(1, 0.125)
        }
        local v45 = u4
        local v46 = u19()
        if v46 ~= nil then
            v46 = v46.globalTeamScoreRequired
        end
        local v47 = v46 == nil and 0 or v46
        v44.Text = "Next reveal at <b>" .. v45.formatNumberWithCommas(v47) .. "</b>"
        v44.TextColor3 = Color3.fromRGB(255, 255, 255)
        v44.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
        v44.TextXAlignment = Enum.TextXAlignment.Left
        v44.TextYAlignment = Enum.TextYAlignment.Center
        v44.RichText = true
        v44.TextScaled = true
        v44.TextTransparency = 0.3
        v44.BackgroundTransparency = 1
        v44.LayoutOrder = 2
        v42.NextReveal = u6.createElement("TextLabel", v44)
        local v48 = u9.CurrentTimedGoalData
        if v48 then
            v48 = u6.createFragment({
                ["TimedGoalTrackScore"] = u6.createElement("TextLabel", {
                    ["LineHeight"] = 1.5,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 4,
                    ["Size"] = UDim2.fromScale(1, 0.6),
                    ["Text"] = v13,
                    ["TextColor3"] = Color3.fromRGB(255, 235, 77),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            })
        end
        if v48 then
            v42[v43 + 1] = v48
        end
        return u6.createFragment({
            ["TimedGoalsRiddleCard"] = u6.createElement("Frame", v38, v42)
        })
    end)
}