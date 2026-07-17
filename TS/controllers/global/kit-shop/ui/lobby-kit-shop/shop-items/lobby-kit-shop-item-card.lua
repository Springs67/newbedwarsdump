-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v5.TweenService;
local UserInputService = v5.UserInputService;
local Badge = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "badge").Badge;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getBattlePassMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata;
local ConsumableStatus = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableStatus;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsKitShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local getBedwarsClassMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;
local v6 = u4.Component:extend("KitShopItemCard");

function v6.init(p7) -- Line: 32
    -- upvalues: u3 (copy), u4 (copy)
    p7.hoverMaid = u3.new();
    p7.ref = u4.createRef();
    p7.maid = u3.new();
end;

function v6.didMount(p8) -- Line: 37
    -- upvalues: UserInputService (copy), SoundManager (copy), GameSound (copy), BedwarsKit (copy), DeviceUtil (copy), UIUtil (copy)
    local v9 = #UserInputService:GetConnectedGamepads() ~= 0 and p8.ref:getValue();

    if v9 then
        p8.maid:GiveTask(v9.SelectionGained:Connect(function() -- Line: 41
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
        end));

        if p8.props.Kit == BedwarsKit.NONE and not DeviceUtil.isHoarceKat() then
            UIUtil:selectGui(v9);
        end;
    end;
end;

function v6.willUnmount(p10) -- Line: 50
    p10.maid:DoCleaning();
end;

