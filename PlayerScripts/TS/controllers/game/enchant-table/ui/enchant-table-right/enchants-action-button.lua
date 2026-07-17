-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local EnchantButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantButton;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;

return {
    EnchantActionButton = v3.new(u2)(function(p4, p5) -- Line: 14
        -- upvalues: EnchantButton (copy), Players (copy), StringUtil (copy), DeviceUtil (copy), InventoryUtil (copy), KnitClient (copy), ColorUtil (copy), u2 (copy), Button (copy)
        local _ = p5.useEffect;
        local v6 = EnchantButton;
        local v7 = Players.LocalPlayer:GetAttribute("EnchantPriceModifier");
        local v8 = math.floor(v6.price * (v7 == nil and 1 or v7));
        local v9 = "<b>" .. tostring(v8) .. " " .. StringUtil.capitalizeFirstLetter(v6.currency) .. (v8 > 1 and "s" or "") .. "</b>";
        local u10 = DeviceUtil.isHoarceKat() and true or InventoryUtil.hasEnough(Players.LocalPlayer, v6.currency, v8);

        if not u10 then
            v9 = "<b>Requires " .. tostring(v8) .. " " .. StringUtil.capitalizeFirstLetter(v6.currency) .. (v8 > 1 and "s" or "") .. "</b>";
        end;

        local function _() -- Line: 28
            -- upvalues: u10 (copy), KnitClient (ref)
            task.spawn(function() -- Line: 29
                -- upvalues: u10 (ref), KnitClient (ref)
                if not u10 then
                    return nil;
                end;

                KnitClient.Controllers.EnchantTableController:researchEnchant();
            end);
        end;

        local v11 = {
            hoverBrightness = 0.2,
            Selectable = true,
            LayoutOrder = 2,
            ZIndex = 10,
            GamepadShouldAutoSelect = true,
            Size = UDim2.fromScale(1, 1),
            Text = v9,
            TextLabel = {
                ZIndex = 11
            },

            OnClick = function() -- Line: 42, Name: OnClick
                -- upvalues: u10 (copy), KnitClient (ref)
                task.spawn(function() -- Line: 29
                    -- upvalues: u10 (ref), KnitClient (ref)
                    if not u10 then
                        return nil;
                    end;

                    KnitClient.Controllers.EnchantTableController:researchEnchant();
                end);
            end
        };
        local v12;

        if u10 then
            v12 = v6.buttonColor;
        else
            v12 = ColorUtil.darken(v6.buttonColor, 0.2);
        end;

        v11.BackgroundColor3 = v12;
        local v13 = {};
        local v14 = #v13;

        if u10 then
            u10 = u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.brighten(v6.buttonColor, 0.9)), ColorSequenceKeypoint.new(1, ColorUtil.darken(v6.buttonColor, 0.9)) })
            });
        end;

        if u10 then
            v13[v14 + 1] = u10;
        end;

        v13[#v13 + 1] = u2.createElement("UIStroke", {
            Thickness = 2,
            Color = ColorUtil.brighten(v6.buttonColor, 0.1)
        });

        return u2.createElement(Button, v11, v13);
    end)
};