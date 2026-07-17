-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local BedWarsPlaces = v1.BedWarsPlaces;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local PlaceId = v1.PlaceId;
local PlayerRender = v1.PlayerRender;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ServerType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").ServerType;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = { BedWarsPlaces.GAME, BedWarsPlaces.GAME_MEGA, BedWarsPlaces.GAME_MICRO };
local v30 = v3.new(u2)(function(u6, p7) -- Line: 19
    -- upvalues: Players (copy), PlaceId (copy), u5 (copy), default (copy), KnitClient (copy), ServerType (copy), u2 (copy), Padding (copy), PlayerRender (copy), Empty (copy), AutoSizedText (copy), ColorUtil (copy)
    local useEffect = p7.useEffect;
    local v8, u9 = p7.useState(nil);
    local Friend = u6.Friend;
    local v10 = Players:GetPlayerByUserId(u6.Friend.info.VisitorId) ~= nil;
    local u11 = u6.Friend.placeId == PlaceId.LOBBY and true or u6.Friend.placeId == PlaceId.AFK;
    local u12 = table.find(u5, u6.Friend.placeId) ~= nil;

    local function _(p13) -- Line: 28
        -- upvalues: u11 (copy), u12 (copy)
        if u11 then
            return Color3.fromRGB(0, 148, 255);
        end;

        if u12 then
            return Color3.fromRGB(29, 207, 0);
        end;

        return Color3.fromRGB(0, 148, 255);
    end;

    local function _() -- Line: 36
        -- upvalues: default (ref), u6 (copy)
        default.Client:Get("JoinFriend"):SendToServer(u6.Friend.info.VisitorId);
    end;

    useEffect(function() -- Line: 39
        -- upvalues: KnitClient (ref), u6 (copy), u9 (copy), ServerType (ref)
        KnitClient.Controllers.BedwarsPlayerLocationController:getPlayerLocation(u6.Friend.info.VisitorId):andThen(function(p14) -- Line: 41
            -- upvalues: u9 (ref), ServerType (ref)
            if not p14 then
                u9(nil);

                return nil;
            end;

            u9({
                title = p14.title,
                subtitle = p14.subtitle,
                buttonText = (p14.inCustomMatch or p14.serverType == ServerType.STANDARD_SERVER) and "JOIN" or (not p14.inCustomMatch and p14.serverType == ServerType.RESERVED_SERVER and "SPECTATE" or "")
            });
        end);
    end, {});
    local v15 = {
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = Color3.fromRGB(247, 247, 247)
    };
    local v16 = {
        u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 8)
        }),
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }),
        u2.createElement(Padding, {
            Padding = UDim.new(0, 8)
        }),
        u2.createElement(PlayerRender, {
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 0.3,
            LayoutOrder = 1,
            PlayerUserId = u6.Friend.info.VisitorId,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(33, 33, 33)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) })
    };
    local v17 = #v16;
    local v18 = {
        LayoutOrder = 2,
        Size = UDim2.new(0.8, -76, 1, 0)
    };
    local v19 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Center",
            Padding = UDim.new(0, 2)
        }), u2.createElement(Empty, {
            Size = UDim2.new(1, 0, 0, 36)
        }, { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Center",
                Padding = UDim.new(0, 0)
            }), u2.createElement(AutoSizedText, {
                TextSize = 20,
                Text = Friend.info.DisplayName,
                TextColor3 = Color3.fromRGB(34, 34, 34),
                Font = Enum.Font.SourceSans
            }), u2.createElement(AutoSizedText, {
                TextSize = 14,
                TextTransparency = 0.4,
                Text = "@" .. Friend.info.UserName,
                TextColor3 = ColorUtil.BLACK,
                Font = Enum.Font.SourceSans
            }) }) };
    local v20 = {
        Size = UDim2.new(1, 0, 0, 28)
    };
    local v21 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }) };
    local v22 = #v21;
    local v23 = {};
    local v24;

    if v8 == nil then
        v24 = v8;
    else
        v24 = v8.title;
    end;

    if v24 == nil then
        v24 = string.upper(u6.Friend.locationDisplayName);
    end;

    v23.Text = v24;
    v23.TextSize = 14;
    local _ = u6.Friend.placeId;
    local v25;

    if u11 then
        v25 = Color3.fromRGB(0, 148, 255);
    elseif u12 then
        v25 = Color3.fromRGB(29, 207, 0);
    else
        v25 = Color3.fromRGB(0, 148, 255);
    end;

    v23.TextColor3 = v25;
    v23.Font = Enum.Font.SourceSansBold;
    v23.LayoutOrder = 1;
    v21[v22 + 1] = u2.createElement(AutoSizedText, v23);
    local v26 = {};
    local v27;

    if v8 == nil then
        v27 = v8;
    else
        v27 = v8.subtitle;
    end;

    v26.Text = v27 == nil and "" or v27;
    v26.TextSize = 12;
    v26.TextColor3 = Color3.fromRGB(34, 34, 34);
    v26.Font = Enum.Font.SourceSansBold;
    v26.LayoutOrder = 2;
    v21[v22 + 2] = u2.createElement(AutoSizedText, v26);
    v19[#v19 + 1] = u2.createElement(Empty, v20, v21);
    v16.PlayerNameContainer = u2.createElement(Empty, v18, v19);
    local v28 = not v10 and v8;

    if v28 then
        local v29;

        if v8 == nil then
            v29 = v8;
        else
            v29 = v8.buttonText;
        end;

        v28 = v29 ~= "" and u2.createFragment({
            ActionButton = u2.createElement("ImageButton", {
                Size = UDim2.fromScale(0.2, 0.8),
                BackgroundColor3 = Color3.fromRGB(255, 56, 56),

                [u2.Event.Activated] = function() -- Line: 183
                    -- upvalues: default (ref), u6 (copy)
                    default.Client:Get("JoinFriend"):SendToServer(u6.Friend.info.VisitorId);
                end,

                LayoutOrder = 3
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u2.createElement(AutoSizedText, {
                    TextSize = 18,
                    Text = v8.buttonText,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextColor3 = ColorUtil.WHITE,
                    Font = Enum.Font.SourceSansBold
                }) })
        });
    end;

    if v28 then
        v16[v17 + 1] = v28;
    end;

    return u2.createFragment({
        PlayerRow = u2.createElement("ImageButton", v15, v16)
    });
end);

return {
    FriendElement = v4.connect(function(p31, p32) -- Line: 211
        local v33 = {};

        for i, v in p32 do
            v33[i] = v;
        end;

        return v33;
    end)(v30)
};