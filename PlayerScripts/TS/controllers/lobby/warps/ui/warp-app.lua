-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lobby-warps", "lobby-warps");
local LobbyWarp = v6.LobbyWarp;
local LobbyWarpMeta = v6.LobbyWarpMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v25 = v4.new(u3)(function(u7, p8) -- Line: 25
    -- upvalues: default (copy), Flamework (copy), DeviceUtil (copy), u3 (copy), DarkBackground (copy), Theme (copy), ScaleComponent (copy), Empty (copy), Padding (copy), ColorUtil (copy), IconButton (copy), BedwarsImageId (copy), u2 (copy), LobbyWarp (copy), LobbyWarpMeta (copy), ButtonComponent (copy), AutoCanvasScrollingFrame (copy), SlideIn (copy)
    local _ = p8.useState;
    local u9 = nil;

    local function _(p10) -- Line: 28
        -- upvalues: default (ref), u9 (ref)
        default.Client:Get("LobbyRequestTeleportToLocation"):SendToServer(p10);
        u9();
    end;

    u9 = function() -- Line: 32
        -- upvalues: Flamework (ref), u7 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.AppId);
    end;

    local v11 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v12 = { u3.createElement(DarkBackground, {
            AppId = u7.AppId
        }) };
    local v13 = {};
    local v14 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Modal = true,
        AutoButtonColor = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(190, 200),
        BackgroundColor3 = Theme.backgroundTertiary
    };
    local v15 = {
        u3.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(800, 459),
            ScreenPadding = Vector2.new(24, 24)
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0.05, 0)
        }),
        Header = u3.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.1)
        }, {
            u3.createElement(Padding, {
                Padding = {
                    Top = 4,
                    Left = 6,
                    Right = 6
                }
            }),
            u3.createElement("TextLabel", {
                Text = "Warps",
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.5, 1),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }),
            CloseButton = u3.createElement(IconButton, {
                Size = UDim2.fromScale(1, 1),
                SizeConstraint = "RelativeYY",
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.fromScale(0.99, 0.01),
                Image = BedwarsImageId.X,

                [u3.Event.Activated] = function() -- Line: 91
                    -- upvalues: u9 (ref)
                    u9();
                end
            }, { u3.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) })
        })
    };
    local _ = #v15;
    local v16 = {
        Position = UDim2.fromScale(0, 0.1),
        Size = UDim2.fromScale(1, 0.75)
    };
    local v17 = { u3.createElement(Padding, {
            Padding = {
                Top = 8,
                Left = 12,
                Right = 12
            }
        }) };
    local v18 = u2.values(LobbyWarp);

    local function v21(u19) -- Line: 117
        -- upvalues: LobbyWarpMeta (ref), u3 (ref), ButtonComponent (ref), default (ref), u9 (ref)
        local v20 = LobbyWarpMeta[u19];

        return u3.createElement(ButtonComponent, {
            Size = UDim2.new(1, 0, 0, 18),
            Text = string.upper(v20.name),

            OnClick = function() -- Line: 122, Name: OnClick
                -- upvalues: u19 (copy), default (ref), u9 (ref)
                default.Client:Get("LobbyRequestTeleportToLocation"):SendToServer(u19);
                u9();
            end
        });
    end;

    local v22 = table.create(#v18);

    for i, v in v18 do
        v22[i] = v21(v, i - 1, v18);
    end;

    local v23 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0, 6)
        }) };
    local v24 = #v23;

    for i, v in v22 do
        v23[v24 + i] = v;
    end;

    v17[#v17 + 1] = u3.createElement(AutoCanvasScrollingFrame, {}, v23);
    v15.Body = u3.createElement(Empty, v16, v17);
    v13[#v13 + 1] = u3.createElement("ImageButton", v14, v15);
    v12[#v12 + 1] = u3.createElement(SlideIn, {}, v13);

    return u3.createFragment({
        WarpAppScreenGui = u3.createElement("ScreenGui", v11, v12)
    });
end);

return {
    WarpApp = v5.connect(function(p26, p27) -- Line: 153
        local v28 = {};

        for i, v in p27 do
            v28[i] = v;
        end;

        return v28;
    end)(v25)
};