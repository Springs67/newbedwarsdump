-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ExpireList = v1.ExpireList;
local IconButton = v1.IconButton;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = ExpireList.new(5);

return {
    TorunamentTeamRecommendedPlayer = v3.new(u2)(function(u5, p6) -- Line: 17
        -- upvalues: u4 (copy), Players (copy), ClientStore (copy), KnitClient (copy), Flamework (copy), u2 (copy), Empty (copy), ColorUtil (copy), IconButton (copy), BedwarsImageId (copy), Theme (copy)
        local function v8() -- Line: 18
            -- upvalues: u4 (ref), Players (ref), ClientStore (ref), KnitClient (ref), u5 (copy), Flamework (ref)
            if u4:has(Players.LocalPlayer.UserId) then
                return nil;
            end;

            u4:add(Players.LocalPlayer.UserId);
            local myTeamId = ClientStore:getState().Tournament.myTeamId;

            if myTeamId == "" or not myTeamId then
                return nil;
            end;

            KnitClient.Controllers.TournamentTeamController:requestSendTournamentTeamInvitation(myTeamId, u5.DisplayPlayer.userId):andThen(function(p7) -- Line: 28
                -- upvalues: Flamework (ref)
                if p7 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        message = "Invite sent!"
                    });

                    return;
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                    message = "Invite could not be sent. Try again soon."
                });
            end);
        end;

        return u2.createFragment({
            ["Player-" .. tostring(u5.DisplayPlayer.userId)] = u2.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 1,
                LayoutOrder = 1,
                Size = UDim2.new(0.9, 0, 0, 60),
                SizeConstraint = Enum.SizeConstraint.RelativeXY,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    Padding = UDim.new(0, 0)
                }),
                u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.2, 0)
                }),
                u2.createElement("UIGradient", {
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(0.38, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(1, Color3.fromHex("CFB15A")) })
                }),
                u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 10)
                }),
                UserInfo = u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.7, 1)
                }, { u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 0)
                    }), u2.createElement("TextLabel", {
                        AutomaticSize = "X",
                        TextXAlignment = "Left",
                        BackgroundTransparency = 1,
                        TextTransparency = 0,
                        BorderSizePixel = 0,
                        TextScaled = true,
                        LayoutOrder = 1,
                        AutoLocalize = false,
                        Size = UDim2.fromScale(0, 0.55),
                        Text = u5.DisplayPlayer.displayName,
                        TextColor3 = ColorUtil.hexColor(16777215),
                        Font = Enum.Font.ArialBold
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 18
                        }) }), u2.createElement("TextLabel", {
                        AutomaticSize = "X",
                        TextXAlignment = "Left",
                        BackgroundTransparency = 1,
                        TextTransparency = 0.3,
                        BorderSizePixel = 0,
                        TextScaled = true,
                        Font = "Roboto",
                        LayoutOrder = 2,
                        AutoLocalize = false,
                        Size = UDim2.fromScale(0, 0.45),
                        Text = u5.DisplayPlayer.name,
                        TextColor3 = ColorUtil.hexColor(16777215)
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 16
                        }) }) }),
                SendInviteIcon = u2.createElement(Empty, {
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(0.3, 1),
                    SizeConstraint = Enum.SizeConstraint.RelativeXY
                }, { u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        SortOrder = "LayoutOrder",
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        Padding = UDim.new(0, 0)
                    }), u2.createElement(IconButton, {
                        SizeConstraint = "RelativeYY",
                        Tooltip = "Send Invite",
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(1, 1),
                        Image = BedwarsImageId.ACCEPT_TOURNAMENT_INVITE_ICON,
                        IconProps = {
                            ScaleType = "Fit",
                            Size = UDim2.fromScale(0.8, 0.8),
                            ImageColor3 = Theme.mcRed
                        },
                        OnClick = v8
                    }) })
            })
        });
    end)
};