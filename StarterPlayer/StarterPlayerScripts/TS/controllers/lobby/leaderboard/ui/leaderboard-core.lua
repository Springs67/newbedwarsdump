local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DropdownComponent
local u5 = v2.Empty
local u6 = v2.StringUtil
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta")
local u10 = v9.getLeaderboardMeta
local u11 = v9.LeaderboardMeta
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-types").PlayfabLeaderboard
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "roblox-leaderboards").RobloxLeaderboard
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = u1.import(script, script.Parent.Parent, "leaderboard-list").LeaderboardList
local u16 = u1.import(script, script.Parent, "stat-rank-element").StatRankElement
local u17 = u8.Component:extend("LeaderboardCore")
function u17.init(p18, _) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u8
    --]]
    p18.resetTimerActive = true
    local v19 = {}
    local v20 = #v19
    local v21 = u7.entries(u11)
    table.move(v21, 1, #v21, v20 + 1, v19)
    local v22 = 0
    local v23 = {}
    for v24, v25 in v19 do
        local _ = v24 - 1
        local _ = v25[1]
        if v25[2].displayInLobby == true then
            v22 = v22 + 1
            v23[v22] = v25
        end
    end
    table.sort(v23, function(p26, p27) --[[ Line: 46 ]]
        return p26[2].displayName < p27[2].displayName
    end)
    local function v34(p28, p29) --[[ Line: 50 ]]
        local v30 = p29[2].displayName
        local v31 = {}
        local v32 = #v31
        local v33 = #p28
        table.move(p28, 1, v33, v32 + 1, v31)
        v31[v32 + v33 + 1] = {
            ["text"] = v30,
            ["value"] = v30
        }
        return v31
    end
    local v35 = {}
    for v36 = 1, #v23 do
        v35 = v34(v35, v23[v36], v36 - 1, v23)
    end
    p18.dropdownItems = v35
    local v37 = p18.props.DefaultLeaderboard
    if v37 == nil then
        local v38 = 0
        local v39 = {}
        for v40, v41 in u7.entries(u11) do
            local _ = v40 - 1
            local _ = v41[1]
            if v41[2].displayInLobby == true then
                v38 = v38 + 1
                v39[v38] = v41
            end
        end
        v37 = v39[1][1]
    end
    p18.defaultLeaderboard = v37
    p18:handleSelectLeaderboard(p18.defaultLeaderboard)
    local v42, v43 = u8.createBinding("")
    p18.resetsInText = v42
    p18.setResetsInText = v43
end
function u17.didMount(p44) --[[ Line: 96 ]]
    p44:setupResetTimer(p44.state.leaderboard)
end
function u17.didUpdate(p45, p46, p47) --[[ Line: 99 ]]
    if p46.store.Leaderboard.leaderboards ~= p45.props.store.Leaderboard.leaderboards then
        p45:refreshLeaderboard()
        return true
    end
    if p47.leaderboard == p45.state.leaderboard then
        return nil
    end
    local v48 = p45.state.leaderboardData
    if v48 ~= nil then
        v48 = v48.nextReset
    end
    if v48 ~= 0 and (v48 == v48 and v48) then
        p45:setupResetTimer(p45.state.leaderboard)
        p45.resetTimerActive = true
    end
    if v48 == 0 or (v48 ~= v48 or not v48) then
        p45.resetTimerActive = false
        p45.setResetsInText("")
    end
    return true
end
function u17.setupResetTimer(u49, u50) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u12
        [3] = u13
        [4] = u6
    --]]
    u1.Promise.defer(function() --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u50
            [3] = u49
            [4] = u13
            [5] = u6
        --]]
        local v51 = nil
        if u12[u50] == nil then
            if u13[u50] ~= nil then
                v51 = u49.props.store.Leaderboard.leaderboards[u50]
            end
        else
            v51 = u49.props.store.Leaderboard.leaderboards[u50]
        end
        if not v51 then
            return nil
        end
        while u49.resetTimerActive do
            local v52 = v51.nextReset
            if v52 == 0 or (v52 ~= v52 or not v52) then
                return nil
            end
            local v53 = os.time()
            local v54 = v51.nextReset - v53
            local v55 = math.max(0, v54)
            local v56 = u6.formatCountdownTime(v55, {
                ["hours"] = true,
                ["days"] = true,
                ["seperator"] = ":"
            })
            u49.setResetsInText("Resets in: <font color=\"rgb(185, 188, 255)\">" .. v56 .. "</font>")
            task.wait(1)
        end
    end)
