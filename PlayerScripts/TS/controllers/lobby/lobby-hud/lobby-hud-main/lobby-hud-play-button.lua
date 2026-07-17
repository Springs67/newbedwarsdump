-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local TweenService = v4.TweenService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    LobbyHudPlayButton = v3.new(u2)(function(p5, p6) -- Line: 19
        -- upvalues: u2 (copy), DeviceUtil (copy), KnitClient (copy), TweenService (copy), Empty (copy), ColorUtil (copy), BedwarsImageId (copy), Players (copy), SoundManager (copy), GameSound (copy), ShineEffect (copy), ShineEffectVariation (copy), Padding (copy)
        local _ = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = u2.createRef();
        local u8 = u2.createRef();
        local v9;

        if DeviceUtil.isHoarceKat() then
            v9 = true;
        else
            v9 = KnitClient.Controllers.LobbyTutorialController:isFirstTimePlayer();

            if v9 == nil then
                v9 = false;
            end;
        end;

        useEffect(function() -- Line: 35
            -- upvalues: u7 (copy), TweenService (ref), u8 (copy)
            local u10 = u7:getValue();

            if u10 then
                local u11 = TweenService:Create(u10, TweenInfo.new(5, Enum.EasingStyle.Linear), {
                    Offset = Vector2.new(-1, 0)
                });
                u11:Play();
                u11.Completed:Connect(function() -- Line: 42
                    -- upvalues: u10 (copy), u11 (copy)
                    if u10.Rotation == 180 then
                        u10.Rotation = 0;
                        u10.Offset = Vector2.new(1, 0);
                    else
                        u10.Rotation = 180;
                        u10.Offset = Vector2.new(1, 0);
                    end;

                    u11:Play();
                end);
            end;

            local v12 = u8:getValue();

            if v12 then
                TweenService:Create(v12, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true, 1), {
                    Position = UDim2.new(0.5, 0, 0.7, -4)
                }):Play();
            end;
        end, {});
        local v13 = {
            Size = UDim2.fromScale(0.3, 1)
        };
        local FrameProps = p5.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v13[i] = v;
            end;
        end;

        local v14 = {};
        local v15 = #v14;

        if v9 then
            v9 = u2.createFragment({
                NewPlayerHint = u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, -0.2),
                    AnchorPoint = Vector2.new(0.5, 1)
                }, {
                    HelperText = u2.createElement("TextLabel", {
                        Text = "Play your first match!",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.35),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                    }, { u2.createElement("UIStroke", {
                            Thickness = 1
                        }) }),
                    DownArrowImage = u2.createElement("ImageLabel", {
                        Position = UDim2.fromScale(0.5, 0.7),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        SizeConstraint = "RelativeYY",
                        Image = BedwarsImageId.ARROW_DOWN_1,
                        BackgroundTransparency = 1,
                        [u2.Ref] = u8,
                        LayoutOrder = 2
                    })
                })
            });
        end;

        if v9 then
            v14[v15 + 1] = v9;
        end;

        local v16 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.WHITE
        };
        local ButtonProps = p5.ButtonProps;

        if ButtonProps then
            for i, v in ButtonProps do
                v16[i] = v;
            end;
        end;

        v16[u2.Event.Activated] = function() -- Line: 118
            -- upvalues: Players (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
            local v17 = Players.LocalPlayer:GetAttribute("ResolvingMatchDisconnect");

            if v17 ~= 0 and (v17 == v17 and (v17 ~= "" and v17)) then
                return nil;
            end;

            KnitClient.Controllers.LobbyHudController:openLobbyPlayMenu();
            SoundManager:playSound(GameSound.UI_CLICK_2);
        end;

        local v18 = {
            u2.createElement(ShineEffect, {
                Loop = false,
                OnHover = true,
                Color = ColorUtil.WHITE,
                Variation = ShineEffectVariation.solid
            }),
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            u2.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(114, 255, 120)
            }, { u2.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                }) }),
            u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new(Color3.fromRGB(35, 218, 53), Color3.fromRGB(54, 235, 94)),
                [u2.Ref] = u7
            })
        };
        local _ = #v18;
        local v19 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v20 = { u2.createElement(
                "UIListLayout",
                {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center"
                }
            ), u2.createElement(Padding, {
                Padding = UDim.new(0, 6)
            }), u2.createElement("TextLabel", {
                Text = "PLAY",
                TextSize = 26,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.7, 1),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }) };
        local v21 = #v20;
        local v22 = p5[u2.Children];

        if v22 then
            for i, v in v22 do
                if type(i) == "number" then
                    v20[v21 + i] = v;
                else
                    v20[i] = v;
                end;
            end;
        end;

        v18.Content = u2.createElement(Empty, v19, v20);
        v14[#v14 + 1] = u2.createElement("ImageButton", v16, v18);

        return u2.createElement(Empty, v13, v14);
    end)
};