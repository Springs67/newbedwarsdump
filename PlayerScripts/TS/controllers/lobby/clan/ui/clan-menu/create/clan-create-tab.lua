-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local ClanCreateForm = RuntimeLib.import(script, script.Parent, "clan-create-form").ClanCreateForm;
local ClanCreatePurchase = RuntimeLib.import(script, script.Parent, "clan-create-purchase").ClanCreatePurchase;

return {
    ClanCreateTab = v3.new(u2)(function(p4, p5) -- Line: 12
        -- upvalues: DeviceUtil (copy), ClanUtil (copy), Players (copy), u2 (copy), Empty (copy), ClanCreateForm (copy), ClanCreatePurchase (copy)
        local _ = p5.useState;
        local v6 = DeviceUtil.isHoarceKat() and true or (p4.store.Clans.hasClanPass or ClanUtil.hasClanPass(Players.LocalPlayer));
        local createFragment = u2.createFragment;
        local v7 = {};
        local createElement = u2.createElement;
        local v8 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v9 = {};
        local v10;

        if v6 then
            v10 = u2.createElement(ClanCreateForm);
        else
            v10 = u2.createElement(ClanCreatePurchase);
        end;

        v9[1] = v10;
        v7.ClanCreateTab = createElement(Empty, v8, v9);

        return createFragment(v7);
    end)
};