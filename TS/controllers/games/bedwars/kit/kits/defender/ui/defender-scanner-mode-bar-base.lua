-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local DefenderScannerModeBarCore = RuntimeLib.import(script, script.Parent, "defender-scanner-mode-bar-core").DefenderScannerModeBarCore;
local v8 = v2.new(u1)(function(p4) -- Line: 7
    -- upvalues: u1 (copy), DefenderScannerModeBarCore (copy)
    local v5 = {};
    local v6 = {};
    local v7 = {
        ResetOnSpawn = false
    };

    for i, v in p4 do
        v6[i] = v;
    end;

    v5[#v5 + 1] = u1.createElement(DefenderScannerModeBarCore, v6);

    return u1.createFragment({
        DefenderScannerModeBarGUI = u1.createElement("ScreenGui", v7, v5)
    });
end);

return {
    DefenderScannerModeBarBase = v3.connect(function(p9, p10) -- Line: 23
        local v11 = {};

        for i, v in p10 do
            v11[i] = v;
        end;

        v11.activeMode = p9.Kit.defenderScannerMode;

        return v11;
    end)(v8)
};