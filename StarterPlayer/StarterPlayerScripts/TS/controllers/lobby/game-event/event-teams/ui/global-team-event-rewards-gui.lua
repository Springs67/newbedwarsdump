local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.SoundManager
local u9 = v2.StringUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u20 = v1.import(script, script.Parent, "global-team-event-reward-box").GlobalTeamEventRewardBox
return {
    ["GlobalTeamEventRewardsGUI"] = v12.new(u11)(function(u21, p22) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u16
            [3] = u5
            [4] = u10
            [5] = u13
            [6] = u17
            [7] = u8
            [8] = u18
            [9] = u11
            [10] = u7
            [11] = u9
            [12] = u4
            [13] = u19
            [14] = u14
            [15] = u20
            [16] = u6
            [17] = u3
        --]]
        local v23 = p22.useState
        local v24 = p22.useEffect
        local _, u25 = v23(0)
        local u26, u27 = v23({})
        local u28, u29 = v23(0)
        local v30 = u15[u21.EventType]
        local u31 = v30.globalTeamEventKey
        local u32 = 0
        local v33 = u16.getGlobalTeamMissionsForTeam(u31, u21.GlobalTeamKey)
        local u34
        if u5.isHoarceKat() then
            u34 = 20000000
        else
            local v35 = u10.Controllers.GlobalTeamsController:getLocalGlobalTeamScore(u31, u21.GlobalTeamKey)
            u34 = v35 == nil and 0 or v35
        end
        local v36 = 0
        local u37 = v36
        for v38, v39 in v33 do
            local _ = v38 - 1
            if u37 < v39.globalTeamScoreRequired then
                v36 = v39.globalTeamScoreRequired
                u37 = v36
            end
        end
        local u40 = 1500 / #v33
        local v41 = 0
        local v42 = v41
        for v43, v44 in v33 do
            local _ = v43 - 1
            if v44.globalTeamScoreRequired <= u34 then
                v41 = v42 + 1
                v42 = v41
            end
        end
        local v45 = -1
        for v46, v47 in v33 do
            local _ = v46 - 1
            if u34 < v47.globalTeamScoreRequired == true then
                v45 = v46 - 1
                break
            end
        end
        local v48 = v45 - 1
        if v33[#v33 - 1 + 1].globalTeamScoreRequired <= u34 then
            v45 = #v33 - 1
            v48 = #v33 - 1
        end
        local v49 = v33[v45 + 1].globalTeamScoreRequired - (v48 <= 0 and 0 or v33[v48 + 1].globalTeamScoreRequired)
        local v50 = v49 == 0 and 0 or (u34 - (v48 <= 0 and 0 or v33[v48 + 1].globalTeamScoreRequired)) / v49
        local v51 = v42 * u40 + v50 * u40
        v24(function() --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u21
                [3] = u27
                [4] = u25
                [5] = u34
                [6] = u37
                [7] = u29
            --]]
            local v52 = u13:getState().Event.profileData.events[u21.EventType]
            local v53
            if v52 == nil then
                v53 = v52
            else
                v53 = v52.claimedGlobalTeamRewards
            end
            u27(v53 == nil and {} or v53)
            local v54 = u25
            local v55 = u34 / u37
            v54((math.clamp(v55, 0, 1)))
            if v52 ~= nil then
                v52 = v52.totalGlobalTeamContribution
            end
            u29(v52 == nil and 0 or v52)
        end, {})
        local function u61(p56) --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u32
                [3] = u17
                [4] = u31
                [5] = u8
                [6] = u18
                [7] = u27
            --]]
            if table.find(u26, p56) ~= nil then
                return nil
            end
            if tick() - u32 < 0.5 then
                return nil
            end
            u32 = tick()
            local v57 = {
                ["globalTeamEventKey"] = u31,
                ["rewardId"] = p56
            }
            if not u17.Client:Get("TryToClaimGlobalTeamReward"):CallServer(v57) then
                return nil
            end
            u8:playSound(u18.UI_REWARD)
            local v58 = {}
            local v59 = #v58
            local v60 = #u26
            table.move(u26, 1, v60, v59 + 1, v58)
            v58[v59 + v60 + 1] = p56
            u27(v58)
        end
        local v62 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2,
                ["Selectable"] = false,
                ["Size"] = UDim2.fromScale(1, 1),
                ["CanvasSize"] = UDim2.new(1, 0, 0, 1620)
            }
        }
        local v63 = {}
        local _ = #v63
        local v64 = {
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v65 = { u11.createElement(u7, {
                ["Padding"] = {
                    ["Vertical"] = 60
                }
            }), u11.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local _ = #v65
        local function v71(p66, p67) --[[ Line: 178 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u40
                [3] = u9
                [4] = u4
            --]]
            local v68 = u11.createElement
            local v69 = {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromOffset(0, 1500 - (p67 + 1) * u40),
                ["Size"] = UDim2.fromScale(1, 0.015)
            }
            local v70 = {
                ["GlobalTeamEventRewardScoreRequirement"] = u11.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Right",
                    ["Text"] = u9.formatNumberWithCommas(p66.globalTeamScoreRequired),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextColor3"] = u4.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                })
            }
            return v68("Frame", v69, v70)
        end
        local v72 = table.create(#v33)
        for v73, v74 in v33 do
            v72[v73] = v71(v74, v73 - 1, v33)
        end
        local v75 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 100,
            ["Size"] = UDim2.new(0.3, 0, 0, 1500)
        }
        local v76 = {}
        local v77 = #v76
        for v78, v79 in v72 do
            v76[v77 + v78] = v79
        end
        v65.GlobalTeamEventRewardScoreRequirementsColumn = u11.createElement("Frame", v75, v76)
        local function v81(_, p80) --[[ Line: 213 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u40
                [3] = u4
            --]]
            return u11.createElement("Frame", {
                ["BackgroundTransparency"] = 0.3,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 100,
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromOffset(0, 1500 - (p80 + 1) * u40),
                ["Size"] = UDim2.new(1, 0, 0, 1),
                ["BackgroundColor3"] = u4.BLACK
            })
        end
        local v82 = table.create(#v33)
        for v83, v84 in v33 do
            v82[v83] = v81(v84, v83 - 1, v33)
        end
        local v85 = {
            ["BorderSizePixel"] = 5,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 200,
            ["Size"] = UDim2.new(0, 75, 0, 1500),
            ["BackgroundColor3"] = u19.backgroundTertiary,
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }
        local v86 = {
            u11.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            ["GlobalTeamEventRewardProgressBar"] = u11.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0,
                ["Size"] = UDim2.new(0.9, 0, 0, v51),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["BackgroundColor3"] = u19.backgroundSuccess
            }, { u11.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }), u11.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.75,
                    ["ZIndex"] = 3,
                    ["Size"] = UDim2.fromScale(0.8, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u14[v30.currencies[1]].icon,
                    ["ScaleType"] = Enum.ScaleType.Tile,
                    ["TileSize"] = UDim2.new(0.65, 0, 0, 30)
                }) })
        }
        local v87 = #v86
        for v88, v89 in v82 do
            v86[v87 + v88] = v89
        end
        v65.GlobalTeamEventRewardProgressBarContainer = u11.createElement("Frame", v85, v86)
        local function v97(u90, p91) --[[ Line: 272 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u34
                [3] = u26
                [4] = u31
                [5] = u61
                [6] = u28
                [7] = u11
                [8] = u20
            --]]
            local v92 = {
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromOffset(0, 1500 - (p91 + 1) * u40),
                ["Size"] = UDim2.new(1, 0, 0, 80)
            }
            local v93 = {}
            local v94 = #v93
            local v95 = {
                ["RewardData"] = u90,
                ["Score"] = u34
            }
            local v96 = u90.globalTeamRewardId
            v95.Claimed = table.find(u26, v96) ~= nil
            v95.GlobalTeamEventKey = u31
            function v95.OnClaimClick() --[[ Line: 288 ]]
                --[[
                Upvalues:
                    [1] = u61
                    [2] = u90
                --]]
                return u61(u90.globalTeamRewardId)
            end
            v95.HasEnoughPoints = u34 >= u90.globalTeamScoreRequired
            v95.PersonalScoreContribution = u28
            v93[v94 + 1] = u11.createElement(u20, v95)
            return u11.createElement("Frame", v92, v93)
        end
        local v98 = table.create(#v33)
        for v99, v100 in v33 do
            v98[v99] = v97(v100, v99 - 1, v33)
        end
        local v101 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 300,
            ["Size"] = UDim2.new(0.4, 0, 0, 1500),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v102 = {}
        local v103 = #v102
        for v104, v105 in v98 do
            v102[v103 + v104] = v105
        end
        v65.GlobalTeamEventRewardBoxesColumn = u11.createElement("Frame", v101, v102)
        v63.GlobalTeamFrameContainer = u11.createElement(u6, v64, v65)
        return u11.createFragment({
            ["GlobalTeamRewardsList"] = u11.createElement(u3, v62, v63)
        })
    end)
}