-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local MapSettingsModal = RuntimeLib.import(script, script.Parent, "map-settings-modal").MapSettingsModal;

return function(p3) -- Line: 9
    -- upvalues: u2 (copy), GameReducer (copy), u1 (copy), StoreProvider (copy), MapSettingsModal (copy), QueueType (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer
    }), {});
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(MapSettingsModal, {
            AppId = "MapSettingsModal",
            MapSaveDisplayInfo = {
                code = "1234ACBD5678",
                name = "hello",
                creator = 214,
                copylock = true,
                published = false,
                queueType = QueueType.BEDWARS_20v20,
                dateCreated = os.time(),
                lastUpdated = os.time()
            }
        }) }), p3);

    return function() -- Line: 30
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;