-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type");
local ClanUpgradeTier = v5.ClanUpgradeTier;
local ClanUpgradeType = v5.ClanUpgradeType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local CrateItemRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity;
local getCrateItemRarityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta;
local CrateStarTierColors = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-tier-types").CrateStarTierColors;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta");
local AltarUpgradeTier = v6.AltarUpgradeTier;
local CrateMeta = v6.CrateMeta;
local u7 = Color3.fromHex("16ADED");

return {
    CratePickerRarityProbabilities = v4.new(u3)(function(u8, p9) -- Line: 23
        -- upvalues: u3 (copy), AltarUpgradeTier (copy), u2 (copy), CrateItemRarity (copy), KnitClient (copy), ClientStore (copy), ClanUpgradeType (copy), ClanUpgradeTier (copy), CrateMeta (copy), getCrateItemRarityMeta (copy), CrateStarTierColors (copy), BedwarsImageId (copy), Empty (copy), StringUtil (copy), ColorUtil (copy), u7 (copy)
        local useState = p9.useState;
        local useEffect = p9.useEffect;

        if not u8.selectedCrate then
            return u3.createFragment();
        end;

        local u10, u11 = useState(AltarUpgradeTier.TIER_0);
        local u12 = u2.values(CrateItemRarity);
        useEffect(function() -- Line: 31
            -- upvalues: KnitClient (ref), ClientStore (ref), ClanUpgradeType (ref), ClanUpgradeTier (ref), AltarUpgradeTier (ref), u11 (copy)
            if not KnitClient.Controllers.ClanHqLobby:isClanHq() then
                return nil;
            end;

            local myClan = ClientStore:getState().Clans.myClan;

            if myClan ~= nil then
                myClan = myClan.upgrades[ClanUpgradeType.CRATE_ALTAR];
            end;

            local v13;

            if myClan == ClanUpgradeTier.CRATE_ALTAR_3 then
                v13 = AltarUpgradeTier.TIER_3;
            elseif myClan == ClanUpgradeTier.CRATE_ALTAR_2 then
                v13 = AltarUpgradeTier.TIER_2;
            elseif myClan == ClanUpgradeTier.CRATE_ALTAR_1 then
                v13 = AltarUpgradeTier.TIER_1;
            else
                v13 = AltarUpgradeTier.TIER_0;
            end;

            u11(v13);
        end, {});
        table.sort(u12);

        local function v28(p14) -- Line: 47
            -- upvalues: CrateMeta (ref), u8 (copy), AltarUpgradeTier (ref), u10 (copy), getCrateItemRarityMeta (ref), CrateStarTierColors (ref), u3 (ref), BedwarsImageId (ref), u12 (copy), Empty (ref), StringUtil (ref), ColorUtil (ref), u7 (ref)
            local v15 = CrateMeta[u8.selectedCrate].raritySettings[AltarUpgradeTier.TIER_0][p14];
            local v16 = CrateMeta[u8.selectedCrate].raritySettings[u10][p14];
            local v17 = getCrateItemRarityMeta(p14);
            local v18 = CrateStarTierColors[v17.tier];
            local v19 = false;
            local v20 = 0;
            local v21 = {};

            while true do
                if v19 then
                    v20 = v20 + 1;
                else
                    v19 = true;
                end;

                if v20 >= v17.stars then
                    local v22 = {
                        Size = UDim2.fromScale(1, 1 / #u12)
                    };
                    local v23 = {};
                    local _ = #v23;
                    local v24 = {
                        Size = UDim2.fromScale(0.8, 1)
                    };
                    local v25 = { u3.createElement("UIListLayout", {
                            FillDirection = "Horizontal",
                            HorizontalAlignment = "Left",
                            Padding = UDim.new(0, 2)
                        }) };
                    local v26 = #v25;

                    for i, v in v21 do
                        v25[v26 + i] = v;
                    end;

                    v23.StarsList = u3.createElement(Empty, v24, v25);
                    v23.ProbabilityValue = u3.createElement("TextLabel", {
                        Font = "Roboto",
                        TextXAlignment = "Right",
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        Position = UDim2.fromScale(1, 0.5),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Size = UDim2.fromScale(0.2, 1),
                        Text = "<b>" .. StringUtil.roundNumber(v15 * 100, 2) .. "%</b>" .. (u10 == AltarUpgradeTier.TIER_0 and "" or " -> <font color=\"" .. ColorUtil.richTextColor(u7) .. "\"><b>" .. StringUtil.roundNumber(v16 * 100, 2) .. "%</b></font>"),
                        TextColor3 = Color3.fromRGB(134, 255, 104)
                    }, { u3.createElement("UITextSizeConstraint", {
                            MaxTextSize = 14
                        }) });

                    return u3.createFragment({
                        ProbabilityWrapper = u3.createElement(Empty, v22, v23)
                    });
                end;

                local v27 = u3.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Image = BedwarsImageId.STAR_SOLID,
                    ImageColor3 = v18
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
                table.insert(v21, v27);
            end;
        end;

        local v29 = table.create(#u12);

        for i, v in u12 do
            v29[i] = v28(v, i - 1, u12);
        end;

        local v30 = {
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0.2)
        };
        local v31 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 0.04)
            }) };
        local v32 = #v31;

        for i, v in v29 do
            v31[v32 + i] = v;
        end;

        return u3.createFragment({
            CrateProbabilities = u3.createElement(Empty, v30, v31)
        });
    end)
};