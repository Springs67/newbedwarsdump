-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsClass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass;
local getBedwarsClassMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local BedBreakEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local KillEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local WinEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-meta").WinEffectMeta;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local SectionTitle = RuntimeLib.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "section-title").SectionTitle;
local EquippedRow = RuntimeLib.import(script, script.Parent, "equipped-row").EquippedRow;

return {
    CurrentlyEquipped = v3.new(u2)(function(p4, p5) -- Line: 22
        -- upvalues: getBedwarsKitMeta (copy), BedwarsClass (copy), getBedwarsClassMeta (copy), KillEffectMeta (copy), BedBreakEffectMeta (copy), WinEffectMeta (copy), getItemSkinMeta (copy), u2 (copy), Padding (copy), SectionTitle (copy), EquippedRow (copy), BedwarsImageId (copy), KillEffectType (copy), BedBreakEffectType (copy), WinEffectType (copy), AutoCanvasScrollingFrame (copy), Empty (copy)
        local _ = p5.useState;
        local equipped = p4.ProfileData.equipped;
        local v6 = getBedwarsKitMeta(equipped.activeKit);
        local kitClass = v6.kitClass;

        if kitClass == nil then
            kitClass = BedwarsClass.MISC;
        end;

        local v7 = getBedwarsClassMeta(kitClass);
        local imageId = getBedwarsClassMeta(BedwarsClass.FIGHTER).imageId;
        local v8 = KillEffectMeta[equipped.selectedKillEffect];
        local v9 = BedBreakEffectMeta[equipped.selectedBedBreakEffect];
        local v10 = WinEffectMeta[equipped.selectedWinEffect];
        local v11;

        if equipped.bedSkin then
            v11 = getItemSkinMeta(equipped.bedSkin);
        else
            v11 = nil;
        end;

        local v12 = {
            Size = p4.Size or UDim2.fromScale(1, 1),
            LayoutOrder = p4.LayoutOrder
        };
        local v13 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u2.createElement(Padding, {
                Padding = {
                    Right = 10,
                    Left = 10,
                    Top = 10,
                    Bottom = 0
                }
            }), u2.createElement(SectionTitle, {
                title = "Equipped",
                SectionDivider = true
            }) };
        local v14 = {
            ScrollingFrameProps = {
                Size = UDim2.fromScale(1, 0.9)
            }
        };
        local v15 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }) };
        local _ = #v15;
        local v16 = {
            LayoutOrder = 3
        };
        local v17;

        if v6 == nil then
            v17 = v6;
        else
            v17 = v6.renderImage;
        end;

        v16.Image = v17;

        if kitClass ~= BedwarsClass.MISC then
            imageId = v7.imageId;
        end;

        v16.Icon = imageId;
        v16.Type = "Kit";

        if v6 ~= nil then
            v6 = v6.name;
        end;

        v16.Name = v6;
        v16.None = false;
        v15.KitRow = u2.createElement(EquippedRow, v16);
        local v18 = {
            LayoutOrder = 0
        };
        local v19;

        if v8 == nil then
            v19 = v8;
        else
            v19 = v8.image;
        end;

        v18.Image = v19 == nil and "" or v19;
        v18.Icon = BedwarsImageId.HUD_KILLS_ICON;
        v18.Type = "Kill Effect";

        if v8 ~= nil then
            v8 = v8.name;
        end;

        v18.Name = v8;
        v18.None = equipped.selectedKillEffect == KillEffectType.NONE;
        v15.KillEffectRow = u2.createElement(EquippedRow, v18);
        local v20 = {
            LayoutOrder = 2
        };
        local v21;

        if v9 == nil then
            v21 = v9;
        else
            v21 = v9.image;
        end;

        v20.Image = v21 == nil and "" or v21;
        v20.Icon = BedwarsImageId.HUD_BEDS_ICON;
        v20.Type = "Bed Break Effect";

        if v9 ~= nil then
            v9 = v9.name;
        end;

        v20.Name = v9;
        v20.None = equipped.selectedBedBreakEffect == BedBreakEffectType.NONE;
        v15.BedBreakEffectRow = u2.createElement(EquippedRow, v20);
        local v22 = {
            LayoutOrder = 3
        };
        local v23;

        if v10 == nil then
            v23 = v10;
        else
            v23 = v10.image;
        end;

        v22.Image = v23 == nil and "" or v23;
        v22.Icon = BedwarsImageId.TROPHY_SOLID;
        v22.Type = "Win Effect";

        if v10 ~= nil then
            v10 = v10.name;
        end;

        v22.Name = v10;
        v22.None = equipped.selectedWinEffect == WinEffectType.NONE;
        v15.WinEffectRow = u2.createElement(EquippedRow, v22);
        local v24 = {
            LayoutOrder = 4
        };
        local v25;

        if v11 == nil then
            v25 = v11;
        else
            v25 = v11.renderImage;
        end;

        v24.Image = v25 == nil and "" or v25;
        v24.Icon = BedwarsImageId.HUD_BEDS_ICON;
        v24.Type = "Bed Skin";
        local v26;

        if v11 == nil then
            v26 = v11;
        else
            v26 = v11.name;
        end;

        v24.Name = v26 == nil and "" or v26;
        v24.None = v11 == nil;
        v15.BedSkinRow = u2.createElement(EquippedRow, v24);
        v13[#v13 + 1] = u2.createElement(AutoCanvasScrollingFrame, v14, v15);

        return u2.createElement(Empty, v12, v13);
    end)
};