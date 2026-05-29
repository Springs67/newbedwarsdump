local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ButtonComponent
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, script.Parent.Parent.Parent, "reward", "ui", "reward-showcase").RewardShowcase
local u18 = v1.import(script, script.Parent, "milestones-config").milestonesLayout
return {
    ["MilestonesReward"] = v10.new(u9)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u6
            [3] = u13
            [4] = u18
            [5] = u9
            [6] = u16
            [7] = u5
            [8] = u12
            [9] = u11
            [10] = u17
            [11] = u7
            [12] = u4
            [13] = u8
            [14] = u15
            [15] = u3
        --]]
        local v21 = p20.useEffect
        local v22 = u19.store.Bedwars.playerLevel >= u19.MilestoneRewardData.levelRequirement
        local v23 = nil
        for v24, v25 in u19.store.Bedwars.milestoneRewardsClaimed do
            local _ = v24 - 1
            if v25 == u19.MilestoneRewardData.id == true then
                v23 = v25
                break
            end
        end
        local u26 = not v23
        local v27 = u19.MilestoneRewardData.reward.displayTitle
        if v27 == nil then
            v27 = u14.getRewardType(u19.MilestoneRewardData.reward)
        end
        v21(function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u19
                [3] = u6
                [4] = u13
            --]]
            if u26 and (u19.MilestoneRewardData.instantClaim and not u6.isHoarceKat()) then
                u13.Client:Get("ClaimMilestoneReward"):CallServer(u19.MilestoneRewardData.id)
            end
        end, {})
        local v28 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = -1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(0, u18.distanceX, 1, 0)
        }
        local v29 = { u9.createElement("UIListLayout", {
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v30 = #v29
        local v31 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.9),
            ["BackgroundTransparency"] = v22 and 0 or 0.5,
            ["BackgroundColor3"] = u16.backgroundPrimary
        }
        local v32 = {}
        local v33 = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v34 = u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        })
        local v35 = u9.createElement
        local v36 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["BackgroundTransparency"] = v22 and 0.55 or 0.75,
            ["BackgroundColor3"] = u5.BLACK
        }
        local v37 = {}
        local v38 = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v39 = u9.createElement
        local v40 = {
            ["TextSize"] = 25,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v41 = u19.MilestoneRewardData.levelRequirement
        v40.Text = "Lv. " .. tostring(v41)
        v40.TextColor3 = u12.getLevelColor(u19.MilestoneRewardData.levelRequirement)
        v40.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v40.TextTransparency = v22 and 0 or 0.5
        v40.TextXAlignment = Enum.TextXAlignment.Center
        __set_list(v37, 1, {v38, v39("TextLabel", v40)})
        __set_list(v32, 1, {v33, v34, v35("Frame", v36, v37)})
        local v42 = #v32
        local v43 = u19.MilestoneRewardData.reward.image
        local v44
        if v43 == "" or not v43 then
            v44 = u9.createElement(u17, {
                ["ZIndex"] = 10,
                ["Reward"] = u19.MilestoneRewardData.reward,
                ["Position"] = UDim2.fromOffset(0, 0),
                ["Size"] = UDim2.fromScale(1, 1)
            })
        else
            local v45 = {
                ["Position"] = UDim2.fromOffset(0, 0),
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v46 = u19.MilestoneRewardData.reward.image
            if v46 == nil then
                v46 = u11.FREE_KIT_SLOT
            end
            v45.Image = v46
            v45.ScaleType = Enum.ScaleType.Fit
            v45.BorderSizePixel = 0
            v45.BackgroundTransparency = 1
            v45.LayoutOrder = 2
            v45.ZIndex = 10
            v44 = u9.createElement("ImageLabel", v45)
        end
        local v47 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v48 = {
            u9.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 100,
                ["Position"] = UDim2.fromOffset(0, 0),
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u16.backgroundPrimary,
                ["Transparency"] = v22 and not u26 and 1 or 0.5
            }),
            [#v48 + 1] = v44
        }
        v32[v42 + 1] = u9.createElement(u7, v47, v48)
        local v49 = not u19.MilestoneRewardData.instantClaim
        if v49 then
            if u26 then
                if v22 then
                    v49 = u9.createElement(u4, {
                        ["LayoutOrder"] = 3,
                        ["Text"] = "CLAIM",
                        ["TextSize"] = 20,
                        ["Size"] = UDim2.fromScale(0.9, 0.2),
                        ["BackgroundColor3"] = u16.backgroundSuccess,
                        ["OnClick"] = function() --[[ Name: OnClick, Line 151 ]]
                            --[[
                            Upvalues:
                                [1] = u6
                                [2] = u13
                                [3] = u19
                                [4] = u8
                                [5] = u15
                            --]]
                            if not u6.isHoarceKat() and u13.Client:Get("ClaimMilestoneReward"):CallServer(u19.MilestoneRewardData.id) then
                                u8:playSound(u15.UI_REWARD)
                            end
                        end,
                        ["TextColor3"] = u5.WHITE
                    })
                else
                    v49 = v22
                end
            else
                v49 = u26
            end
        end
        if v49 then
            v32[v42 + 2] = v49
        end
        local v50 = #v32
        local v51 = not (u26 and v22)
        if v51 then
            v51 = u9.createElement(u3, {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 3,
                ["Selectable"] = true,
                ["Size"] = UDim2.fromScale(0.9, 0.2),
                ["BackgroundTransparency"] = v22 and 0.55 or 0.75,
                ["BackgroundColor3"] = u5.BLACK,
                ["OnClick"] = function() --[[ Name: OnClick, Line 175 ]] end
            }, {
                u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }),
                u9.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }),
                u9.createElement("TextLabel", {
                    ["TextSize"] = 15,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["Text"] = v27,
                    ["TextColor3"] = u16.textPrimary,
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextTransparency"] = v22 and 0 or 0.5,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }),
                u9.createElement("TextLabel", {
                    ["TextSize"] = 20,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["Text"] = u19.MilestoneRewardData.description,
                    ["TextColor3"] = u5.WHITE,
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextTransparency"] = v22 and 0 or 0.5,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            })
        end
        if v51 then
            v32[v50 + 1] = v51
        end
        v29[v30 + 1] = u9.createElement("Frame", v31, v32)
        v29[v30 + 2] = u9.createElement("ImageLabel", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.15, 0.075),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["Image"] = u11.TRIANGLE_DOWN,
            ["ImageColor3"] = u16.backgroundPrimary,
            ["ImageTransparency"] = v22 and 0 or 0.5,
            ["ScaleType"] = Enum.ScaleType.Stretch
        })
        return u9.createFragment({
            ["MilestonesReward"] = u9.createElement("Frame", v28, v29)
        })
    end)
}