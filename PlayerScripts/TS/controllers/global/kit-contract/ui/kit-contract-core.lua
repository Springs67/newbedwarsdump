-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local KitContractRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards;
local KitContractUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils;
local KitContractRewardInfoCard = RuntimeLib.import(script, script.Parent, "RewardInfo", "kit-contract-reward-info-card").KitContractRewardInfoCard;
local KitContractRewardShowcase = RuntimeLib.import(script, script.Parent, "RewardShowcase", "kit-contract-reward-showcase").KitContractRewardShowcase;
local KitContractRewardsListContainer = RuntimeLib.import(script, script.Parent, "RewardsList", "kit-contract-rewards-list-container").KitContractRewardsListContainer;
local KitContractStatPanel = RuntimeLib.import(script, script.Parent, "StatPanel", "kit-contract-stat-panel").KitContractStatPanel;

return {
    KitContractCore = v3.new(u2)(function(u4, p5) -- Line: 17
        -- upvalues: KitContractRewards (copy), u2 (copy), KitContractUtils (copy), KnitClient (copy), Empty (copy), BedwarsKitMeta (copy), ColorUtil (copy), BedwarsImageId (copy), KitContractRewardInfoCard (copy), KitContractRewardShowcase (copy), KitContractStatPanel (copy), KitContractRewardsListContainer (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local useMemo = p5.useMemo;
        local u6 = KitContractRewards[u4.SelectedKit];

        if u6 ~= nil then
            u6 = u6.rewards;
        end;

        if not u6 then
            return u2.createFragment();
        end;

        local v7, v8 = useState(u6[1]);
        local v9 = u4.store.Lobby.kitStatsProfiles[u4.SelectedKit];
        local u10, u11 = useState(v9 == nil and {
            wins = 0,
            kills = 0
        } or v9);
        local v12 = u4.store.Lobby.kitContractProfiles[u4.SelectedKit];
        local v13, u14 = useState(v12 == nil and {
            purchasedUnlock = false,
            claimedRewards = {}
        } or v12);
        local v19 = useMemo(function() -- Line: 50
            -- upvalues: u6 (copy), KitContractUtils (ref), u4 (copy), u10 (copy)
            local v15 = false;
            local v16 = 0;
            local v17 = 1;

            while true do
                if v15 then
                    v16 = v16 + 1;
                else
                    v15 = true;
                end;

                if v16 >= #u6 then
                    break;
                end;

                local v18 = KitContractUtils.getProgressBarPercentage(u6[v16 + 1].tier, u4.SelectedKit, u10);
                v17 = u6[v16 + 1].tier;

                if v18 < 1 then
                    break;
                end;
            end;

            return v17;
        end, {});
        useEffect(function() -- Line: 73
            -- upvalues: u4 (copy), KnitClient (ref), u11 (copy), u14 (copy)
            local v20 = u4.store.Lobby.kitStatsProfiles[u4.SelectedKit];
            u11(v20 == nil and (KnitClient.Controllers.KitContractController:getKitStats(u4.SelectedKit):expect() or {
                wins = 0,
                kills = 0
            }) or v20);
            local v21 = u4.store.Lobby.kitContractProfiles[u4.SelectedKit];
            u14(v21 == nil and (KnitClient.Controllers.KitContractController:getKitContractProfile(u4.SelectedKit):expect() or {
                purchasedUnlock = false,
                claimedRewards = {}
            }) or v21);
        end, {});

        local function v23() -- Line: 95
            -- upvalues: u4 (copy), u14 (copy)
            local v22 = u4.store.Lobby.kitContractProfiles[u4.SelectedKit];
            u14(v22 == nil and {
                purchasedUnlock = false,
                claimedRewards = {}
            } or v22);
        end;

        local v24 = u4.store.Lobby.kitContractProfiles[u4.SelectedKit];

        if v24 ~= nil then
            v24 = v24.purchasedUnlock;
        end;

        useEffect(v23, { u4.SelectedKit, v24 });

        if not v7 then
            return u2.createFragment();
        end;

        local v25 = {};

        for i, v in u4 do
            v25[i] = v;
        end;

        v25.SelectedKit = nil;
        v25.store = nil;
        local v26 = {};

        for i, v in v25 do
            v26[i] = v;
        end;

        return u2.createElement(Empty, v26, {
            Header = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.1),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), u2.createElement(Empty, {
                    Size = UDim2.fromScale(0.2, 1)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }),
                    u2.createElement("TextLabel", {
                        LayoutOrder = 1,
                        BackgroundTransparency = 1,
                        TextSize = 26,
                        TextWrapped = false,
                        TextTransparency = 0.5,
                        AutomaticSize = Enum.AutomaticSize.XY,
                        Text = BedwarsKitMeta[u4.SelectedKit].name .. " Kit → ",
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }),
                    u2.createElement("ImageLabel", {
                        LayoutOrder = 2,
                        BackgroundTransparency = 1,
                        Image = BedwarsImageId.SCROLL_SOLID,
                        Size = UDim2.fromScale(0.1, 1)
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }),
                    u2.createElement("TextLabel", {
                        LayoutOrder = 3,
                        BackgroundTransparency = 1,
                        TextSize = 26,
                        TextWrapped = false,
                        AutomaticSize = Enum.AutomaticSize.XY,
                        Text = " " .. BedwarsKitMeta[u4.SelectedKit].name .. " Contract",
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    })
                }) }),
            KitContractBody = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.75)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                KitContractBodyLeft = u2.createElement(Empty, {
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(0.3, 1)
                }, { u2.createElement(KitContractRewardInfoCard, {
                        Reward = v7,
                        SelectedKit = u4.SelectedKit,
                        KitContractProfile = v13,
                        KitStats = u10,
                        Size = UDim2.fromScale(1, 1)
                    }) }),
                KitContractBodyCenter = u2.createElement(Empty, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.4, 1)
                }, { u2.createElement(KitContractRewardShowcase, {
                        Reward = v7,
                        Size = UDim2.fromScale(1, 1)
                    }) }),
                KitContractBodyRight = u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.3, 1)
                }, { u2.createElement(KitContractStatPanel, {
                        SelectedKit = u4.SelectedKit,
                        UserKitStatProfile = u10,
                        Size = UDim2.fromScale(1, 0.9),
                        Position = UDim2.fromScale(0, 0.1),
                        HighestUnlockedTier = v19
                    }) })
            }),
            KitContractFooter = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.27),
                Position = UDim2.fromScale(0.5, 0.74),
                AnchorPoint = Vector2.new(0.5, 0)
            }, {
                KitContractRewardsListContainer = u2.createElement(KitContractRewardsListContainer, {
                    store = u4.store,
                    SelectedKit = u4.SelectedKit,
                    Size = UDim2.fromScale(0.8, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Reward = v7,
                    SetReward = v8,
                    KitContractProfile = v13,
                    UserKitStatProfile = u10,
                    HighestUnlockedTier = v19
                })
            })
        });
    end)
};