function v6.render(u11) -- Line: 53
    -- upvalues: getBedwarsKitMeta (copy), DeviceUtil (copy), BedwarsKit (copy), ClientStore (copy), KnitClient (copy), BedwarsKitShop (copy), u2 (copy), ConsumableStatus (copy), getBedwarsClassMeta (copy), u4 (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), TweenService (copy), BedwarsImageId (copy), Empty (copy), KitViewport (copy), Badge (copy), TooltipContainer (copy), AutoSizedText (copy), getBattlePassMetadata (copy)
    local v12 = getBedwarsKitMeta(u11.props.Kit);
    local u13 = u11.props.SelectionMode == "VIEW_ONLY";
    local v14 = v12.gamepassId ~= nil and true or v12.devProductId ~= nil;
    local v15;

    if u11.props.Kit then
        v15 = u11.props.store;

        if v15 ~= nil then
            v15 = v15.Bedwars.favoriteKits[u11.props.Kit] ~= nil;
        end;

        if v15 == nil then
            v15 = false;
        end;
    else
        v15 = false;
    end;

    local v16;

    if DeviceUtil.isHoarceKat() then
        v16 = u11.props.Kit == BedwarsKit.NONE and true or getBedwarsKitMeta(u11.props.Kit).freeKit;

        if not v16 then
            local ownedKits = ClientStore:getState().Bedwars.ownedKits;
            v16 = table.find(ownedKits, u11.props.Kit) ~= nil;
        end;
    else
        v16 = KnitClient.Controllers.UnlockController:isKitOwned(u11.props.Kit);
    end;

    local v17 = not (u11.props.store.Bedwars.kit or u11.props.Kit) and true or u11.props.store.Bedwars.kit == u11.props.Kit;
    local v18 = BedwarsKitShop.FreeKitRotation.kitAvailableThisWeek(u11.props.Kit, u11.props.store.Bedwars.freeKitLevel);
    local v19 = BedwarsKitShop.FreeKitRotation.getFreeKitLevelReq(u11.props.Kit);
    local limitedTime = v12.limitedTime;
    local unlockedInBattlePass = v12.unlockedInBattlePass;

    if unlockedInBattlePass == nil then
        unlockedInBattlePass = false;
    end;

    local myClan = u11.props.store.Clans.myClan;

    if myClan ~= nil then
        myClan = myClan.kitShop.unlocks[u11.props.Kit] ~= nil;
    end;

    if myClan == nil then
        myClan = false;
    end;

    local function _(p20) -- Line: 111
        -- upvalues: ConsumableStatus (ref), u11 (copy)
        local _ = p20[1];
        local v21 = p20[2];
        local v22 = v21.status == ConsumableStatus.ACTIVE;

        if v22 then
            local extraData = v21.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v22 = extraData == u11.props.Kit;
        end;

        return v22;
    end;

    local v23 = nil;

    for i, v in u2.entries(u11.props.store.Consumable.record) do
        local _ = i - 1;
        local _ = v[1];
        local v24 = v[2];
        local v25 = v24.status == ConsumableStatus.ACTIVE;

        if v25 then
            local extraData = v24.extraData;

            if extraData ~= nil then
                extraData = extraData.rentedKit;
            end;

            v25 = extraData == u11.props.Kit;
        end;

        if v25 == true then
            v23 = v;
            break;
        end;
    end;

    if v23 ~= nil then
        v23 = v23[2];
    end;

    local v26 = v23 ~= nil;
    local v27;

    if v12.kitClass == nil then
        v27 = nil;
    else
        v27 = getBedwarsClassMeta(v12.kitClass);
    end;

    local v28 = {
        [u4.Ref] = u11.ref,
        Size = UDim2.fromScale(1, 1)
    };
    local v29;

    if v16 and u11.props.SelectionMode == "OPEN_DETAILS" then
        v29 = Color3.fromRGB(255, 255, 255);
    else
        v29 = ColorUtil.BLACK;
    end;

    v28.BackgroundColor3 = v29;
    v28.BackgroundTransparency = u11.props.Selected and 0.25 or 0.5;
    v28.BorderSizePixel = v17 and 1 or 0;
    v28.BorderMode = "Outline";
    v28.BorderColor3 = ColorUtil.hexColor(16771973);
    v28.LayoutOrder = u11.props.LayoutOrder;
    v28.AutoButtonColor = false;
    v28.Selectable = true;

    v28[u4.Event.MouseButton1Click] = function() -- Line: 150
        -- upvalues: u13 (copy), SoundManager (ref), GameSound (ref), u11 (copy)
        if u13 then
            return nil;
        end;

        SoundManager:playSound(GameSound.UI_CLICK);
        u11.props.OnClick();
    end;

    v28[u4.Event.MouseButton2Click] = function() -- Line: 157
        -- upvalues: u13 (copy), SoundManager (ref), GameSound (ref), u11 (copy)
        if u13 then
            return nil;
        end;

        SoundManager:playSound(GameSound.UI_CLICK);
        local OnRightClick = u11.props.OnRightClick;

        if OnRightClick ~= nil then
            OnRightClick();
        end;
    end;

    v28[u4.Event.MouseEnter] = function(p30) -- Line: 167
        -- upvalues: u13 (copy), u11 (copy), TweenService (ref)
        if u13 then
            return nil;
        end;

        u11.hoverMaid:DoCleaning();

        if not u11.props.Selected then
            local u31 = TweenService:Create(p30, TweenInfo.new(0.12), {
                BackgroundTransparency = 0.25
            });
            u11.hoverMaid:GiveTask(function() -- Line: 176
                -- upvalues: u31 (copy)
                u31:Cancel();
            end);
            u31:Play();
        end;
    end;

    v28[u4.Event.MouseLeave] = function(p32) -- Line: 182
        -- upvalues: u13 (copy), u11 (copy), TweenService (ref)
        if u13 then
            return nil;
        end;

        u11.hoverMaid:DoCleaning();

        if not u11.props.Selected then
            local u33 = TweenService:Create(p32, TweenInfo.new(0.12), {
                BackgroundTransparency = u11.props.Selected and 0.25 or 0.5
            });
            u11.hoverMaid:GiveTask(function() -- Line: 191
                -- upvalues: u33 (copy)
                u33:Cancel();
            end);
            u33:Play();
        end;
    end;

    local v34 = {};
    local v35 = u4.createElement("UICorner", {
        CornerRadius = UDim.new(0.02, 0)
    });
    local createElement = u4.createElement;
    local v36 = {};
    local v37;

    if u11.props.Selected then
        v37 = Color3.fromRGB(255, 227, 66);
    else
        v37 = ColorUtil.WHITE;
    end;

    v36.Color = v37;
    v36.Thickness = u11.props.Selected and 2 or 1;
    v36.Transparency = u11.props.Selected and 0 or 0.5;
    v34[1], v34[2] = v35, createElement("UIStroke", v36);
    local v38 = #v34;
    local v39 = v15 and not u13 and u4.createElement("ImageLabel", {
        ImageTransparency = 0.8,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.9, 0.9),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Image = BedwarsImageId.STAR_ALT_SOLID
    });

    if v39 then
        v34[v38 + 1] = v39;
    end;

    local v40 = #v34;
    v34[v40 + 1] = u4.createElement(Empty, {
        Size = UDim2.fromScale(0.92, 0.92),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, { u4.createElement(KitViewport, {
            Kit = u11.props.Kit,
            ImageTransparency = u11.props.Banned and 0.6 or 0
        }) });
    local v41 = u11.props.Banned and u4.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.75, 0.75),
        Image = BedwarsImageId.BLOCK_ICON,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, { u4.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });

    if v41 then
        v34[v40 + 2] = v41;
    end;

    local v42 = #v34;
    local v43;

    if v18 then
        v43 = not u13;
    else
        v43 = v18;
    end;

    if v43 then
        local v44 = (v19 == nil and 0 or v19) > 0;

        if v44 then
            local v45 = {
                BackgroundTransparency = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.6),
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = ColorUtil.hexColor(2789761)
            };
            local v46 = { u4.createElement("UICorner", {
                    CornerRadius = UDim.new(6, 6)
                }) };
            local v47 = {
                Size = UDim2.fromScale(0.9, 0.9),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Text = (v19 == nil and 0 or v19) <= 0 and "" or "Lv. " .. tostring(v19),
                Font = "Roboto",
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Center,
                LayoutOrder = 2
            };
            v46[#v46 + 1] = u4.createElement("TextLabel", v47);
            v44 = u4.createElement("Frame", v45, v46);
        end;

        local v48 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 0.22),
            Image = BedwarsImageId.BANNER_HORIZONTAL,
            Position = UDim2.fromScale(0.5, -0.01),
            AnchorPoint = Vector2.new(0.5, 0),
            ImageColor3 = Color3.fromRGB(255, 255, 255)
        };
        local v49 = { u4.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.8421052631578947
            }), u4.createElement("TextLabel", {
                Text = "FREE THIS WEEK!",
                TextScaled = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                Size = UDim2.fromScale(0.75, 0.45),
                Position = UDim2.fromScale(0.5, 0.13),
                AnchorPoint = Vector2.new(0.5, 0),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }) };
        local v50 = #v49;

        if v44 then
            v49[v50 + 1] = v44;
        end;

        v43 = u4.createElement("ImageLabel", v48, v49);
    end;

    if v43 then
        v34[v42 + 1] = v43;
    end;

    local v51 = #v34;
    local v52 = limitedTime and not (u13 or v18) and u4.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0.22),
        Image = BedwarsImageId.BANNER_HORIZONTAL,
        Position = UDim2.fromScale(0.5, -0.01),
        AnchorPoint = Vector2.new(0.5, 0),
        ImageColor3 = Color3.fromRGB(252, 122, 122)
    }, { u4.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.8421052631578947
        }), u4.createElement("TextLabel", {
            Text = "LIMITED",
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            Size = UDim2.fromScale(0.75, 0.45),
            Position = UDim2.fromScale(0.5, 0.13),
            AnchorPoint = Vector2.new(0.5, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }) });

    if v52 then
        v34[v51 + 1] = v52;
    end;

    v34.KitTrainingIcons = u4.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.16),
        AnchorPoint = Vector2.new(-1, 0),
        Position = UDim2.fromScale(0.03, 0.03)
    }, { u4.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Center",
            Padding = UDim.new(0.05, 0)
        }) });
    local v53 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.16),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(0.97, 0.03)
    };
    local v54 = { u4.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Right",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.05, 0)
        }) };
    local v55 = #v54;
    local v56 = v12.featured and not u13 and u4.createElement(Badge, {
        Text = v12.featured.text,
        TextLabelProps = {
            LayoutOrder = 90
        },
        BackgroundColor = v12.featured.backgroundColor
    });

    if v56 then
        v54[v55 + 1] = v56;
    end;

    local v57 = #v54;

    if v26 then
        v26 = u4.createElement("TextLabel", {
            SizeConstraint = "RelativeYY",
            Text = "⏰",
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 97,
            Size = UDim2.fromScale(1, 1)
        }, { u4.createElement(TooltipContainer, {}, { u4.createElement(AutoSizedText, {
                    Text = "Unlocked with Rental Pass",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) }) });
    end;

    if v26 then
        v54[v57 + 1] = v26;
    end;

    local v58 = #v54;

    if myClan then
        myClan = u4.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            LayoutOrder = 98,
            Size = UDim2.fromScale(1, 1),
            Image = BedwarsImageId.CLAN
        }, { u4.createElement(TooltipContainer, {}, { u4.createElement(AutoSizedText, {
                    Text = "Unlocked by Clan",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) }) });
    end;

    if myClan then
        v54[v58 + 1] = myClan;
    end;

    local v59 = #v54;
    local v60 = not v16;

    if v60 then
        if v14 or v12.bedCoinProduct ~= nil then
            v60 = not u13 and u4.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                LayoutOrder = 100,
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.BED_COIN_ICON
            }, { u4.createElement(TooltipContainer, {}, { u4.createElement(AutoSizedText, {
                        Text = "Purchasable",
                        TextSize = 16,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }) }) });
        else
            v60 = false;
        end;
    end;

    if v60 then
        v54[v59 + 1] = v60;
    end;

    local v61 = #v54;
    local v62 = v12.battlepassSeason and u4.createElement("ImageLabel", {
        SizeConstraint = "RelativeYY",
        ScaleType = "Fit",
        BackgroundTransparency = 1,
        LayoutOrder = 99,
        Size = UDim2.fromScale(1, 1),
        Image = getBattlePassMetadata(v12.battlepassSeason).icon
    }, { u4.createElement(TooltipContainer, {}, { u4.createElement(AutoSizedText, {
                TextSize = 16,
                Text = "BP Season " .. string.gsub(v12.battlepassSeason, "season", ""),
                Font = Enum.Font.SourceSansBold,
                Limits = Vector2.new(300, 60)
            }) }) });

    if v62 then
        v54[v61 + 1] = v62;
    end;

    v34.KitCategoryIcons = u4.createElement("Frame", v53, v54);

    if v12 then
        local v63 = {
            BackgroundTransparency = 0.55,
            Size = UDim2.fromScale(1, 0.16),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v64 = { u4.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.035, 0)
            }), u4.createElement("UICorner", {
                CornerRadius = UDim.new(0.03, 0)
            }), u4.createElement(Empty, {
                LayoutOrder = 0
            }) };
        local v65 = #v64;

        if v27 then
            if v27.imageId == "" then
                v27 = false;
            else
                v27 = u4.createFragment({
                    KitClass = u4.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ScaleType = "Fit",
                        LayoutOrder = 1,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.12, 0.75),
                        Image = v27.imageId,
                        ImageTransparency = u11.props.Banned and 0.35 or 0
                    }, { u4.createElement(TooltipContainer, {}, { u4.createElement(AutoSizedText, {
                                TextSize = 16,
                                Text = v27.display,
                                Font = Enum.Font.SourceSansBold
                            }) }), u4.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) })
                });
            end;
        end;

        if v27 then
            v64[v65 + 1] = v27;
        end;

        v64[#v64 + 1] = u4.createElement("TextLabel", {
            TextScaled = true,
            TextXAlignment = "Left",
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            Text = v12.name,
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextTransparency = u11.props.Banned and 0.35 or 0
        });
        v12 = u4.createFragment({
            KitNameTag = u4.createElement("Frame", v63, v64)
        });
    end;

    v34[#v34 + 1] = v12;

    return u4.createElement("ImageButton", v28, v34);
end;

return {
    KitShopItemCard = v6
};