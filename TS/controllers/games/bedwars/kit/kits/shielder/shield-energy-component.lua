-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ProgressBar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local InfernalShieldBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "infernal-shield-balance").InfernalShieldBalance;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ShieldEnergyComponent = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy), u1 (copy), u2 (copy), ProgressBar (copy), Theme (copy), InfernalShieldBalance (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(0);
        local Character = u4.player.Character;
        local v8 = Color3.fromRGB(8, 184, 74);

        if Character then
            local shielder = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)].shielder;

            if shielder ~= nil then
                shielder = shielder.effectColor;
            end;

            v8 = shielder or v8;
        end;

        useEffect(function() -- Line: 29
            -- upvalues: u1 (ref), u4 (copy), u7 (copy)
            local u9 = u1.new();
            local v10 = u4.player:GetAttribute("InfernalShieldEnergy");
            u7(v10 == nil and 0 or v10);
            u9:GiveTask(u4.player:GetAttributeChangedSignal("InfernalShieldEnergy"):Connect(function() -- Line: 36
                -- upvalues: u4 (ref), u7 (ref)
                local v11 = u4.player:GetAttribute("InfernalShieldEnergy");
                u7(v11 == nil and 0 or v11);
            end));

            return function() -- Line: 43
                -- upvalues: u9 (copy)
                u9:DoCleaning();
            end;
        end, {});

        return u2.createElement(ProgressBar, {
            AcceptZero = true,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = v6 / InfernalShieldBalance.SHIELD_MAX_ENERGY,
            BarGradient = ColorSequence.new(v8, v8),
            Title = {
                text = "Shield Energy"
            }
        });
    end)
};