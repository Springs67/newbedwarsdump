-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta");
local ClanUpgradeMeta = v5.ClanUpgradeMeta;
local ClanUpgradeTypeMeta = v5.ClanUpgradeTypeMeta;
local ClanUpgradeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type").ClanUpgradeType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ClanProfilePageLayout = RuntimeLib.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local PillCounter = RuntimeLib.import(script, script.Parent.Parent, "war-tab", "pill-counter").PillCounter;
local ClanProfileUpgradeCard = RuntimeLib.import(script, script.Parent, "clan-profile-upgrade-card").ClanProfileUpgradeCard;
local ClanProfileUpgradeDetails = RuntimeLib.import(script, script.Parent, "clan-profile-upgrade-details").ClanProfileUpgradeDetails;

return {
    ClanProfileUpgradesTab = v4.new(u3)(function(u6, p7) -- Line: 24
        -- upvalues: DeviceUtil (copy), ClanUtil (copy), ClanMemberRank (copy), ClanUpgradeTypeMeta (copy), ClanUpgradeMeta (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), u3 (copy), PillCounter (copy), BedwarsImageId (copy), Empty (copy), u2 (copy), ClanUpgradeType (copy), ClanProfileUpgradeCard (copy), AutoCanvasScrollingFrame (copy), ClanProfileUpgradeDetails (copy), ClanProfilePageLayout (copy)
        local useState = p7.useState;
        local v8, u9 = useState(false);
        local u10, u11 = useState(nil);
        local u12;

        if u6.store.Clans.myClanMember and not DeviceUtil.isHoarceKat() then
            u12 = ClanUtil.hasClanRank(u6.store.Clans.myClanMember, ClanMemberRank.ADMIN);
        else
            u12 = false;
        end;

        local function v16() -- Line: 32
            -- upvalues: u10 (copy), u12 (ref), ClanUpgradeTypeMeta (ref), ClanUpgradeMeta (ref), u9 (copy), KnitClient (ref), u6 (copy), SoundManager (ref), GameSound (ref), u11 (copy)
            if u10 and u12 then
                local v13 = ClanUpgradeTypeMeta[ClanUpgradeMeta[u10].type];

                if v13.disabled or v13.tempDisabled then
                    return nil;
                end;

                u9(true);
                local u14 = ClanUpgradeMeta[u10];
                KnitClient.Controllers.ClanController:upgrade(u14.type, u6.store.Clans.myClanId):andThen(function(p15) -- Line: 42
                    -- upvalues: u9 (ref), u14 (copy), SoundManager (ref), GameSound (ref), u11 (ref)
                    u9(false);

                    if p15 and u14.nextUpgrade then
                        SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
                        u11(u14.nextUpgrade);
                    end;
                end);
            end;
        end;

        local v17 = {
            Title = "AVAILABLE UPGRADES",
            PaddingBottom = true
        };
        local v18 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v19 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Right",
                Padding = UDim.new(0.05, 0)
            }), u3.createElement(PillCounter, {
                Tooltip = "Clan Coins",
                Icon = BedwarsImageId.COIN,
                Amount = u6.Clan.coins,
                FrameProps = {
                    LayoutOrder = 1,
                    Size = UDim2.new(0.42, 0, 1, 0)
                }
            }) };
        local v20 = {
            Icon = BedwarsImageId.CLAN_CRYSTAL
        };
        local clanWarCoins = u6.Clan.clanWarCoins;
        v20.Amount = clanWarCoins == nil and 0 or clanWarCoins;
        v20.Tooltip = "Clan War Crystals";
        v20.FrameProps = {
            LayoutOrder = 2,
            Size = UDim2.new(0.42, 0, 1, 0)
        };
        v19[#v19 + 1] = u3.createElement(PillCounter, v20);
        v17.RightTitleElement = u3.createElement(Empty, v18, v19);
        local v21 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v22 = u2.values(ClanUpgradeType);
        table.sort(v22);

        local function v26(p23) -- Line: 104
            -- upvalues: ClanUpgradeTypeMeta (ref), u6 (copy), ClanUpgradeMeta (ref), u3 (ref), ClanProfileUpgradeCard (ref), u10 (copy), u11 (copy)
            if ClanUpgradeTypeMeta[p23].disabled then
                return nil;
            end;

            local v24 = u6.store.Clans.myClan.upgrades[p23];
            local v25;

            if v24 then
                v25 = ClanUpgradeMeta[v24].nextUpgrade or v24;
            else
                v25 = ClanUpgradeTypeMeta[p23].firstUpgrade;
            end;

            return u3.createElement(ClanProfileUpgradeCard, {
                UpgradeType = p23,
                UpgradeTier = v25,
                SelectedUpgrade = u10,
                OnClick = u11,
                store = u6.store
            });
        end;

        local v27 = 0;
        local v28 = {};

        for i, v in v22 do
            local v29 = v26(v, i - 1, v22);

            if v29 ~= nil then
                v27 = v27 + 1;
                v28[v27] = v29;
            end;
        end;

        local v30 = {
            ScrollingFrameProps = {
                LayoutOrder = 1,
                Size = UDim2.new(0.35, 0, 1, 0)
            }
        };
        local v31 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Top",
                Padding = UDim.new(0, 6)
            }) };
        local v32 = #v31;

        for i, v in v28 do
            v31[v32 + i] = v;
        end;

        v21.UpgradesList = u3.createElement(AutoCanvasScrollingFrame, v30, v31);
        v21[#v21 + 1] = u3.createElement(ClanProfileUpgradeDetails, {
            SelectedUpgrade = u10,
            Clan = u6.Clan,
            OnUpgrade = v16,
            NoUpgradePermission = not u12,
            Loading = v8
        });

        return u3.createElement(ClanProfilePageLayout, v17, v21);
    end)
};