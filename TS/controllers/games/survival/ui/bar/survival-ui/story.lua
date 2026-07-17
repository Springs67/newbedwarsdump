-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local SurvivalUi = RuntimeLib.import(script, script.Parent, "survival-ui").SurvivalUi;

return function(p3) -- Line: 8
    -- upvalues: Workspace (copy), u1 (copy), SurvivalUi (copy), RunService (copy)
    local u4 = Workspace:GetServerTimeNow() + 30;
    local u5 = 100;
    local u6 = 0;
    local u7 = os.clock() + 12;
    local u8 = u1.mount(u1.createElement(SurvivalUi, {
        maxHealth = 100,
        waveCount = 10,
        state = 1,
        health = u5,
        endTime = u4
    }), p3);
    local u9 = RunService.Heartbeat:Connect(function() -- Line: 20
        -- upvalues: u6 (ref), u7 (copy), u5 (ref), u8 (ref), u1 (ref), SurvivalUi (ref), u4 (copy)
        if os.clock() - u6 > 0.2 and os.clock() < u7 then
            u6 = os.clock();
            u5 = u5 - 2;
            u8 = u1.update(u8, u1.createElement(SurvivalUi, {
                maxHealth = 100,
                waveCount = 10,
                state = 1,
                health = u5,
                endTime = u4
            }));
        end;
    end);

    return function() -- Line: 33
        -- upvalues: u9 (copy), u1 (ref), u8 (ref)
        u9:Disconnect();
        u1.unmount(u8);
    end;
end;