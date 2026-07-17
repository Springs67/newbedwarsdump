-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ArmorTrimUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KitContractRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local KitDetailsArmorTrimButton = RuntimeLib.import(script, script.Parent, "buttons", "kit-details-armor-trim-button").KitDetailsArmorTrimButton;
local KitDetailsContractButton = RuntimeLib.import(script, script.Parent, "buttons", "kit-details-contract-button").KitDetailsContractButton;

return {
    KitDetailsInfoCardButtons = v3.new(u2)(function(u4, p5) -- Line: 20
        -- upvalues: DeviceUtil (copy), KnitClient (copy), BedwarsKit (copy), PlaceUtil (copy), ArmorTrimUtil (copy), getBedwarsKitMeta (copy), KitContractRewards (copy), u2 (copy), KitDetailsArmorTrimButton (copy), KitDetailsContractButton (copy), Empty (copy), Flamework (copy), BedwarsAppIds (copy), ColorUtil (copy), BedwarsImageId (copy)
        local _ = p5.useState;
        local _ = p5.useMemo;
        local _ = p5.useEffect;
        local v6;

        if u4.SelectedBundle then
            v6 = false;
        else
            if DeviceUtil.isHoarceKat() then
                v6 = true;
            else
                v6 = KnitClient.Controllers.UnlockController:isKitUnlocked(u4.SelectedKit or BedwarsKit.NONE) and PlaceUtil.isLobbyServer();
            end;

            if v6 then
                local v7 = table.find(ArmorTrimUtil.BLACK_LISTED_ARMOR_TRIM_KITS, u4.SelectedKit or BedwarsKit.NONE) ~= nil;
                v6 = not v7;
            end;
        end;

        local v8 = false;
        local v9 = false;

        if u4.SelectedKit ~= BedwarsKit.NONE then
            v8 = getBedwarsKitMeta(u4.SelectedKit).lore and true or v8;
            local v10 = KitContractRewards[u4.SelectedKit] ~= nil;

            if v10 then
                local v11 = KitContractRewards[u4.SelectedKit];

                if v11 ~= nil then
                    v11 = v11.disabled;
                end;

                v10 = not v11;
            end;

            if v10 then
                v9 = true;
            end;
        end;

        local v12 = {};

        for i, v in u4 do
            v12[i] = v;
        end;

        v12.SelectedKit = nil;
        v12.store = nil;
        local v13 = {};

        for i, v in v12 do
            v13[i] = v;
        end;

        local v14 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.075, 0)
            }) };
        local v15 = #v14;

        if v6 then
            v6 = u2.createElement(KitDetailsArmorTrimButton, {
                SelectedKit = u4.SelectedKit,
                store = u4.store,
                Size = UDim2.fromScale(0.325, 1)
            });
        end;

        if v6 then
            v14[v15 + 1] = v6;
        end;

        local v16 = #v14;

        if v9 then
            v9 = u2.createElement(KitDetailsContractButton, {
                SelectedKit = u4.SelectedKit,
                store = u4.store,
                Size = UDim2.fromScale(0.325, 1)
            });
        end;

        if v9 then
            v14[v16 + 1] = v9;
        end;

        local v17 = #v14;

        if v8 then
            v8 = u2.createElement(Empty, {
                Size = UDim2.fromScale(0.2, 1)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 3)
                }), u2.createElement("TextButton", {
                    Size = UDim2.fromScale(1, 0.5),
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45),
                    Text = "",

                    [u2.Event.Activated] = function() -- Line: 107
                        -- upvalues: Flamework (ref), BedwarsAppIds (ref), u4 (copy)
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.LORE, {
                            SelectedKit = u4.SelectedKit
                        });
                    end
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), u2.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UIGradient", {
                            Rotation = -90,
                            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0.9) })
                        }), u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 4)
                        }) }), u2.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.8, 0.8),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Image = BedwarsImageId.SCROLL_SOLID,
                        ScaleType = Enum.ScaleType.Fit
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }) }), u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 0.1)
                }) });
        end;

        if v8 then
            v14[v17 + 1] = v8;
        end;

        return u2.createElement(Empty, v13, v14);
    end)
};