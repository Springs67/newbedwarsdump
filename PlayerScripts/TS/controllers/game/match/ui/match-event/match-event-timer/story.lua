-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchEventCountdown = RuntimeLib.import(script, script.Parent, "match-event-countdown").MatchEventCountdown;

return function(p3) -- Line: 10
    -- upvalues: u2 (copy), GameReducer (copy), u1 (copy), StoreProvider (copy), MatchEventCountdown (copy), BedwarsImageId (copy), ColorUtil (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer
    }), {});
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(MatchEventCountdown, {
            AppId = "MatchEventCountdown",
            id = "id",
            name = "Boss Spawn",
            textTransparency = 1,
            image = BedwarsImageId.THREE_TITANS_ICON,
            time = os.time() + 30,
            isOnTopHud = {
                shouldDisplay = false
            },
            textColor = ColorUtil.WHITE
        }) }), p3);

    return function() -- Line: 30
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;