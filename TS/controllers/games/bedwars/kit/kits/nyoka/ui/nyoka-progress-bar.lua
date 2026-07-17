-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    NyokaProgressApp = v3.new(u2)(function(u4, p5) -- Line: 8
        -- upvalues: u1 (copy), u2 (copy), ProgressBar (copy), Theme (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6 = u4.player:GetAttribute("MendingCanopyStaffMana");
        local v7, u8 = useState(v6 == nil and 0 or v6);
        useEffect(function() -- Line: 21
            -- upvalues: u1 (ref), u4 (copy), u8 (copy)
            local u9 = u1.new();
            u9:GiveTask(u4.player:GetAttributeChangedSignal("MendingCanopyStaffMana"):Connect(function() -- Line: 28
                -- upvalues: u4 (ref), u8 (ref)
                local v10 = u4.player:GetAttribute("MendingCanopyStaffMana");
                u8(v10 == nil and 100 or v10);
            end));

            return function() -- Line: 36
                -- upvalues: u9 (copy)
                u9:DoCleaning();
            end;
        end, {});

        return u2.createElement(ProgressBar, {
            AcceptZero = true,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = math.clamp(v7 / u4.maxProgress, 0, 1),
            BarGradient = ColorSequence.new(Color3.fromRGB(213, 127, 18), Color3.fromRGB(255, 243, 1))
        });
    end)
};