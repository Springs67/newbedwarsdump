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
    SpiritBridgeProgressApp = v4.new(u3)(function(u5, p6) -- Line: 10
        -- upvalues: u2 (copy), u3 (copy), ProgressBar (copy), Theme (copy), ColorUtil (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7 = math;
        local v8 = u5.character:GetAttribute("CurrentBridgeLength");
        local v9, u10 = useState((v7.max(1, v8 == nil and 100 or v8)));
        local v11 = u5.character:GetAttribute("CurrentBridgeDistanceTraveled");
        local v12, u13 = useState(v11 == nil and 0 or v11);
        local v14 = u5.character:GetAttribute("CurrentSpiritArmorModifier");
        local v15, u16 = useState(v14 == nil and 0 or v14);
        useEffect(function() -- Line: 29
            -- upvalues: u2 (ref), u5 (copy), u13 (copy), u10 (copy), u16 (copy)
            local u17 = u2.new();
            u17:GiveTask(u5.character:GetAttributeChangedSignal("CurrentBridgeDistanceTraveled"):Connect(function() -- Line: 31
                -- upvalues: u5 (ref), u13 (ref)
                local v18 = u5.character:GetAttribute("CurrentBridgeDistanceTraveled");
                u13(v18 == nil and 0 or v18);
            end));
            u17:GiveTask(u5.character:GetAttributeChangedSignal("CurrentBridgeLength"):Connect(function() -- Line: 38
                -- upvalues: u5 (ref), u10 (ref)
                local v19 = u5.character:GetAttribute("CurrentBridgeLength");
                u10(v19 == nil and 100 or v19);
            end));
            u17:GiveTask(u5.character:GetAttributeChangedSignal("CurrentSpiritArmorModifier"):Connect(function() -- Line: 46
                -- upvalues: u5 (ref), u16 (ref)
                local v20 = u5.character:GetAttribute("CurrentSpiritArmorModifier");
                u16(v20 == nil and 0 or v20);
            end));

            return function() -- Line: 53
                -- upvalues: u17 (copy)
                u17:DoCleaning();
            end;
        end, {});

        return u3.createElement(ProgressBar, {
            AcceptZero = true,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = math.clamp(v12 / v9, 0, 1),
            BarGradient = ColorSequence.new(ColorUtil.hexColor(16773050), ColorUtil.hexColor(16777215)),
            Title = {
                text = "+" .. tostring(v15) .. " Armor",
                color = Theme.mcGold
            }
        });
    end)
};