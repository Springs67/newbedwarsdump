local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, script.Parent, "ui", "pvp-arena-intermission-ui").PvPArenaIntermissionUI
local u18 = v1.import(script, script.Parent, "ui", "pvp-arena-round-ui").PvPArenaRoundUI
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "PvpArenaController"
    end,
    ["__index"] = u9
})
u19.__index = u19
function u19.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
        [3] = u13
    --]]
    u9.constructor(p22, { u11.PVP_ARENA })
    p22.Name = "PvpArenaController"
    p22.gameState = u13.PRE
end
function u19.onGameInit(u23) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
        [3] = u14
        [4] = u6
        [5] = u10
        [6] = u15
        [7] = u12
        [8] = u3
        [9] = u16
        [10] = u7
    --]]
    u8.CanUseLocalAbility:connect(function(p24) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u13
        --]]
        if u23.gameState ~= u13.IN_PROGRESS then
            p24:setCancelled(true)
        end
    end)
    u8.AbilityUsed:connect(function(p25) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u13
        --]]
        if u23.gameState ~= u13.IN_PROGRESS then
            p25:setCancelled(true)
        end
    end)
    u8.MatchStateChange:connect(function(p26) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u6
            [3] = u10
        --]]
        if p26.matchState == u14.RUNNING then
            for v27, v28 in u6.Controllers.TeamController:getTeams() do
                local _ = v27 - 1
                u10:dispatch({
                    ["type"] = "AddPvPArenaTeamHealth",
                    ["health"] = 100,
                    ["team"] = v28
                })
            end
        end
    end)
    u15.Client:Get("PvPArenaGameStateChanged"):Connect(function(u29) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u12
            [3] = u23
            [4] = u3
            [5] = u16
            [6] = u7
        --]]
        if u29.gameState == u13.IN_PROGRESS then
            task.delay(u12.GRACE_PERIOD_TIME, function() --[[ Line: 69 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u29
                --]]
                u23.gameState = u29.gameState
            end)
        else
            u23.gameState = u29.gameState
        end
        if u29.gameState == u13.INTERMISSION then
            u23:mountIntermissionUI()
            u23:mountRoundUI()
            local u30 = u3:playSound(u16.PVP_ARENA_INTERMISSION_TRACK):getInstance()
            local v31 = task
            local v32 = u12
            local v33 = u12
            local v34 = u29.roundNumber
            local v35 = v34 == nil and 0 or v34
            v31.delay(v32.getIntermissionRoundTime(v33.isAugmentRound(v35)), function() --[[ Line: 87 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u7
                --]]
                if u30 then
                    local v36 = u7:Create(u30, TweenInfo.new(3), {
                        ["Volume"] = 0
                    })
                    v36:Play()
                    v36.Completed:Once(function() --[[ Line: 93 ]]
                        --[[
                        Upvalues:
                            [1] = u30
                        --]]
                        u30:Stop()
                    end)
                end
            end)
        end
        local _ = u29.gameState == u13.IN_PROGRESS
        if u29.gameState == u13.POST then
            u23:unMountIntermissionUI()
            u23:unMountRoundUI()
        end
    end)
    u15.Client:Get("PvPArenaTeamHealthChanged"):Connect(function(p37) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10:dispatch({
            ["type"] = "SetPvPArenaTeamHealth",
            ["team"] = p37.team,
            ["health"] = p37.health
        })
    end)
end
function u19.getGameState(p38) --[[ Line: 114 ]]
    return p38.gameState
end
function u19.mountIntermissionUI(_) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaIntermissionUI") then
        return nil
    end
    local v39 = {
        ["appId"] = "PvPArenaIntermissionUI",
        ["app"] = u17
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v39, {})
end
function u19.unMountIntermissionUI(_) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaIntermissionUI") then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvPArenaIntermissionUI")
end
function u19.mountRoundUI(_) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u18
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaRoundUI") then
        return nil
    end
    local v40 = {
        ["appId"] = "PvPArenaRoundUI",
        ["app"] = u18
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v40, {})
end
function u19.unMountRoundUI(_) --[[ Line: 141 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("PvPArenaRoundUI") then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("PvPArenaRoundUI")
end
v5.CreateController(u19.new())
return nil