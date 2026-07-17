-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;

return {
    PlayerVoteStroke = v3.new(u2)(function(p4, p5) -- Line: 7
        -- upvalues: u2 (copy), u1 (copy), TweenService (copy)
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        useEffect(function() -- Line: 10
            -- upvalues: u6 (copy), u1 (ref), TweenService (ref)
            local u7 = u6:getValue();

            if not u7 then
                return nil;
            end;

            local u8 = u1.new();
            local u9 = TweenService:Create(u7, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Transparency = 0.05
            });
            local u10 = TweenService:Create(u7, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Transparency = 0.75
            });
            u8:GiveTask(u9.Completed:Connect(function() -- Line: 22
                -- upvalues: u8 (copy), u10 (copy)
                u8:GiveTask(task.delay(0.5, function() -- Line: 23
                    -- upvalues: u10 (ref)
                    u10:Play();
                end));
            end));
            u8:GiveTask(function() -- Line: 27
                -- upvalues: u9 (copy)
                u9:Cancel();
                u9:Destroy();
            end);
            u8:GiveTask(u10.Completed:Connect(function() -- Line: 31
                -- upvalues: u8 (copy), u9 (copy)
                u8:GiveTask(task.delay(0.5, function() -- Line: 32
                    -- upvalues: u9 (ref)
                    u9:Play();
                end));
            end));
            u8:GiveTask(function() -- Line: 36
                -- upvalues: u10 (copy)
                u10:Cancel();
                u10:Destroy();
            end);
            u9:Play();

            return function() -- Line: 41
                -- upvalues: u8 (copy), u7 (copy)
                u8:Destroy();
                u7.Transparency = 0;
            end;
        end, { p4.Blink });

        return u2.createElement("UIStroke", {
            [u2.Ref] = u6,
            Thickness = 2,
            Color = p4.Color,
            Transparency = 0.3
        });
    end)
};