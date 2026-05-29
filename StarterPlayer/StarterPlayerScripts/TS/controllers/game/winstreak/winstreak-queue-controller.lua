local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, script.Parent, "ui", "versus-hud").VersusHud
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "WinstreakQueueController"
    end,
    ["__index"] = u9
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p18)
    p18.Name = "WinstreakQueueController"
    p18.tree = nil
end
function u15.KnitStart(u19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u10
        [4] = u13
        [5] = u11
        [6] = u8
        [7] = u6
    --]]
    u9.KnitStart(u19)
    u5.Controllers.MatchController:getQueueTypeAsync():andThen(function(u20) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u13
            [3] = u5
            [4] = u11
            [5] = u19
        --]]
        if u20 ~= u10.WINSTREAK_1v1 and u20 ~= u10.BRIDGE_DUEL then
            return nil
        end
        u13.Client:Get("TeamsUpdateEvent"):Connect(function(_) --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u11
                [3] = u13
                [4] = u20
                [5] = u10
                [6] = u19
            --]]
            if u5.Controllers.MatchController:getMatchState() == u11.RUNNING then
                return nil
            end
            u13.Client:Get("RequestWinstreakQueueVersusBoard"):CallServerAsync():andThen(function(p21) --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u10
                    [3] = u19
                --]]
                if u20 == u10.BRIDGE_DUEL then
                    u19:displayVersusHudFromTeams(p21.teamA, p21.teamB, true)
                else
                    u19:displayVersusHudFromTeams(p21.teamA, p21.teamB)
                end
            end)
        end)
    end)
    u8.MatchStateChange:connect(function(p22) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u19
            [3] = u6
        --]]
        if p22.matchState == u11.RUNNING and u19.tree then
            u6.unmount(u19.tree)
        end
    end)
end
function u15.displayVersusHudFromTeams(p23, p24, p25, p26) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
    --]]
    local v27 = nil
    local v28
    if p24 then
        local v29
        if p24.offlinePlayer then
            local v30 = u2.getPlayer(p24.offlinePlayer)
            if v30 then
                v29 = u12.getGamePlayer(v30):getDisplayName()
            else
                v29 = p24.offlinePlayer.displayName
            end
        else
            v29 = ""
        end
        v28 = {
            ["Name"] = v29,
            ["offlinePlayer"] = p24.offlinePlayer,
            ["teamColor"] = p24.teamColor
        }
        local v31
        if p26 then
            v31 = nil
        else
            v31 = p24.stat
        end
        v28.stat = v31
    else
        v28 = nil
    end
    if p25 then
        local v32
        if p25.offlinePlayer then
            local v33 = u2.getPlayer(p25.offlinePlayer)
            if v33 then
                v32 = u12.getGamePlayer(v33):getDisplayName()
            else
                v32 = p25.offlinePlayer.displayName
            end
        else
            v32 = ""
        end
        v27 = {
            ["Name"] = v32,
            ["offlinePlayer"] = p25.offlinePlayer,
            ["teamColor"] = p25.teamColor
        }
        local v34
        if p26 then
            v34 = nil
        else
            v34 = p25.stat
        end
        v27.stat = v34
    end
    p23:displayVersusHud(v28, v27)
end
function u15.displayVersusHud(p35, p36, p37) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
        [3] = u7
    --]]
    if p35.tree then
        u6.update(p35.tree, u6.createElement(u14, {
            ["TeamA"] = p36,
            ["TeamB"] = p37
        }))
    else
        p35.tree = u6.mount(u6.createElement(u14, {
            ["TeamA"] = p36,
            ["TeamB"] = p37
        }), u7.LocalPlayer:WaitForChild("PlayerGui"))
    end
end
v4.CreateController(u15.new())
return nil