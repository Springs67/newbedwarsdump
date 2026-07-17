-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local PlayerRender = v1.PlayerRender;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    TournamentOutgoingInvite = v3.new(u2)(function(u4, p5) -- Line: 17
        -- upvalues: SoundManager (copy), GameSound (copy), ClientStore (copy), default (copy), OfflinePlayerUtil (copy), u2 (copy), Empty (copy), PlayerRender (copy), ColorUtil (copy), IconButton (copy), BedwarsImageId (copy), Theme (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(nil);

        local function v8() -- Line: 21
            -- upvalues: SoundManager (ref), GameSound (ref), ClientStore (ref), u4 (copy), default (ref)
            SoundManager:playSound(GameSound.UI_CLICK_2);
            local myTeamId = ClientStore:getState().Tournament.myTeamId;

            if myTeamId == "" or not myTeamId then
                return nil;
            end;

            local InvitedPlayer = u4.InvitedPlayer;
            default.Client:GetNamespace("Tournament"):Get("RequestRevokeTournamentTeamInvitation"):CallServerAsync(myTeamId, InvitedPlayer);
        end;

        useEffect(function() -- Line: 30
            -- upvalues: OfflinePlayerUtil (ref), u4 (copy), u7 (copy)
            task.spawn(function() -- Line: 31
                -- upvalues: OfflinePlayerUtil (ref), u4 (ref), u7 (ref)
                OfflinePlayerUtil.getOfflinePlayersByUserIds({ u4.InvitedPlayer }):andThen(function(p9) -- Line: 33
                    -- upvalues: u7 (ref)
                    if p9[1] then
                        u7(p9[1]);
                    end;
                end);
            end);
        end, {});

        return u2.createFragment({
            ["Player-" .. tostring(u4.InvitedPlayer)] = u2.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 1,
                LayoutOrder = 1,
                Size = UDim2.new(0.6, 0, 0, 60),
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
                PlayerRender = u2.createElement(Empty, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.2, 1)
                }, { u2.createElement(PlayerRender, {
                        FallbackTransparency = 1,
                        SizeConstraint = "RelativeYY",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = 1,
                        PlayerUserId = u4.InvitedPlayer,
                        Size = UDim2.fromScale(1, 1)
                    }, { u2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }), u2.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }) }) }),
                UserInfo = u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0.5, 1)
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
                        Text = not v6 and "loading" or v6.displayName,
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
                        Text = not v6 and "loading" or "@" .. v6.name,
                        TextColor3 = ColorUtil.hexColor(16777215)
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 16
                        }) }) }),
                CancelInviteIcon = u2.createElement(Empty, {
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
                        Tooltip = "Cancel Invite",
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(1, 1),
                        Image = BedwarsImageId.TRASH_SOLID,
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