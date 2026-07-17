-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local ReportTicketResult = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "report", "report").ReportTicketResult;
local OverwatchHud = RuntimeLib.import(script, script.Parent, "overwatch-hud").OverwatchHud;

return function(p3) -- Line: 11
    -- upvalues: u2 (copy), GameReducer (copy), BedwarsReducer (copy), QueueType (copy), u1 (copy), StoreProvider (copy), OverwatchHud (copy), ReportTicketResult (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Bedwars = BedwarsReducer
    }), {
        Game = {
            queueType = QueueType.BEDWARS_20v20
        },
        Bedwars = {
            kills = { 32 }
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(OverwatchHud, {
            AppId = "OverwatchHud",
            ReportTicket = {
                _id = "1",
                reports = 1,
                priorityReports = 1,
                reported = 1,
                resolution = ReportTicketResult.PENDING,
                lastReported = os.time(),
                firstReported = os.time() - 10
            }
        }) }), p3);

    return function() -- Line: 41
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;