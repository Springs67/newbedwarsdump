-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ImageId = v1.ImageId;
local ScaleComponent = v1.ScaleComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local LobbyHudSideButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lobby", "lobby-hud", "lobby-hud-side", "lobby-hud-side-button").LobbyHudSideButton;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v30 = v3.new(u2)(function(p6, p7) -- Line: 22
    -- upvalues: KnitClient (copy), Players (copy), RunService (copy), DeviceUtil (copy), u2 (copy), ScaleComponent (copy), LobbyHudSideButton (copy), ImageId (copy), Flamework (copy), BedwarsAppIds (copy), BedwarsImageId (copy), QueueType (copy), ClientStore (copy), Empty (copy), AfkPlaceUtils (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local v8, u9 = useState(nil);
    local v10, u11 = useState("0.00");
    local v12, u13 = useState("0.00");
    local v14, u15 = useState(true);
    local u16 = nil;
    useEffect(function() -- Line: 30
        -- upvalues: KnitClient (ref), Players (ref), u9 (copy), u16 (ref), u13 (copy), u11 (copy), RunService (ref)
        KnitClient.Controllers.TrainingRoomDpsCounterController.syncEvents.PlayerDpsUpdatedEvent:connect(function(p17) -- Line: 31
            -- upvalues: Players (ref), u9 (ref), u16 (ref), u13 (ref), u11 (ref)
            if p17.player == Players.LocalPlayer then
                u9(p17.dpsData);
                u16 = p17.dpsData;

                if p17.clear then
                    u13("0.00");
                    u11("0.00");
                end;
            end;
        end);
        RunService.Heartbeat:Connect(function() -- Line: 41
            -- upvalues: u16 (ref), u11 (ref), u13 (ref)
            if not u16 then
                return nil;
            end;

            if not u16.isRecording then
                return nil;
            end;

            local v18 = tick() - u16.damageRecordingStartTime;
            u11((string.format("%.2f", v18)));
            u13((string.format("%.2f", u16.totalDamage / v18)));
        end);
    end, {});
    local v19 = {
        ResetOnSpawn = false
    };
    local v20 = {};
    local v21 = #v20;
    local v22 = {
        Size = UDim2.fromOffset(110, 600),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0.01, DeviceUtil.isSmallScreen() and 0.43 or 0.5)
    };
    local v23 = {};
    local v24 = u2.createElement(ScaleComponent, {
        MaximumSize = Vector2.new(110, 600)
    });
    local v25 = u2.createElement("UIListLayout", {
        FillDirection = "Vertical",
        VerticalAlignment = "Center",
        HorizontalAlignment = "Left",
        SortOrder = "LayoutOrder",
        Padding = UDim.new(0, 6)
    });
    local v26 = u2.createElement(LobbyHudSideButton, {
        Text = "COMMANDS",
        Icon = ImageId.WARNING,

        OnClick = function() -- Line: 80, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.TRAINING_ROOM_COMMANDS_APP, {});
        end
    });
    local v27;

    if v14 then
        v27 = u2.createElement(LobbyHudSideButton, {
            Text = "STOP DPS",
            Icon = BedwarsImageId.SWORD_ICON,

            OnClick = function() -- Line: 87, Name: OnClick
                -- upvalues: u15 (copy), KnitClient (ref)
                u15(false);
                KnitClient.Controllers.TrainingRoomDpsCounterController:setDpsTrackingEnabled(false);
            end
        });
    else
        v27 = u2.createElement(LobbyHudSideButton, {
            Text = "RESTART DPS",
            Icon = BedwarsImageId.SWORD_ICON,

            OnClick = function() -- Line: 94, Name: OnClick
                -- upvalues: u15 (copy), KnitClient (ref)
                u15(true);
                KnitClient.Controllers.TrainingRoomDpsCounterController:setDpsTrackingEnabled(true);
            end
        });
    end;

    v23[1], v23[2], v23[3], v23[4] = v24, v25, v26, v27;
    local v28 = #v23;
    local v29;

    if KnitClient.Controllers.MatchController:getQueueType() == QueueType.CUSTOM_KIT_CREATION then
        v29 = false;
    else
        v29 = u2.createElement(LobbyHudSideButton, {
            Text = "CHANGE KIT",
            Icon = ImageId.HELMET_SOLID,

            OnClick = function() -- Line: 104, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), ClientStore (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_SHOP_APP, {
                    ShowAllKits = true,
                    SelectedKit = ClientStore:getState().Bedwars.kit
                });
            end
        });
    end;

    if v29 then
        v23[v28 + 1] = v29;
    end;

    v20[v21 + 1] = u2.createElement(Empty, v22, v23);
    v20[v21 + 2] = u2.createElement(Empty, {
        Size = UDim2.fromScale(0.5, 0.25),
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.fromScale(1, 0.3)
    }, {
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            VerticalAlignment = "Top",
            HorizontalAlignment = "Right",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 5)
        }),
        u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextStrokeTransparency = 1,
            TextSize = 15,
            Text = "Total Damage: " .. string.format("%.2f", not v8 and 0 or v8.totalDamage),
            AnchorPoint = Vector2.new(1, 1),
            Size = UDim2.fromScale(1, 0.15),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
            AutomaticSize = Enum.AutomaticSize.X,
            Font = AfkPlaceUtils.Theme.font,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextColor3 = Color3.new(1, 0.23, 0.23)
        }),
        u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextStrokeTransparency = 1,
            TextSize = 15,
            Text = "Damage Per Second: " .. v12,
            AnchorPoint = Vector2.new(1, 1),
            Size = UDim2.fromScale(1, 0.15),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
            AutomaticSize = Enum.AutomaticSize.X,
            Font = AfkPlaceUtils.Theme.font,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextColor3 = Color3.new(1, 0.23, 0.23)
        }),
        u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextStrokeTransparency = 1,
            TextSize = 15,
            Text = "Time: " .. v10,
            AnchorPoint = Vector2.new(1, 1),
            Size = UDim2.fromScale(1, 0.15),
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
            AutomaticSize = Enum.AutomaticSize.X,
            Font = AfkPlaceUtils.Theme.font,
            TextXAlignment = Enum.TextXAlignment.Right,
            TextColor3 = Color3.new(1, 0.23, 0.23)
        })
    });

    return u2.createElement("ScreenGui", v19, v20);
end);

return {
    TrainingRoomHudSide = v4.connect(function(p31, p32) -- Line: 173
        local v33 = {};

        for i, v in p32 do
            v33[i] = v;
        end;

        return v33;
    end)(v30)
};