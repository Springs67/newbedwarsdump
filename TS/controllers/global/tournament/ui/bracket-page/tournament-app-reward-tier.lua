-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local TournamentRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-rewards").TournamentRewards;
local TournamentDivision = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-types").TournamentDivision;
local TournamentAppRewardTile = RuntimeLib.import(script, script.Parent, "tournament-app-reward-tile").TournamentAppRewardTile;

return {
    TournamentAppRewardTier = v2.new(u1)(function(u3, p4) -- Line: 11
        -- upvalues: ClientStore (copy), TournamentDivision (copy), TournamentRewards (copy), u1 (copy), BedwarsImageId (copy), TournamentAppRewardTile (copy), Empty (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = u3.currentWins < u3.rewardTier;
        local v6 = ClientStore:getState().Tournament.myTeamDivision or TournamentDivision.Division_I;
        local v7 = TournamentRewards.getRewardsByDivisionWins(v6, u3.rewardTier);
        local u8 = u3.rewardTier == 3 and u3.currentLosses >= 1 and true or u3.rewardTier == 2 and u3.currentLosses >= 2;
        local v9 = {
            Size = UDim2.fromScale(1, 0.45)
        };
        local v10 = {};
        local v11 = #v10;
        local v12;

        if u3.currentWins == u3.rewardTier then
            v12 = u1.createFragment({
                TierIconHighlighted = u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    Image = BedwarsImageId.REWARD_TIER_UI_HIGHLIGHT,
                    ImageTransparency = u8 and 0.7 or 0
                })
            });
        else
            v12 = false;
        end;

        if v12 then
            v10[v11 + 1] = v12;
        end;

        local v13 = #v10;
        local v14;

        if u3.currentWins == u3.rewardTier then
            v14 = false;
        else
            v14 = u1.createFragment({
                TierIconNoHighlight = u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    Image = BedwarsImageId.REWARD_TIER_UI,
                    ImageTransparency = u8 and 0.7 or 0
                })
            });
        end;

        if v14 then
            v10[v13 + 1] = v14;
        end;

        local v15 = #v10;
        v10.RewardAmount = u1.createElement("TextLabel", {
            RichText = true,
            TextScaled = true,
            Font = "Roboto",
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            ZIndex = 2,
            Size = UDim2.fromScale(1, 0.1),
            Position = UDim2.fromScale(0, 0.15),
            Text = "<b>" .. tostring(u3.rewardTier) .. " Wins</b>",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        });
        local v16;

        if v5 then
            if u8 then
                v16 = u1.createFragment({
                    RewardStatus = u1.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        Size = UDim2.fromScale(0.1, 0.1),
                        Position = UDim2.fromScale(0.8, 0.7),
                        Image = BedwarsImageId.X,
                        ImageColor3 = Color3.fromRGB(255, 0, 0),
                        ImageTransparency = u8 and 0.7 or 0
                    }, { u1.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) })
                });
            else
                v16 = u8;
            end;
        else
            v16 = v5;
        end;

        if v16 then
            v10[v15 + 1] = v16;
        end;

        local v17 = #v10;
        local v18 = v5 and not u8 and u1.createFragment({
            RewardStatus = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 2,
                Size = UDim2.fromScale(0.1, 0.1),
                Position = UDim2.fromScale(0.8, 0.7),
                Image = BedwarsImageId.LOCK_SOLID,
                ImageTransparency = u8 and 0.7 or 0
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) })
        });

        if v18 then
            v10[v17 + 1] = v18;
        end;

        local v19 = #v10;
        local v20 = not v5 and u1.createFragment({
            RewardStatus = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 2,
                Size = UDim2.fromScale(0.1, 0.1),
                Position = UDim2.fromScale(0.8, 0.7),
                Image = BedwarsImageId.CHECK_SOLID,
                ImageColor3 = Color3.fromRGB(0, 255, 0),
                ImageTransparency = u8 and 0.7 or 0
            }, { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) })
        });

        if v20 then
            v10[v19 + 1] = v20;
        end;

        local _ = #v10;

        local function _(p21, p22) -- Line: 130
            -- upvalues: u1 (ref), TournamentAppRewardTile (ref), u8 (copy), u3 (copy)
            return u1.createElement(TournamentAppRewardTile, {
                reward = p21,
                LayoutOrder = p22,
                unWinnable = u8,
                rewardTier = u3.rewardTier
            });
        end;

        local v23 = table.create(#v7);

        for i, v in v7 do
            v23[i] = u1.createElement(TournamentAppRewardTile, {
                reward = v,
                LayoutOrder = i - 1,
                unWinnable = u8,
                rewardTier = u3.rewardTier
            });
        end;

        local v24 = {
            BackgroundTransparency = 1,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.5)
        };
        local v25 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 8)
            }) };
        local v26 = #v25;

        for i, v in v23 do
            v25[v26 + i] = v;
        end;

        v10.RewardsShowcase = u1.createElement("Frame", v24, v25);

        return u1.createFragment({
            RewardTierArea = u1.createElement(Empty, v9, v10)
        });
    end)
};