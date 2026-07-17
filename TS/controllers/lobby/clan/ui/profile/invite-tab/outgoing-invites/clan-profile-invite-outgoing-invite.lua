-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local PlayerRender = v1.PlayerRender;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ClanProfileInviteOutgoingInvite = v3.new(u2)(function(u4, p5) -- Line: 17
        -- upvalues: DeviceUtil (copy), SoundManager (copy), GameSound (copy), default (copy), OfflinePlayerUtil (copy), u2 (copy), Theme (copy), Empty (copy), PlayerRender (copy), ColorUtil (copy), IconButton (copy), BedwarsImageId (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState(nil);

        local function v8() -- Line: 21
            -- upvalues: DeviceUtil (ref), SoundManager (ref), GameSound (ref), default (ref), u4 (copy)
            if not DeviceUtil.isHoarceKat() then
                SoundManager:playSound(GameSound.UI_CLICK_2);
                default.Client:GetNamespace("Clans"):Get("CancelOutgoingInvite"):CallServerAsync(u4.ClanInvite);
            end;
        end;

        useEffect(function() -- Line: 27
            -- upvalues: OfflinePlayerUtil (ref), u4 (copy), u7 (copy)
            task.spawn(function() -- Line: 28
                -- upvalues: OfflinePlayerUtil (ref), u4 (ref), u7 (ref)
                OfflinePlayerUtil.getOfflinePlayersByUserIds({ u4.ClanInvite.targetUserId }):andThen(function(p9) -- Line: 30
                    -- upvalues: u7 (ref)
                    if p9[1] then
                        u7(p9[1]);
                    end;
                end);
            end);
        end, {});

        return u2.createElement("Frame", {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.new(0.98, 0, 0, 40),
            BackgroundColor3 = Theme.backgroundPrimary,
            LayoutOrder = u4.LayoutOrder
        }, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10),
                PaddingTop = UDim.new(0, 6),
                PaddingBottom = UDim.new(0, 6)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 0)
            }),
            u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.7, 1)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 8)
                }),
                u2.createElement(PlayerRender, {
                    FallbackTransparency = 1,
                    SizeConstraint = "RelativeYY",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    PlayerUserId = u4.ClanInvite.targetUserId,
                    Size = UDim2.fromScale(1, 1)
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) }),
                UserInfo = u2.createElement(Empty, {
                    AutomaticSize = "X",
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(0, 1)
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
                u2.createElement("TextLabel", {
                    AutomaticSize = "X",
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    TextTransparency = 0.3,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    Font = "Roboto",
                    LayoutOrder = 3,
                    AutoLocalize = false,
                    Size = UDim2.fromScale(0, 0.6),
                    Text = "Invited on " .. DateTime.fromUnixTimestamp(u4.ClanInvite.time):FormatLocalTime("L LT", "en-us"),
                    TextColor3 = ColorUtil.hexColor(16777215)
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 14
                    }) })
            }),
            u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.3, 1)
            }, { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    HorizontalAlignment = "Right",
                    SortOrder = "LayoutOrder",
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
        });
    end)
};