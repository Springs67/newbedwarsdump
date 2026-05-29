local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.UIUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta
local u10 = v1.import(script, script.Parent, "armor-trim", "match-end-armor-trim-xp").MatchEndArmorTrimXp
local u11 = v1.import(script, script.Parent, "currency", "match-end-currency-earned").MatchEndCurrencyEarned
local u12 = v1.import(script, script.Parent, "kit-contract", "kit-contract-progress").KitContractProgress
local u13 = v1.import(script, script.Parent, "match-outcome").MatchOutcome
local u14 = v1.import(script, script.Parent, "mission", "match-end-mission-progress").MatchEndMissionProgress
local u15 = v1.import(script, script.Parent, "progression", "battle-pass-progression").BattlePassProgression
local u16 = v1.import(script, script.Parent, "progression", "player-level-progression").PlayerLevelProgression
local u17 = v1.import(script, script.Parent, "ranked", "ranked-summary").RankedSummary
local u18 = nil
local function v23(p19) --[[ Line: 271 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u18
    --]]
    local v20 = {}
    local v21 = #v20
    local v22 = {
        ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 110),
        ["BackgroundTransparency"] = 1
    }
    v20[v21 + 1] = u6.createElement("Frame", v22, { u6.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(u3.isSmallScreen() and 0.98 or 0.8, 1),
            ["Position"] = UDim2.new(0.5, 0, 0.5, u3.isSmallScreen() and 35 or 50),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, { u6.createElement(u18, {
                ["RankChangeData"] = p19.RankChangeData,
                ["WinningTeamId"] = p19.WinningTeamId,
                ["PlayerMatchExperienceEarned"] = p19.PlayerMatchExperienceEarned,
                ["BattlePassMatchExperienceEarned"] = p19.BattlePassMatchExperienceEarned,
                ["BedCoinsEarned"] = p19.BedCoinsEarned,
                ["ClanContributionEarned"] = p19.ClanContributionEarned,
                ["MissionProgress"] = p19.MissionProgress,
                ["DisableAnimation"] = p19.DisableAnimation,
                ["ArmorTrimXpEarned"] = p19.ArmorTrimXpEarned,
                ["KitStatsDelta"] = p19.KitStatsDelta,
                ["EquippedKit"] = p19.EquippedKit
            }) }) })
    return u6.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 101
    }, v20)
