-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local ClanKitShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-kit-shop").ClanKitShop;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanProfileKitShopCard = RuntimeLib.import(script, script.Parent, "clan-profile-kit-shop-card").ClanProfileKitShopCard;
local CountdownComponent = RuntimeLib.import(script, script.Parent, "countdown-component").CountdownComponent;

return {
    ClanProfileKitShop = v3.new(u2)(function(u4, p5) -- Line: 17
        -- upvalues: KnitClient (copy), ClanUtil (copy), ClanKitShop (copy), u2 (copy), ColorUtil (copy), BedwarsImageId (copy), Theme (copy), Empty (copy), CountdownComponent (copy), DeviceUtil (copy), ClanMemberRank (copy), ClanProfileKitShopCard (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, u7 = useState(false);
        local v8, u9 = useState(0);
        local v10 = {};

        for i, v in u4 do
            v10[i] = v;
        end;

        v10.store = nil;
        v10.Clan = nil;

        local function u13(p11) -- Line: 29
            -- upvalues: u6 (copy), u7 (copy), KnitClient (ref)
            if u6 then
                return nil;
            end;

            u7(true);
            KnitClient.Controllers.ClanController:kitShopPurchase(p11):andThen(function(p12) -- Line: 35
                -- upvalues: u7 (ref)
                if p12 then
                    u7(false);
                end;
            end);
        end;

        useEffect(function() -- Line: 42
            -- upvalues: ClanUtil (ref), u9 (copy)
            u9((ClanUtil.resetTime:getNextWeeklyResetTime()));
        end, { u4.Clan.kitShop.id });
        local u14 = u4.Clan.level >= ClanKitShop.reqClanLevel;

        local function v15() -- Line: 47
            -- upvalues: u2 (ref), ColorUtil (ref), BedwarsImageId (ref), Theme (ref), ClanKitShop (ref)
            return u2.createFragment({
                ShopLockedOverlay = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0.4,
                    ZIndex = 100,
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.BLACK
                }, {
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }),
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        Padding = UDim.new(0.1, 0)
                    }),
                    u2.createElement("ImageLabel", {
                        SizeConstraint = "RelativeYY",
                        ScaleType = "Fit",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        ZIndex = 100,
                        Size = UDim2.fromScale(1, 0.15),
                        Image = BedwarsImageId.LOCK_SOLID
                    }),
                    u2.createElement("TextLabel", {
                        AutomaticSize = "Y",
                        SizeConstraint = "RelativeXX",
                        TextScaled = true,
                        RichText = true,
                        Font = "Roboto",
                        TextXAlignment = "Center",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        ZIndex = 100,
                        Size = UDim2.fromScale(1, 0),
                        Text = "<b>Unlocked when <font color=\"" .. ColorUtil.richTextColor(Theme.mcYellow) .. "\">(Clan Lv." .. tostring(ClanKitShop.reqClanLevel) .. ")</font> reached</b>",
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 18
                        }) })
                })
            });
        end;

        local v16 = {};

        for i, v in v10 do
            v16[i] = v;
        end;

        local v17 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                Padding = UDim.new(0.04, 0)
            }), u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 40)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0, 4)
                }), u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Text = "<b>Unlock kits for your clan to use. Purchased kits last for 1 week.</b>",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Center",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 0),
                    TextColor3 = ColorUtil.WHITE
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }), u2.createElement(CountdownComponent, {
                    PreText = "<font transparency=\"0.3\">New kits in: </font>",
                    EndTime = v8,
                    CountdownOptions = {
                        days = true,
                        hours = true,
                        seperator = " : "
                    }
                }) }) };
        local v18 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0.82)
        };
        local v19 = {};
        local v20 = #v19;
        local v21 = not u14 and u2.createElement(v15);

        if v21 then
            v19[v20 + 1] = v21;
        end;

        local _ = #v19;
        local kits = u4.Clan.kitShop.kits;

        local function v32(p22, p23) -- Line: 156
            -- upvalues: ClanKitShop (ref), u4 (copy), DeviceUtil (ref), ClanUtil (ref), ClanMemberRank (ref), u2 (ref), ClanProfileKitShopCard (ref), u14 (copy), u13 (copy), u6 (copy)
            local v24 = math;
            local v25 = 0;

            for _ in u4.Clan.members do
                v25 = v25 + 1;
            end;

            local v26 = ClanKitShop.getKitShopKitPrice(v25);
            local v27 = v24.ceil(v26);
            local v28 = u4.Clan.kitShop.unlocks[p22] ~= nil;
            local v29 = u4.Clan.coins < v27;
            local v30 = p23 + 1 > u4.Clan.kitShop.stock;
            local v31;

            if u4.store.Clans.myClanMember and not DeviceUtil.isHoarceKat() then
                v31 = ClanUtil.hasClanRank(u4.store.Clans.myClanMember, ClanMemberRank.ADMIN);
            else
                v31 = false;
            end;

            return u2.createElement(ClanProfileKitShopCard, {
                Kit = p22,
                Price = v27,
                Purchased = v28,
                CantBuy = not u14 or v29,
                Disabled = not (u14 and v31),
                OnPurchase = u13,
                Locked = v30,
                Loading = u6,
                Index = p23 + 1
            });
        end;

        local v33 = table.create(#kits);

        for i, v in kits do
            v33[i] = v32(v, i - 1, kits);
        end;

        local v34 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 1)
        };
        local v35 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Left",
                Padding = UDim.new(0.05, 0)
            }) };
        local v36 = #v35;

        for i, v in v33 do
            v35[v36 + i] = v;
        end;

        v19.KitShopCards = u2.createElement(Empty, v34, v35);
        v17[#v17 + 1] = u2.createElement(Empty, v18, v19);

        return u2.createFragment({
            ClanProfileKitShop = u2.createElement(Empty, v16, v17)
        });
    end)
};