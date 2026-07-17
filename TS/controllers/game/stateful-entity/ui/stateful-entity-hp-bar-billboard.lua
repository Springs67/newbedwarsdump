-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local StatefulEntityHpBar = RuntimeLib.import(script, script.Parent, "stateful-entity-hp-bar").StatefulEntityHpBar;
local v10 = v2.new(u1)(function(p4, p5) -- Line: 7
    -- upvalues: u1 (copy), StatefulEntityHpBar (copy)
    local _ = p5.useState;
    local maxDistance = p4.maxDistance;
    local v6 = (maxDistance == 0 or (maxDistance ~= maxDistance or not maxDistance)) and 35 or p4.maxDistance;
    local createFragment = u1.createFragment;
    local v7 = {};
    local createElement = u1.createElement;
    local v8 = {
        AlwaysOnTop = true
    };
    local v9;

    if p4.adornee then
        v9 = p4.adornee;
    elseif p4.gameEntity:IsA("Model") then
        v9 = p4.gameEntity.PrimaryPart;
    else
        v9 = p4.gameEntity;
    end;

    v8.Adornee = v9;
    v8.StudsOffset = p4.hpBarOffset;
    v8.Size = p4.size or UDim2.fromScale(5, 0.35);
    v8.MaxDistance = v6;
    v8.DistanceLowerLimit = v6;
    v8.DistanceUpperLimit = v6;
    v7.StatefulEntityHpBar = createElement("BillboardGui", v8, { u1.createElement(StatefulEntityHpBar, {
            AppId = "StatefulEntityHpBar_" .. p4.gameEntity.Name,
            gameEntity = p4.gameEntity,
            serverInstance = p4.serverInstance,
            barColor = p4.barColor
        }) });

    return createFragment(v7);
end);

return {
    StatefulEntityHpBarBillboard = v3.connect(function(p11, p12) -- Line: 31
        local v13 = {};

        for i, v in p12 do
            v13[i] = v;
        end;

        return v13;
    end)(v10)
};