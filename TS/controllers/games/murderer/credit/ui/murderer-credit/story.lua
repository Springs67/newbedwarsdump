-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local MurdererCreditApp = RuntimeLib.import(script, script.Parent, "murderer-credit-app").MurdererCreditApp;

return function(p3) -- Line: 7
    -- upvalues: u2 (copy), u1 (copy), StoreProvider (copy), MurdererCreditApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({}), {});
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(MurdererCreditApp, {
            AppId = "MurdererCredit"
        }) }), p3);

    return function() -- Line: 16
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;