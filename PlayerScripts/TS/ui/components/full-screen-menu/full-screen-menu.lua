-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local EmptyButton = v1.EmptyButton;
local ScaleComponent = v1.ScaleComponent;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Lighting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Lighting;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local RoundTextButton = RuntimeLib.import(script, script.Parent.Parent, "buttons", "round-text-button").RoundTextButton;

return {
    FullScreenMenu = v5.new(u4)(function(u6, p7) -- Line: 20
        -- upvalues: u2 (copy), u3 (copy), Lighting (copy), DeviceUtil (copy), KnitClient (copy), PlaceUtil (copy), SoundManager (copy), GameSound (copy), u4 (copy), RoundTextButton (copy), BedwarsImageId (copy), ScaleComponent (copy), ColorUtil (copy), Empty (copy), EmptyButton (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local u8, u9 = useState(true);
        local u10, u11 = useState(true);
        local u12 = u6.ContainerSize or UDim2.fromOffset(900, 520);
        useEffect(function() -- Line: 27
            -- upvalues: u2 (ref), u6 (copy), u3 (ref), Lighting (ref), DeviceUtil (ref), KnitClient (ref)
            local u13 = u2.new();

            if not u6.Background.Blur then
                return nil;
            end;

            local v14 = u3("BlurEffect", {
                Parent = Lighting
            });
            v14.Size = u6.Background.Blur and 12 or 0;
            u13:GiveTask(v14);

            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.FovController:playUIOpenFOVTween();
            end;

            return function() -- Line: 40
                -- upvalues: u13 (copy), DeviceUtil (ref), KnitClient (ref)
                u13:DoCleaning();

                if not DeviceUtil.isHoarceKat() then
                    KnitClient.Controllers.FovController:playUICloseFOVTween();
                end;
            end;
        end, {});
        useEffect(function() -- Line: 48
            -- upvalues: DeviceUtil (ref), KnitClient (ref), PlaceUtil (ref)
            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.HotbarController:unmountHotbar();

                if PlaceUtil.isLobbyServer() then
                    KnitClient.Controllers.LobbyHudController:unmountLobbyHud();
                end;
            end;

            return function() -- Line: 55
                -- upvalues: DeviceUtil (ref), KnitClient (ref), PlaceUtil (ref)
                if not DeviceUtil.isHoarceKat() then
                    KnitClient.Controllers.HotbarController:mountHotbar();

                    if PlaceUtil.isLobbyServer() then
                        KnitClient.Controllers.LobbyHudController:mountLobbyHud();
                    end;
                end;
            end;
        end, {});
        useEffect(function() -- Line: 64
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.UI_OPEN_2);
        end, {});

        local function v15() -- Line: 67
            -- upvalues: u6 (copy), u9 (copy)
            local BackButton = u6.BackButton;

            if BackButton ~= nil then
                BackButton = BackButton.ShouldShow;
            end;

            u9(BackButton == nil and true or BackButton);
        end;

        local BackButton = u6.BackButton;

        if BackButton ~= nil then
            BackButton = BackButton.ShouldShow;
        end;

        useEffect(v15, { BackButton });

        local function v16() -- Line: 83
            -- upvalues: u6 (copy), u11 (copy)
            local ExitButton = u6.ExitButton;

            if ExitButton ~= nil then
                ExitButton = ExitButton.ShouldShow;
            end;

            u11(ExitButton == nil and true or ExitButton);
        end;

        local ExitButton = u6.ExitButton;

        if ExitButton ~= nil then
            ExitButton = ExitButton.ShouldShow;
        end;

        useEffect(v16, { ExitButton });

        local function u23() -- Line: 99
            -- upvalues: u8 (copy), u6 (copy), u4 (ref), RoundTextButton (ref), BedwarsImageId (ref), u10 (copy)
            local v17 = {};
            local v18 = #v17;
            local v19 = u8 and u6.BackButton and u4.createElement(RoundTextButton, {
                Selectable = true,
                ZIndex = 91,
                Text = {
                    Text = "BACK",
                    Bold = true
                },
                Image = BedwarsImageId.ARROW_LEFT,

                OnClick = function() -- Line: 109, Name: OnClick
                    -- upvalues: u6 (ref)
                    local BackButton2 = u6.BackButton;

                    if BackButton2 ~= nil then
                        BackButton2.OnClick();
                    end;
                end,

                Size = UDim2.fromScale(0.1, 0.85),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }, { u4.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(150, 75),
                    MinSize = Vector2.new(75, 37.5)
                }) });

            if v19 then
                v17[v18 + 1] = v19;
            end;

            local v20 = #v17;
            local v21 = u10 and u6.ExitButton;

            if v21 then
                local v22 = {
                    Selectable = true,
                    Text = {
                        Text = "EXIT",
                        Bold = true
                    },
                    Image = BedwarsImageId.X
                };
                local ExitButton2 = u6.ExitButton;

                if ExitButton2 ~= nil then
                    ExitButton2 = ExitButton2.OnClick;
                end;

                v22.OnClick = ExitButton2;
                v22.Size = UDim2.fromScale(u6.DisableScaleComponent and 0.9 or 0.1, 0.85);
                v22.AnchorPoint = Vector2.new(0.5, 0.5);
                v22.Position = UDim2.fromScale(0.5, 0.5);
                v22.ZIndex = 91;
                v21 = u4.createElement(RoundTextButton, v22, { u4.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(150, 75),
                        MinSize = Vector2.new(75, 37.5)
                    }) });
            end;

            if v21 then
                v17[v20 + 1] = v21;
            end;

            return u4.createFragment(v17);
        end;

        local function v37() -- Line: 160
            -- upvalues: u6 (copy), u4 (ref), u12 (copy), ScaleComponent (ref), ColorUtil (ref), DeviceUtil (ref), u23 (copy), Empty (ref)
            local v24 = {};
            local _ = #v24;
            local v25 = {};
            local BackgroundImageProps = u6.Background.BackgroundImageProps;

            if BackgroundImageProps then
                for i, v in BackgroundImageProps do
                    v25[i] = v;
                end;
            end;

            v25.Size = UDim2.fromScale(1, 1);
            v25.Position = UDim2.fromScale(0.5, 0.5);
            v25.AnchorPoint = Vector2.new(0.5, 0.5);
            v25.ZIndex = -1;
            v24.Background = u4.createFragment({
                Background = u4.createElement("ImageLabel", v25)
            });
            local v26 = {
                Size = u12,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            };
            local ContentProps = u6.ContentProps;

            if ContentProps then
                for i, v in ContentProps do
                    v26[i] = v;
                end;
            end;

            local v27 = {};
            local v28 = #v27;
            local v29 = not u6.DisableScaleComponent and u4.createElement(ScaleComponent, {
                PowerRelationshipPastMaximum = 0.8,
                MaximumSize = Vector2.new(u12.X.Offset * 2.25, u12.Y.Offset * 2.25)
            });

            if v29 then
                v27[v28 + 1] = v29;
            end;

            local v30 = #v27;
            local v31 = u6[u4.Children];

            if v31 then
                for i, v in v31 do
                    if type(i) == "number" then
                        v27[v30 + i] = v;
                    else
                        v27[i] = v;
                    end;
                end;
            end;

            local _ = #v27;
            local v32 = {
                Size = UDim2.fromScale(1, 0.1),
                Position = UDim2.fromScale(0, 0.9)
            };
            local v33 = {};
            local v34 = #v33;
            local v35 = u6.DisableScaleComponent and u4.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12)
            });

            if v35 then
                v33[v34 + 1] = v35;
            end;

            local v36;

            if u6.EnableButtonBackgroundPanel then
                v36 = u4.createElement("Frame", {
                    BackgroundTransparency = 0.3,
                    ZIndex = 90,
                    Size = UDim2.fromScale(0, 1),
                    AutomaticSize = Enum.AutomaticSize.X,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = ColorUtil.BLACK
                }, {
                    u4.createElement("UIListLayout", {
                        HorizontalFlex = "SpaceAround",
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 10)
                    }),
                    u4.createElement("UIPadding", {
                        PaddingRight = UDim.new(0.02, DeviceUtil.isSmallScreen() and 3 or 10),
                        PaddingLeft = UDim.new(0.02, DeviceUtil.isSmallScreen() and 3 or 10),
                        PaddingTop = UDim.new(0.01, DeviceUtil.isSmallScreen() and 3 or 6),
                        PaddingBottom = UDim.new(0.01, DeviceUtil.isSmallScreen() and 3 or 6)
                    }),
                    u4.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }),
                    u23()
                });
            else
                v36 = u4.createFragment({ u4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        Padding = UDim.new(0, 10)
                    }), u23() });
            end;

            v33[#v33 + 1] = v36;
            v27.Footer = u4.createElement(Empty, v32, v33);
            v24.Content = u4.createFragment({
                Content = u4.createElement(Empty, v26, v27)
            });

            return u4.createFragment(v24);
        end;

        local v38 = {
            IgnoreGuiInset = true,
            ResetOnSpawn = false
        };
        local ScreenGuiProps = u6.ScreenGuiProps;

        if ScreenGuiProps then
            for i, v in ScreenGuiProps do
                v38[i] = v;
            end;
        end;

        local v39 = {};
        local v40 = #v39;
        local v41 = u6.UseFrame and u4.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        }, { v37() });

        if v41 then
            v39[v40 + 1] = v41;
        end;

        local v42 = #v39;
        local v43 = not u6.UseFrame and u4.createElement(EmptyButton, {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Modal = true,
            [u4.Event.MouseButton1Click] = u6.Background.OnClick
        }, { v37() });

        if v43 then
            v39[v42 + 1] = v43;
        end;

        return u4.createElement("ScreenGui", v38, v39);
    end)
};