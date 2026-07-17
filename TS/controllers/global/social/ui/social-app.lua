-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local LobbyHudLargeButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lobby", "lobby-hud", "lobby-hud-large-button").LobbyHudLargeButton;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getEmoteAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local v14 = v3.new(u2)(function(p5, p6) -- Line: 16
    -- upvalues: DeviceUtil (copy), u2 (copy), DarkBackground (copy), getEmoteAsset (copy), EmoteType (copy), Flamework (copy), BedwarsAppIds (copy), LobbyHudLargeButton (copy), BedwarsImageId (copy), WidgetComponent (copy)
    local _ = p6.useState;
    local _ = p6.useEffect;
    local v7 = {
        ResetOnSpawn = false,
        DisplayOrder = 20,
        IgnoreGuiInset = not DeviceUtil.isSmallScreen()
    };
    local v8 = { u2.createElement(DarkBackground, {
            AppId = p5.AppId
        }) };
    local v9 = {
        Title = "SOCIAL",
        AppId = p5.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.75 or 0.6, DeviceUtil.isSmallScreen() and 0.75 or 0.6)
    };
    local v10 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }) };
    local v11 = #v10;
    local v12 = {};
    local v13 = getEmoteAsset(EmoteType.SELFIE);
    v12.Icon = v13 == nil and "" or v13;
    v12.Text = "Friends";

    function v12.OnClick() -- Line: 54
        -- upvalues: Flamework (ref), BedwarsAppIds (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.FRIENDS_LIST, {});
    end;

    v12.FrameProps = {
        LayoutOrder = 0,
        Size = UDim2.fromScale(0.5, 1)
    };
    v10[v11 + 1] = u2.createElement(LobbyHudLargeButton, v12);
    v10[v11 + 2] = u2.createElement(LobbyHudLargeButton, {
        Text = "Verify",
        Icon = BedwarsImageId.XP_BOOST,

        OnClick = function() -- Line: 65, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.SOCIAL_CONNECTIONS, {});
        end,

        FrameProps = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.5, 1)
        }
    });
    v8[#v8 + 1] = u2.createElement(WidgetComponent, v9, v10);

    return u2.createFragment({
        SocialApp = u2.createElement("ScreenGui", v7, v8)
    });
end);

return {
    SocialApp = v4.connect(function(p15, p16) -- Line: 79
        local v17 = {};

        for i, v in p16 do
            v17[i] = v;
        end;

        return v17;
    end)(v14)
};