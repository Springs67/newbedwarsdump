-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local getConsumableMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types");
local ConsumableCategory = v5.ConsumableCategory;
local ConsumableStatus = v5.ConsumableStatus;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local ConsumableBoost = RuntimeLib.import(script, script.Parent, "consumable-boost").ConsumableBoost;
local v15 = v3.new(u2)(function(p6, p7) -- Line: 14
    -- upvalues: u2 (copy), ConsumableBoost (copy), PlaceUtil (copy), Empty (copy)
    local _ = p7.useState;
    local v8 = {};
    local _ = #v8;
    local activeBoosts = p6.activeBoosts;

    local function _(p9) -- Line: 22
        -- upvalues: u2 (ref), ConsumableBoost (ref)
        return u2.createElement(ConsumableBoost, {
            Consumable = p9
        });
    end;

    local v10 = table.create(#activeBoosts);
    local v11 = {
        ResetOnSpawn = false
    };

    for i, v in activeBoosts do
        local _ = i - 1;
        v10[i] = u2.createElement(ConsumableBoost, {
            Consumable = v
        });
    end;

    local v12 = {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0.01, 0.99),
        Size = UDim2.fromScale(0.1, PlaceUtil.isGameServer() and 0.05 or 0.07)
    };
    local v13 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            Padding = UDim.new(0.05, 0)
        }) };
    local v14 = #v13;

    for i, v in v10 do
        v13[v14 + i] = v;
    end;

    v8.ConsumableBoostList = u2.createElement(Empty, v12, v13);

    return u2.createFragment({
        ConsumableBoostList = u2.createElement("ScreenGui", v11, v8)
    });
end);

return {
    ConsumableBoostList = v4.connect(function(p16, p17) -- Line: 54
        -- upvalues: u1 (copy), ConsumableStatus (copy), ConsumableCategory (copy), getConsumableMeta (copy)
        local v18 = u1.entries(p16.Consumable.record);

        local function v22(p19) -- Line: 56
            -- upvalues: ConsumableStatus (ref), ConsumableCategory (ref), getConsumableMeta (ref)
            local _ = p19[1];
            local v20 = p19[2];

            if v20.status ~= ConsumableStatus.ACTIVE then
                return nil;
            end;

            local v21 = { ConsumableCategory.BATTLE_PASS_XP, ConsumableCategory.ARMOR_TRIM_XP };
            local category = getConsumableMeta(v20.consumable).category;

            if table.find(v21, category) ~= nil then
                return v20;
            end;
        end;

        local v23 = 0;
        local v24 = {};

        for i, v in v18 do
            local v25 = v22(v, i - 1, v18);

            if v25 ~= nil then
                v23 = v23 + 1;
                v24[v23] = v25;
            end;
        end;

        local v26 = {};

        for i, v in p17 do
            v26[i] = v;
        end;

        v26.activeBoosts = v24;

        return v26;
    end)(v15)
};