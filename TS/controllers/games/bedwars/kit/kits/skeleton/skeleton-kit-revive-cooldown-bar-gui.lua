-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v4.RunService;
local Workspace = v4.Workspace;

return {
    SkeletonKitReviveCooldownBarGUI = v3.new(u2)(function(u5, p6) -- Line: 12
        -- upvalues: RunService (copy), Workspace (copy), u2 (copy), Empty (copy), ProgressBar (copy)
        local useEffect = p6.useEffect;
        local v7, u8 = p6.useState(0);
        useEffect(function() -- Line: 16
            -- upvalues: RunService (ref), u8 (copy), Workspace (ref), u5 (copy)
            local u10 = RunService.Heartbeat:Connect(function() -- Line: 17
                -- upvalues: u8 (ref), Workspace (ref), u5 (ref)
                local v9 = (Workspace:GetServerTimeNow() - u5.StartServerTime) / (u5.EndServerTime - u5.StartServerTime);
                u8((math.clamp(v9, 0, 1)));
            end);

            return function() -- Line: 20
                -- upvalues: u10 (copy)
                u10:Disconnect();
            end;
        end);

        return u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.05)
        }, { u2.createElement(ProgressBar, {
                LayoutOrder = 1,
                Flip = true,
                GradientRotation = 0,
                Progress = v7,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BarGradient = ColorSequence.new(Color3.fromRGB(199, 166, 18), Color3.fromRGB(130, 128, 28)),
                Title = {
                    text = "Revive cooldown"
                }
            }) });
    end)
};