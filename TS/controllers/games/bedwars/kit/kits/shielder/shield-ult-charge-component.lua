-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local InfernalShieldBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "infernal-shield-balance").InfernalShieldBalance;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ShieldUltChargeComponent = v4.new(u3)(function(u5, p6) -- Line: 13
        -- upvalues: ColorUtil (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), u2 (copy), u3 (copy), ProgressBar (copy), Theme (copy), InfernalShieldBalance (copy)
        local useEffect = p6.useEffect;
        local v7, u8 = p6.useState(0);
        local Character = u5.player.Character;
        local v9 = ColorUtil.hexColor(12060447);

        if Character then
            local shielder = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)].shielder;

            if shielder ~= nil then
                shielder = shielder.effectColor;
            end;

            v9 = shielder or v9;
        end;

        useEffect(function() -- Line: 31
            -- upvalues: u2 (ref), u5 (copy), u8 (copy)
            local u10 = u2.new();
            local v11 = u5.player:GetAttribute("InfernalShieldUltCharge");
            u8(v11 == nil and 0 or v11);
            u10:GiveTask(u5.player:GetAttributeChangedSignal("InfernalShieldUltCharge"):Connect(function() -- Line: 38
                -- upvalues: u5 (ref), u8 (ref)
                local v12 = u5.player:GetAttribute("InfernalShieldUltCharge");
                u8(v12 == nil and 0 or v12);
            end));

            return function() -- Line: 45
                -- upvalues: u10 (copy)
                u10:DoCleaning();
            end;
        end, {});

        return u3.createElement(ProgressBar, {
            AcceptZero = true,
            Size = Theme.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            Progress = v7 / InfernalShieldBalance.SHIELD_ULT_CHARGE_REQ,
            BarGradient = ColorSequence.new(v9, v9),
            Title = {
                text = "Leap Charge"
            }
        });
    end)
};