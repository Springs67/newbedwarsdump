-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local GooseWorldIndicatorComponent = RuntimeLib.import(script, script.Parent, "goose-world-indicator-component").GooseWorldIndicatorComponent;
local v6 = v2.new(u1)(function(p4, p5) -- Line: 7
    -- upvalues: u1 (copy), GooseWorldIndicatorComponent (copy)
    local _ = p5.useState;

    return u1.createElement(GooseWorldIndicatorComponent, {
        despawnTime = p4.despawnTime,
        gooseHolderTeamId = p4.holderTeamId,
        billboardAdornee = p4.billboardAdornee
    });
end);

return {
    GooseIndicatorApp = v3.connect(function(p7, p8) -- Line: 16
        local v9 = {};
        local activeGoose = p7.Game.activeGoose;

        if activeGoose ~= nil then
            activeGoose = activeGoose.despawnTime;
        end;

        v9.despawnTime = activeGoose == nil and 0 or activeGoose;
        v9.holderTeamId = p7.Game.gooseOwnerTeam;

        for i, v in p8 do
            v9[i] = v;
        end;

        return v9;
    end)(v6)
};