end
u18 = v7.new(u6)(function(u24, p25) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u8
        [4] = u4
        [5] = u9
        [6] = u13
        [7] = u5
        [8] = u16
        [9] = u15
        [10] = u17
        [11] = u11
        [12] = u10
        [13] = u12
        [14] = u14
    --]]
    local _ = p25.useState
    local v26 = p25.useEffect
    local v27 = u24.BattlePassMatchExperienceEarned ~= nil and true or u24.PlayerMatchExperienceEarned ~= nil
    local v28 = u24.ArmorTrimXpEarned ~= nil and true or u24.KitStatsDelta ~= nil
    local u29 = u6.createRef()
    local u30 = u6.createRef()
    v26(function() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u29
            [3] = u24
            [4] = u3
            [5] = u8
            [6] = u4
            [7] = u9
        --]]
        task.spawn(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u29
                [3] = u24
                [4] = u3
                [5] = u8
                [6] = u4
                [7] = u9
            --]]
            local u31 = u30:getValue()
            local u32 = u29:getValue()
            if u24.DisableAnimation then
                u32.Size = UDim2.fromScale(1, u3.isSmallScreen() and 0.8 or 0.75)
                return nil
            end
            if u3.isHoarceKat() then
                task.wait(0.1)
            end
            local v33 = TweenInfo.new(0.4, Enum.EasingStyle.Cubic)
            u8:Create(u32, v33, {
                ["Size"] = UDim2.fromScale(1, u3.isSmallScreen() and 0.8 or 0.75)
            }):Play()
            u4:setContainerTransparency(u31, 1, {
                ["onSetTweenInfo"] = TweenInfo.new(0),
                ["onCleanUpTweenInfo"] = v33
            }):DoCleaning()
            local v34 = u9[4].displaySecs
            local v35 = (v34 == nil and 1 or v34) - 0.4
            local u36 = TweenInfo.new(0.4, Enum.EasingStyle.Cubic)
            task.delay(v35, function() --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u32
                    [3] = u36
                    [4] = u4
                    [5] = u31
                --]]
                u8:Create(u32, u36, {
                    ["Size"] = UDim2.fromScale(1, 0)
                }):Play()
                u4:setContainerTransparency(u31, 1, {
                    ["onSetTweenInfo"] = u36
                })
            end)
        end)
    end)
    local v37 = {
        ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, u3.isSmallScreen() and 0 or 80),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0.05),
        ["BackgroundTransparency"] = 1,
        ["Visible"] = u24.Visible,
        [u6.Ref] = u30
    }
    local v38 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        }), u6.createElement(u13, {
            ["LayoutOrder"] = 0,
            ["WinningTeamId"] = u24.WinningTeamId,
            ["Size"] = UDim2.fromScale(0.5, 0.2)
        }) }
    local _ = #v38
    local v39 = {
        ["Size"] = UDim2.fromScale(1, 0),
        ["BackgroundTransparency"] = 0.7,
        ["BackgroundColor3"] = u5.BLACK,
        ["LayoutOrder"] = 1,
        [u6.Ref] = u29
    }
    local v40 = { u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }), u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }) }
    local _ = #v40
    local v41 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, u3.isSmallScreen() and 0.3 or 0.2),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["Visible"] = v27
    }
    local v42 = {}
    local _ = #v42
    local v43 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v44 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v45 = #v44
    local v46 = u24.PlayerMatchExperienceEarned
    if v46 then
        v46 = u6.createElement(u16, {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.43, 1),
            ["MatchExperienceEarned"] = u24.PlayerMatchExperienceEarned,
            ["DisableAnimation"] = u24.DisableAnimation
        })
    end
    if v46 then
        v44[v45 + 1] = v46
    end
    local v47 = #v44
    local v48 = u24.BattlePassMatchExperienceEarned
    if v48 then
        v48 = u6.createElement(u15, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.43, 1),
            ["MatchExperienceEarned"] = u24.BattlePassMatchExperienceEarned,
            ["DisableAnimation"] = u24.DisableAnimation
        })
    end
    if v48 then
        v44[v47 + 1] = v48
    end
    v42.MatchExperienceProgression = u6.createElement("Frame", v43, v44)
    v40.PrimaryProgressionWrapper = u6.createElement("Frame", v41, v42)
    local v49 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, v27 and 0.6 or 0.8)
    }
    local v50 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 0)
        }) }
    local v51 = #v50
    local v52 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 0,
        ["Size"] = UDim2.fromScale(0.2, 1),
        ["Visible"] = u24.RankChangeData ~= nil
    }
    local v53 = {}
    local v54 = #v53
    local v55 = u24.RankChangeData
    if v55 then
        v55 = u6.createElement(u17, {
            ["RankChangeData"] = u24.RankChangeData
        })
    end
    if v55 then
        v53[v54 + 1] = v55
    end
    v50.RankedWrapper = u6.createElement("Frame", v52, v53)
    local v56 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.14, 1)
    }
    local v57 = {}
    local v58 = #v57
    local v59
    if u24.BedCoinsEarned == nil and u24.ClanContributionEarned == 0 then
        v59 = false
    else
        v59 = u6.createElement(u11, {
            ["BedCoinsEarned"] = u24.BedCoinsEarned,
            ["ClanContributionEarned"] = u24.ClanContributionEarned,
            ["FrameProps"] = {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }
        })
    end
    if v59 then
        v57[v58 + 1] = v59
    end
    v50.CurrencyEarnedWrapper = u6.createElement("Frame", v56, v57)
    local v60 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.2, 1),
        ["Visible"] = v28
    }
    local v61 = {}
    local _ = #v61
    local v62 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.9, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v63 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["Padding"] = UDim.new(0.05, 0),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v64 = #v63
    local v65 = u24.ArmorTrimXpEarned
    if v65 then
        v65 = u6.createElement(u10, {
            ["ArmorTrimXpEarned"] = u24.ArmorTrimXpEarned,
            ["FrameProps"] = {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            }
        })
    end
    if v65 then
        v63[v64 + 1] = v65
    end
    local v66 = #v63
    local v67 = u24.KitStatsDelta
    if v67 then
        v67 = u6.createElement(u12, {
            ["KitStatsDelta"] = u24.KitStatsDelta,
            ["EquippedKit"] = u24.EquippedKit,
            ["FrameProps"] = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1)
            }
        })
    end
    if v67 then
        v63[v66 + 1] = v67
    end
    v61.MiscProgression = u6.createElement("Frame", v62, v63)
    v50.MiscProgressionWrapper = u6.createElement("Frame", v60, v61)
    v50[v51 + 1] = u6.createElement(u14, {
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(0.95 - ((u24.RankChangeData and 0.2 or 0) + 0.14 + (v28 and 0.2 or 0)), 1),
        ["Missions"] = u24.MissionProgress or {}
    })
    v40.SecondaryProgressionWrapper = u6.createElement("Frame", v49, v50)
    v38.MatchSummaryProgressionContainer = u6.createElement("Frame", v39, v40)
    return u6.createFragment({
        ["MatchSummaryProgressionWrapper"] = u6.createElement("Frame", v37, v38)
    })
end)
return {
    ["MatchEndProgressWrapper"] = v23,
    ["MatchEndProgress"] = u18
}