-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AfkProfileUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-profile-utils").AfkProfileUtil;
local AfkShopApp = RuntimeLib.import(script, script.Parent, "afk-shop-app").AfkShopApp;

return function(p2) -- Line: 8
    -- upvalues: CreateRoduxApp (copy), AfkShopApp (copy), ClientStore (copy), AfkProfileUtil (copy), u1 (copy)
    local u3 = CreateRoduxApp("AfkShopApp", AfkShopApp, {}, {}, {
        Parent = p2
    });
    local v4 = {};
    local v5 = {
        type = "SetAfkDataAll"
    };

    for i, v in AfkProfileUtil.makeStarterAfkData() do
        v4[i] = v;
    end;

    v5.afkData = v4;
    ClientStore:dispatch(v5);

    return function() -- Line: 23
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;