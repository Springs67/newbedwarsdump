-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local VacuumConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vacuum", "vacuum-constants").VacuumConstants;

return {
    VacuumGUI = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: VacuumConstants (copy), Players (copy), u2 (copy), Empty (copy), ProgressBar (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, u7 = useState(p4.InitialGhostCount / VacuumConstants.MAX_GHOST_COUNT);
        local v8, u9 = useState(tostring(p4.InitialGhostCount) .. " / " .. tostring(VacuumConstants.MAX_GHOST_COUNT) .. " Ghosts");
        useEffect(function() -- Line: 15
            -- upvalues: Players (ref), u7 (copy), VacuumConstants (ref), u9 (copy)
            local u12 = Players.LocalPlayer:GetAttributeChangedSignal("Vacuum_GhostCount"):Connect(function() -- Line: 16
                -- upvalues: Players (ref), u7 (ref), VacuumConstants (ref), u9 (ref)
                local v10 = Players.LocalPlayer:GetAttribute("Vacuum_GhostCount");
                local v11 = v10 == nil and 0 or v10;
                u7(v11 / VacuumConstants.MAX_GHOST_COUNT);
                u9(tostring(v11) .. " / " .. tostring(VacuumConstants.MAX_GHOST_COUNT) .. " Ghosts");
            end);

            return function() -- Line: 25
                -- upvalues: u12 (copy)
                u12:Disconnect();
            end;
        end, {});

        return u2.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.05)
        }, { u2.createElement(ProgressBar, {
                LayoutOrder = 1,
                Flip = false,
                GradientRotation = 0,
                AcceptZero = true,
                Progress = v6,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BarGradient = ColorSequence.new(Color3.fromRGB(173, 207, 250), Color3.fromRGB(128, 235, 255)),
                Title = {
                    text = v8
                }
            }) });
    end)
};