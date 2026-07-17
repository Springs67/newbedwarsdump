-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CloudEnchantUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CloudEnergyComponent = v4.new(u3)(function(u5, p6) -- Line: 11
        -- upvalues: u2 (copy), u3 (copy), ProgressBar (copy), Theme (copy), CloudEnchantUtil (copy), ColorUtil (copy)
        local useEffect = p6.useEffect;
        local v7, u8 = p6.useState(0);
        useEffect(function() -- Line: 15
            -- upvalues: u2 (ref), u5 (copy), u8 (copy)
            local u9 = u2.new();
            u9:GiveTask(u5.character:GetAttributeChangedSignal("CloudEnergy"):Connect(function() -- Line: 17
                -- upvalues: u5 (ref), u8 (ref)
                local v10 = u5.character:GetAttribute("CloudEnergy");
                u8(v10 == nil and 0 or v10);
            end));

            return function() -- Line: 24
                -- upvalues: u9 (copy)
                u9:DoCleaning();
            end;
        end, {});

        return u3.createElement(ProgressBar, {
            AcceptZero = true,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = v7 / CloudEnchantUtil.CLOUD_MAX_ENERGY,
            BarGradient = ColorSequence.new(ColorUtil.hexColor(16773050), ColorUtil.hexColor(16777215))
        });
    end)
};