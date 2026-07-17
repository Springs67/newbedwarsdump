-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GetTarmacAsset = v1.GetTarmacAsset;
local IconButton = v1.IconButton;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u5 = GetTarmacAsset("NoImage");
local v33 = v3.new(u2)(function(u6, p7) -- Line: 24
    -- upvalues: SoundManager (copy), GameSound (copy), KnitClient (copy), Flamework (copy), DeviceUtil (copy), u2 (copy), DarkBackground (copy), Theme (copy), ScaleComponent (copy), IconButton (copy), BedwarsImageId (copy), Padding (copy), u5 (copy), ColorUtil (copy), Players (copy), Empty (copy), SlideIn (copy)
    local _ = p7.useState;
    local u8 = u6.PendingRating or u6.ProfileStoredRating;

    local function _(p9) -- Line: 28
        -- upvalues: SoundManager (ref), GameSound (ref), KnitClient (ref), u6 (copy)
        SoundManager:playSound(GameSound.UI_CLICK_2);
        KnitClient.Controllers.CustomMapBrowserController:userRateMap({
            mapId = u6.mapData.mapId,
            rating = p9
        });
    end;

    local function _() -- Line: 35
        -- upvalues: Flamework (ref), u6 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);
    end;

    p7.useEffect(function() -- Line: 38
        -- upvalues: SoundManager (ref), GameSound (ref), DeviceUtil (ref), KnitClient (ref)
        SoundManager:playSound(GameSound.UI_OPEN_2);

        if not DeviceUtil.isHoarceKat() then
            KnitClient.Controllers.CustomMapBrowserController:getExistingLocalRatings();
        end;

        return function() -- Line: 43
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_CLOSE_2);
        end;
    end, {});
    local v10 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v11 = { u2.createElement(DarkBackground, {
            BackgroundTransparency = 0.4,
            AppId = u6.AppId
        }) };
    local v12 = {};
    local v13 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Modal = true,
        AutoButtonColor = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(190, 109),
        BackgroundColor3 = Theme.backgroundTertiary
    };
    local v14 = {
        u2.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(800, 459),
            ScreenPadding = Vector2.new(24, 24)
        }),
        CloseButton = u2.createElement(IconButton, {
            Size = UDim2.fromScale(0.1, 0.1),
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(0.99, 0.01),
            Image = BedwarsImageId.X,

            [u2.Event.Activated] = function() -- Line: 81
                -- upvalues: Flamework (ref), u6 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u6.AppId);
            end
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) })
    };
    local _ = #v14;
    local v15 = {
        Size = UDim2.fromScale(1, 0.75)
    };
    local v16 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.075, 0)
        }), u2.createElement(Padding, {
            Padding = {
                Top = 4
            }
        }) };
    local _ = #v16;
    local v17 = {
        Size = UDim2.fromScale(1, 0.45)
    };
    local thumbnailImage = u6.mapData.thumbnailImage;
    local v18;

    if thumbnailImage == "" or not thumbnailImage then
        v18 = u5.Image;
    else
        v18 = "rbxassetid://" .. u6.mapData.thumbnailImage;
    end;

    v17.Image = v18;
    v17.BorderSizePixel = 0;
    v17.BackgroundTransparency = 0.3;
    v17.BackgroundColor3 = ColorUtil.BLACK;
    v17.LayoutOrder = 1;
    v16.MapThumbnail = u2.createElement("ImageLabel", v17, { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }), u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }) });
    v16.MapTitle = u2.createElement("TextLabel", {
        TextScaled = true,
        RichText = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.75, 0.14),
        Text = "Enjoying <font color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\">" .. u6.mapData.mapTitle .. "</font>?",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
    });
    v16.MapSubtext = u2.createElement("TextLabel", {
        TextScaled = true,
        TextTransparency = 0.3,
        TextYAlignment = "Top",
        RichText = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 3,
        Size = UDim2.fromScale(0.75, 0.15),
        Text = "Feel free to leave a rating and help <b><font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. Players:GetNameFromUserIdAsync(u6.mapData.creatorUserId) .. "</font></b> better understand your experience",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
    }, { u2.createElement("UITextSizeConstraint", {
            MaxTextSize = 24
        }) });
    v14.Body = u2.createElement(Empty, v15, v16);
    local v19 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 4,
        Size = UDim2.fromScale(1, 0.225),
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1)
    };
    local v20 = { (u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder"
        })) };
    local createElement = u2.createElement;
    local v21 = {
        Size = UDim2.fromScale(0.5, 1)
    };
    local v22;

    if u8 == "like" then
        v22 = Theme.backgroundSuccess;
    else
        v22 = Theme.backgroundPrimary;
    end;

    v21.BackgroundColor3 = v22;
    v21.BorderSizePixel = 0;

    v21[u2.Event.Activated] = function() -- Line: 172
        -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref), KnitClient (ref), u6 (copy)
        if u8 == "like" then
            SoundManager:playSound(GameSound.UI_CLICK_2);
            KnitClient.Controllers.CustomMapBrowserController:userRateMap({
                rating = "unset",
                mapId = u6.mapData.mapId
            });

            return;
        end;

        SoundManager:playSound(GameSound.UI_CLICK_2);
        KnitClient.Controllers.CustomMapBrowserController:userRateMap({
            rating = "like",
            mapId = u6.mapData.mapId
        });
    end;

    v21.LayoutOrder = 1;
    local v23 = { (u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.06, 0)
        })) };
    local createElement2 = u2.createElement;
    local v24 = {
        SizeConstraint = "RelativeYY",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.45),
        Image = BedwarsImageId.THUMBS_UP
    };
    local v25;

    if u8 == "like" then
        v25 = Color3.fromRGB(113, 255, 110);
    else
        v25 = Color3.fromRGB(255, 255, 255);
    end;

    v24.ImageColor3 = v25;
    v24.ImageTransparency = u8 == "like" and 0 or 0.3;
    v23.ThumbsUp = createElement2("ImageLabel", v24, { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v23[2] = u2.createElement("TextLabel", {
    AutomaticSize = "X",
    TextScaled = true,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    LayoutOrder = 2,
    Size = UDim2.fromScale(0, 0.4),
    Text = u8 == "like" and "LIKED" or "LIKE",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextTransparency = u8 == "like" and 0 or 0.3,
    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
});
    v20.LikeMapButton = createElement("ImageButton", v21, v23);
    local v26 = #v20;
    local v27;

    if u8 == nil or u8 == "unset" then
        v27 = u2.createFragment({
            Divider = u2.createElement("Frame", {
                BackgroundTransparency = 0.8,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                Size = UDim2.new(0, 1, 1, 0),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            })
        });
    else
        v27 = false;
    end;

    if v27 then
        v20[v26 + 1] = v27;
    end;

    local _ = #v20;
    local createElement3 = u2.createElement;
    local v28 = {
        Size = UDim2.fromScale(0.5, 1)
    };
    local v29;

    if u8 == "dislike" then
        v29 = Theme.backgroundError;
    else
        v29 = Theme.backgroundPrimary;
    end;

    v28.BackgroundColor3 = v29;
    v28.BorderSizePixel = 0;

    v28[u2.Event.Activated] = function() -- Line: 234
        -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref), KnitClient (ref), u6 (copy)
        if u8 == "dislike" then
            SoundManager:playSound(GameSound.UI_CLICK_2);
            KnitClient.Controllers.CustomMapBrowserController:userRateMap({
                rating = "unset",
                mapId = u6.mapData.mapId
            });

            return;
        end;

        SoundManager:playSound(GameSound.UI_CLICK_2);
        KnitClient.Controllers.CustomMapBrowserController:userRateMap({
            rating = "dislike",
            mapId = u6.mapData.mapId
        });
    end;

    v28.LayoutOrder = 3;
    local v30 = { (u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.06, 0)
        })) };
    local createElement4 = u2.createElement;
    local v31 = {
        SizeConstraint = "RelativeYY",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.45),
        Image = BedwarsImageId.THUMBS_DOWN
    };
    local v32;

    if u8 == "dislike" then
        v32 = Color3.fromRGB(255, 171, 178);
    else
        v32 = Color3.fromRGB(255, 255, 255);
    end;

    v31.ImageColor3 = v32;
    v31.ImageTransparency = u8 == "dislike" and 0 or 0.3;
    v30.ThumbsUp = createElement4("ImageLabel", v31, { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }) });
    v30[2] = u2.createElement("TextLabel", {
    AutomaticSize = "X",
    TextScaled = true,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    LayoutOrder = 2,
    Size = UDim2.fromScale(0, 0.4),
    Text = u8 == "dislike" and "DISLIKED" or "DISLIKE",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    TextTransparency = u8 == "dislike" and 0 or 0.3,
    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
});
    v20.DislikeMapButton = createElement3("ImageButton", v28, v30);
    v14.Actions = u2.createElement("Frame", v19, v20);
    v12[#v12 + 1] = u2.createElement("ImageButton", v13, v14);
    v11[#v11 + 1] = u2.createElement(SlideIn, {}, v12);

    return u2.createElement("ScreenGui", v10, v11);
end);

return {
    RateMapModal = v4.connect(function(p34, p35) -- Line: 283
        local v36 = {};

        for i, v in p35 do
            v36[i] = v;
        end;

        v36.PendingRating = p34.Lobby.pendingMapRatings[p35.mapData.mapId];
        v36.ProfileStoredRating = p34.Lobby.mapBrowserProfileData.ratings[p35.mapData.mapId];

        return v36;
    end)(v33)
};