-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local SettingsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "settings-reducer").SettingsReducer;
local makeStarterSettings = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-util").makeStarterSettings;
local SettingsApp = RuntimeLib.import(script, script.Parent, "settings-app").SettingsApp;

return function(p3) -- Line: 9
    -- upvalues: u2 (copy), SettingsReducer (copy), makeStarterSettings (copy), u1 (copy), StoreProvider (copy), SettingsApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Settings = SettingsReducer
    }), {
        Settings = makeStarterSettings()
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(SettingsApp, {
            AppId = "SettingsApp"
        }) }), p3);

    return function() -- Line: 22
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;