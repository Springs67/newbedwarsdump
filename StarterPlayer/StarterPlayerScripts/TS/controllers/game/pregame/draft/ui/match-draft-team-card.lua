local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "draft", "match-draft-config").MatchDraftConfig
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-selector-options").MatchDraftSelectorOption
local u13 = v1.import(script, script.Parent, "match-draft-ban-box").MatchDraftBanBox
local u14 = v1.import(script, script.Parent, "match-draft-team-player-icon").MatchDraftTeamPlayerIcon
return {
    ["MatchDraftTeamCard"] = v7.new(u6)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u3
            [3] = u6
            [4] = u13
            [5] = u4
            [6] = u5
            [7] = u8
            [8] = u9
            [9] = u11
            [10] = u12
            [11] = u14
        --]]
        local _ = p16.useState
        local v17 = u15.store.Draft.sharedData
        if v17 ~= nil then
            v17 = v17.kitBans[u15.Team.id]
        end
        local v18 = v17 == nil and {} or v17
        local v19 = #v18
        local v20 = false
        while true do
            if v20 then
                v19 = v19 + 1
            else
                v20 = true
            end
            if v19 >= u10.BANNING_ROUNDS then
                local v21 = {}
                for v22, v23 in u15 do
                    v21[v22] = v23
                end
                v21.store = nil
                v21.Team = nil
                v21.IsTeamLockedIn = nil
                local v24 = {}
                for v25, v26 in v21 do
                    v24[v25] = v26
                end
                v24.BackgroundColor3 = u3.WHITE
                v24.ClipsDescendants = false
                v24.BorderSizePixel = 0
                local v27 = {}
                local v28 = u6.createElement
                local v29 = "UIGradient"
                local v30 = {
                    ["Rotation"] = 0
                }
                local v31 = ColorSequence.new
                local v32
                if u15.IsTeamLockedIn then
                    v32 = {}
                    local v33 = ColorSequenceKeypoint.new(0, u15.Team.color or Color3.fromRGB(62, 174, 255))
                    local v34 = ColorSequenceKeypoint.new
                    local v35 = 1
                    local v36
                    if u15.Team.color then
                        v36 = u3.darken(u15.Team.color, 0.6)
                    else
                        v36 = Color3.fromRGB(42, 113, 165)
                    end
                    __set_list(v32, 1, {v33, v34(v35, v36)})
                else
                    v32 = {}
                    local v37 = ColorSequenceKeypoint.new
                    local v38 = 0
                    local v39
                    if u15.Team.color then
                        v39 = u3.darken(u15.Team.color, 0.3)
                    else
                        v39 = Color3.fromRGB(42, 113, 165)
                    end
                    __set_list(v32, 1, {v37(v38, v39), ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))})
                end
                v30.Color = v31(v32)
                __set_list(v27, 1, {v28(v29, v30), u6.createElement("UIAspectRatioConstraint", {
    ["AspectRatio"] = 2
})})
                local v40 = #v27
                local function v47(p41) --[[ Line: 69 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u13
                        [3] = u15
                    --]]
                    local v42 = u6.createFragment
                    local v43 = {}
                    local v44 = u6.createElement
                    local v45 = u13
                    local v46 = {
                        ["Size"] = UDim2.fromScale(0.9, 0.9),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["TeamColor"] = u15.Team.color,
                        ["BanData"] = {
                            ["LockedIn"] = true,
                            ["Kit"] = p41 or nil
                        }
                    }
                    v43.TeamKitBanBox = v44(v45, v46)
                    return v42(v43)
                end
                local v48 = table.create(#v18)
                for v49, v50 in v18 do
                    v48[v49] = v47(v50, v49 - 1, v18)
                end
                local v51 = {
                    ["Size"] = UDim2.fromScale(1, 0.8)
                }
                local v52 = { u6.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["Padding"] = UDim.new(0.02, 0),
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    }) }
                local v53 = #v52
                for v54, v55 in v48 do
                    v52[v53 + v54] = v55
                end
                v27[v40 + 1] = u6.createElement(u4, v51, v52)
                local v56 = {
                    ["BackgroundTransparency"] = 0.3,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.2),
                    ["Position"] = UDim2.fromScale(0, 1),
                    ["AnchorPoint"] = Vector2.new(0, 1),
                    ["BackgroundColor3"] = u3.BLACK
                }
                local v57 = {}
                local _ = #v57
                local v58 = {
                    ["Size"] = UDim2.fromScale(0.48, 1),
                    ["Position"] = UDim2.fromScale(0.02, 0),
                    ["Text"] = "Team " .. u15.Team.name
                }
                local v59 = u15.Team.id
                local v60 = u15.store.Game.myTeam
                if v60 ~= nil then
                    v60 = v60.id
                end
                local v61
                if v59 == v60 then
                    v61 = Color3.fromRGB(255, 204, 92)
                else
                    v61 = Color3.fromRGB(255, 255, 255)
                end
                v58.TextColor3 = v61
                v58.TextXAlignment = Enum.TextXAlignment.Left
                v58.TextScaled = true
                v58.Font = Enum.Font.SourceSansBold
                v58.AutoLocalize = false
                v58.BorderSizePixel = 0
                v58.BackgroundTransparency = 1
                v58.ZIndex = 2
                v57.TeamName = u6.createElement("TextLabel", v58, { u6.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) })
                v27.TextBackgroundBar = u6.createElement("Frame", v56, v57)
                local v62 = u5.values(u15.Team.members)
                local function v90(p63, p64) --[[ Line: 142 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u8
                        [3] = u9
                        [4] = u11
                        [5] = u12
                        [6] = u6
                        [7] = u14
                    --]]
                    local v65 = u15.store.Game.myTeam
                    if v65 ~= nil then
                        v65 = v65.id
                    end
                    local v66 = v65 == u15.Team.id
                    local v67 = nil
                    for v68, v69 in u8(u15.store.Game.queueType or u9.BEDWARS_TO4).teams do
                        local _ = v68 - 1
                        if v69.id ~= u15.Team.id == true then
                            v67 = v69
                            break
                        end
                    end
                    if v67 ~= nil then
                        v67 = v67.maxPlayers
                    end
                    local v70 = v67 == nil and 4 or v67
                    local v71 = false
                    local v72
                    if v66 then
                        local v73 = u15.store.Draft.sharedData
                        if v73 ~= nil then
                            v73 = v73.matchDraftPhase
                        end
                        if v73 == u11.BANNING then
                            local v74 = u15.store.Draft.teamData.votedKitBans
                            local v75 = p64.userId
                            local v76 = v74[tostring(v75)]
                            if v76 ~= nil then
                                v76 = v76.selectorOption
                            end
                            v72 = v76 == u12.SELECT
                        else
                            local v77 = u15.store.Draft.sharedData
                            if v77 ~= nil then
                                v77 = v77.matchDraftPhase
                            end
                            if v77 == u11.KIT_SELECT then
                                local v78 = u15.store.Draft.teamData.kitSelection
                                local v79 = p64.userId
                                local v80 = v78[tostring(v79)]
                                if v80 ~= nil then
                                    v80 = v80.selectorOption
                                end
                                v72 = v80 == u12.SELECT
                            else
                                local v81 = u15.store.Draft.sharedData
                                if v81 ~= nil then
                                    v81 = v81.matchDraftPhase
                                end
                                v72 = v81 == u11.BANNING_TRANSITION and true or v71
                            end
                        end
                    else
                        local v82 = u15.store.Draft.sharedData
                        if v82 ~= nil then
                            v82 = v82.matchDraftPhase
                        end
                        if v82 == u11.BANNING then
                            local v83 = u15.store.Draft.enemyTeamData[u15.Team.id]
                            if v83 ~= nil then
                                v83 = v83.playersVoted
                            end
                            local v84 = p64.userId
                            v72 = v83[tostring(v84)] ~= nil
                            if v72 == nil then
                                v72 = false
                            end
                        else
                            local v85 = u15.store.Draft.sharedData
                            if v85 ~= nil then
                                v85 = v85.matchDraftPhase
                            end
                            if v85 == u11.KIT_SELECT then
                                local v86 = u15.store.Draft.enemyTeamData[u15.Team.id]
                                if v86 ~= nil then
                                    v86 = v86.kitSelection
                                end
                                local v87 = p64.userId
                                v72 = v86[tostring(v87)] ~= nil
                                if v72 == nil then
                                    v72 = false
                                end
                            else
                                local v88 = u15.store.Draft.sharedData
                                if v88 ~= nil then
                                    v88 = v88.matchDraftPhase
                                end
                                v72 = v88 == u11.BANNING_TRANSITION and true or v71
                            end
                        end
                    end
                    local v89 = u6.createElement(u14, {
                        ["Player"] = p64,
                        ["DidPlayerVote"] = v72,
                        ["TeamSize"] = v70
                    })
                    table.insert(p63, v89)
                    return p63
                end
                local v91 = {}
                for v92 = 1, #v62 do
                    v91 = v90(v91, v62[v92], v92 - 1, v62)
                end
                local v93 = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.new(0, 35, 1, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["BackgroundColor3"] = u3.BLACK
                }
                local v94 = { u6.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                        ["Padding"] = UDim.new(0.02, 0),
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    }) }
                local v95 = #v94
                for v96, v97 in v91 do
                    v94[v95 + v96] = v97
                end
                v27[v40 + 2] = u6.createElement("Frame", v93, v94)
                return u6.createElement("Frame", v24, v27)
            end
            table.insert(v18, false)
        end
    end)
}