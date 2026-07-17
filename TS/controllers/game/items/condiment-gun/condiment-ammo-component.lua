-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CondimentGunConfigs = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "condiment-gun", "condiment-gun-config").CondimentGunConfigs;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CondimentAmmoComponent = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: CondimentGunConfigs (copy), u1 (copy), u2 (copy), ProgressBar (copy), Theme (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, u7 = useState(u4.item:GetAttribute("Ammo"));
        local v8, u9 = useState(CondimentGunConfigs.condiments[u4.item:GetAttribute("Mode")].color);
        useEffect(function() -- Line: 14
            -- upvalues: u1 (ref), u4 (copy), u7 (copy), CondimentGunConfigs (ref), u9 (copy)
            local u10 = u1.new();
            u10:GiveTask(u4.item:GetAttributeChangedSignal("Ammo"):Connect(function() -- Line: 16
                -- upvalues: u7 (ref), u4 (ref)
                u7(u4.item:GetAttribute("Ammo"));
            end));
            u10:GiveTask(u4.item:GetAttributeChangedSignal("Mode"):Connect(function() -- Line: 19
                -- upvalues: CondimentGunConfigs (ref), u4 (ref), u9 (ref)
                u9(CondimentGunConfigs.condiments[u4.item:GetAttribute("Mode")].color);
            end));

            return function() -- Line: 23
                -- upvalues: u10 (copy)
                u10:DoCleaning();
            end;
        end);

        return u2.createElement(ProgressBar, {
            AcceptZero = true,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = v6 / CondimentGunConfigs.ammo.max,
            BarGradient = ColorSequence.new(v8.dark, v8.light)
        });
    end)
};