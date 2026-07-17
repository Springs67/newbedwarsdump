-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ArmorTrimPlayerViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "armor-trim", "ui", "armor-trim-player-viewport").ArmorTrimPlayerViewport;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank");
local ArmorTrimEffectRank = v4.ArmorTrimEffectRank;
local ArmorTrimEffectRankMeta = v4.ArmorTrimEffectRankMeta;
local ArmorTrimType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType;
local ArmorTrimProgressUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "progress", "armor-trim-progress-util").ArmorTrimProgressUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local KitDetailsButton = RuntimeLib.import(script, script.Parent.Parent, "kit-details-button").KitDetailsButton;

return {
    KitDetailsArmorTrimButton = v3.new(u2)(function(u5, p6) -- Line: 17
        -- upvalues: ArmorTrimProgressUtil (copy), u1 (copy), ArmorTrimEffectRank (copy), ArmorTrimEffectRankMeta (copy), Flamework (copy), BedwarsAppIds (copy), BedwarsKit (copy), ArmorTrimType (copy), ColorUtil (copy), u2 (copy), ArmorTrimPlayerViewport (copy), KitDetailsButton (copy)
        local _ = p6.useState;
        local u7 = u5.store.ArmorTrim.selectedArmorTrimConfigs[u5.SelectedKit];
        local v8 = u5.store.ArmorTrim.allKitProgress[u5.SelectedKit];
        local v9;

        if v8 == nil then
            v9 = v8;
        else
            local function _(p10) -- Line: 23
                -- upvalues: u7 (copy)
                local v11 = u7;

                if v11 ~= nil then
                    v11 = v11.type;
                end;

                return p10.trim == v11;
            end;

            v9 = nil;

            for i, v in v8 do
                local _ = i - 1;
                local v12;

                if u7 == nil then
                    v12 = u7;
                else
                    v12 = u7.type;
                end;

                if v.trim == v12 == true then
                    v9 = v;
                    break;
                end;
            end;
        end;

        local u13 = u5.store.ArmorTrim.selectedArmorTrimConfigs[u5.SelectedKit];

        if v8 ~= nil then
            local function _(p14) -- Line: 46
                -- upvalues: u13 (copy)
                local v15 = u13;

                if v15 ~= nil then
                    v15 = v15.type;
                end;

                return p14.trim == v15;
            end;

            v8 = nil;

            for i, v in v8 do
                local _ = i - 1;
                local v16;

                if u13 == nil then
                    v16 = u13;
                else
                    v16 = u13.type;
                end;

                if v.trim == v16 == true then
                    v8 = v;
                    break;
                end;
            end;
        end;

        local v17;

        if v8 == nil then
            v17 = v8;
        else
            v17 = v8.xpEarned;
        end;

        local v18 = ArmorTrimProgressUtil.getTier(v17 == nil and 0 or v17);
        local v19 = u1.values(ArmorTrimEffectRank);
        table.sort(v19, function(p20, p21) -- Line: 77
            return p20 < p21;
        end);
        local v22 = v19[math.min(#v19 - 1, v18) + 1];
        local v23;

        if v22 == nil then
            v23 = ArmorTrimEffectRank.T1;
        else
            v23 = v22;
        end;

        local v24 = ArmorTrimEffectRankMeta[v23];
        local v25 = ArmorTrimProgressUtil.getXpAtTier(v18);
        local v26 = ArmorTrimProgressUtil.getXpAtTier(v18 + 1);
        local v27 = math.min(v26, ArmorTrimProgressUtil.getXpAtTier(ArmorTrimProgressUtil.getMaxTier())) - v25;
        local v28 = {};

        for i, v in u5 do
            v28[i] = v;
        end;

        v28.SelectedKit = nil;
        v28.store = nil;
        local v29 = {};

        for i, v in v28 do
            v29[i] = v;
        end;

        v29.Title = "ARMOR TRIM";
        v29.Subtitle = "VIEW";

        function v29.OnClick() -- Line: 104
            -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.ARMOR_TRIM_APP, {
                SelectedKit = u5.SelectedKit
            });
        end;

        local v30;

        if v8 == nil then
            v30 = v8;
        else
            v30 = v8.xpEarned;
        end;

        local v31;

        if v30 == 0 or (v30 ~= v30 or not v30) then
            v31 = nil;
        else
            v31 = (v8.xpEarned - v25) / v27;
        end;

        v29.Progress = v31;
        local v32 = {};
        local v33 = {
            ButtonMode = "NONE",
            BackgroundTransparency = 0,
            SelectedKit = BedwarsKit.NONE,
            Size = UDim2.fromScale(1, 0.7),
            Position = UDim2.fromScale(0, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(87, 87, 87)
        };
        local v34;

        if u13 == nil then
            v34 = u13;
        else
            v34 = u13.type;
        end;

        if v34 == nil then
            v34 = ArmorTrimType.TRIM_1;
        end;

        v33.ArmorTrimType = v34;
        v33.ArmorTrimEffectRank = v22;
        v33.Rotate = false;
        v33.ViewportProps = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v35 = {
            armorSet = "IRON"
        };
        local v36;

        if u13 == nil then
            v36 = u13;
        else
            v36 = u13.color;
        end;

        local v37;

        if v36 then
            v37 = Color3.new(u13.color.r, u13.color.g, u13.color.b);
        else
            v37 = ColorUtil.WHITE;
        end;

        v35.armorTrimColor = v37;
        v33.StartingSelection = v35;
        v32[#v32 + 1] = u2.createElement(ArmorTrimPlayerViewport, v33, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextStrokeTransparency = 0,
                TextTransparency = 0.25,
                ZIndex = 100,
                Size = UDim2.fromScale(1, 0.35),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 0.8),
                Text = v24.text,
                TextColor3 = ColorUtil.WHITE,
                TextStrokeColor3 = ColorUtil.BLACK,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center
            }) });

        return u2.createElement(KitDetailsButton, v29, v32);
    end)
};