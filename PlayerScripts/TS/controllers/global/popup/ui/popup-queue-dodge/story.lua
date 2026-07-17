-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local Popup = RuntimeLib.import(script, script.Parent, "popup").Popup;

return function(p3) -- Line: 9
    -- upvalues: u2 (copy), GameReducer (copy), u1 (copy), StoreProvider (copy), Popup (copy), Workspace (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer
    }), {});
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(Popup, {
            AppId = "Popup",
            title = "PARTY IS RESTRICTED",
            message = "We understand that sometimes you may need to cancel a match, but quitting before the game begins can make the game less enjoyable for other players and disrupt the matchmaking process. If you keep leaving matches, the time you have to wait before playing again will get longer each time and you\'ll receive a deduction of rank points.\n\n<font transparency=\".6\" size=\"10\">69D0_DOD0_DOSA_S9D2AS</font>",
            countdown = {
                preText = "Penalty Timer: ",
                endTime = Workspace:GetServerTimeNow() + 600
            }
        }) }), p3);

    return function() -- Line: 28
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;