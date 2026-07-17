-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local PregameVotingApp = RuntimeLib.import(script, script.Parent, "pregame-voting-app").PregameVotingApp;

return function(p3) -- Line: 8
    -- upvalues: u2 (copy), BedwarsReducer (copy), u1 (copy), StoreProvider (copy), PregameVotingApp (copy)
    local u4 = u2.Store.new(u2.combineReducers({
        Bedwars = BedwarsReducer
    }), {
        Bedwars = {
            pregameVote = {
                voteState = { {
                        pregameVotingOption = {
                            mapName = "to4_Halloween-Map-2025"
                        },
                        voterUserIds = { 4491239179, 4491239179, 4491239179 }
                    }, {
                        pregameVotingOption = {
                            mapName = "to4_Volatile"
                        },
                        voterUserIds = {}
                    }, {
                        pregameVotingOption = {
                            mapName = "to4_Skull-Island"
                        },
                        voterUserIds = { 4491239179, 4491239179 }
                    }, {
                        pregameVotingOption = {
                            mapName = "to4_Sanctum"
                        },
                        voterUserIds = { 4491239179 }
                    } }
            }
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = u4
    }, { u1.createElement(PregameVotingApp, {
            AppId = "PregameVotingApp",
            VoteStartTime = os.time(),
            VoteEndTime = os.time() + 5
        }) }), p3);
    task.delay(5, function() -- Line: 47
        -- upvalues: u4 (copy)
        u4:dispatch({
            type = "SetPregameVoteWon",
            winningVoterIndex = 0,
            winningVotingOption = {
                mapName = "to4_Sanctum"
            }
        });
    end);

    return function() -- Line: 56
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;