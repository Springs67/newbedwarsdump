local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.OfflinePlayerUtil
local u5 = v3.WatchCharacter
local u6 = v3.WatchPlayerCharacter
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u20 = v1.import(script, script.Parent, "ui", "placement-hud").PlacementHud
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "OneInTheChamberController"
    end,
    ["__index"] = u14
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u17
        [3] = u11
    --]]
    u14.constructor(p24, { u17.ONE_IN_THE_CHAMBER })
    p24.Name = "OneInTheChamberController"
    p24.playerModifierMaid = u11.new()
    p24.winningTeamsMaidMap = {}
end
function u21.KnitStart(p25) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p25)
end
function u21.onGameInit(u26) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u16
        [3] = u13
        [4] = u15
        [5] = u19
        [6] = u18
        [7] = u2
        [8] = u20
        [9] = u9
        [10] = u10
        [11] = u4
        [12] = u11
        [13] = u12
        [14] = u6
    --]]
    u5(function(p27, _) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        local v28 = u16:getEntity(p27)
        if v28 ~= nil then
            v28:hideNametag()
        end
    end)
    u13.MatchStateChange:connect(function(p29) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u19
            [3] = u18
            [4] = u2
            [5] = u20
        --]]
        local v30 = u15:getState().Game.queueType
        if p29.matchState == u19.RUNNING and v30 == u18.ONE_IN_THE_CHAMBER then
            local v31 = {
                ["appId"] = "PlacementHud",
                ["app"] = u20
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v31, {
                ["queueType"] = v30
            })
        end
    end)
    u13.TeamScoreChange:connect(function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
            [3] = u26
            [4] = u4
            [5] = u11
            [6] = u12
            [7] = u6
        --]]
        local v32 = u9.Controllers.TeamScoreController:getHighestTeamScore()
        if not v32 then
            return nil
        end
        local v33 = table.create(#v32)
        for v34, v35 in v32 do
            local _ = v34 - 1
            v33[v34] = v35.Name
        end
        for v36, v37 in u10.keys(u26.winningTeamsMaidMap) do
            local _ = v36 - 1
            if table.find(v33, v37) == nil then
                local v38 = u26.winningTeamsMaidMap[v37]
                if v38 ~= nil then
                    v38:DoCleaning()
                end
                u26.winningTeamsMaidMap[v37] = nil
            end
        end
        local function v52(p39) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u9
                [3] = u4
                [4] = u11
                [5] = u12
                [6] = u6
            --]]
            local u40 = p39.Name
            if u26.winningTeamsMaidMap[u40] ~= nil then
                return nil
            end
            local v41 = u9.Controllers.TeamController:getTeamById(u40)
            if v41 ~= nil then
                local v42 = v41.members
                local function v49(p43) --[[ Line: 109 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u11
                        [3] = u12
                        [4] = u6
                        [5] = u26
                        [6] = u40
                    --]]
                    local v44 = u4.getPlayer(p43)
                    if not v44 then
                        return nil
                    end
                    if v44:FindFirstChild("PlayerHighlight") then
                        return nil
                    end
                    local u45 = u11.new()
                    local function u47(p46) --[[ Line: 118 ]]
                        --[[
                        Upvalues:
                            [1] = u12
                            [2] = u45
                        --]]
                        u45:GiveTask((u12("Highlight", {
                            ["Name"] = "PlayerHighlight",
                            ["OutlineTransparency"] = 0.3,
                            ["Parent"] = p46,
                            ["OutlineColor"] = Color3.fromRGB(255, 0, 0),
                            ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
                        })))
                    end
                    if v44.Character then
                        u47(v44.Character)
                    end
                    u45:GiveTask(u6(v44, function(p48) --[[ Line: 131 ]]
                        --[[
                        Upvalues:
                            [1] = u47
                        --]]
                        u47(p48)
                    end))
                    u26.winningTeamsMaidMap[u40] = u45
                end
                for v50, v51 in v42 do
                    v49(v51, v50, v42)
                end
            end
        end
        for v53, v54 in v32 do
            v52(v54, v53 - 1, v32)
        end
    end)
end
v8.CreateController(u21.new())
return nil