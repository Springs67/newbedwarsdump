-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent, "controllers", "global", "reward", "ui", "reward-showcase").RewardShowcase;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local LockerPreviewUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent, "types", "app-config").BedwarsAppIds;

return {
    RewardTile = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: RewardUtils (copy), u2 (copy), LockerPreviewUtil (copy), u1 (copy), RunService (copy), Flamework (copy), BedwarsAppIds (copy), KnitClient (copy), BedwarsImageId (copy), ColorUtil (copy), RewardShowcase (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local v6 = RewardUtils.getRewardColors(u4.Reward);
        local consumable = u4.Reward.consumable;

        if not consumable then
            consumable = u4.Reward.bedCoins;

            if consumable == 0 or (consumable ~= consumable or not consumable) then
                consumable = u4.Reward.crate or (u4.Reward.eventCurrency or u4.Reward.clanShopContribution);
            end;
        end;

        local u7 = u2.createRef();
        local u8 = not u4.DisablePreview and LockerPreviewUtil.canPreview(u4.Reward);
        useEffect(function() -- Line: 29
            -- upvalues: u1 (ref), u7 (copy), RunService (ref)
            local u9 = u1.new();
            local u10 = u7:getValue();

            if u10 then
                u9:GiveTask(RunService.Heartbeat:Connect(function(p11) -- Line: 34
                    -- upvalues: u10 (copy)
                    u10.Rotation = (u10.Rotation + 45 * p11) % 360;
                end));
            end;

            return function() -- Line: 39
                -- upvalues: u9 (copy)
                u9:DoCleaning();
            end;
        end, {});
        local v15 = {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = 1,
            SizeConstraint = Enum.SizeConstraint.RelativeXX,

            [u2.Event.Activated] = function() -- Line: 49
                -- upvalues: u8 (copy), LockerPreviewUtil (ref), u4 (copy), Flamework (ref), BedwarsAppIds (ref), KnitClient (ref)
                if not u8 then
                    return nil;
                end;

                local v12 = LockerPreviewUtil.rewardToPreviewItem(u4.Reward);
                local u13 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.STORE_MENU_APP);
                local u14 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.BATTLEPASS);
                KnitClient.Controllers.LockerPreviewController:openFullscreenPreview(v12, {
                    onOpen = function() -- Line: 57, Name: onOpen
                        -- upvalues: KnitClient (ref)
                        KnitClient.Controllers.LobbyHudController:unmountLobbyHud();
                        KnitClient.Controllers.HotbarController:unmountHotbar();
                    end,

                    onClose = function() -- Line: 61, Name: onClose
                        -- upvalues: u13 (copy), Flamework (ref), BedwarsAppIds (ref), KnitClient (ref), u14 (copy)
                        if u13 then
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.STORE_MENU_APP, {
                                AppId = BedwarsAppIds.STORE_MENU_APP
                            });
                            KnitClient.Controllers.LobbyHudController:unmountLobbyHud();
                            KnitClient.Controllers.HotbarController:unmountHotbar();
                        elseif u14 then
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.BATTLEPASS, {});
                        end;

                        KnitClient.Controllers.LockerPreviewController:closePreview();
                    end
                });
            end,

            ZIndex = u4.ZIndex
        };
        local ImageButtonProps = u4.ImageButtonProps;

        if ImageButtonProps then
            for i, v in ImageButtonProps do
                v15[i] = v;
            end;
        end;

        local v16 = {};
        local v17 = #v16;
        local v18 = not u4.IgnoreAspectRatio and u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        });

        if v18 then
            v16[v17 + 1] = v18;
        end;

        local _ = #v16;
        local v19 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Transparency = u4.Transparency
        };
        local v20 = {};
        local v21 = #v20;
        local v22 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.2, 0.2),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(0.97, 0.01),
            ScaleType = Enum.ScaleType.Fit,
            Image = BedwarsImageId.EYE_SOLID,
            Visible = u8
        };
        local ZIndex = u4.ZIndex;
        v22.ZIndex = (ZIndex == nil and 1 or ZIndex) + 1;
        v20.PreviewIcon = u2.createElement("ImageLabel", v22);
        local v23 = not u4.IgnoreAspectRatio and u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        });

        if v23 then
            v20[v21 + 1] = v23;
        end;

        local v24 = #v20;
        v20[v24 + 1] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        });
        local createElement = u2.createElement;
        local v25 = {
            Rotation = 90
        };
        local v26;

        if v6 then
            v26 = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.darken(v6.backgroundColor, 0.6)), ColorSequenceKeypoint.new(1, ColorUtil.brighten(v6.backgroundColor, 0.1)) });
        else
            v26 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 44, 59)) });
        end;

        v25.Color = v26;
        v20[v24 + 2] = createElement("UIGradient", v25);
        v20[v24 + 3] = u2.createElement("UIStroke", {
            Thickness = 2,
            Color = ColorUtil.brighten(v6.backgroundColor, 0.25),
            Transparency = u4.Transparency
        }, { u2.createElement("UIGradient", {
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.7, 0), NumberSequenceKeypoint.new(1, 1) }),
                [u2.Ref] = u7
            }) });
        local v27 = {
            Reward = u4.Reward
        };
        local v28;

        if consumable == 0 or (consumable ~= consumable or not consumable) then
            v28 = u4.Simple;
        else
            v28 = consumable;
        end;

        local v29;

        if v28 == 0 or (v28 ~= v28 or not v28) then
            v29 = UDim2.fromScale(0.8, 0.775);
        else
            v29 = UDim2.fromScale(0.8, 0.8);
        end;

        v27.Size = v29;
        local v30;

        if consumable == 0 or (consumable ~= consumable or not consumable) then
            v30 = u4.Simple;
        else
            v30 = consumable;
        end;

        v27.Position = UDim2.fromScale(0.5, (v30 == 0 or (v30 ~= v30 or not v30)) and 0.4 or 0.5);
        v27.AnchorPoint = Vector2.new(0.5, 0.5);
        v27.GroupTransparency = u4.Transparency;
        local ZIndex2 = u4.ZIndex;
        v27.ZIndex = (ZIndex2 == nil and 1 or ZIndex2) + 1;
        v20[v24 + 4] = u2.createElement(RewardShowcase, v27);

        if consumable == 0 then
            consumable = false;
        elseif consumable ~= consumable then
            consumable = false;
        end;

        local v31 = not consumable;

        if v31 then
            local v32 = {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.225),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = ColorUtil.WHITE
            };
            local ZIndex3 = u4.ZIndex;
            v32.ZIndex = (ZIndex3 == nil and 11 or ZIndex3) + 1;
            v32.Transparency = u4.Transparency;
            v32.Visible = not u4.Simple;
            local v33 = { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }) };
            local v34 = {
                TextScaled = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.85, 0.9),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = RewardUtils.getRewardName(u4.Reward),
                TextColor3 = Color3.fromRGB(39, 39, 39),
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextTransparency = u4.Transparency
            };
            local ZIndex4 = u4.ZIndex;
            v34.ZIndex = (ZIndex4 == nil and 11 or ZIndex4) + 1;
            v33[#v33 + 1] = u2.createElement("TextLabel", v34);
            v31 = u2.createFragment({
                RewardNameContainer = u2.createElement("Frame", v32, v33)
            });
        end;

        if v31 then
            v20[v24 + 5] = v31;
        end;

        v16.RewardTile = u2.createElement("Frame", v19, v20);

        return u2.createFragment({
            RewardTilePreviewButton = u2.createElement("ImageButton", v15, v16)
        });
    end)
};