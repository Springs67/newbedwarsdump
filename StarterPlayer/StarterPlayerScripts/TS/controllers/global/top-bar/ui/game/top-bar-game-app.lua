local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.TopBarButton
local u7 = v3.TopBarCard
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game-hud", "game-hud-widget").GameHudWidget
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u19 = v1.import(script, script.Parent, "hud-alive-player-counts").HudAlivePlayerCounts
local u20 = v1.import(script, script.Parent, "hud-bed-health").HudBedHealth
local u21 = v1.import(script, script.Parent, "hud-event-timer").HudEventTimer
local u22 = v1.import(script, script.Parent, "hud-local-kills").HudLocalKills
local u23 = v1.import(script, script.Parent, "hud-lucky-block-luck").HudLuckyBlockLuckHud
local u24 = v1.import(script, script.Parent, "hud-match-timer").HudMatchTimer
local u25 = v1.import(script, script.Parent, "hud-team-bridge-duel-scores", "hud-team-bridge-duel-scores").HudTeamBridgeDuelScores
local u26 = v1.import(script, script.Parent, "hud-team-scores", "hud-team-scores").HudTeamScores
local u27 = v1.import(script, script.Parent, "hud-teams", "hud-beds").HudTeamBeds
local v71 = v10.new(u9)(function(p28, p29) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u16
        [3] = u15
        [4] = u2
        [5] = u14
        [6] = u13
        [7] = u8
        [8] = u18
        [9] = u12
        [10] = u9
        [11] = u7
        [12] = u4
        [13] = u23
        [14] = u21
        [15] = u24
        [16] = u22
        [17] = u20
        [18] = u27
        [19] = u19
        [20] = u26
        [21] = u25
        [22] = u6
        [23] = u17
    --]]
    local _ = p29.useMemo
    local v30 = p29.useState
    local v31 = p29.useEffect
    local v32
    if u5.isHoarceKat() then
        v32 = u16.SKYWARS_TO2
    else
        v32 = p28.QueueType or u16.BEDWARS_TEST
    end
    local v33
    if u5.isHoarceKat() then
        v33 = u15[v32]
    else
        v33 = u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v32)
    end
    local v34 = v33.teams
    local v35 = u5.isMobileControls()
    local v36
    if v33.game == u14.BEDWARS then
        v36 = true
    elseif v33.hudWidgets then
        local v37 = v33.hudWidgets
        local v38 = u13.BEDS
        v36 = table.find(v37, v38) ~= nil
    else
        v36 = false
    end
    local v39
    if u5.isHoarceKat() then
        v39 = false
    else
        v39 = u8.Controllers.MatchController:getMatchState() == u18.POST
    end
    local v40, u41 = v30(v39)
    v31(function() --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u18
            [3] = u41
        --]]
        u12.MatchStateChange:connect(function(p42) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u41
            --]]
            if p42.matchState == u18.POST then
                u41(true)
            end
        end)
    end, {})
    local v43 = {}
    local v44 = #v43
    local v45 = v33.winConInfoHud ~= nil and not v40
    if v45 then
        v45 = u9.createElement(u7, {
            ["LayoutOrder"] = 0,
            ["BackgroundColor3"] = u4.hexColor(16755200)
        }, { u9.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextSize"] = 16,
                ["Text"] = v33.winConInfoHud,
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = u4.WHITE
            }) })
    end
    if v45 then
        v43[v44 + 1] = v45
    end
    local v46 = #v43
    local v47 = v33.luckyBlock
    if v47 ~= nil then
        v47 = v47.luckSystem
    end
    if v47 then
        v47 = not v40
        if v47 then
            v47 = u9.createElement(u23, {
                ["LayoutOrder"] = 0
            })
        end
    end
    if v47 then
        v43[v46 + 1] = v47
    end
    local v48 = #v43
    local v49 = not v40
    if v49 then
        v49 = u9.createElement(u21, {
            ["LayoutOrder"] = 1
        })
    end
    if v49 then
        v43[v48 + 1] = v49
    end
    local v50 = #v43
    local v51 = not v40
    if v51 then
        v51 = u9.createElement(u24, {
            ["LayoutOrder"] = 2
        })
    end
    if v51 then
        v43[v50 + 1] = v51
    end
    local v52 = #v43
    local v53 = not v40
    if v53 then
        v53 = u9.createElement(u22, {
            ["AppId"] = "HudKillsApp",
            ["LayoutOrder"] = 3,
            ["LocalPlayerId"] = p28.LocalPlayerId
        })
    end
    if v53 then
        v43[v52 + 1] = v53
    end
    local v54 = #v43
    local v55 = not v40
    if v55 then
        if v36 then
            v55 = u9.createElement(u20, {
                ["AppId"] = "HudBedHealth"
            })
        else
            v55 = v36
        end
    end
    if v55 then
        v43[v54 + 1] = v55
    end
    local v56 = #v43
    local v57 = v36 and not v40
    if v57 then
        v57 = u9.createElement(u27, {
            ["LayoutOrder"] = 4,
            ["Teams"] = v34
        })
    end
    if v57 then
        v43[v56 + 1] = v57
    end
    local v58 = #v43
    local v59 = v33.hudWidgets
    if v59 ~= nil then
        local v60 = u13.ALIVE_PLAYERS
        v59 = table.find(v59, v60) ~= nil
    end
    if v59 then
        v59 = not v40
        if v59 then
            v59 = u9.createElement(u19, {
                ["LayoutOrder"] = 4
            })
        end
    end
    if v59 then
        v43[v58 + 1] = v59
    end
    local v61 = #v43
    local v62 = v33.hudWidgets
    if v62 ~= nil then
        local v63 = u13.SCORE
        v62 = table.find(v62, v63) ~= nil
    end
    if v62 then
        v62 = u9.createElement(u26, {
            ["LayoutOrder"] = 4
        })
    end
    if v62 then
        v43[v61 + 1] = v62
    end
    local v64 = #v43
    local v65 = v33.hudWidgets
    if v65 ~= nil then
        local v66 = u13.BRIDGE_DUEL_SCORE
        v65 = table.find(v65, v66) ~= nil
    end
    if v65 then
        v65 = not v35
        if v65 then
            v65 = u9.createElement(u25, {
                ["LayoutOrder"] = 4
            })
        end
    end
    if v65 then
        v43[v64 + 1] = v65
    end
    local v67 = #v43
    local v68 = u5.isMobileControls()
    if v68 then
        v68 = u9.createElement(u6, {
            ["LayoutOrder"] = 52,
            ["ToolTip"] = "OPEN TABLIST",
            ["Image"] = u17.TabListMobileIcon,
            ["OnClick"] = function(_, p69) --[[ Name: OnClick, Line 182 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                local v70 = u8.Controllers.TablistController
                v70.toggleTablist()
                p69(v70.tablistOpen)
            end,
            ["SelectedState"] = {
                ["BackgroundColor"] = u4.WHITE
            }
        })
    end
    if v68 then
        v43[v67 + 1] = v68
    end
    return u9.createFragment(v43)
end)
return {
    ["TopBarGameApp"] = v11.connect(function(p72, p73) --[[ Line: 198 ]]
        local v74 = {}
        for v75, v76 in p73 do
            v74[v75] = v76
        end
        v74.QueueType = p72.Game.queueType
        v74.CustomMatchMapSaveInfoDto = p72.CustomMatch.mapSaveData
        v74.IsCustom = p72.Game.customMatch ~= nil
        return v74
    end)(v71)
}