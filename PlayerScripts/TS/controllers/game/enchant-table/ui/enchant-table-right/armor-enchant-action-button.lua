-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local StringUtil = v1.StringUtil;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ArmorEnchantButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").ArmorEnchantButton;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;

return {
    ArmorEnchantActionButton = v3.new(u2)(function(p4, p5) -- Line: 15
        -- upvalues: u2 (copy), ArmorEnchantButton (copy), DeviceUtil (copy), UIUtil (copy), StringUtil (copy), Players (copy), InventoryUtil (copy), KnitClient (copy), ColorUtil (copy), Button (copy)
        local useEffect = p5.useEffect;
        local u6 = u2.createRef();
        local v7 = ArmorEnchantButton;
        useEffect(function() -- Line: 19
            -- upvalues: DeviceUtil (ref), u6 (copy), UIUtil (ref)
            if DeviceUtil.isGamepadControls() then
                UIUtil:selectGui((u6:getValue()));
            end;
        end, {});

        local function v13(p8) -- Line: 25
            -- upvalues: StringUtil (ref)
            local v9 = string.split(p8, "_");
            local v10 = false;
            local v11 = 0;
            local v12 = "";

            while true do
                if v10 then
                    v11 = v11 + 1;
                else
                    v10 = true;
                end;

                if v11 >= #v9 then
                    return v12;
                end;

                v12 = v12 .. StringUtil.capitalizeFirstLetter(v9[v11 + 1]);

                if v11 < #v9 - 1 then
                    v12 = v12 .. " ";
                end;
            end;
        end;

        local v14 = Players.LocalPlayer:GetAttribute("EnchantPriceModifier");
        local v15 = math.floor(v7.price * (v14 == nil and 1 or v14));
        local v16 = "<b>" .. tostring(v15) .. " " .. v13(v7.currency) .. (v15 > 1 and "s" or "") .. "</b>";
        local u17 = DeviceUtil.isHoarceKat() and true or InventoryUtil.hasEnough(Players.LocalPlayer, v7.currency, v15);

        if not u17 then
            v16 = "<b>Requires " .. tostring(v15) .. " " .. v13(v7.currency) .. (v15 > 1 and "s" or "") .. "</b>";
        end;

        local u18;

        if DeviceUtil.isHoarceKat() then
            u18 = nil;
        else
            u18 = KnitClient.Controllers.ArmorAugmentManagerController:getCannotPurchaseArmorEnchantReason(Players.LocalPlayer);
        end;

        if u18 ~= "" then
            v16 = u18 or v16;
        end;

        local function _() -- Line: 63
            -- upvalues: u17 (copy), u18 (copy), KnitClient (ref)
            task.spawn(function() -- Line: 64
                -- upvalues: u17 (ref), u18 (ref), KnitClient (ref)
                if not u17 then
                    return nil;
                end;

                if u18 ~= "" and u18 then
                    return nil;
                end;

                KnitClient.Controllers.EnchantTableController:researchArmorEnchant();
            end);
        end;

        local v19 = {
            [u2.Ref] = u6,
            Size = UDim2.fromScale(1, 1),
            Text = v16,
            TextLabel = {
                ZIndex = 11
            },

            OnClick = function() -- Line: 81, Name: OnClick
                -- upvalues: u17 (copy), u18 (copy), KnitClient (ref)
                task.spawn(function() -- Line: 64
                    -- upvalues: u17 (ref), u18 (ref), KnitClient (ref)
                    if not u17 then
                        return nil;
                    end;

                    if u18 ~= "" and u18 then
                        return nil;
                    end;

                    KnitClient.Controllers.EnchantTableController:researchArmorEnchant();
                end);
            end
        };
        local v20;

        if u17 and (u18 == "" or not u18) then
            v20 = v7.buttonColor;
        else
            v20 = ColorUtil.darken(v7.buttonColor, 0.2);
        end;

        v19.BackgroundColor3 = v20;
        v19.hoverBrightness = 0.2;
        v19.Selectable = true;
        v19.LayoutOrder = 2;
        v19.ZIndex = 10;
        local v21 = {};
        local v22 = #v21;

        if u17 then
            if u18 == "" then
                u18 = false;
            end;

            u17 = not u18 and u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.brighten(v7.buttonColor, 0.9)), ColorSequenceKeypoint.new(1, ColorUtil.darken(v7.buttonColor, 0.9)) })
            });
        end;

        if u17 then
            v21[v22 + 1] = u17;
        end;

        v21[#v21 + 1] = u2.createElement("UIStroke", {
            Thickness = 2,
            Color = ColorUtil.brighten(v7.buttonColor, 0.1)
        });

        return u2.createElement(Button, v19, v21);
    end)
};