-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local EmptyButton = v1.EmptyButton;
local RandomUtil = v1.RandomUtil;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local InventoryHeader = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader;
local InventoryTile = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "inventory-tile").InventoryTile;
local v4 = u2.Component:extend("InventoryAppBase");

function v4.init(p5) -- Line: 31
end;

function v4.render(p6) -- Line: 33
    -- upvalues: u2 (copy), Empty (copy), InventoryTile (copy), RuntimeLib (copy), getItemMeta (copy), ClientStore (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), DarkBackground (copy), DeviceUtil (copy), InventoryHeader (copy), ColorUtil (copy), EmptyButton (copy), Workspace (copy), PlaceUtil (copy), KnitClient (copy), BedwarsImageId (copy), Flamework (copy), BedwarsAppIds (copy), TooltipContainer (copy), AutoSizedText (copy), SlideIn (copy)
    local v7 = false;
    local v8 = 0;
    local v9 = {};
    local v10 = {};

    while true do
        if true then
            if v7 then
                v8 = v8 + 1;
            else
                v7 = true;
            end;
        end;

        if v8 >= 32 then
            table.sort(v9, function(p11, p12) -- Line: 77
                return p11.addedToBackpackTime < p12.addedToBackpackTime;
            end);
            local v13 = false;
            local v14 = 0;

            while true do
                if v13 then
                    v14 = v14 + 1;
                else
                    v13 = true;
                end;

                if v14 >= 24 then
                    break;
                end;

                local u15;

                if v14 < #v9 then
                    u15 = v9[v14 + 1];
                else
                    u15 = nil;
                end;

                local v20 = u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1),
                    LayoutOrder = v14
                }, { u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.025),
                        PaddingBottom = UDim.new(0.025),
                        PaddingLeft = UDim.new(0.025),
                        PaddingRight = UDim.new(0.025)
                    }), u2.createElement(InventoryTile, {
                        InvItem = u15,
                        AutoSelect = v14 == 0,
                        LayoutOrder = v14,
                        OnClick = RuntimeLib.async(function() -- Line: 112
                            -- upvalues: u15 (ref), getItemMeta (ref), ClientStore (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
                            if not u15 then
                                return;
                            end;

                            local v16 = getItemMeta(u15.itemType);

                            if v16.armor and ClientStore:getState().Inventory.observedInventory.inventory.armor[v16.armor.slot + 1] == "empty" then
                                ClientStore:dispatch({
                                    type = "InventorySetArmorItem",
                                    item = u15,
                                    armorSlot = v16.armor.slot
                                });
                                SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_EQUIP));
                            end;

                            if v16.backpack and ClientStore:getState().Inventory.observedInventory.inventory.backpack == nil then
                                ClientStore:dispatch({
                                    type = "InventorySetBackpack",
                                    item = u15
                                });
                                SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_EQUIP));
                            end;

                            local function _(p17) -- Line: 135
                                return p17.item == nil;
                            end;

                            local v18 = -1;

                            for i, v in ClientStore:getState().Inventory.observedInventory.hotbar do
                                local _ = i - 1;

                                if v.item == nil == true then
                                    v18 = i - 1;
                                    break;
                                end;
                            end;

                            if v18 > -1 and not (v16.backpack or v16.armor) then
                                ClientStore:dispatch({
                                    type = "InventoryAddToHotbar",
                                    slot = v18,
                                    item = u15
                                });
                            end;

                            return true;
                        end),

                        SendToHotbarSlot = function(p19) -- Line: 159, Name: SendToHotbarSlot
                            -- upvalues: u15 (ref), ClientStore (ref)
                            if u15 then
                                ClientStore:dispatch({
                                    type = "InventoryAddToHotbar",
                                    slot = p19,
                                    item = u15
                                });
                            end;
                        end
                    }) });
                table.insert(v10, v20);
            end;

            local u21 = 0;
            local v22 = false;
            local v23 = {};

            while true do
                if v22 then
                    u21 = u21 + 1;
                else
                    v22 = true;
                end;

                if u21 >= 3 then
                    local u24 = p6.props.Inventory.observedInventory.inventory.backpack or nil;
                    local v25 = u2.createElement(Empty, {
                        Size = UDim2.fromScale(1, 1)
                    }, { u2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0.025),
                            PaddingBottom = UDim.new(0.025),
                            PaddingLeft = UDim.new(0.025),
                            PaddingRight = UDim.new(0.025)
                        }), u2.createElement(InventoryTile, {
                            LayoutOrder = 0,
                            InvItem = u24,
                            OnClick = RuntimeLib.async(function() -- Line: 250
                                -- upvalues: u24 (ref), ClientStore (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
                                if u24 then
                                    ClientStore:dispatch({
                                        type = "InventorySetBackpack",
                                        item = nil
                                    });
                                    SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_UNEQUIP));

                                    return true;
                                end;
                            end),

                            SendToHotbarSlot = function() -- Line: 260, Name: SendToHotbarSlot
                                -- upvalues: u24 (ref), ClientStore (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
                                if u24 then
                                    ClientStore:dispatch({
                                        type = "InventorySetBackpack",
                                        item = nil
                                    });
                                    SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_UNEQUIP));
                                end;
                            end
                        }) });
                    local v26 = { u2.createElement(DarkBackground, {
                            Transparent = false,
                            AppId = p6.props.AppId
                        }) };
                    local v27 = {};
                    local v28 = {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.45 or 0.5, DeviceUtil.isSmallScreen() and 0.5 or 0.38),
                        Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.68 or 0.72),
                        AnchorPoint = Vector2.new(0.5, 1)
                    };
                    local v29 = { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1.5
                        }), u2.createElement(
                            "UIListLayout",
                            {
                                FillDirection = "Horizontal",
                                HorizontalAlignment = "Center",
                                VerticalAlignment = "Center"
                            }
                        ) };
                    local v30 = #v29;
                    local v31 = {
                        Size = UDim2.fromScale(0.3333333333333333, 0.75)
                    };
                    local v32 = { u2.createElement("UIListLayout", {
                            FillDirection = "Vertical"
                        }), u2.createElement(InventoryHeader, {
                            Title = "Armor"
                        }), u2.createElement(Empty, {
                            Size = UDim2.fromScale(0, 0.01)
                        }) };
                    local v33 = {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 0.25,
                        Size = UDim2.fromScale(1, 1),
                        AnchorPoint = Vector2.new(1, 0),
                        BackgroundColor3 = ColorUtil.hexColor(1713718)
                    };
                    local v34 = { u2.createElement("UIListLayout", {
                            FillDirection = "Horizontal",
                            VerticalAlignment = "Center"
                        }), u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0.025, 0)
                        }), u2.createElement("Frame", {
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(0.5, 1)
                        }, { u2.createElement("UIGridLayout", {
                                FillDirection = "Vertical",
                                SortOrder = "LayoutOrder",
                                VerticalAlignment = "Center",
                                HorizontalAlignment = "Center",
                                CellSize = UDim2.fromScale(0.96, 0.32),
                                CellPadding = UDim2.fromScale(0, 0)
                            }), v25 }) };
                    local v35 = {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.5, 1)
                    };
                    local v36 = { u2.createElement("UIGridLayout", {
                            FillDirection = "Vertical",
                            SortOrder = "LayoutOrder",
                            VerticalAlignment = "Center",
                            HorizontalAlignment = "Center",
                            CellSize = UDim2.fromScale(0.96, 0.32),
                            CellPadding = UDim2.fromScale(0, 0)
                        }) };
                    local v37 = #v36;
                    local v38 = {
                        DisplayOrder = 1
                    };

                    for i, v in v23 do
                        v36[v37 + i] = v;
                    end;

                    v34[#v34 + 1] = u2.createElement("Frame", v35, v36);
                    v32[#v32 + 1] = u2.createElement(EmptyButton, v33, v34);
                    v29[v30 + 1] = u2.createElement(Empty, v31, v32);
                    v29[v30 + 2] = u2.createElement(Empty, {
                        Size = UDim2.fromScale(0.08, 0)
                    });
                    local v39 = {
                        Size = UDim2.fromScale(1, 1)
                    };
                    local v40 = { u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            HorizontalAlignment = "Right",
                            Padding = UDim.new(0, 6)
                        }) };
                    local v41 = #v40;
                    local v42 = {
                        Size = UDim2.new(1, 0, 0, 0.03 * Workspace.CurrentCamera.ViewportSize.Y)
                    };
                    local v43 = { u2.createElement(Empty, {
                            Size = UDim2.fromScale(1, 1)
                        }, { u2.createElement("TextLabel", {
                                Text = "Inventory",
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                TextXAlignment = "Left",
                                Size = UDim2.fromScale(1, 1),
                                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                                TextColor3 = Color3.fromRGB(255, 255, 255)
                            }) }) };
                    local v44 = {
                        Size = UDim2.fromScale(1, 1)
                    };
                    local v45 = { u2.createElement("UIListLayout", {
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            HorizontalAlignment = Enum.HorizontalAlignment.Right
                        }) };
                    local v46 = #v45;
                    local v47 = PlaceUtil.isGameServer() and KnitClient.Controllers.GamemodeController:isLocalPlayerInCreativeMode() and u2.createFragment({
                        OpenCreativeInventoryBtn = u2.createElement("ImageButton", {
                            Size = UDim2.fromScale(1.5, 1.5),
                            Image = BedwarsImageId.ELLIPSIS,
                            ScaleType = "Fit",
                            BackgroundColor3 = Color3.fromHex("6b6fbf"),
                            BorderSizePixel = 0,
                            Active = true,

                            [u2.Event.Activated] = function() -- Line: 422
                                -- upvalues: Flamework (ref), BedwarsAppIds (ref), KnitClient (ref)
                                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.INVENTORY);
                                KnitClient.Controllers.GamemodeController:toggleCreativeInventory();
                            end
                        }, { u2.createElement("UICorner", {
                                CornerRadius = UDim.new(0.1, 0)
                            }), u2.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1
                            }), u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                                    Text = "Open Creative Inventory",
                                    TextSize = 16,
                                    Font = Enum.Font.SourceSansBold,
                                    Limits = Vector2.new(300, 60)
                                }), u2.createElement(AutoSizedText, {
                                    Text = "[C] Hotkey",
                                    TextSize = 14,
                                    Font = Enum.Font.SourceSansSemibold,
                                    Limits = Vector2.new(300, 500)
                                }) }) })
                    });

                    if v47 then
                        v45[v46 + 1] = v47;
                    end;

                    v43[#v43 + 1] = u2.createElement(Empty, v44, v45);
                    v40[v41 + 1] = u2.createElement(Empty, v42, v43);
                    v40[v41 + 2] = u2.createElement(Empty, {
                        Size = UDim2.fromScale(0, 0.01)
                    });
                    local v48 = {
                        Size = UDim2.fromScale(1, 1)
                    };
                    local v49 = { u2.createElement("UIListLayout", {
                            FillDirection = "Horizontal"
                        }) };
                    local v50 = {
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(1, 1),
                        BackgroundColor3 = ColorUtil.hexColor(1713718)
                    };
                    local v51 = { u2.createElement("UIGridLayout", {
                            FillDirection = "Horizontal",
                            SortOrder = "LayoutOrder",
                            CellSize = UDim2.fromScale(0.16666666666666666, 0.25),
                            CellPadding = UDim2.fromScale(0, 0)
                        }) };
                    local v52 = #v51;

                    for i, v in v10 do
                        v51[v52 + i] = v;
                    end;

                    v49[#v49 + 1] = u2.createElement("Frame", v50, v51);
                    v40[v41 + 3] = u2.createElement(EmptyButton, v48, v49);
                    v29[v30 + 3] = u2.createElement(Empty, v39, v40);
                    v27[#v27 + 1] = u2.createElement("Frame", v28, v29);
                    v26[#v26 + 1] = u2.createElement(SlideIn, {}, v27);

                    return u2.createElement("ScreenGui", v38, v26);
                end;

                local v53 = nil;
                local u54;

                if u21 < #p6.props.Inventory.observedInventory.inventory.armor then
                    u54 = p6.props.Inventory.observedInventory.inventory.armor[u21 + 1];

                    if u54 == "empty" then
                        u54 = v53;
                    end;
                else
                    u54 = v53;
                end;

                local v55 = u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, { u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.025),
                        PaddingBottom = UDim.new(0.025),
                        PaddingLeft = UDim.new(0.025),
                        PaddingRight = UDim.new(0.025)
                    }), u2.createElement(InventoryTile, {
                        InvItem = u54,
                        LayoutOrder = u21,
                        OnClick = RuntimeLib.async(function() -- Line: 206
                            -- upvalues: u54 (ref), ClientStore (ref), u21 (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
                            if u54 then
                                ClientStore:dispatch({
                                    type = "InventorySetArmorItem",
                                    item = nil,
                                    armorSlot = u21
                                });
                                SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_UNEQUIP));

                                return true;
                            end;
                        end),

                        SendToHotbarSlot = function() -- Line: 217, Name: SendToHotbarSlot
                            -- upvalues: u54 (ref), ClientStore (ref), u21 (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
                            if u54 then
                                ClientStore:dispatch({
                                    type = "InventorySetArmorItem",
                                    item = nil,
                                    armorSlot = u21
                                });
                                SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_UNEQUIP));
                            end;
                        end
                    }) });
                table.insert(v23, v55);
                u21 = u21;
            end;
        end;

        local u56;

        if v8 < #p6.props.Inventory.observedInventory.inventory.items then
            u56 = p6.props.Inventory.observedInventory.inventory.items[v8 + 1];

            local function _(p57) -- Line: 52
                -- upvalues: u56 (ref)
                return p57.item == u56;
            end;

            local v58 = nil;

            for i, v in p6.props.Inventory.observedInventory.hotbar do
                local _ = i - 1;

                if v.item == u56 == true then
                    v58 = v;
                    break;
                end;
            end;

            if v58 then
                u56 = nil;
            end;
        else
            u56 = nil;
        end;

        if u56 then
            table.insert(v9, u56);
        end;
    end;
end;

return {
    InventoryApp = v3.connect(function(p59, p60) -- Line: 492
        local v61 = {
            Inventory = p59.Inventory
        };

        for i, v in p60 do
            v61[i] = v;
        end;

        return v61;
    end)(v4)
};