-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularSpinner = v1.CircularSpinner;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local PlayerProfileEmpty = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lobby", "player-profile", "ui", "player-profile-empty").PlayerProfileEmpty;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local HostPanelTextBox = RuntimeLib.import(script, script.Parent.Parent.Parent, "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox;
local MatchHistoryCore = RuntimeLib.import(script, script.Parent, "match-history-core").MatchHistoryCore;
local v25 = v3.new(u2)(function(u5, p6) -- Line: 23
    -- upvalues: DeviceUtil (copy), u2 (copy), DarkBackground (copy), Workspace (copy), ScaleComponent (copy), WidgetComponent (copy), Flamework (copy), Empty (copy), Theme (copy), HostPanelTextBox (copy), KnitClient (copy), CircularSpinner (copy), PlayerProfileEmpty (copy), MatchHistoryCore (copy), SlideIn (copy)
    local useState = p6.useState;
    local v7, u8 = useState(u5.player.displayName);
    local v9, u10 = useState({
        player = u5.player,
        matchHistory = u5.matchHistory
    });
    local v11, u12 = useState(false);
    local v13 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v14 = { u2.createElement(DarkBackground, {
            BackgroundTransparency = 0.4,
            AppId = u5.AppId
        }) };
    local v15 = {};
    local v16 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(800, 600)
    };
    local v17 = {};
    local v18 = #v17;
    local v19 = {
        MaximumSize = Vector2.new(1040, 780),
        ScreenPadding = Workspace.CurrentCamera.ViewportSize * Vector2.new(0.03, 0.045)
    };
    v17[v18 + 1] = u2.createElement(ScaleComponent, v19);
    local createElement = u2.createElement;
    local v20 = {
        AppId = u5.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Title = v9.player.displayName .. "\'s Match History",

        OnClose = function() -- Line: 66, Name: OnClose
            -- upvalues: Flamework (ref), u5 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
        end
    };
    local v23 = {
        u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.05, 0)
        }),
        Searchbar = u2.createElement(Empty, {
            LayoutOrder = 1,
            Size = UDim2.new(1, 0, 0.05, 0)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 4)
            }),
            u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "UserID/Username:",
                TextSize = 14,
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = Enum.AutomaticSize.X,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Theme.textPrimary,
                TextXAlignment = Enum.TextXAlignment.Left
            }),
            CopyUserId = u2.createElement(HostPanelTextBox, {
                TextEditable = true,
                TextScaled = true,
                LayoutOrder = 2,
                TextSize = 14,
                LeftPadding = 0.05,
                Size = UDim2.new(0.3, 0, 1, 0),
                Text = tostring(v7),
                Font = Enum.Font.SourceSans,
                TextColor3 = Color3.fromRGB(191, 191, 191),
                TextXAlignment = Enum.TextXAlignment.Left,

                OnFocusLost = function(u21) -- Line: 103, Name: OnFocusLost
                    -- upvalues: u12 (copy), KnitClient (ref), u10 (copy), u8 (copy)
                    u12(true);
                    KnitClient.Controllers.MatchHistoryController:requestMatchHistory(u21):andThen(function(p22) -- Line: 106
                        -- upvalues: u10 (ref), u8 (ref), u21 (copy), u12 (ref)
                        if p22 then
                            u10({
                                player = p22.player,
                                matchHistory = p22.matchHistory
                            });
                            u8(u21);
                        end;

                        u12(false);
                    end);
                end
            })
        })
    };
    local v24;

    if v11 then
        v24 = u2.createElement(CircularSpinner, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.3)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    elseif #v9.matchHistory == 0 then
        v24 = u2.createElement(PlayerProfileEmpty, {
            Text = "No match history available.",
            Size = UDim2.fromScale(1, 0.9)
        });
    else
        v24 = u2.createElement(MatchHistoryCore, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.9),
            userId = v9.player.userId,
            matchHistory = v9.matchHistory
        });
    end;

    v23[2] = v24;
    v17[v18 + 2] = createElement(WidgetComponent, v20, v23);
    v15[#v15 + 1] = u2.createElement("Frame", v16, v17);
    v14[#v14 + 1] = u2.createElement(SlideIn, {}, v15);

    return u2.createElement("ScreenGui", v13, v14);
end);

return {
    MatchHistoryModerationApp = v4.connect(function(p26, p27) -- Line: 145
        local v28 = {};

        for i, v in p27 do
            v28[i] = v;
        end;

        return v28;
    end)(v25)
};