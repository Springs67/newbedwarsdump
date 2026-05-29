local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = u1.import(script, script.Parent, "tournament-app-reward-tier").TournamentAppRewardTier
return {
    ["TournamentAppRewardTracker"] = v5.new(u4)(function(_, p8) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u6
            [3] = u3
            [4] = u4
            [5] = u2
            [6] = u7
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local v11, u12 = v9(0)
        local v13, u14 = v9(0)
        v10(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u6
                [3] = u3
                [4] = u14
                [5] = u12
            --]]
            u1.async(function() --[[ Line: 15 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u3
                    [3] = u14
                    [4] = u12
                --]]
                local v15 = u6:getState().Tournament.myTeamId
                if v15 == "" or not v15 then
                    return nil
                end
                local v16 = { u3.Controllers.TournamentTeamController:requestTournamentTeamData(v15):await() }
                if v16[1] and v16[2] then
                    local v17 = v16[2].matches
                    local function v21(p18) --[[ Line: 23 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                            [2] = u12
                        --]]
                        if p18.won then
                            u14(function(p19) --[[ Line: 25 ]]
                                return p19 + 1
                            end)
                        else
                            u12(function(p20) --[[ Line: 29 ]]
                                return p20 + 1
                            end)
                        end
                    end
                    for v22, v23 in v17 do
                        v21(v23, v22 - 1, v17)
                    end
                end
            end)()
        end, {})
        v10(function() --[[ Line: 41 ]] end, { v11, v13 })
        local v24 = u4.createFragment
        local v25 = {}
        local v26 = u4.createElement
        local v27 = u2
        local v28 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.4, 1)
        }
        local v29 = {}
        local v30 = u4.createElement
        local v31 = {
            ["LayoutOrder"] = 2,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromHex("6467A7")
        }
        local v32 = {
            ["RewardTitle"] = u4.createElement("TextLabel", {
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Text"] = "<b>Rewards</b>",
                ["Font"] = "Roboto",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.09),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Center
            }),
            ["RewardInfo"] = u4.createElement("TextLabel", {
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Text"] = "<b>Scaled By Division</b>",
                ["Font"] = "Roboto",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["TextTransparency"] = 0.7,
                ["Size"] = UDim2.fromScale(1, 0.03),
                ["Position"] = UDim2.fromScale(0, 0.09),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Center
            }),
            ["RewardTiers"] = u4.createElement("Frame", {
                ["LayoutOrder"] = 2,
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0.1),
                ["Size"] = UDim2.fromScale(0.65, 0.85)
            }, {
                u4.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(-0.145, 0)
                }),
                u4.createElement(u7, {
                    ["rewardTier"] = 3,
                    ["currentWins"] = v13,
                    ["currentLosses"] = v11
                }),
                u4.createElement(u7, {
                    ["rewardTier"] = 2,
                    ["currentWins"] = v13,
                    ["currentLosses"] = v11
                }),
                u4.createElement(u7, {
                    ["rewardTier"] = 1,
                    ["currentWins"] = v13,
                    ["currentLosses"] = v11
                })
            })
        }
        v29.TournamentRewards = v30("Frame", v31, v32)
        v25["Right Side - Rewards"] = v26(v27, v28, v29)
        return v24(v25)
    end)
}