end
function u17.refreshLeaderboard(p57) --[[ Line: 163 ]]
    local v58 = p57.state.leaderboard
    local v59 = p57.props.store.Leaderboard.leaderboards[v58]
    if v59 then
        p57:setState({
            ["leaderboard"] = v58,
            ["leaderboardData"] = v59
        })
    else
        p57:setState({
            ["leaderboard"] = v58
        })
    end
end
function u17.handleSelectLeaderboard(p60, p61) --[[ Line: 177 ]]
    local v62 = p60.props.store.Leaderboard.leaderboards[p61]
    if v62 then
        p60:setState({
            ["leaderboard"] = p61,
            ["leaderboardData"] = v62
        })
    else
        p60:setState({
            ["leaderboard"] = p61
        })
    end
end
function u17.render(u63) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
        [3] = u3
        [4] = u8
        [5] = u7
        [6] = u11
        [7] = u4
        [8] = u5
        [9] = u15
        [10] = u16
    --]]
    local v64 = u10(u63.state.leaderboard)
    local v65 = u63.state.leaderboardData
    local v66 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u14.backgroundPrimary
    }
    local v67 = {}
    local v68 = #v67
    local v69 = {
        ["Image"] = "rbxassetid://7106394844",
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(1, 0, 0.125, 0),
        ["BackgroundColor3"] = u3.hexColor(3092550)
    }
    local v70 = { u8.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.2, 0),
            ["PaddingBottom"] = UDim.new(0.2, 0),
            ["PaddingLeft"] = UDim.new(0.075, 0),
            ["PaddingRight"] = UDim.new(0.075, 0)
        }) }
    local v71 = #v70
    local v72 = {}
    local v73
    if v64 == nil then
        v73 = v64
    else
        v73 = v64.displayName
    end
    v72.Text = "Leaderboard: " .. tostring(v73)
    v72.Size = UDim2.fromScale(1, 0.5)
    v72.Position = UDim2.fromScale(0, 0)
    v72.AnchorPoint = Vector2.new(0, 0)
    v72.BackgroundTransparency = 1
    v72.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v72.TextScaled = true
    v72.TextXAlignment = Enum.TextXAlignment.Left
    v72.TextYAlignment = Enum.TextYAlignment.Top
    v72.TextColor3 = Color3.fromRGB(255, 255, 255)
    v72.AutoLocalize = false
    v70[v71 + 1] = u8.createElement("TextLabel", v72)
    local v74 = {}
    local v75
    if v64 == nil then
        v75 = v64
    else
        v75 = v64.description
    end
    v74.Text = tostring(v75)
    v74.Size = UDim2.fromScale(1, 0.4)
    v74.Position = UDim2.fromScale(0, 1)
    v74.AnchorPoint = Vector2.new(0, 1)
    v74.BackgroundTransparency = 1
    v74.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v74.TextScaled = true
    v74.TextXAlignment = Enum.TextXAlignment.Left
    v74.TextYAlignment = Enum.TextYAlignment.Bottom
    v74.TextColor3 = u14.textPrimary
    v70[v71 + 2] = u8.createElement("TextLabel", v74)
    v67[v68 + 1] = u8.createElement("ImageLabel", v69, v70)
    local v76 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0, 1),
        ["Size"] = UDim2.new(1, 0, 0.875, -0)
    }
    local v77 = { u8.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.02, 0),
            ["PaddingBottom"] = UDim.new(0.03, 0),
            ["PaddingLeft"] = UDim.new(0.075, 0),
            ["PaddingRight"] = UDim.new(0.075, 0)
        }), u8.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v78 = #v77
    local v79 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.06)
    }
    local v80 = {}
    local v81 = #v80
    local v82 = {
        ["OnSurfaceGui"] = true,
        ["Size"] = UDim2.new(0.425, 0, 1, 0),
        ["DefaultItem"] = {
            ["text"] = u10(u63.defaultLeaderboard).displayName,
            ["value"] = u10(u63.defaultLeaderboard).displayName
        }
    }
    local v83 = u10(u63.defaultLeaderboard)
    if v83 ~= nil then
        v83 = v83.displayName
    end
    v82.PlaceholderText = v83
    v82.Items = u63.dropdownItems
    function v82.OnItemSelected(p84) --[[ Line: 294 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
            [3] = u63
        --]]
        local v85 = {}
        local v86 = #v85
        local v87 = u7.entries(u11)
        table.move(v87, 1, #v87, v86 + 1, v85)
        local v88 = 0
        local v89 = {}
        for v90, v91 in v85 do
            local _ = v90 - 1
            local _ = v91[1]
            if v91[2].displayName == p84 == true then
                v88 = v88 + 1
                v89[v88] = v91
            end
        end
        local v92 = table.create(#v89)
        for v93, v94 in v89 do
            local _ = v93 - 1
            local v95 = v94[1]
            local _ = v94[2]
            v92[v93] = v95
        end
        u63:handleSelectLeaderboard(v92[1])
    end
    v80[v81 + 1] = u8.createElement(u4, v82)
    local v96 = v81 + 2
    local v97 = u63.resetsInText
    if v97 then
        v97 = u8.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextTransparency"] = 0.2,
            ["Text"] = u63.resetsInText,
            ["Size"] = UDim2.new(0.5, 0, 0.75, 0),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        })
    end
    v80[v96] = v97
    v77.Header = u8.createElement(u5, v79, v80)
    local v98 = v78 + 1
    local v99
    if v65 then
        v99 = u8.createElement(u15, {
            ["LeaderboardType"] = u63.state.leaderboard,
            ["LeaderboardData"] = v65,
            ["FrameProps"] = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0.8200000000000001, 0),
                ["Position"] = UDim2.fromScale(0, 0.08)
            }
        })
    else
        v99 = v65
    end
    v77[v98] = v99
    local _ = #v77
    local v100
    if v65 == nil then
        v100 = v65
    else
        v100 = v65.leaderboardPosition
    end
    local v101 = v100 ~= nil
    if v101 then
        local v102 = {}
        local v103
        if v65 == nil then
            v103 = v65
        else
            v103 = v65.leaderboardPosition
        end
        local v104 = "<b>YOUR POSITION:</b> <font color=\"rgb(185, 188, 255)\">"
        local v105
        if v103 == 0 or (v103 ~= v103 or not v103) then
            v105 = "Not Placed"
        else
            local v106 = v65.leaderboardPosition
            local v107 = tostring(v106)
            v105 = string.gsub(string.reverse((string.gsub(string.reverse(v107), "%d%d%d", "%1,"))), "^,", "")
        end
        v102.Text = v104 .. v105 .. "</font>"
        v102.Size = UDim2.new(1, 0, 0.5, -2)
        v102.BackgroundTransparency = 1
        v102.Font = Enum.Font.RobotoMono
        v102.TextScaled = true
        v102.RichText = true
        v102.TextXAlignment = Enum.TextXAlignment.Left
        v102.TextColor3 = Color3.fromRGB(255, 255, 255)
        v102.LayoutOrder = 1
        v101 = u8.createElement("TextLabel", v102)
    end
    local v108 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 3,
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0, 1),
        ["Size"] = UDim2.fromScale(1, 0.07)
    }
    local v109 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 2)
        }) }
    local v110 = #v109
    if v101 then
        v109[v110 + 1] = v101
    end
    local v111 = #v109
    local v112 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 0.5, -2)
    }
    local v113 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }) }
    local v114 = #v113
    local v115 = {}
    local v116
    if v64 == nil then
        v116 = v64
    else
        v116 = string.upper(v64.statName)
    end
    v115.Text = "YOUR " .. tostring(v116) .. ":"
    v115.Size = UDim2.new(0, 0, 1, 0)
    v115.AutomaticSize = "X"
    v115.BackgroundTransparency = 1
    v115.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
    v115.TextScaled = true
    v115.TextXAlignment = Enum.TextXAlignment.Left
    v115.TextColor3 = Color3.fromRGB(255, 255, 255)
    v115.LayoutOrder = 1
    v113[v114 + 1] = u8.createElement("TextLabel", v115)
    local v117
    if v65 == nil then
        v117 = v65
    else
        v117 = v65.localStatRank
    end
    if v117 then
        v117 = u8.createElement(u16, {
            ["LayoutOrder"] = 2,
            ["StatRank"] = v65.localStatRank
        })
    end
    if v117 then
        v113[v114 + 2] = v117
    end
    local v118 = #v113
    local v119 = {}
    local v120
    if v65 == nil then
        v120 = v65
    else
        v120 = v65.localStatRank
    end
    local v121
    if v120 then
        v121 = v65.localStatRank.rankStatValue
    elseif v65 == nil then
        v121 = v65
    else
        v121 = v65.localStatValue
    end
    local v122 = tostring(v121)
    local v123 = string.gsub(string.reverse((string.gsub(string.reverse(v122), "%d%d%d", "%1,"))), "^,", "")
    if v65 ~= nil then
        v65 = v65.localStatRank
    end
    if v65 then
        v65 = v64
    end
    v119.Text = "<font color=\"rgb(185, 188, 255)\">" .. v123 .. " " .. (not v65 and "" or v64.metric) .. "</font>"
    v119.Size = UDim2.new(0, 0, 1, 0)
    v119.AutomaticSize = "X"
    v119.BackgroundTransparency = 1
    v119.Font = Enum.Font.RobotoMono
    v119.TextScaled = true
    v119.RichText = true
    v119.TextXAlignment = Enum.TextXAlignment.Left
    v119.TextColor3 = Color3.fromRGB(255, 255, 255)
    v119.LayoutOrder = 3
    v113[v118 + 1] = u8.createElement("TextLabel", v119)
    v109[v111 + 1] = u8.createElement(u5, v112, v113)
    v77.LeaderboardExtraInfo = u8.createElement("Frame", v108, v109)
    v67[v68 + 2] = u8.createElement("Frame", v76, v77)
    return u8.createElement("Frame", v66, v67)
end
function u17.willUnmount(p124) --[[ Line: 482 ]]
    p124.resetTimerActive = false
end
return {
    ["LeaderboardUIWrapper"] = function(p125) --[[ Name: LeaderboardUIWrapper, Line 486 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u17
        --]]
        local v126 = {
            ["LightInfluence"] = 0.25,
            ["Face"] = Enum.NormalId.Front,
            ["SizingMode"] = Enum.SurfaceGuiSizingMode.PixelsPerStud
        }
        local v127 = {}
        local v128 = #v127
        local v129 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.new(1, -30, 1, -30)
        }
        local v130 = {}
        local v131 = #v130
        local v132 = {}
        for v133, v134 in p125 do
            v132[v133] = v134
        end
        v130[v131 + 1] = u8.createElement(u17, v132)
        v127[v128 + 1] = u8.createElement("Frame", v129, v130)
        return u8.createElement("SurfaceGui", v126, v127)
    end,
    ["LeaderboardCore"] = u17
}