-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local DropdownComponent = v1.DropdownComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;

return {
    KitDetailsSkinVariantSelect = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: BedwarsKitSkinMeta (copy), u2 (copy), DeviceUtil (copy), KnitClient (copy), ColorUtil (copy), BedwarsKit (copy), ClientStore (copy), u3 (copy), DropdownComponent (copy)
        local _ = p6.useState;
        local SelectedKitSkin = u5.SelectedKitSkin;
        local variantOfSkin = BedwarsKitSkinMeta[SelectedKitSkin].variantOfSkin;

        if variantOfSkin ~= nil then
            variantOfSkin = variantOfSkin.parentSkin;
        end;

        if variantOfSkin ~= nil then
            SelectedKitSkin = variantOfSkin;
        end;

        local function _(p7) -- Line: 27
            -- upvalues: SelectedKitSkin (copy)
            local _ = p7[1];
            local variantOfSkin2 = p7[2].variantOfSkin;

            if variantOfSkin2 ~= nil then
                variantOfSkin2 = variantOfSkin2.parentSkin;
            end;

            return variantOfSkin2 == SelectedKitSkin;
        end;

        local v8 = 0;
        local v9 = {};

        for i, v in u2.entries(BedwarsKitSkinMeta) do
            local _ = i - 1;
            local _ = v[1];
            local variantOfSkin2 = v[2].variantOfSkin;

            if variantOfSkin2 ~= nil then
                variantOfSkin2 = variantOfSkin2.parentSkin;
            end;

            if variantOfSkin2 == SelectedKitSkin == true then
                v8 = v8 + 1;
                v9[v8] = v;
            end;
        end;

        table.sort(v9, function(p10, p11) -- Line: 46
            local variantValue = p10[2].variantOfSkin.variantValue;
            local variantValue2 = p11[2].variantOfSkin.variantValue;

            return (variantValue == nil and 0 or variantValue) < (variantValue2 == nil and 0 or variantValue2);
        end);

        local function v16(p12) -- Line: 59
            -- upvalues: SelectedKitSkin (copy), DeviceUtil (ref), u5 (copy), KnitClient (ref)
            local v13 = p12[1];
            local v14 = p12[2];
            local variantOfSkin2 = v14.variantOfSkin;

            if variantOfSkin2 ~= nil then
                variantOfSkin2 = variantOfSkin2.parentSkin;
            end;

            if variantOfSkin2 == SelectedKitSkin then
                local v15;

                if DeviceUtil.isHoarceKat() then
                    v15 = table.find(u5.store.Bedwars.ownedKitSkins, v13) ~= nil;
                else
                    v15 = KnitClient.Controllers.UnlockController:isKitSkinUnlocked(v13);
                end;

                return {
                    text = v14.variantOfSkin.variantName,
                    icon = v14.variantOfSkin.variantIconColor,
                    value = v13,
                    locked = not v15
                };
            end;
        end;

        local v17 = 0;
        local v18 = {};

        for i, v in v9 do
            local v19 = v16(v, i - 1, v9);

            if v19 ~= nil then
                v17 = v17 + 1;
                v18[v17] = v19;
            end;
        end;

        local function _(p20) -- Line: 88
            -- upvalues: u5 (copy)
            return p20.value == u5.SelectedKitSkin;
        end;

        local v21 = nil;

        for i, v in v18 do
            local _ = i - 1;

            if v.value == u5.SelectedKitSkin == true then
                v21 = v;
                break;
            end;
        end;

        if not v21 then
            local function _(p22) -- Line: 102
                -- upvalues: SelectedKitSkin (copy)
                return p22.value == SelectedKitSkin;
            end;

            v21 = nil;

            for i, v in v18 do
                local _ = i - 1;

                if v.value == SelectedKitSkin == true then
                    v21 = v;
                    break;
                end;
            end;
        end;

        local v23 = {
            ButtonTransparency = 0.5,
            Size = u5.Size,
            ButtonColor = ColorUtil.BLACK,
            DefaultItem = v21
        };

        if v21 ~= nil then
            v21 = v21.text;
        end;

        v23.PlaceholderText = v21;
        v23.Items = v18;

        function v23.OnItemSelected(p24) -- Line: 128
            -- upvalues: u5 (copy), BedwarsKitSkinMeta (ref), BedwarsKit (ref), DeviceUtil (ref), KnitClient (ref), ClientStore (ref)
            u5.SetSelectedSkin(p24);
            local v25 = BedwarsKitSkinMeta[p24];

            if not v25.kit then
                return nil;
            end;

            local v26;

            if u5.store.Bedwars.equippedKitSkins then
                v26 = p24 == u5.store.Bedwars.equippedKitSkins[v25.kit or BedwarsKit.NONE];
            else
                v26 = false;
            end;

            local v27;

            if DeviceUtil.isHoarceKat() then
                v27 = table.find(u5.store.Bedwars.ownedKitSkins, p24) ~= nil;
            else
                v27 = KnitClient.Controllers.UnlockController:isKitSkinUnlocked(p24);
            end;

            if v27 and not v26 then
                if DeviceUtil.isHoarceKat() then
                    ClientStore:dispatch({
                        type = "EquipKitSkin",
                        kit = v25.kit,
                        kitSkin = p24
                    });

                    return;
                end;

                KnitClient.Controllers.KitSkinController:equipKitSkin(v25.kit, p24);
            end;
        end;

        v23.LayoutOrder = u5.LayoutOrder;

        return u3.createFragment({
            KitShopVariantSelectDropdownComponent = u3.createElement(DropdownComponent, v23, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                }), u3.createElement("UIStroke", {
                    Thickness = 1,
                    Color = ColorUtil.WHITE
                }) })
        });
    end)
};