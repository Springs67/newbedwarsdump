-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local KeysReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "keys-reducer").KeysReducer;
local KeyType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-type").KeyType;
local LobbyPlayMenuApp = RuntimeLib.import(script, script.Parent, "lobby-play-menu-app").LobbyPlayMenuApp;

return function(p3) -- Line: 10
    -- upvalues: u2 (copy), GameReducer (copy), KeysReducer (copy), KeyType (copy), u1 (copy), StoreProvider (copy), LobbyPlayMenuApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Keys = KeysReducer
    }), {
        Keys = {
            keysData = {
                [KeyType.HALLOWEEN_LTM] = {
                    amount = 3,
                    keyRegenStartTime = os.time() + 10000
                }
            }
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(LobbyPlayMenuApp, {
            AppId = "LobbyQueueMenu"
        }) }), p3);

    return function() -- Line: 31
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;