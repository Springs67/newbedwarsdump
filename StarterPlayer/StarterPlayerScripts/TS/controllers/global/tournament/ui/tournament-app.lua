local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.DeviceUtil
local u5 = v2.SlideIn
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.RunService
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-types").TournamentDivision
local u15 = v1.import(script, script.Parent, "bracket-page", "tournament-app-bracket-page").TournamentAppBracketPage
local u16 = v1.import(script, script.Parent, "incoming-invites-page", "tournament-app-incoming-invites-page").TournamentAppIncomingInvitesPage
local u17 = v1.import(script, script.Parent, "info-page", "tournament-app-info-page").TournamentAppInfoPage
local u18 = v1.import(script, script.Parent, "outbound-invites-page", "tournament-app-outbound-invites-page").TournamentAppOutboundInvitePage
local u19 = v1.import(script, script.Parent, "team-page", "tournament-app-team-page").TournamentAppTeamPage
local u20 = v1.import(script, script.Parent, "team-page", "tournament-create-team-page").TournamentCreateTeamPage
local u21 = v1.import(script, script.Parent, "tournament-app-header").TournamentAppHeader
local u22 = v1.import(script, script.Parent, "tournament-app-types").TournamentAppTab
local v52 = v8.new(u7)(function(p23, p24) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u22
        [3] = u4
        [4] = u7
        [5] = u3
        [6] = u21
        [7] = u17
        [8] = u19
        [9] = u20
        [10] = u15
        [11] = u16
        [12] = u13
        [13] = u14
        [14] = u6
        [15] = u18
        [16] = u5
    --]]
    local v25 = p24.useState
    local _ = p24.useEffect
    local v26
    if u12:IsStudio() then
        v26 = nil
    else
        v26 = p23.TeamData
    end
    local v27, u28 = v25(u22.TEAM)
    local v29 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = not u4.isSmallScreen()
    }
    local v30 = { u7.createElement(u3, {
            ["AppId"] = p23.AppId
        }) }
    local v31 = #v30
    local v32 = {}
    local _ = #v32
    local v33 = {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["Modal"] = true,
        ["AutoButtonColor"] = false,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.7, 0.8),
        ["BackgroundColor3"] = Color3.fromHex("403E74")
    }
    local v35 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }), u7.createElement(u21, {
            ["AppId"] = p23.AppId,
            ["SelectedTab"] = v27,
            ["SelectTabButton"] = function(p34) --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28(p34)
            end
        }) }
    local v36 = #v35
    local v37
    if v27 == u22.INFO then
        v37 = u7.createElement(u17)
    else
        v37 = false
    end
    if v37 then
        v35[v36 + 1] = v37
    end
    local v38 = #v35
    local v39
    if v27 == u22.TEAM then
        if v26 then
            v39 = u7.createElement(u19, {
                ["TeamName"] = v26.TeamName,
                ["TeamIcon"] = v26.TeamIcon,
                ["TeamId"] = v26.TeamId,
                ["TeamLeader"] = v26.TeamLeader,
                ["TeamMembers"] = v26.TeamMembers,
                ["Region"] = v26.Region,
                ["Division"] = v26.Division,
                ["Emotes"] = p23.Emotes
            })
        else
            v39 = u7.createElement(u20)
        end
    else
        v39 = false
    end
    if v39 then
        v35[v38 + 1] = v39
    end
    local v40 = #v35
    local v41
    if v27 == u22.BRACKET then
        v41 = u7.createElement(u15, {
            ["inATeam"] = v26 and true or false
        })
    else
        v41 = false
    end
    if v41 then
        v35[v40 + 1] = v41
    end
    local v42 = #v35
    local v43
    if v27 == u22.INVITES then
        local v44 = u7.createElement
        local v45 = u16
        local v46 = {}
        local v47
        if u12:IsStudio() then
            v47 = {
                {
                    ["teamId"] = "10240120401240124",
                    ["teamName"] = "Aery Gamers",
                    ["teamTag"] = "AG",
                    ["invitingPlayer"] = 14124124,
                    ["weekId"] = "3",
                    ["teamIcon"] = u13.ACADEMY_AERY_GL,
                    ["division"] = u14.Division_I
                }
            }
        else
            v47 = u6.values(p23.incomingTournamentInvites)
        end
        v46.Invites = v47
        v43 = v44(v45, v46)
    else
        v43 = false
    end
    if v43 then
        v35[v42 + 1] = v43
    end
    local v48 = #v35
    local v49 = v27 == u22.OUTBOUND_INVITES
    if v49 then
        local v50 = {}
        local v51 = p23.TeamData
        if v51 ~= nil then
            v51 = v51.OutboundInvites
        end
        v50.OutboundInvites = v51 == nil and {} or v51
        v49 = u7.createElement(u18, v50)
    end
    if v49 then
        v35[v48 + 1] = v49
    end
    v32.AppBackground = u7.createElement("ImageButton", v33, v35)
    v30[v31 + 1] = u7.createElement(u5, {}, v32)
    return u7.createFragment({
        ["TournamentTeamApp"] = u7.createElement("ScreenGui", v29, v30)
    })
end)
return {
    ["TournamentApp"] = v9.connect(function(p53, p54) --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        local v55 = p53.Tournament.myTeamId
        if v55 ~= "" and v55 then
            local v56 = p53.Tournament.myTeamName
            v55 = (v56 ~= "" and v56 and true or false) and p53.Tournament.myTeamIcon
            if v55 then
                v55 = p53.Tournament.myTeamLeader
                if v55 ~= 0 and (v55 == v55 and v55) then
                    v55 = p53.Tournament.myTeamRegion and p53.Tournament.myTeamDivision
                    if v55 then
                        v55 = p53.Tournament.outboundTournamentInvites
                    end
                end
            end
        end
        if v55 == 0 or (v55 ~= v55 or (v55 == "" or not v55)) then
            local v57 = {}
            for v58, v59 in p54 do
                v57[v58] = v59
            end
            v57.Emotes = nil
            v57.TeamData = nil
            v57.incomingTournamentInvites = p53.Tournament.incomingTournamentInvites
            v57.outboundTournamentInvites = p53.Tournament.outboundTournamentInvites
            return v57
        else
            local v60 = {}
            for v61, v62 in p54 do
                v60[v61] = v62
            end
            local v63
            if p53.Tournament.myTeamLeader == u11.LocalPlayer.UserId then
                v63 = p53.Locker.emotes
            else
                v63 = nil
            end
            v60.Emotes = v63
            v60.TeamData = {
                ["TeamId"] = p53.Tournament.myTeamId,
                ["TeamName"] = p53.Tournament.myTeamName,
                ["TeamIcon"] = p53.Tournament.myTeamIcon,
                ["TeamLeader"] = p53.Tournament.myTeamLeader,
                ["TeamMembers"] = p53.Tournament.myTeamMembers or {},
                ["Region"] = p53.Tournament.myTeamRegion,
                ["Division"] = p53.Tournament.myTeamDivision,
                ["OutboundInvites"] = p53.Tournament.outboundTournamentInvites
            }
            v60.incomingTournamentInvites = p53.Tournament.incomingTournamentInvites
            return v60
        end
    end)(v52)
}