-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local NecromancerStaffCore = RuntimeLib.import(script, script.Parent, "necromancer-staff-core").NecromancerStaffCore;
local v9 = v2.new(u1)(function(p4, p5) -- Line: 7
    -- upvalues: u1 (copy), NecromancerStaffCore (copy)
    local _ = p5.useState;
    local v6 = {};
    local v7 = {};
    local v8 = {
        ResetOnSpawn = false
    };

    for i, v in p4 do
        v7[i] = v;
    end;

    v6[#v6 + 1] = u1.createElement(NecromancerStaffCore, v7);

    return u1.createFragment({
        NecromancerStaffGUI = u1.createElement("ScreenGui", v8, v6)
    });
end);

return {
    NecromancerStaffUiBase = v3.connect(function(p10, p11) -- Line: 24
        local v12 = {};

        for i, v in p11 do
            v12[i] = v;
        end;

        v12.activeMode = p10.Kit.necromancerSummonType;

        return v12;
    end)(v9)
};