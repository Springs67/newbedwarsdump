local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "PregameVotingController"
    end,
    ["__index"] = u6
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p15)
    p15.Name = "PregameVotingController"
end
function u12.KnitStart(u16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u7
        [4] = u5
        [5] = u9
    --]]
    u6.KnitStart(u16)
    u10.Client:Get("PregameVotingStarted"):Connect(function(u17) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u16
        --]]
        u7:dispatch({
            ["type"] = "BedwarsSetPregameVoteState",
            ["voteState"] = u17.snapshot
        })
        u7:dispatch({
            ["type"] = "GameSetSome",
            ["data"] = {
                ["pregameVotingEnabled"] = true
            }
        })
        task.delay(2, function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u17
            --]]
            u16:tryMount(u17.voteEndTime)
        end)
    end)
    u10.Client:Get("PregameVoteSnapshotUpdate"):Connect(function(p18) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        u7:dispatch({
            ["type"] = "BedwarsSetPregameVoteState",
            ["voteState"] = p18.snapshot
        })
    end)
    u10.Client:Get("PregameVoteEnded"):Connect(function(p19) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        u7:dispatch({
            ["type"] = "SetPregameVoteWon",
            ["winningVotingOption"] = p19.pregameVotingSelection,
            ["winningVoterIndex"] = p19.winningVoterIndex
        })
    end)
    u5.MatchStateChange:connect(function(p20) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        local _ = p20.matchState == u9.PRE
    end)
end
function u12.voteForPregameOption(_, p21) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
        [3] = u10
    --]]
    u3:playSound(u11.UI_CLICK_2)
    u10.Client:Get("CastPregameVote"):SendToServer({
        ["votingOptionIndex"] = p21
    })
end
function u12.tryMount(_, p22) --[[ Line: 72 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u7
        [4] = u9
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u8.PREGAME_VOTING) then
        return nil
    end
    if u7:getState().Game.matchState ~= u9.PRE then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.PREGAME_VOTING, {
        ["VoteStartTime"] = os.time(),
        ["VoteEndTime"] = p22
    })
end
v4.CreateController(u12.new())
return nil