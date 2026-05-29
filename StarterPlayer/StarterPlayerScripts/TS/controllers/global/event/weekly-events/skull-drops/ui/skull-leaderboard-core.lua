local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.StringUtil
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lobby", "leaderboard", "leaderboard-list").LeaderboardList
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lobby", "leaderboard", "ui", "stat-rank-element").StatRankElement
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta").getLeaderboardMeta
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-types").PlayfabLeaderboard
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "roblox-leaderboards").RobloxLeaderboard
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u13 = u6.Component:extend("SkullLeaderboardCore")
function u13.init(p14, _) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
    --]]
    p14.resetTimerActive = true
    p14.defaultLeaderboard = u11.MARROWS_MADNESS
    p14:handleSelectLeaderboard(p14.defaultLeaderboard)
    local v15, v16 = u6.createBinding("")
    p14.resetsInText = v15
    p14.setResetsInText = v16
end
function u13.didMount(p17) --[[ Line: 27 ]]
    p17:setupResetTimer(p17.state.leaderboard)
end
function u13.didUpdate(p18, p19, p20) --[[ Line: 30 ]]
    if p19.store.Leaderboard.leaderboards ~= p18.props.store.Leaderboard.leaderboards then
        p18:refreshLeaderboard()
        return true
    end
    if p20.leaderboard == p18.state.leaderboard then
        return nil
    end
    local v21 = p18.state.leaderboardData
    if v21 ~= nil then
        v21 = v21.nextReset
    end
    if v21 ~= 0 and (v21 == v21 and v21) then
        p18:setupResetTimer(p18.state.leaderboard)
        p18.resetTimerActive = true
    end
    if v21 == 0 or (v21 ~= v21 or not v21) then
        p18.resetTimerActive = false
        p18.setResetsInText("")
    end
    return true
end
function u13.setupResetTimer(u22, u23) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u10
        [3] = u11
        [4] = u5
    --]]
    u1.Promise.defer(function() --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u23
            [3] = u22
            [4] = u11
            [5] = u5
        --]]
        local v24 = nil
        if u10[u23] == nil then
            if u11[u23] ~= nil then
                v24 = u22.props.store.Leaderboard.leaderboards[u23]
            end
        else
            v24 = u22.props.store.Leaderboard.leaderboards[u23]
        end
        if not v24 then
            return nil
        end
        while u22.resetTimerActive do
            local v25 = v24.nextReset
            if v25 == 0 or (v25 ~= v25 or not v25) then
                return nil
            end
            local v26 = os.time()
            local v27 = v24.nextReset - v26
            local v28 = math.max(0, v27)
            local v29 = u5.formatCountdownTime(v28, {
                ["hours"] = true,
                ["days"] = true,
                ["seperator"] = ":"
            })
            u22.setResetsInText("Resets in: <font color=\"rgb(185, 188, 255)\">" .. v29 .. "</font>")
            task.wait(1)
        end
    end)
end
function u13.refreshLeaderboard(p30) --[[ Line: 94 ]]
    local v31 = p30.state.leaderboard
    local v32 = p30.props.store.Leaderboard.leaderboards[v31]
    if v32 then
        p30:setState({
            ["leaderboard"] = v31,
            ["leaderboardData"] = v32
        })
    else
        p30:setState({
            ["leaderboard"] = v31
        })
    end
end
function u13.handleSelectLeaderboard(p33, p34) --[[ Line: 108 ]]
    local v35 = p33.props.store.Leaderboard.leaderboards[p34]
    if v35 then
        p33:setState({
            ["leaderboard"] = p34,
            ["leaderboardData"] = v35
        })
    else
        p33:setState({
            ["leaderboard"] = p34
        })
    end
