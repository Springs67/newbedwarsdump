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
    InvisibleCloakEnergyComponent = v4.new(u3)(function(u5, p6) -- Line: 10
        -- upvalues: ColorUtil (copy), u2 (copy), u3 (copy), ProgressBar (copy), Theme (copy)
        local useEffect = p6.useEffect;
        local _, u7 = p6.useState(0);
        local v8 = u5.backpack:GetAttribute("Energy");
        local v9 = v8 == nil and 100 or v8;
        local v10 = ColorSequence.new(ColorUtil.hexColor(12255224), ColorUtil.hexColor(16777215));

        if v9 < 20 then
            v10 = ColorSequence.new(ColorUtil.hexColor(12257822), ColorUtil.hexColor(12257822));
        end;

        useEffect(function() -- Line: 23
            -- upvalues: u2 (ref), u5 (copy), u7 (copy)
            local u11 = u2.new();
            u11:GiveTask(u5.backpack:GetAttributeChangedSignal("Energy"):Connect(function() -- Line: 25
                -- upvalues: u7 (ref), u5 (ref)
                local v12 = u5.backpack:GetAttribute("Energy");
                u7(v12 == nil and 0 or v12);
            end));

            return function() -- Line: 33
                -- upvalues: u11 (copy)
                u11:DoCleaning();
            end;
        end, {});

        return u3.createElement(ProgressBar, {
            AcceptZero = true,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = v9 / 100,
            BarGradient = v10
        });
    end)
};