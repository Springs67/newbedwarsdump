-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Countdown = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Countdown;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    BlockInvulnTimer = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: u1 (copy), Countdown (copy)
        local _ = p3.useState;

        return u1.createFragment({
            BlockInvuln = u1.createElement("BillboardGui", {
                StudsOffsetWorldSpace = Vector3.new(0, 3, 0),
                ResetOnSpawn = false,
                MaxDistance = 150,
                Adornee = p2.Adornee,
                Size = UDim2.fromScale(8, 2)
            }, { u1.createElement(Countdown, {
                    EndTime = p2.EndTime,
                    CountdownConfig = {
                        days = false,
                        hours = false,
                        minutes = false,
                        seconds = true
                    }
                }, { u1.createElement("UIStroke", {
                        Thickness = 2
                    }) }) })
        });
    end)
};