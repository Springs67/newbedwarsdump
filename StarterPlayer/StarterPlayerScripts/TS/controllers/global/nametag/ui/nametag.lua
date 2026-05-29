local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitServer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.RunService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lobby", "title", "ui", "lobby-title").LobbyTitle
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lobby", "title", "ui", "player-lobby-title").PlayerLobbyTitle
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-config").NametagConfig
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u25 = v1.import(script, script.Parent, "nametag-winstreak").NameTagWinStreak
return {
    ["NameTag"] = v8.new(u7)(function(u26, p27) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u18
            [4] = u15
            [5] = u19
            [6] = u5
            [7] = u17
            [8] = u11
            [9] = u6
            [10] = u10
            [11] = u22
            [12] = u24
            [13] = u4
            [14] = u23
            [15] = u16
            [16] = u21
            [17] = u2
            [18] = u25
            [19] = u13
            [20] = u20
            [21] = u14
        --]]
        local v28 = p27.useState
        local v29 = p27.useEffect
        local v30, u31 = v28(u26.EntityInstance.Name)
        local v32, u33 = v28(u12:IsStudio() and "fast" or "")
        local v34, u35 = v28(0)
        local v36, u37 = v28(0)
        local v38, u39 = v28("")
        local _, _ = v28("")
        local v40, u41 = v28(false)
        local u42 = u7.createRef()
        local v43 = v32 ~= ""
        local v44 = u18.getActiveTeamEvents()
        if #v44 > 0 then
            u18.isEventRunning(v44[1])
        end
        local v45 = u15:getPlayerFromEntityInstance(u26.EntityInstance)
        v29(function() --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u26
                [3] = u42
                [4] = u6
                [5] = u10
                [6] = u22
                [7] = u31
                [8] = u24
                [9] = u4
                [10] = u37
                [11] = u39
                [12] = u23
                [13] = u15
                [14] = u41
                [15] = u33
                [16] = u35
            --]]
            local u46 = u11:GetPlayerFromCharacter(u26.EntityInstance)
            if not u46 then
                return nil
            end
            local u47 = u42:getValue()
            if not u47 then
                return nil
            end
            local u48 = u6.new()
            u10:AddTag(u47, "EntityNameTag")
            u47.Adornee = u26.EntityInstance.Head
            u48:GiveTask(u26.EntityInstance:GetAttributeChangedSignal("NametagStudsOffsetWorldSpace"):Connect(function() --[[ Line: 121 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u47
                --]]
                local v49 = u26.EntityInstance:GetAttribute("NametagStudsOffsetWorldSpace")
                if v49 then
                    u47.StudsOffsetWorldSpace = v49
                end
            end))
            u31((u22.getGamePlayer(u46):getDisplayName()))
            u46:GetAttributeChangedSignal("DisguiseDisplayName"):Connect(function(_) --[[ Line: 131 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u46
                    [3] = u31
                --]]
                u31(u22.getGamePlayer(u46):getDisplayName())
            end)
            if u24.isLobbyServer() then
                task.spawn(function() --[[ Line: 137 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                        [2] = u11
                        [3] = u4
                        [4] = u37
                        [5] = u39
                        [6] = u23
                        [7] = u48
                        [8] = u15
                        [9] = u41
                        [10] = u22
                        [11] = u46
                        [12] = u33
                        [13] = u35
                    --]]
                    if u26.EntityInstance == u11.LocalPlayer.Character then
                        local u50 = u4.Controllers.NametagController:requestNametagData(u11.LocalPlayer)
                        if u50 ~= nil then
                            u50 = u50:andThen(function(p51) --[[ Line: 142 ]]
                                --[[
                                Upvalues:
                                    [1] = u37
                                    [2] = u39
                                    [3] = u23
                                --]]
                                if not p51 then
                                    return nil
                                end
                                local v52 = p51.winstreak
                                if v52 ~= 0 and (v52 == v52 and v52) then
                                    u37(p51.winstreak)
                                end
                                local v53 = p51.rankDivision
                                if v53 ~= 0 and (v53 == v53 and v53) then
                                    u39(u23[p51.rankDivision].image)
                                end
                            end)
                        end
                        u48:GiveTask(function() --[[ Line: 158 ]]
                            --[[
                            Upvalues:
                                [1] = u50
                            --]]
                            local v54 = u50
                            if v54 ~= nil then
                                v54:cancel()
                            end
                        end)
                    else
                        u4.Controllers.EntityHoverController:watchEntityMouseHover(function(p55) --[[ Line: 166 ]]
                            --[[
                            Upvalues:
                                [1] = u26
                                [2] = u15
                                [3] = u4
                                [4] = u37
                                [5] = u39
                                [6] = u23
                                [7] = u48
                                [8] = u41
                            --]]
                            if p55:getInstance() == u26.EntityInstance then
                                local v56 = u15:getEntity(u26.EntityInstance)
                                if v56 ~= nil then
                                    v56 = v56:getPlayer()
                                end
                                if not v56 then
                                    return nil
                                end
                                local u57 = u4.Controllers.NametagController:requestNametagData(v56)
                                if u57 ~= nil then
                                    u57 = u57:andThen(function(p58) --[[ Line: 180 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u37
                                            [2] = u39
                                            [3] = u23
                                        --]]
                                        if not p58 then
                                            return nil
                                        end
                                        local v59 = p58.winstreak
                                        if v59 ~= 0 and (v59 == v59 and v59) then
                                            u37(p58.winstreak)
                                        end
                                        local v60 = p58.rankDivision
                                        if v60 ~= 0 and (v60 == v60 and v60) then
                                            u39(u23[p58.rankDivision].image)
                                        end
                                    end)
                                end
                                u48:GiveTask(function() --[[ Line: 196 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u57
                                    --]]
                                    local v61 = u57
                                    if v61 ~= nil then
                                        v61:cancel()
                                    end
                                end)
                                u41(true)
                            end
                        end)
                        u4.Controllers.EntityHoverController:watchEntityMouseUnHover(function(_) --[[ Line: 205 ]]
                            --[[
                            Upvalues:
                                [1] = u41
                            --]]
                            u41(false)
                        end)
                    end
                    local v62 = u22.getGamePlayer(u46):getClanTag()
                    if v62 ~= nil then
                        u33(v62)
                    end
                    u48:GiveTask(u46:GetAttributeChangedSignal("ClanTag"):Connect(function(_) --[[ Line: 217 ]]
                        --[[
                        Upvalues:
                            [1] = u22
                            [2] = u46
                            [3] = u33
                        --]]
                        local v63 = u22.getGamePlayer(u46):getClanTag()
                        if v63 ~= nil then
                            u33(v63)
                        end
                    end))
                    u35((u22.getGamePlayer(u46):getLevel()))
                    u48:GiveTask(u46:GetAttributeChangedSignal("PlayerLevel"):Connect(function() --[[ Line: 226 ]]
                        --[[
                        Upvalues:
                            [1] = u22
                            [2] = u46
                            [3] = u35
                        --]]
                        u35((u22.getGamePlayer(u46):getLevel()))
                    end))
                    u48:GiveTask(u46:GetAttributeChangedSignal("StreamerModeDisguise"):Connect(function() --[[ Line: 229 ]]
                        --[[
                        Upvalues:
                            [1] = u22
                            [2] = u46
                            [3] = u35
                        --]]
                        u35((u22.getGamePlayer(u46):getLevel()))
                    end))
                end)
            end
            return function() --[[ Line: 234 ]]
                --[[
                Upvalues:
                    [1] = u48
                --]]
                u48:DoCleaning()
            end
        end, {})
        local v64 = {
            ["Size"] = UDim2.fromScale(5, 0.65),
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 1.6, 0),
            ["AlwaysOnTop"] = true,
            ["MaxDistance"] = u16.BillboardMaxDistanceLobby,
            ["ResetOnSpawn"] = false,
            ["AutoLocalize"] = false,
            [u7.Ref] = u42
        }
        local v65 = {}
        local v66 = #v65
        local v67 = u24.isGameServer()
        if v67 then
            v67 = u7.createFragment({
                ["TeamIndicator"] = u7.createElement("ImageLabel", {
                    ["BorderSizePixel"] = 0,
                    ["Visible"] = false,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.75, 0.75),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["BackgroundColor3"] = Color3.fromRGB(0, 255, 38)
                }, { u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(50, 0)
                    }) })
            })
        end
        if v67 then
            v65[v66 + 1] = v67
        end
        local v68 = #v65
        v65.DisplayNameContainer = u7.createElement("Frame", {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.8, 0.75),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }, {
            ["Stroke"] = u7.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Transparency"] = 1,
                ["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
            }),
            u7.createElement("UIGradient", {
                ["Color"] = ColorSequence.new(Color3.fromRGB(0, 0, 0)),
                ["Transparency"] = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.15, 0.55),
                    NumberSequenceKeypoint.new(0.5, 0.55),
                    NumberSequenceKeypoint.new(0.85, 0.55),
                    NumberSequenceKeypoint.new(1, 1)
                })
            }),
            ["DisplayName"] = u7.createElement("TextLabel", {
                ["Font"] = "Roboto",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["AutoLocalize"] = false,
                ["TextYAlignment"] = "Center",
                ["LayoutOrder"] = 3,
                ["Text"] = (not (v43 and u24.isLobbyServer()) and "" or "<font color=\"rgb(219,219,219)\">[" .. v32 .. "]</font>") .. " <b>" .. v30 .. "</b>",
                ["Size"] = UDim2.new(0.9, 0, 0.9, 0),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        })
        local v69 = u24.isLobbyServer()
        if v69 then
            local v70 = u21.getLevelMeta(v34)
            if v70 ~= nil then
                v70 = v70.gradient
            end
            if v70 then
                v70 = u7.createElement("UIGradient", {
                    ["Color"] = u21.getLevelMeta(v34).gradient
                })
            end
            local v71 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["AutoLocalize"] = false,
                ["TextYAlignment"] = "Center",
                ["TextStrokeTransparency"] = 0.7,
                ["LayoutOrder"] = 1,
                ["Text"] = "(" .. tostring(v34) .. ") ",
                ["Size"] = UDim2.fromScale(0.2, 0.65),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(-0.06, 0.5),
                ["TextColor3"] = u21.getLevelColor(v34),
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
            }
            local v72 = {}
            local v73 = #v72
            if v70 then
                v72[v73 + 1] = v70
            end
            v69 = u7.createFragment({
                ["PlayerLevel"] = u7.createElement("TextLabel", v71, v72)
            })
        end
        if v69 then
            v65[v68 + 1] = v69
        end
        local v74 = #v65
        local v75 = v40 or (u2.isHoarceKat() or u26.EntityInstance == u11.LocalPlayer.Character)
        if v75 then
            local v76 = {}
            local v77 = #v76
            local v78 = u24.isLobbyServer()
            if v78 then
                if v38 == "" then
                    v78 = false
                else
                    v78 = u7.createFragment({
                        ["RankDisplay"] = u7.createElement("ImageLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["LayoutOrder"] = 5,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["AnchorPoint"] = Vector2.new(1, 0.5),
                            ["Position"] = UDim2.fromScale(1, 0.3),
                            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                            ["Image"] = v38
                        })
                    })
                end
            end
            if v78 then
                v76[v77 + 1] = v78
            end
            local v79 = #v76
            local v80 = u24.isLobbyServer()
            if v80 then
                if v36 > 0 then
                    v80 = u7.createElement(u25, {
                        ["WinStreak"] = v36,
                        ["Size"] = UDim2.fromScale(0.1, 0.75),
                        ["AnchorPoint"] = Vector2.new(1, 0.5),
                        ["Position"] = UDim2.fromScale(1.05, 0.6)
                    })
                else
                    v80 = false
                end
            end
            if v80 then
                v76[v79 + 1] = v80
            end
            local v81 = #v76
            if u2.isHoarceKat() then
                v45 = u7.createElement(u13, {
                    ["TitleType"] = u20.FLOW,
                    ["TextLabelProps"] = {
                        ["AnchorPoint"] = Vector2.new(0, 0.99),
                        ["Size"] = UDim2.fromScale(1, 0.6)
                    }
                })
            else
                local v82 = u24.isLobbyServer()
                if v82 then
                    if v45 then
                        v45 = u7.createElement(u14, {
                            ["Player"] = v45,
                            ["TextLabelProps"] = {
                                ["AnchorPoint"] = Vector2.new(0, 0.99),
                                ["Size"] = UDim2.fromScale(1, 0.6)
                            }
                        })
                    end
                else
                    v45 = v82
                end
            end
            if v45 then
                v76[v81 + 1] = v45
            end
            v75 = u7.createFragment(v76)
        end
        if v75 then
            v65[v74 + 1] = v75
        end
        return u7.createFragment({
            ["Nametag"] = u7.createElement("BillboardGui", v64, v65)
        })
    end)
}