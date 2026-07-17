-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local HotbarApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "hotbar-app").HotbarApp;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ChickenUi = RuntimeLib.import(script, script.Parent, "chicken-ui").ChickenUi;

return function(p2) -- Line: 8
    -- upvalues: CreateRoduxApp (copy), HotbarApp (copy), u1 (copy), ChickenUi (copy), ItemType (copy)
    local u3 = CreateRoduxApp("hotbar", HotbarApp, {}, {}, {
        Parent = p2
    });
    local u4 = u1.mount(u1.createElement(ChickenUi, {
        chickenPrice = 5,
        currency = ItemType.EMERALD
    }), p2);

    return function() -- Line: 16
        -- upvalues: u1 (ref), u3 (copy), u4 (copy)
        u1.unmount(u3);
        u1.unmount(u4);
    end;
end;