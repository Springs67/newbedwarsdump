-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KitContractUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local RankTier = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier;
local KitContractKitStatsCardRow = RuntimeLib.import(script, script.Parent.Parent, "KitStats", "kit-contract-kit-stats-card-row").KitContractKitStatsCardRow;

return {
    KitContractKitMasteryEmoteStatsCard = v4.new(u3)(function(p5, p6) -- Line: 15
        -- upvalues: KitContractUtils (copy), u3 (copy), BedwarsKitMeta (copy), ColorUtil (copy), BedwarsImageId (copy), u2 (copy), RankMeta (copy), RankTier (copy), KitContractKitStatsCardRow (copy), Empty (copy)
        local _ = p6.useState;
        local u7 = KitContractUtils.getKitMasteryTierData(p5.SelectedKit, p5.UserKitStatProfile);
        local v8 = {};

        for i, v in p5 do
            v8[i] = v;
        end;

        v8.SelectedKit = nil;
        v8.UserKitStatProfile = nil;
        local v9 = {};

        for i, v in v8 do
            v9[i] = v;
        end;

        local v10 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }), u3.createElement("UIPadding", {
                PaddingRight = UDim.new(0.1, 0),
                PaddingLeft = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.05, 0),
                PaddingBottom = UDim.new(0.1, 0)
            }) };
        local v11 = {
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.24)
        };
        local v12 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.1, 0)
            }), u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.445),
                Text = BedwarsKitMeta[p5.SelectedKit].name .. " Mastery",
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.SourceSansBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center
            }) };
        local v13 = #v12;
        local v14 = {
            Size = UDim2.new(1, -8, 0.545, 0),
            BackgroundColor3 = p5.BackgroundColor3 or ColorUtil.WHITE
        };
        local BackgroundTransparency = p5.BackgroundTransparency;
        v14.BackgroundTransparency = BackgroundTransparency == nil and 0.65 or BackgroundTransparency;
        v14.LayoutOrder = 1;
        local v15 = {
            u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }),
            u3.createElement("UIPadding", {
                PaddingRight = UDim.new(0.025, 0),
                PaddingLeft = UDim.new(0.025, 0),
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0)
            }),
            u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.075, 1),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                Image = BedwarsImageId.STAR_SOLID
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }),
            u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Text = "  Unlocked Mastery Rank",
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.6625, 1),
                Position = UDim2.fromScale(0.075, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
                TextColor3 = ColorUtil.darken(ColorUtil.WHITE, 0.8),
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Center
            })
        };
        local v16 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.2625, 1),
            Position = UDim2.fromScale(1, 0.5),
            AnchorPoint = Vector2.new(1, 0.5)
        };

        local function _(p17) -- Line: 123
            -- upvalues: u7 (copy), RankTier (ref)
            local v18 = u7;

            if v18 ~= nil then
                v18 = v18.currentTierRank;
            end;

            if v18 == nil then
                v18 = RankTier.BRONZE;
            end;

            return p17.tier == v18;
        end;

        local v19 = nil;

        for i, v in u2.values(RankMeta) do
            local _ = i - 1;
            local v20;

            if u7 == nil then
                v20 = u7;
            else
                v20 = u7.currentTierRank;
            end;

            if v20 == nil then
                v20 = RankTier.BRONZE;
            end;

            if v.tier == v20 == true then
                v19 = v;
                break;
            end;
        end;

        if v19 ~= nil then
            v19 = v19.image;
        end;

        if v19 == nil then
            v19 = nil;
        end;

        v16.Image = v19;
        v15[#v15 + 1] = u3.createElement("ImageLabel", v16, { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v12[v13 + 1] = u3.createElement("Frame", v14, v15);
        local v21;

        if u7 == nil then
            v21 = u7;
        else
            v21 = u7.nextTierNumber;
        end;

        local v22 = v21 ~= nil and u3.createElement(KitContractKitStatsCardRow, {
            StatTitle = "Next Tier Unlock",
            LayoutOrder = 1,
            StatValue = tostring(u7.nextTierNumber),
            Size = UDim2.new(1, -8, 0.545, 0)
        });

        if v22 then
            v12[v13 + 2] = v22;
        end;

        v10[#v10 + 1] = u3.createElement(Empty, v11, v12);

        return u3.createFragment({
            KitContractStatsCard = u3.createElement(Empty, v9, v10)
        });
    end)
};