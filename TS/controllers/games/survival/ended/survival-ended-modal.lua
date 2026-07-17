-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Button = v1.Button;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local GameCoreClientConfig = v1.GameCoreClientConfig;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v19 = v3.new(u2)(function(u5, p6) -- Line: 19
    -- upvalues: Flamework (copy), DeviceUtil (copy), u2 (copy), DarkBackground (copy), Theme (copy), ScaleComponent (copy), Empty (copy), AutoSizedText (copy), Button (copy), SoundManager (copy), GameCoreClientConfig (copy), default (copy), SlideIn (copy)
    local _ = p6.useEffect;
    local v7, u8 = p6.useState(false);

    local function _() -- Line: 23
        -- upvalues: Flamework (ref), u5 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
    end;

    local v9 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v10 = { u2.createElement(DarkBackground, {
            BackgroundTransparency = 0.4,
            AppId = u5.AppId
        }) };
    local v11 = {};
    local v12 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Modal = true,
        AutoButtonColor = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(142.5, 54.5),
        BackgroundColor3 = Theme.backgroundTertiary
    };
    local v13 = { u2.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(600, 229.5),
            ScreenPadding = Vector2.new(24, 24)
        }), u2.createElement(Empty, {
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(1, 0.75)
        }, { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }), u2.createElement(AutoSizedText, {
                TextSize = 12,
                Text = "You Survived!",
                LayoutOrder = 0,
                Font = Enum.Font.SourceSansBold,
                Limits = Vector2.new(300, 60)
            }), u2.createElement(AutoSizedText, {
                TextSize = 8,
                Text = "Click \"Continue\" to play endless mode.",
                LayoutOrder = 0,
                Font = Enum.Font.SourceSans,
                Limits = Vector2.new(300, 60)
            }) }) };
    local v14 = {
        Position = UDim2.fromScale(0, 0.75),
        Size = UDim2.fromScale(1, 0.25)
    };
    local v15 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 5)
        }) };
    local v16 = #v15;
    local v17 = not v7 and u2.createElement(Button, {
        Text = "<b>Continue</b>",
        LayoutOrder = 0,
        BackgroundColor3 = Theme.mcGreen,
        Size = UDim2.fromScale(0.28, 1),

        OnClick = function() -- Line: 100, Name: OnClick
            -- upvalues: SoundManager (ref), GameCoreClientConfig (ref), Flamework (ref), u5 (copy)
            SoundManager:playSound(GameCoreClientConfig.Sounds.UI_CLICK);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
        end
    }, { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 3.795918367346939,
            DominantAxis = "Height"
        }) });

    if v17 then
        v15[v16 + 1] = v17;
    end;

    local v18;

    if v7 then
        v18 = u2.createElement(AutoSizedText, {
            TextSize = 8,
            Text = "Returning to lobby...",
            LayoutOrder = 1,
            Font = Enum.Font.SourceSans,
            Limits = Vector2.new(300, 60)
        });
    else
        v18 = u2.createElement(Button, {
            Text = "<b>Exit to Lobby</b>",
            LayoutOrder = 1,
            BackgroundColor3 = Theme.mcGreen,
            Size = UDim2.fromScale(0.28, 1),

            OnClick = function() -- Line: 119, Name: OnClick
                -- upvalues: u8 (copy), SoundManager (ref), GameCoreClientConfig (ref), DeviceUtil (ref), default (ref)
                u8(true);
                SoundManager:playSound(GameCoreClientConfig.Sounds.UI_CLICK);

                if not DeviceUtil.isHoarceKat() then
                    default.Client:Get("TeleportToLobby"):SendToServer();
                end;
            end
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.795918367346939,
                DominantAxis = "Height"
            }) });
    end;

    v15[#v15 + 1] = v18;
    v13[#v13 + 1] = u2.createElement(Empty, v14, v15);
    v11[#v11 + 1] = u2.createElement("ImageButton", v12, v13);
    v10[#v10 + 1] = u2.createElement(SlideIn, {}, v11);

    return u2.createElement("ScreenGui", v9, v10);
end);

return {
    SurvivalEndedModal = v4.connect(function(p20, p21) -- Line: 145
        local v22 = {};

        for i, v in p21 do
            v22[i] = v;
        end;

        return v22;
    end)(v19)
};