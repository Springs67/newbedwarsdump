-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local KeysReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "keys-reducer").KeysReducer;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local KeyType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-type").KeyType;
local MissingKeysModal = RuntimeLib.import(script, script.Parent, "missing-keys-modal").MissingKeysModal;

return function(p3) -- Line: 11
    -- upvalues: KeyType (copy), u2 (copy), GameReducer (copy), KeysReducer (copy), u1 (copy), StoreProvider (copy), MissingKeysModal (copy), QueueType (copy)
    local v4 = {
        [KeyType.HALLOWEEN_LTM] = {
            amount = 4,
            keyRegenStartTime = os.time() - 30
        }
    };
    local v5 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Keys = KeysReducer
    }), {
        Keys = {
            keysData = v4
        }
    });
    local u6 = u1.mount(u1.createElement(StoreProvider, {
        store = v5
    }, { u1.createElement(MissingKeysModal, {
            AppId = "",
            MissingKeys = {
                {
                    amount = 1,
                    keyType = KeyType.HALLOWEEN_LTM
                }
            },
            QueueType = QueueType.HALLOWEEN_EVENT
        }) }), p3);

    return function() -- Line: 39
        -- upvalues: u1 (ref), u6 (copy)
        return u1.unmount(u6);
    end;
end;