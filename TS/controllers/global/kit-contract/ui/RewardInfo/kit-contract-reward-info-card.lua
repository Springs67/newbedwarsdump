-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local PurchaseButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "purchase-button").PurchaseButton;
local BedCoinProductList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-product-list").BedCoinProductList;
local KitContractUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    KitContractRewardInfoCard = v4.new(u3)(function(u5, p6) -- Line: 18
        -- upvalues: DeviceUtil (copy), default (copy), KnitClient (copy), u3 (copy), ColorUtil (copy), u2 (copy), KitContractUtils (copy), Empty (copy), RewardUtils (copy), PurchaseButton (copy), SoundManager (copy), GameSound (copy), BedCoinProductList (copy)
        p6.useEffect(function() -- Line: 20
            -- upvalues: DeviceUtil (ref), default (ref), KnitClient (ref)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local u8 = default.Client:Get("KitContractPurchaseSuccess"):Connect(function(p7) -- Line: 24
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.KitContractController:getKitContractProfile(p7.kit, true);
            end);

            return function() -- Line: 27
                -- upvalues: u8 (copy)
                if not u8.Connected then
                    return nil;
                end;

                u8:Disconnect();
            end;
        end, {});

        local function v12(p9, p10, p11) -- Line: 34
            -- upvalues: u3 (ref), ColorUtil (ref)
            return u3.createFragment({
                ["KitContractInfoPill" .. p10] = u3.createElement("Frame", {
                    LayoutOrder = 0,
                    BackgroundTransparency = 0.5,
                    Size = UDim2.fromScale(0.375, 1),
                    BackgroundColor3 = p11 or Color3.fromRGB(103, 103, 103)
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }), u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        Size = UDim2.fromScale(0.8, 0.75),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Text = p9,
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }) })
            });
        end;

        local u13 = "<font transparency=\".3\">Unlocks at </font>";

        local function u24(u14) -- Line: 62
            -- upvalues: u2 (ref), u24 (ref), u13 (ref), u5 (copy), ColorUtil (ref)
            if type(u14) ~= "table" then
                return nil;
            end;

            local v15 = u2.entries(u14);

            local function v23(p16, p17) -- Line: 67
                -- upvalues: u24 (ref), u2 (ref), u14 (copy), u13 (ref), u5 (ref), ColorUtil (ref)
                local v18 = p16[2];
                local v19 = tostring(p16[1]);

                if type(v18) == "table" then
                    u24(v18);

                    return nil;
                end;

                local v20;

                if string.sub(v19, #v19, #v19) == "s" and v18 == 1 then
                    v20 = string.sub(v19, 0, #v19 - 1);
                else
                    v20 = v19;
                end;

                if p17 + 1 <= #u2.keys(u14) and p17 ~= 0 then
                    u13 = u13 .. "<font transparency=\".3\">& </font>";
                end;

                local v21 = u5.KitStats[v19];
                local richTextColor = ColorUtil.richTextColor;
                local v22;

                if v18 <= (v21 == nil and 0 or v21) then
                    v22 = Color3.fromRGB(237, 199, 89);
                else
                    v22 = Color3.fromRGB(103, 103, 103);
                end;

                u13 = u13 .. "<font color=\"" .. richTextColor(v22) .. "\"><b>" .. tostring(v18) .. " " .. v20 .. "</b></font> ";
            end;

            for i, v in v15 do
                v23(v, i - 1, v15);
            end;
        end;

        u24(u5.Reward.task);
        local purchasedUnlock = u5.KitContractProfile.purchasedUnlock;
        local v25 = {};

        for i, v in u5 do
            v25[i] = v;
        end;

        v25.Reward = nil;
        v25.SelectedKit = nil;
        v25.KitContractProfile = nil;
        v25.KitStats = nil;
        local v26 = {};

        for i, v in v25 do
            v26[i] = v;
        end;

        local v27 = {};
        local v28 = #v27;
        local v29 = {
            Size = UDim2.fromScale(0.85, 0.85),
            Position = UDim2.fromScale(0, 0.48),
            AnchorPoint = Vector2.new(0, 0.5)
        };
        local v30 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v31 = #v30;
        local v32 = {
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.07)
        };
        local v33 = {};
        local v34 = #v33;
        local v35 = u5.Reward.requiresPurchaseUnlock and u3.createElement("TextLabel", {
            BackgroundTransparency = 0.7,
            TextScaled = true,
            Text = "REQUIRES PASS",
            Size = UDim2.fromScale(0.775, 1),
            Position = UDim2.fromScale(0, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = KitContractUtils.ProgressColor,
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        }, { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.15, 0),
                PaddingBottom = UDim.new(0.15, 0)
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }) });

        if v35 then
            v33[v34 + 1] = v35;
        end;

        v30.KitContractInfoTopPill = u3.createElement(Empty, v32, v33);
        v30[v31 + 1] = u3.createElement(Empty, {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.015)
        });
        local v36 = RewardUtils.getRewardType(u5.Reward);

        if v36 ~= nil then
            v36 = string.upper(v36);
        end;

        local v37 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.07)
        };
        local v38 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.025, 0)
            }),
            [#v38 + 1] = v12(tostring(v36), "RewardType")
        };
        local v39 = "TIER " .. tostring(u5.Reward.tier);
        local v40;

        if KitContractUtils.isTierUnlocked(u5.Reward.tier, u5.SelectedKit, u5.KitStats) then
            v40 = Color3.fromRGB(237, 199, 89);
        else
            v40 = nil;
        end;

        v38[#v38 + 1] = v12(v39, "RewardTier", v40);
        v30.KitContractInfoPills = u3.createElement(Empty, v37, v38);
        v30[v31 + 2] = u3.createElement(Empty, {
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0.015)
        });
        local v41 = {
            LayoutOrder = 4,
            BackgroundTransparency = 1,
            TextScaled = true,
            Size = UDim2.fromScale(1, 0.2)
        };
        local v42 = RewardUtils.getRewardName(u5.Reward);

        if v42 ~= nil then
            v42 = string.upper(v42);
        end;

        v41.Text = v42;
        v41.TextColor3 = ColorUtil.WHITE;
        v41.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
        v41.TextXAlignment = Enum.TextXAlignment.Left;
        v41.TextYAlignment = Enum.TextYAlignment.Center;
        v30.KitContractInfoRewardTitle = u3.createElement("TextLabel", v41, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 42 or 58
            }) });
        v30.KitContractInfoRewardRequirements = u3.createElement("TextLabel", {
            LayoutOrder = 5,
            BackgroundTransparency = 1,
            RichText = true,
            TextScaled = true,
            Size = UDim2.fromScale(1, 0.15),
            Text = u13,
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.fromName("Roboto"),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top
        }, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = DeviceUtil.isSmallScreen() and 24 or 34,
                MinTextSize = DeviceUtil.isSmallScreen() and 12 or 18
            }) });
        v27.KitContractInfoCard = u3.createElement(Empty, v29, v30);
        local v43 = not purchasedUnlock and u3.createFragment({
            KitContractPurchaseButtons = u3.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.125),
                Position = UDim2.fromScale(0, 0.96),
                AnchorPoint = Vector2.new(0, 1)
            }, { u3.createElement(PurchaseButton, {
                    LayoutOrder = 0,
                    Title = "PURCHASE PASS",
                    Selectable = true,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.fromScale(0, 0),
                    Size = UDim2.fromScale(0.5, 1),
                    Cost = { {
                            robux = 149
                        } },

                    OnClick = function() -- Line: 246, Name: OnClick
                        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), u5 (copy)
                        SoundManager:playSound(GameSound.UI_CLICK);
                        KnitClient.Controllers.KitContractController:promptPurchaseToContract(u5.SelectedKit);
                    end
                }), u3.createElement(PurchaseButton, {
                    LayoutOrder = 1,
                    Title = "PURCHASE PASS",
                    Selectable = true,
                    AnchorPoint = Vector2.new(0, 0),
                    Position = UDim2.fromScale(0.55, 0),
                    Size = UDim2.fromScale(0.5, 1),
                    Cost = {
                        {
                            bedcoin = BedCoinProductList.getProductInfo(58).cost
                        }
                    },
                    BackgroundColor3 = Color3.fromRGB(255, 224, 107),

                    OnClick = function() -- Line: 262, Name: OnClick
                        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), u5 (copy)
                        SoundManager:playSound(GameSound.UI_CLICK);
                        KnitClient.Controllers.BedCoinProductPurchaseController:purchase({
                            productId = 58,
                            selectedKit = u5.SelectedKit
                        }, function() -- Line: 269
                            -- upvalues: KnitClient (ref), u5 (ref)
                            KnitClient.Controllers.KitContractController:getKitContractProfile(u5.SelectedKit, true);
                        end);
                    end
                }) })
        });

        if v43 then
            v27[v28 + 1] = v43;
        end;

        return u3.createFragment({
            KitContractRewardInfoCard = u3.createElement(Empty, v26, v27)
        });
    end)
};