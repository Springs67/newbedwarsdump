-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local FriendElement = RuntimeLib.import(script, script.Parent, "friend-element").FriendElement;
local _ = {
    {
        LastOnline = "test",
        IsOnline = true,
        LastLocation = "BedWars",
        LocationType = 4,
        PlaceId = 4793564307,
        GameId = "4793564307",
        VisitorId = OfflinePlayerUtil.Dummy.oiogy.userId,
        UserName = OfflinePlayerUtil.Dummy.oiogy.name,
        DisplayName = OfflinePlayerUtil.Dummy.oiogy.displayName
    },
    {
        LastOnline = "test",
        IsOnline = true,
        LastLocation = "BedWars",
        LocationType = 4,
        PlaceId = 6660162924,
        GameId = "4793564307",
        VisitorId = OfflinePlayerUtil.Dummy.spleenhook.userId,
        UserName = OfflinePlayerUtil.Dummy.spleenhook.name,
        DisplayName = OfflinePlayerUtil.Dummy.spleenhook.displayName
    }
};
local v21 = v3.new(u2)(function(u5, p6) -- Line: 44
    -- upvalues: SoundManager (copy), GameSound (copy), DeviceUtil (copy), u2 (copy), DarkBackground (copy), ScaleComponent (copy), Padding (copy), Empty (copy), AutoSizedText (copy), ColorUtil (copy), IconButton (copy), BedwarsImageId (copy), Flamework (copy), FriendElement (copy), AutoCanvasScrollingFrame (copy), SlideIn (copy)
    local _ = p6.useState;
    local useEffect = p6.useEffect;
    local v7 = UDim2.fromOffset(620, 500);
    useEffect(function() -- Line: 48
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        return function() -- Line: 50
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});
    local v8 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v9 = { u2.createElement(DarkBackground, {
            AppId = u5.AppId,
            ImageButtonProps = {
                ZIndex = 0
            }
        }) };
    local v10 = {};
    local v11 = {
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Modal = true,
        Size = v7,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromHex("#333333")
    };
    local v12 = {
        u2.createElement(ScaleComponent, {
            PowerRelationshipPastMaximum = 0.6,
            MaximumSize = Vector2.new(v7.X.Offset * 1.2, v7.Y.Offset * 1.2),
            ScreenPadding = Vector2.new(30, 30)
        }),
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }),
        u2.createElement(Padding, {
            Padding = UDim.new(0, 28)
        }),
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Left",
            Padding = UDim.new(0, 16)
        }),
        u2.createElement(Empty, {
            Size = UDim2.new(1, 0, 0, 28)
        }, { u2.createElement(AutoSizedText, {
                TextSize = 28,
                Text = "FRIENDS LIST - " .. tostring(#u5.OnlineFriends) .. " ONLINE ",
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.SourceSansBold
            }), u2.createElement(IconButton, {
                Size = UDim2.new(0, 28, 0, 28),
                Image = BedwarsImageId.X,
                Position = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),

                OnClick = function() -- Line: 111, Name: OnClick
                    -- upvalues: Flamework (ref), u5 (copy)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
                end
            }) })
    };
    local v13;

    if #u5.OnlineFriends == 0 then
        v13 = u2.createElement(AutoSizedText, {
            Text = "No friends online BedWars",
            TextSize = 18,
            TextTransparency = 0.3,
            TextColor3 = Color3.fromRGB(242, 242, 242),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Font = Enum.Font.SourceSansBold
        });
    else
        local OnlineFriends = u5.OnlineFriends;
        table.sort(OnlineFriends, function(p14, p15) -- Line: 131
            return p14.info.DisplayName < p15.info.DisplayName;
        end);

        local function _(p16, p17) -- Line: 135
            -- upvalues: u2 (ref), FriendElement (ref)
            return u2.createElement(FriendElement, {
                Friend = p16
            });
        end;

        v13 = table.create(#OnlineFriends);

        for i, v in OnlineFriends do
            local _ = i - 1;
            v13[i] = u2.createElement(FriendElement, {
                Friend = v
            });
        end;
    end;

    local v18 = {
        ScrollingFrameProps = {
            Size = UDim2.fromScale(1, 0.9)
        }
    };
    local v19 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 8)
        }) };
    local v20 = #v19;

    if v13.elements == nil and (v13.props == nil or v13.component == nil) then
        for i, v in v13 do
            v19[v20 + i] = v;
        end;
    else
        v19[v20 + 1] = v13;
    end;

    v12[#v12 + 1] = u2.createElement(AutoCanvasScrollingFrame, v18, v19);
    v10[#v10 + 1] = u2.createElement("ImageButton", v11, v12);
    v9[#v9 + 1] = u2.createElement(SlideIn, {}, v10);

    return u2.createElement("ScreenGui", v8, v9);
end);

return {
    FriendsList = v4.connect(function(p22, p23) -- Line: 174
        local v24 = {};

        for i, v in p23 do
            v24[i] = v;
        end;

        v24.OnlineFriends = p22.Friends.easyFriends;

        return v24;
    end)(v21)
};