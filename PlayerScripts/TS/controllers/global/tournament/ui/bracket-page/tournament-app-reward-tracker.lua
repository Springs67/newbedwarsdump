-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local TournamentAppRewardTier = RuntimeLib.import(script, script.Parent, "tournament-app-reward-tier").TournamentAppRewardTier;

return {
    TournamentAppRewardTracker = v2.new(u1)(function(p3, p4) -- Line: 9
        -- upvalues: RuntimeLib (copy), ClientStore (copy), KnitClient (copy), u1 (copy), Empty (copy), TournamentAppRewardTier (copy)
        local useState = p4.useState;
        local useEffect = p4.useEffect;
        local v5, u6 = useState(0);
        local v7, u8 = useState(0);
        useEffect(function() -- Line: 14
            -- upvalues: RuntimeLib (ref), ClientStore (ref), KnitClient (ref), u8 (copy), u6 (copy)
            RuntimeLib.async(function() -- Line: 15
                -- upvalues: ClientStore (ref), KnitClient (ref), u8 (ref), u6 (ref)
                local myTeamId = ClientStore:getState().Tournament.myTeamId;

                if myTeamId == "" or not myTeamId then
                    return nil;
                end;

                local v9 = { KnitClient.Controllers.TournamentTeamController:requestTournamentTeamData(myTeamId):await() };

                if v9[1] and v9[2] then
                    local matches = v9[2].matches;

                    local function v13(p10) -- Line: 23
                        -- upvalues: u8 (ref), u6 (ref)
                        if p10.won then
                            u8(function(p11) -- Line: 25
                                return p11 + 1;
                            end);

                            return;
                        end;

                        u6(function(p12) -- Line: 29
                            return p12 + 1;
                        end);
                    end;

                    for i, v in matches do
                        v13(v, i - 1, matches);
                    end;
                end;
            end)();
        end, {});
        useEffect(function() -- Line: 41
        end, { v5, v7 });

        return u1.createFragment({
            ["Right Side - Rewards"] = u1.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.4, 1)
            }, {
                TournamentRewards = u1.createElement("Frame", {
                    LayoutOrder = 2,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromHex("6467A7")
                }, {
                    RewardTitle = u1.createElement("TextLabel", {
                        RichText = true,
                        TextScaled = true,
                        Text = "<b>Rewards</b>",
                        Font = "Roboto",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.09),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Center
                    }),
                    RewardInfo = u1.createElement("TextLabel", {
                        RichText = true,
                        TextScaled = true,
                        Text = "<b>Scaled By Division</b>",
                        Font = "Roboto",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        TextTransparency = 0.7,
                        Size = UDim2.fromScale(1, 0.03),
                        Position = UDim2.fromScale(0, 0.09),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Center
                    }),
                    RewardTiers = u1.createElement("Frame", {
                        LayoutOrder = 2,
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0.5, 0),
                        Position = UDim2.fromScale(0.5, 0.1),
                        Size = UDim2.fromScale(0.65, 0.85)
                    }, {
                        u1.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(-0.145, 0)
                        }),
                        u1.createElement(TournamentAppRewardTier, {
                            rewardTier = 3,
                            currentWins = v7,
                            currentLosses = v5
                        }),
                        u1.createElement(TournamentAppRewardTier, {
                            rewardTier = 2,
                            currentWins = v7,
                            currentLosses = v5
                        }),
                        u1.createElement(TournamentAppRewardTier, {
                            rewardTier = 1,
                            currentWins = v7,
                            currentLosses = v5
                        })
                    })
                })
            })
        });
    end)
};