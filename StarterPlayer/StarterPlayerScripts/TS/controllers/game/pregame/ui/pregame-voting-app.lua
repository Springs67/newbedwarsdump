local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.ColorUtil
local u6 = v3.Countdown
local u7 = v3.DarkBackground
local u8 = v3.DeviceUtil
local u9 = v3.Empty
local u10 = v3.SlideIn
local u11 = v3.SoundManager
local u12 = v3.TimedProgressBar
local u13 = v3.UIUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "pregame", "pregame-voting-utils").PregameVotingUtils
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, script.Parent, "pregame-voting-card").PregameVotingCard
local v98 = v15.new(u14)(function(u22, p23) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u17
        [4] = u19
        [5] = u11
        [6] = u20
        [7] = u2
        [8] = u18
        [9] = u7
        [10] = u8
        [11] = u5
        [12] = u9
        [13] = u12
        [14] = u6
        [15] = u21
        [16] = u10
        [17] = u4
    --]]
    local v24 = p23.useState
    local v25 = p23.useEffect
    local u26, u27 = v24(false)
    local u28, u29 = v24(nil)
    local u30, u31 = v24(false)
    local u32, u33 = v24(0)
    local u34, u35 = v24(nil)
    local u36 = u14.createRef()
    local u37 = u14.createRef()
    local u38 = u14.createRef()
    local u39 = u14.createRef()
    v25(function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u31
            [3] = u27
        --]]
        if not (u22.winningVotingOption and u22.voteState) then
            return nil
        end
        u31(true)
        u27(false)
    end, { u22.winningVotingOption })
    v25(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u36
            [3] = u37
            [4] = u39
            [5] = u13
            [6] = u17
            [7] = u19
            [8] = u33
            [9] = u11
            [10] = u20
            [11] = u35
            [12] = u38
            [13] = u2
            [14] = u18
        --]]
        if not (u22.winningVotingOption and u22.voteState) then
            return nil
        end
        local u40 = u36:getValue()
        local u41 = u37:getValue()
        local v42 = u39:getValue()
        if not (u40 and (u41 and v42)) then
            return nil
        end
        task.spawn(function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u13
                [3] = u41
            --]]
            local v43 = u40:WaitForChild("ProgressBarContainer")
            if v43 ~= nil then
                v43 = v43:WaitForChild("ProgressBar")
            end
            u13:setContainerTransparency(u40, 1, {
                ["onSetTweenInfo"] = TweenInfo.new(0.3)
            })
            u13:setContainerTransparency(u41, 1, {
                ["onSetTweenInfo"] = TweenInfo.new(0.3)
            })
        end)
        u17:Create(v42, TweenInfo.new(2, Enum.EasingStyle.Circular), {
            ["Position"] = UDim2.fromScale(0, 0.065)
        }):Play()
        local v44 = u22.voteState
        local v45
        if v44 == nil then
            v45 = v44
        else
            v45 = table.create(#v44)
            for v46, v47 in v44 do
                local _ = v46 - 1
                v45[v46] = #v47.voterUserIds
            end
        end
        local v48 = v45 == nil and { 0 } or v45
        if #v48 == 0 then
            error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
        end
        local u49 = v48[1]
        for v50 = 2, #v48 do
            local v51 = v48[v50]
            local _ = v50 - 1
            u49 = u49 + v51
        end
        local u52
        if u49 > 16 then
            u52 = 1
        elseif u49 > 12 then
            u52 = math.random(1, 2)
        elseif u49 > 8 then
            u52 = math.random(2, 4)
        elseif u49 > 4 then
            u52 = math.random(4, 6)
        else
            u52 = u49 <= 2 and 12 or math.random(6, 8)
        end
        local u53 = -1
        for v54, v55 in u22.voteState do
            local _ = v54 - 1
            local v56 = v55.pregameVotingOption.mapName
            local v57 = u22.winningVotingOption
            if v57 ~= nil then
                v57 = v57.mapName
            end
            if v56 == v57 == true then
                u53 = v54 - 1
                break
            end
        end
        if u53 == -1 then
            local v58 = math.random(0, u19.POOL_SIZE - 1)
            u53 = math.round(v58)
        end
        local v59 = u22.voteState
        local v60 = table.create(#v59)
        for v61, v62 in v59 do
            local _ = v61 - 1
            v60[v61] = #v62.voterUserIds
        end
        local v63 = 0
        for v64 = 1, #v60 do
            local v65 = v60[v64]
            if u53 > v64 - 1 then
                v63 = v63 + v65
            end
        end
        local v66 = u22.winningVoterIndex
        local u67 = v63 + (v66 == nil and 0 or v66)
        local u68 = u52 * u49 + u67
        local u69 = (u19.ROULETTE_DURATION - 2) / u68
        task.spawn(function() --[[ Line: 159 ]]
            --[[
            Upvalues:
                [1] = u68
                [2] = u49
                [3] = u33
                [4] = u52
                [5] = u67
                [6] = u69
                [7] = u11
                [8] = u20
                [9] = u35
                [10] = u53
            --]]
            local v70 = false
            local v71 = 0
            while true do
                if v70 then
                    v71 = v71 + 1
                else
                    v70 = true
                end
                if v71 > u68 then
                    u11:playSound(u20.PREGAME_VOTE_WINNER_CHOSEN)
                    u35(u53)
                    u33(u67)
                    return
                end
                local v72 = v71 % u49
                u33(v72)
                if u52 * u49 + u67 - 10 < v71 then
                    u69 = u69 + 0.05
                end
                if u52 * u49 < v71 and u67 < v72 then
                    u33(v72)
                end
                u11:playSound(u20.ROULETTE_TICK)
                task.wait(u69)
            end
        end)
        local u73 = u38:getValue()
        task.delay(u19.ROULETTE_DURATION + u19.ROULETTE_BREAK_DURATION + 0.5, function() --[[ Line: 191 ]]
            --[[
            Upvalues:
                [1] = u73
                [2] = u13
                [3] = u2
                [4] = u18
            --]]
            if u73 then
                u13:setContainerTransparency(u73, 1, {
                    ["onSetTweenInfo"] = TweenInfo.new(0.3)
                })
            end
            task.wait(1)
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u18.PREGAME_VOTING)
        end)
    end, { u30 })
    local v74
    if u26 then
        v74 = u14.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 901,
            ["Enabled"] = not u22.winningVotingOption
        }, { u14.createElement(u4, {
                ["Text"] = "<b>Show</b>",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.13, 0.05),
                ["Position"] = UDim2.fromScale(0.5, 0.95),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["OnClick"] = function() --[[ Name: OnClick, Line 364 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u26
                        [3] = u11
                        [4] = u20
                    --]]
                    u27(not u26)
                    u11:playSound(u20.UI_CLICK_2)
                end
            }) })
    else
        local v75 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v76 = { u14.createElement(u7, {
                ["AppId"] = u22.AppId,
                ["ImageButtonProps"] = {
                    ["ZIndex"] = -99
                },
                ["OnClick"] = function() --[[ Name: OnClick, Line 212 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u27
                        [3] = u26
                    --]]
                    if not u30 then
                        u27(not u26)
                    end
                    return false
                end
            }) }
        local v77 = #v76
        local v78 = {}
        local v79 = #v78
        local v80 = {
            ["BackgroundTransparency"] = 1,
            ["Modal"] = true,
            ["Size"] = UDim2.fromScale(u8.isSmallScreen() and 0.85 or 0.75, u8.isSmallScreen() and 0.85 or 0.75),
            ["Position"] = UDim2.fromScale(0.5, u8.isSmallScreen() and 0.02 or 0.1),
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }
        local v81 = { u14.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.6386036960985626
            }), u14.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical
            }) }
        local _ = #v81
        local v82 = {
            ["BackgroundTransparency"] = 0.75,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u5.BLACK
        }
        local v83 = { u14.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }), u14.createElement("TextLabel", {
                ["Text"] = "Map Vote!",
                ["TextColor3"] = u5.WHITE,
                ["TextScaled"] = true,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                ["TextStrokeTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["BackgroundTransparency"] = 1,
                [u14.Ref] = u37
            }), u14.createElement(u9, {
                ["Size"] = UDim2.fromScale(1, 0.03),
                ["Position"] = UDim2.fromScale(0, 0.1),
                ["LayoutOrder"] = 1,
                [u14.Ref] = u36
            }, { u14.createElement(u12, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.65, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["StartTime"] = u22.VoteStartTime,
                    ["EndTime"] = u22.VoteEndTime,
                    ["ProgressBarConfig"] = {
                        ["Flip"] = true,
                        ["GradientRotation"] = 180,
                        ["BarGradient"] = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
                    }
                }), u14.createElement(u6, {
                    ["EndTime"] = u22.VoteEndTime,
                    ["TextLabel"] = {
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(0.1, 1),
                        ["Position"] = UDim2.fromScale(0.8, 0.5),
                        ["AnchorPoint"] = Vector2.new(0, 0.5)
                    },
                    ["CountdownConfig"] = {
                        ["minutes"] = false,
                        ["hours"] = false,
                        ["days"] = false
                    }
                }) }) }
        local v84 = #v83
        local v85 = u22.voteState
        if v85 then
            local v86 = u22.voteState
            local function v88(_, u87) --[[ Line: 298 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u21
                    [3] = u22
                    [4] = u28
                    [5] = u34
                    [6] = u29
                    [7] = u30
                    [8] = u32
                --]]
                return u14.createElement(u21, {
                    ["voteState"] = u22.voteState or {},
                    ["Selected"] = u28 == u87,
                    ["winHighlightIndex"] = u34,
                    ["votingOptionIndex"] = u87,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 304 ]]
                        --[[
                        Upvalues:
                            [1] = u29
                            [2] = u87
                        --]]
                        u29(u87)
                    end,
                    ["rouletteMode"] = u30,
                    ["rouletteSelectedVoterIndex"] = u32,
                    ["WinningPregameVotingOption"] = u22.winningVotingOption
                })
            end
            v85 = table.create(#v86)
            for v89, v90 in v86 do
                v85[v89] = v88(v90, v89 - 1, v86)
            end
        end
        local v91 = {
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["Position"] = UDim2.fromScale(0, 0.13),
            [u14.Ref] = u39
        }
        local v92 = { u14.createElement("UIGridLayout", {
                ["FillDirectionMaxCells"] = 2,
                ["CellPadding"] = UDim2.fromScale(0.025, 0.05),
                ["CellSize"] = UDim2.fromScale(0.475, 0.45),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }), u14.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 10),
                ["PaddingBottom"] = UDim.new(0, 10),
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 10)
            }) }
        local v93 = #v92
        if v85 then
            for v94, v95 in v85 do
                v92[v93 + v94] = v95
            end
        end
        v83[v84 + 1] = u14.createElement(u9, v91, v92)
        v81.PregameCore = u14.createElement("Frame", v82, v83)
        v78[v79 + 1] = u14.createElement("ImageButton", v80, v81)
        v76[v77 + 1] = u14.createElement(u10, {}, v78)
        v74 = u14.createElement(u9, v75, v76)
    end
    local v96 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u8.isSmallScreen(),
        [u14.Ref] = u38
    }
    local v97 = {
        [#v97 + 1] = v74
    }
    return u14.createElement("ScreenGui", v96, v97)
end)
return {
    ["PregameVotingApp"] = v16.connect(function(p99, p100) --[[ Line: 383 ]]
        local v101 = {
            ["store"] = p99
        }
        local v102 = p99.Bedwars.pregameVote
        if v102 ~= nil then
            v102 = v102.voteState
        end
        v101.voteState = v102
        local v103 = p99.Bedwars.pregameVote
        if v103 ~= nil then
            v103 = v103.winningVotingOption
        end
        v101.winningVotingOption = v103
        local v104 = p99.Bedwars.pregameVote
        if v104 ~= nil then
            v104 = v104.winningVoterIndex
        end
        v101.winningVoterIndex = v104
        for v105, v106 in p100 do
            v101[v105] = v106
        end
        return v101
    end)(v98)
}