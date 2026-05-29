local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.SoundManager
local u6 = v3.WatchPlayerCharacter
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta").getMinigameMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-util").MinigameUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "MinigameTeamController"
    end,
    ["__index"] = u14
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
        [3] = u11
    --]]
    u14.constructor(p22)
    p22.Name = "MinigameTeamController"
    p22.teams = {}
    p22.minigameMaid = u9.new()
    p22.actionBarTextLabel = u11.createRef()
end
function u19.KnitStart(u23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u17
        [3] = u5
        [4] = u18
        [5] = u7
        [6] = u12
        [7] = u15
        [8] = u13
        [9] = u8
        [10] = u6
        [11] = u10
    --]]
    u14.KnitStart(u23)
    u17.Client:WaitFor("MinigameEnded"):expect():Connect(function(p24) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u5
            [3] = u18
            [4] = u7
            [5] = u12
        --]]
        if p24.eliminateNonWinningTeams then
            local v25 = u23:getLocalPlayerTeam()
            if v25 ~= nil then
                v25 = v25.teamId
            end
            if v25 == "" or not v25 then
                return nil
            end
            local v26 = false
            for v27, v28 in p24.winningTeams do
                local _ = v27 - 1
                if v28.teamId == v25 then
                    v26 = true
                    break
                end
            end
            if v26 then
                u5:playSound(u18.WINTER_MINIGAME_VICTORY)
                u23:hideActionBar()
            else
                u5:playSound(u18.WINTER_MINIGAME_DEFEAT)
                u7.Controllers.SpectateUIController:setLobbyButtonsVisiblity(true)
                u7.Controllers.MinigameTeamController:updateActionBar("Your team is eliminated", Color3.fromRGB(255, 51, 51))
            end
        end
        for v29, v30 in u12:GetPlayers() do
            local _ = v29 - 1
            local v31 = v30:FindFirstAncestorWhichIsA("Highlight")
            if v31 ~= nil then
                v31:Destroy()
            end
        end
        u23.minigameMaid:DoCleaning()
    end)
    u17.Client:Get("MinigameStarted"):Connect(function(p32) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u5
            [3] = u18
            [4] = u7
            [5] = u13
            [6] = u8
            [7] = u23
            [8] = u12
        --]]
        local v33 = u5
        local v34 = u15(p32.minigame.type).musicOverride
        if v34 == nil then
            v34 = u18.WINTER_EVENT_MINIGAME_MUSIC
        end
        local u35 = v33:playSound(v34, {
            ["looped"] = true,
            ["fadeInTime"] = 1.5
        })
        local u36 = u7.Controllers.WinterEventController:getClimbSoundGroup()
        u13(1.5, u8, function(p37) --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            u36.Volume = 0.35 * (1 - p37) + p37 * 0.05
            return u36.Volume
        end)
        u23.minigameMaid:GiveTask(function() --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u8
                [3] = u36
                [4] = u35
                [5] = u5
            --]]
            u13(1.5, u8, function(p38) --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36.Volume = 0.35 * p38 + (1 - p38) * 0.05
                return u36.Volume
            end)
            if u35 then
                u5:tweenSoundVolume(u35, 0, 1.5)
                task.delay(1.5, function() --[[ Line: 113 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                    --]]
                    u35:Stop()
                    u35:Destroy()
                end)
            end
        end)
        u23.minigameMaid:GiveTask(u12.LocalPlayer:GetAttributeChangedSignal("Spectator"):Connect(function() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u12
                [3] = u23
            --]]
            if not u7.Controllers.MinigameController:isMinigameActive() then
                return nil
            end
            if u12.LocalPlayer:GetAttribute("Spectator") and not u7.Controllers.MinigameController:isEliminated() then
                u23:updateActionBar("Your team is not yet eliminated", Color3.fromRGB(59, 255, 74))
            end
        end))
    end)
    u17.Client:WaitFor("MinigameTeamUpdate"):andThen(function(p39) --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u12
            [3] = u6
            [4] = u10
        --]]
        p39:Connect(function(p40) --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u12
                [3] = u6
                [4] = u10
            --]]
            u23.teams = p40
            local v41 = u23:getLocalPlayerTeam()
            if v41 then
                for v42, v43 in v41.players do
                    local _ = v42 - 1
                    if v43 ~= u12.LocalPlayer then
                        u23.minigameMaid:GiveTask(u6(v43, function(p44, _) --[[ Line: 142 ]]
                            --[[
                            Upvalues:
                                [1] = u23
                                [2] = u10
                            --]]
                            u23.minigameMaid:GiveTask(u10("Highlight", {
                                ["Enabled"] = true,
                                ["FillTransparency"] = 1,
                                ["OutlineTransparency"] = 0,
                                ["DepthMode"] = Enum.HighlightDepthMode.Occluded,
                                ["OutlineColor"] = Color3.fromRGB(59, 255, 74),
                                ["Parent"] = p44
                            }))
                        end))
                    end
                end
            end
        end)
    end)
end
function u19.getTeam(p45, p46) --[[ Line: 161 ]]
    local v47 = nil
    for v48, v49 in p45.teams do
        local _ = v48 - 1
        if v49.teamId == p46 == true then
            return v49
        end
    end
    return v47
end
function u19.getTeams(p50) --[[ Line: 177 ]]
    return p50.teams
end
function u19.getLocalPlayerTeam(p51) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    return p51:getPlayerTeam(u12.LocalPlayer)
end
function u19.getPlayerTeam(p52, p53) --[[ Line: 183 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v54 = u16:getMinigameTeamIdByPlayer(p53)
    if v54 ~= "" and v54 then
        return p52:getTeam(v54)
    end
end
function u19.getPlayerTeamId(_, p55) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    return u16:getMinigameTeamIdByPlayer(p55)
end
function u19.updateActionBar(p56, p57, p58) --[[ Line: 192 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u4
    --]]
    if not p56.actionBarMaid then
        p56.actionBarMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u11.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextColor3"] = p58 or u4.WHITE,
            ["Text"] = "",
            [u11.Ref] = p56.actionBarTextLabel,
            ["Size"] = UDim2.fromScale(1, 0.04),
            ["TextScaled"] = true,
            ["Font"] = "GothamBold"
        }))
    end
    local v59 = p56.actionBarTextLabel:getValue()
    local v60
    if v59 then
        local v61
        if v59 == nil then
            v61 = v59
        else
            v61 = v59.Text
        end
        v60 = v61 ~= p57
    else
        v60 = v59
    end
    if v60 then
        v59.Text = p57
        v59.TextColor3 = p58 or u4.WHITE
    end
end
function u19.hideActionBar(p62) --[[ Line: 218 ]]
    local v63 = p62.actionBarMaid
    if v63 ~= nil then
        v63:DoCleaning()
    end
    p62.actionBarMaid = nil
end
u7.CreateController(u19.new())
return nil