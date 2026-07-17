-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local PlayerRender = v1.PlayerRender;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local u22 = v3.new(u2)(function(p4, p5) -- Line: 13
    -- upvalues: ImageId (copy), DeviceUtil (copy), OfflinePlayerUtil (copy), u2 (copy), KnitClient (copy), PlayerRender (copy), Empty (copy), GamePlayerUtil (copy)
    local _ = p5.useState;
    local MOUSE = ImageId.MOUSE;

    if DeviceUtil.isMobileControls() then
        MOUSE = ImageId.TOUCH;
    end;

    local u6;

    if p4.store.Game.spectatingPlayer then
        u6 = OfflinePlayerUtil.getPlayer(p4.store.Game.spectatingPlayer);
    else
        u6 = nil;
    end;

    local function _(p7) -- Line: 25
        -- upvalues: u6 (ref)
        local v8 = u6;

        if v8 ~= nil then
            v8 = v8.Team;

            if v8 ~= nil then
                v8 = v8.Name;
            end;
        end;

        return p7.id == v8;
    end;

    local v9 = nil;

    for i, v in p4.store.Game.teams do
        local _ = i - 1;
        local v10 = u6;

        if v10 ~= nil then
            v10 = v10.Team;

            if v10 ~= nil then
                v10 = v10.Name;
            end;
        end;

        if v.id == v10 == true then
            v9 = v;
            break;
        end;
    end;

    local v11 = {
        Size = UDim2.fromScale(0.13, 0.13),
        Position = UDim2.fromScale(0.02, 0.7),
        ImageTransparency = 1,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Selectable = false,

        [u2.Event.MouseButton1Click] = function() -- Line: 54
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.SpectateController:switchSpectateTargets("next");
        end
    };
    local v12 = { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.1192660550458715
        }), u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left"
        }) };
    local v13 = #v12;
    local v14 = {
        SizeConstraint = "RelativeYY",
        Size = UDim2.fromScale(1, 1)
    };
    local v15 = {};
    local v16 = #v15;
    local v17;

    if p4.store.Game.spectatingPlayer == nil then
        v17 = false;
    else
        v17 = u2.createElement(PlayerRender, {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            PlayerUserId = p4.store.Game.spectatingPlayer.userId
        });
    end;

    if v17 then
        v15[v16 + 1] = v17;
    end;

    v12[v13 + 1] = u2.createElement(Empty, v14, v15);
    local v18 = {
        SizeConstraint = "RelativeYY",
        Size = UDim2.fromScale(2.1192660550458715, 1)
    };
    local v19 = {};
    local v20 = #v19;
    local v21 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = "LuckiestGuy",
        TextScaled = true,
        RichText = true,
        TextXAlignment = "Left",
        Text = not u6 and "Unknown" or GamePlayerUtil.getGamePlayer(u6):getDisplayName(),
        Size = UDim2.fromScale(1, 0.6),
        Position = UDim2.fromScale(0, 0)
    };

    if v9 ~= nil then
        v9 = v9.color;
    end;

    if v9 == nil then
        v9 = Color3.fromRGB(255, 255, 255);
    end;

    v21.TextColor3 = v9;
    v21.AutoLocalize = false;
    v19[v20 + 1] = u2.createElement("TextLabel", v21, { u2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0.1, 0),
            PaddingTop = UDim.new(0.2),
            PaddingBottom = UDim.new(0.1)
        }) });
    v19[v20 + 2] = u2.createElement(Empty, {
        Size = UDim2.fromScale(1, 0.4),
        Position = UDim2.fromScale(0, 1),
        AnchorPoint = Vector2.new(0, 1)
    }, {
        u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center"
        }),
        u2.createElement(Empty, {
            Size = UDim2.fromScale(0.1, 0)
        }),
        u2.createElement("ImageLabel", {
            ImageTransparency = 0.18,
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = MOUSE,
            Size = UDim2.fromScale(1, 1)
        }),
        u2.createElement("TextLabel", {
            Text = "NEXT PLAYER",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Font = "Roboto",
            TextScaled = true,
            TextXAlignment = "Left",
            TextTransparency = 0.18,
            Size = UDim2.fromScale(0.8, 1),
            Position = UDim2.fromScale(0, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }, { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.06, 0),
                PaddingTop = UDim.new(0.22),
                PaddingBottom = UDim.new(0.22)
            }) })
    });
    v12[v13 + 2] = u2.createElement(Empty, v18, v19);

    return u2.createElement("ImageButton", v11, v12);
end);

return {
    SpectateSelectorWrapper = function(p23) -- Line: 161, Name: SpectateSelectorWrapper
        -- upvalues: u2 (copy), u22 (copy)
        return u2.createElement("ScreenGui", {
            ResetOnSpawn = false,
            IgnoreGuiInset = true,
            DisplayOrder = 90
        }, { u2.createElement(u22, {
                store = p23.store
            }) });
    end,

    SpectateSelector = u22
};