-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    BackpackEnergyComponent = v4.new(u3)(function(u5, p6) -- Line: 10
        -- upvalues: u2 (copy), u3 (copy), ProgressBar (copy), Theme (copy), ColorUtil (copy)
        local useEffect = p6.useEffect;
        local _, u7 = p6.useState(0);
        local v8 = u5.backpack:GetAttribute("Energy");
        useEffect(function() -- Line: 19
            -- upvalues: u2 (ref), u5 (copy), u7 (copy)
            local u9 = u2.new();
            u9:GiveTask(u5.backpack:GetAttributeChangedSignal("Energy"):Connect(function() -- Line: 21
                -- upvalues: u7 (ref), u5 (ref)
                local v10 = u5.backpack:GetAttribute("Energy");
                u7(v10 == nil and 0 or v10);
            end));

            return function() -- Line: 29
                -- upvalues: u9 (copy)
                u9:DoCleaning();
            end;
        end, {});

        return u3.createElement(ProgressBar, {
            AcceptZero = true,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = (v8 == nil and 100 or v8) / 100,
            BarGradient = ColorSequence.new(ColorUtil.hexColor(12255224), ColorUtil.hexColor(16777215))
        });
    end)
};