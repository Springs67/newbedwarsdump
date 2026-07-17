-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local SquareCheckBoxTextButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "square-check-box-text-button").SquareCheckBoxTextButton;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta");
local BedwarsKitSkinMeta = v3.BedwarsKitSkinMeta;
local getSkinsForKit = v3.getSkinsForKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local KitDetailsItemListContainer = RuntimeLib.import(script, script.Parent.Parent, "kit-details-item-list-container").KitDetailsItemListContainer;
local KitDetailsInfoCardButtons = RuntimeLib.import(script, script.Parent, "kit-details-info-card-buttons", "kit-details-info-card-buttons").KitDetailsInfoCardButtons;
local KitDetailsKitInfoCard = RuntimeLib.import(script, script.Parent, "kit-details-kit-info-card").KitDetailsKitInfoCard;
local KitDetailsKitSkinCard = RuntimeLib.import(script, script.Parent, "kit-details-kit-skin-card").KitDetailsKitSkinCard;
local KitDetailsSkinVariantSelect = RuntimeLib.import(script, script.Parent, "kit-details-skin-variant-select").KitDetailsSkinVariantSelect;

return {
    KitDetailsLeftContainer = v2.new(u1)(function(u4, p5) -- Line: 18
        -- upvalues: getSkinsForKit (copy), BedwarsKitSkin (copy), BedwarsKitSkinMeta (copy), u1 (copy), KitDetailsKitInfoCard (copy), KitDetailsInfoCardButtons (copy), KitDetailsSkinVariantSelect (copy), SquareCheckBoxTextButton (copy), default (copy), ClientStore (copy), Empty (copy), KitDetailsItemListContainer (copy), KitDetailsKitSkinCard (copy)
        local _ = p5.useState;
        local v6;

        if u4.SelectedKit then
            v6 = getSkinsForKit(u4.SelectedKit);
        else
            v6 = nil;
        end;

        local v7 = { BedwarsKitSkin.DEFAULT };
        local v8 = v6 or {};
        table.move(v8, 1, #v8, #v7 + 1, v7);

        local function _(p9) -- Line: 28
            -- upvalues: BedwarsKitSkinMeta (ref)
            local variantOfSkin = BedwarsKitSkinMeta[p9].variantOfSkin;

            if variantOfSkin ~= nil then
                variantOfSkin = variantOfSkin.parentSkin;
            end;

            return not variantOfSkin and true or variantOfSkin == p9;
        end;

        local v10 = 0;
        local u11 = {};

        for i, v in v7 do
            local _ = i - 1;
            local variantOfSkin = BedwarsKitSkinMeta[v].variantOfSkin;

            if variantOfSkin ~= nil then
                variantOfSkin = variantOfSkin.parentSkin;
            end;

            if (not variantOfSkin and true or variantOfSkin == v) == true then
                v10 = v10 + 1;
                u11[v10] = v;
            end;
        end;

        local v12;

        if u4.SelectedKitSkin then
            v12 = BedwarsKitSkinMeta[u4.SelectedKitSkin];
        else
            v12 = nil;
        end;

        local v13 = {};

        for i, v in u4 do
            v13[i] = v;
        end;

        v13.SelectedKit = nil;
        v13.SelectedKitSkin = nil;
        v13.SetSelectedKitSkin = nil;
        v13.SelectedKitBundle = nil;
        v13.store = nil;
        local v14 = {};

        for i, v in v13 do
            v14[i] = v;
        end;

        local v15 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u1.createElement(KitDetailsKitInfoCard, {
                Size = UDim2.fromScale(1, 0.5),
                SelectedKit = u4.SelectedKit,
                SelectedKitSkin = u4.SelectedKitSkin,
                SelectedKitBundle = u4.SelectedKitBundle
            }) };
        local v16 = #v15;
        local v17 = u4.SelectedKit and u1.createElement(KitDetailsInfoCardButtons, {
            Size = UDim2.fromScale(1, 0.175),
            SelectedKit = u4.SelectedKit,
            store = u4.store
        });

        if v17 then
            v15[v16 + 1] = v17;
        end;

        local v18 = #v15;
        local v19;

        if u11 == nil then
            v19 = false;
        else
            v19 = u4.SelectedKit;
        end;

        if v19 then
            local v20 = {
                Size = UDim2.fromScale(1, 0.325)
            };
            local v21 = { u1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), u1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5)
                }) };
            local v22 = #v21;
            local SelectedKitSkin = u4.SelectedKitSkin;

            if SelectedKitSkin then
                if v12 ~= nil then
                    v12 = v12.variantOfSkin;
                end;

                if v12 then
                    v12 = u1.createElement(KitDetailsSkinVariantSelect, {
                        Size = UDim2.fromScale(0.5, 1),
                        SelectedKitSkin = u4.SelectedKitSkin,
                        SetSelectedSkin = u4.SetSelectedKitSkin,
                        store = u4.store
                    });
                end;
            else
                v12 = SelectedKitSkin;
            end;

            local v23 = {
                Size = UDim2.fromScale(1, 0.1)
            };
            local v26 = { u1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), u1.createElement(SquareCheckBoxTextButton, {
                    Selectable = true,
                    Size = UDim2.fromScale(0.5, 1),
                    Text = {
                        Text = "Use Kit Skin",
                        Bold = true,
                        TextXAlignment = Enum.TextXAlignment.Left
                    },
                    Checked = u4.store.Bedwars.useKitSkin,

                    OnChecked = function(p24) -- Line: 141, Name: OnChecked
                        -- upvalues: default (ref), ClientStore (ref)
                        default.Client:Get("BedwarsSetUseKitSkin"):CallServerAsync({
                            useKitSkin = p24
                        }):andThen(function() -- Line: 145
                        end):catch(function(p25) -- Line: 146
                            warn(p25);
                        end);
                        ClientStore:dispatch({
                            type = "SetUseKitSkin",
                            useKitSkin = p24
                        });
                    end,

                    UIListLayoutProps = {
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }
                }) };
            local v27 = #v26;

            if v12 then
                v26[v27 + 1] = v12;
            end;

            v21[v22 + 1] = u1.createElement(Empty, v23, v26);
            v21[v22 + 2] = u1.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.9)
            }, { u1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5)
                }), u1.createElement(KitDetailsItemListContainer, {
                    CellPadding = 10,
                    Size = UDim2.fromScale(1, 1),

                    CalculateCellSize = function(p28, p29) -- Line: 173, Name: CalculateCellSize
                        return UDim2.fromOffset(p28.X / 3.5 - 10, p28.Y - p29 - 10);
                    end,

                    CanvasOffset = function(p30, p31) -- Line: 176, Name: CanvasOffset
                        return Vector2.new(p30.X / 3.5 * 0.05, 0);
                    end,

                    SetItems = function(u32) -- Line: 179, Name: SetItems
                        -- upvalues: u11 (ref), u1 (ref), KitDetailsKitSkinCard (ref), u4 (copy)
                        local v33 = u11;

                        local function v35(p34) -- Line: 181
                            -- upvalues: u1 (ref), KitDetailsKitSkinCard (ref), u4 (ref), u32 (copy)
                            return u1.createElement(KitDetailsKitSkinCard, {
                                store = u4.store,
                                Size = u32,
                                Position = UDim2.fromScale(0.5, 0.5),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Kit = u4.SelectedKit,
                                Skin = p34,
                                SelectedKitSkin = u4.SelectedKitSkin,
                                SetSelectedKitSkin = u4.SetSelectedKitSkin
                            });
                        end;

                        local v36 = table.create(#v33);

                        for i, v in v33 do
                            v36[i] = v35(v, i - 1, v33);
                        end;

                        return v36;
                    end
                }) });
            v19 = u1.createElement(Empty, v20, v21);
        end;

        if v19 then
            v15[v18 + 1] = v19;
        end;

        return u1.createElement(Empty, v14, v15);
    end)
};