end
function u13.render(p36) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u12
        [4] = u3
        [5] = u6
        [6] = u4
        [7] = u7
        [8] = u8
    --]]
    local v37 = u9(p36.state.leaderboard)
    local v38 = p36.state.leaderboardData
    local v39
    if v38 == nil then
        v39 = v38
    else
        v39 = v38.localStatRank
    end
    local v40
    if v39 then
        v40 = v38.localStatRank.rankStatValue
    elseif v38 == nil then
        v40 = v38
    else
        v40 = v38.localStatValue
    end
    local v41 = tostring(v40)
    local v42
    if v37 == nil then
        v42 = v37
    else
        v42 = v37.statsType
    end
    local v43 = v42 == "time"
    if v43 then
        if v38 == nil then
            v43 = v38
        else
            v43 = v38.localStatValue
        end
    end
    if v43 ~= 0 and (v43 == v43 and v43) then
        v41 = u5.formatCountdownTime(v38.localStatValue)
    end
    local v44 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u12.backgroundPrimary
    }
    local v45 = {}
    local v46 = #v45
    local v47 = {
        ["Image"] = "rbxassetid://7106394844",
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(1, 0, 0.125, 0),
        ["BackgroundColor3"] = u3.hexColor(3092550)
    }
    local v48 = { u6.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.2, 0),
            ["PaddingBottom"] = UDim.new(0.2, 0),
            ["PaddingLeft"] = UDim.new(0.075, 0),
            ["PaddingRight"] = UDim.new(0.075, 0)
        }) }
    local v49 = #v48
    local v50 = {}
    local v51
    if v37 == nil then
        v51 = v37
    else
        v51 = v37.displayName
    end
    v50.Text = "Leaderboard: " .. tostring(v51)
    v50.Size = UDim2.fromScale(1, 0.5)
    v50.Position = UDim2.fromScale(0, 0)
    v50.AnchorPoint = Vector2.new(0, 0)
    v50.BackgroundTransparency = 1
    v50.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v50.TextScaled = true
    v50.TextXAlignment = Enum.TextXAlignment.Left
    v50.TextYAlignment = Enum.TextYAlignment.Top
    v50.TextColor3 = Color3.fromRGB(255, 255, 255)
    v50.AutoLocalize = false
    v48[v49 + 1] = u6.createElement("TextLabel", v50)
    local v52 = {}
    local v53
    if v37 == nil then
        v53 = v37
    else
        v53 = v37.description
    end
    v52.Text = tostring(v53)
    v52.Size = UDim2.fromScale(1, 0.4)
    v52.Position = UDim2.fromScale(0, 1)
    v52.AnchorPoint = Vector2.new(0, 1)
    v52.BackgroundTransparency = 1
    v52.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v52.TextScaled = true
    v52.TextXAlignment = Enum.TextXAlignment.Left
    v52.TextYAlignment = Enum.TextYAlignment.Bottom
    v52.TextColor3 = u12.textPrimary
    v48[v49 + 2] = u6.createElement("TextLabel", v52)
    v45[v46 + 1] = u6.createElement("ImageLabel", v47, v48)
    local v54 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0, 1),
        ["Size"] = UDim2.new(1, 0, 0.875, -0)
    }
    local v55 = { u6.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.02, 0),
            ["PaddingBottom"] = UDim.new(0.03, 0),
            ["PaddingLeft"] = UDim.new(0.075, 0),
            ["PaddingRight"] = UDim.new(0.075, 0)
        }), (u6.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        })) }
    local v56 = u6.createElement
    local v57 = u4
    local v58 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.06)
    }
    local v59 = {}
    local v60 = p36.resetsInText
    if v60 then
        v60 = u6.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextTransparency"] = 0.2,
            ["Text"] = p36.resetsInText,
            ["Size"] = UDim2.new(0.5, 0, 0.75, 0),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        })
    end
    __set_list(v59, 1, {v60})
    v55.Header = v56(v57, v58, v59)
    local v61
    if v38 then
        v61 = u6.createElement(u7, {
            ["LeaderboardType"] = p36.state.leaderboard,
            ["LeaderboardData"] = v38,
            ["FrameProps"] = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0.8200000000000001, 0),
                ["Position"] = UDim2.fromScale(0, 0.08)
            }
        })
    else
        v61 = v38
    end
    __set_list(v55, 3, {v61})
    local _ = #v55
    local v62
    if v38 == nil then
        v62 = v38
    else
        v62 = v38.leaderboardPosition
    end
    local v63 = v62 ~= nil
    if v63 then
        local v64 = {}
        local v65
        if v38 == nil then
            v65 = v38
        else
            v65 = v38.leaderboardPosition
        end
        local v66 = "<b>YOUR POSITION:</b> <font color=\"rgb(185, 188, 255)\">"
        local v67
        if v65 == 0 or (v65 ~= v65 or not v65) then
            v67 = "Not Placed"
        else
            local v68 = v38.leaderboardPosition
            local v69 = tostring(v68)
            v67 = string.gsub(string.reverse((string.gsub(string.reverse(v69), "%d%d%d", "%1,"))), "^,", "")
        end
        v64.Text = v66 .. v67 .. "</font>"
        v64.Size = UDim2.new(1, 0, 0.5, -2)
        v64.BackgroundTransparency = 1
        v64.Font = Enum.Font.RobotoMono
        v64.TextScaled = true
        v64.RichText = true
        v64.TextXAlignment = Enum.TextXAlignment.Left
        v64.TextColor3 = Color3.fromRGB(255, 255, 255)
        v64.LayoutOrder = 1
        v63 = u6.createElement("TextLabel", v64)
    end
    local v70 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 3,
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0, 1),
        ["Size"] = UDim2.fromScale(1, 0.07)
    }
    local v71 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 2)
        }) }
    local v72 = #v71
    if v63 then
        v71[v72 + 1] = v63
    end
    local v73 = #v71
    local v74 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 0.5, -2)
    }
    local v75 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }) }
    local v76 = #v75
    local v77 = {}
    local v78
    if v37 == nil then
        v78 = v37
    else
        v78 = string.upper(v37.statName)
    end
    v77.Text = "YOUR " .. tostring(v78) .. ":"
    v77.Size = UDim2.new(0, 0, 1, 0)
    v77.AutomaticSize = "X"
    v77.BackgroundTransparency = 1
    v77.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
    v77.TextScaled = true
    v77.TextXAlignment = Enum.TextXAlignment.Left
    v77.TextColor3 = Color3.fromRGB(255, 255, 255)
    v77.LayoutOrder = 1
    v75[v76 + 1] = u6.createElement("TextLabel", v77)
    local v79
    if v38 == nil then
        v79 = v38
    else
        v79 = v38.localStatRank
    end
    if v79 then
        v79 = u6.createElement(u8, {
            ["LayoutOrder"] = 2,
            ["StatRank"] = v38.localStatRank
        })
    end
    if v79 then
        v75[v76 + 2] = v79
    end
    local v80 = #v75
    local v81 = {}
    local v82 = string.gsub(string.reverse((string.gsub(string.reverse(v41), "%d%d%d", "%1,"))), "^,", "")
    if v38 ~= nil then
        v38 = v38.localStatRank
    end
    if v38 then
        v38 = v37
    end
    v81.Text = "<font color=\"rgb(185, 188, 255)\">" .. v82 .. " " .. (not v38 and "" or v37.metric) .. "</font>"
    v81.Size = UDim2.new(0, 0, 1, 0)
    v81.AutomaticSize = "X"
    v81.BackgroundTransparency = 1
    v81.Font = Enum.Font.RobotoMono
    v81.TextScaled = true
    v81.RichText = true
    v81.TextXAlignment = Enum.TextXAlignment.Left
    v81.TextColor3 = Color3.fromRGB(255, 255, 255)
    v81.LayoutOrder = 3
    v75[v80 + 1] = u6.createElement("TextLabel", v81)
    v71[v73 + 1] = u6.createElement(u4, v74, v75)
    v55.LeaderboardExtraInfo = u6.createElement("Frame", v70, v71)
    v45[v46 + 2] = u6.createElement("Frame", v54, v55)
    return u6.createElement("Frame", v44, v45)
end
function u13.willUnmount(p83) --[[ Line: 377 ]]
    p83.resetTimerActive = false
end
return {
    ["SkullLeaderboardUIWrapper"] = function(p84) --[[ Name: SkullLeaderboardUIWrapper, Line 381 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u13
        --]]
        local v85 = {
            ["LightInfluence"] = 0.25,
            ["Face"] = Enum.NormalId.Front,
            ["SizingMode"] = Enum.SurfaceGuiSizingMode.PixelsPerStud
        }
        local v86 = {}
        local v87 = #v86
        local v88 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.new(1, -30, 1, -30)
        }
        local v89 = {}
        local v90 = #v89
        local v91 = {}
        for v92, v93 in p84 do
            v91[v92] = v93
        end
        v89[v90 + 1] = u6.createElement(u13, v91)
        v86[v87 + 1] = u6.createElement("Frame", v88, v89)
        return u6.createElement("SurfaceGui", v85, v86)
    end,
    ["SkullLeaderboardCore"] = u13
}