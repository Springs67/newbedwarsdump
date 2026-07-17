-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local UnlocksConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "unlocks", "unlocks-config").UnlocksConfig;

return {
    LobbyHudMainButton = v4.new(u3)(function(u6, p7) -- Line: 20
        -- upvalues: u3 (copy), DeviceUtil (copy), Players (copy), BedwarsKit (copy), UnlocksConfig (copy), u2 (copy), TweenService (copy), Theme (copy), SoundManager (copy), GameSound (copy), Empty (copy), ColorUtil (copy), BedwarsImageId (copy), Padding (copy)
        local _ = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = u3.createRef();
        local v9 = u6.Text == "Kits";
        local v10 = v9 and (DeviceUtil.isHoarceKat() and true or Players.LocalPlayer:GetAttribute("ShowKitHelper") == true) and (u6.store.Bedwars.kit == BedwarsKit.NONE and true or u6.store.Bedwars.kit == nil);

        if v9 then
            v9 = UnlocksConfig.isFreeKitsEventActive() and not v10;
        end;

        useEffect(function() -- Line: 27
            -- upvalues: u2 (ref), u8 (copy), TweenService (ref)
            local u11 = u2.new();
            local v12 = u8:getValue();

            if v12 then
                local v13 = TweenService:Create(v12, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true, 1), {
                    Position = UDim2.new(0.5, 0, 0.7, -4)
                });
                v13:Play();
                u11:GiveTask(v13);
            end;

            return function() -- Line: 37
                -- upvalues: u11 (copy)
                u11:DoCleaning();
            end;
        end, {});
        local v14 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.3, 1),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local FrameProps = u6.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v14[i] = v;
            end;
        end;

        v14[u3.Event.Activated] = function() -- Line: 52
            -- upvalues: SoundManager (ref), GameSound (ref), u6 (copy)
            SoundManager:playSound(GameSound.UI_CLICK_2);
            u6.OnClick();
        end;

        local v15 = {};
        local v16 = #v15;

        if v10 then
            v10 = u3.createFragment({
                NewPlayerHint = u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, -0.2),
                    AnchorPoint = Vector2.new(0.5, 1)
                }, {
                    HelperText = u3.createElement("TextLabel", {
                        Text = "Equip a kit!",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.5),
                        Position = UDim2.fromScale(0, -0.2),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                    }, { u3.createElement("UIStroke", {
                            Thickness = 1
                        }) }),
                    DownArrowImage = u3.createElement("ImageLabel", {
                        Position = UDim2.fromScale(0.5, 0.7),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        SizeConstraint = "RelativeYY",
                        Image = BedwarsImageId.ARROW_DOWN_1,
                        BackgroundTransparency = 1,
                        [u3.Ref] = u8,
                        LayoutOrder = 2
                    })
                })
            });
        end;

        if v10 then
            v15[v16 + 1] = v10;
        end;

        local v17 = #v15;
        v15[v17 + 1] = u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        });

        if v9 then
            v9 = u3.createElement("TextLabel", {
                Text = "🔥 ALL KITS FREE!",
                TextScaled = true,
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.9, 1),
                Position = UDim2.fromScale(0.5, -0.9),
                AnchorPoint = Vector2.new(0.5, 0),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextSize = DeviceUtil.isSmallScreen() and 12 or 14
            }, { u3.createElement("UIStroke", {
                    Transparency = 0.3,
                    Color = Color3.fromRGB(0, 0, 0)
                }) });
        end;

        if v9 then
            v15[v17 + 2] = v9;
        end;

        local v18 = #v15;
        local v19 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v20 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 3)
            }), u3.createElement(Padding, {
                Padding = {
                    Vertical = 6,
                    Horizontal = 4
                }
            }) };
        local v21 = #v20;
        local v22;

        if u6.Icon == nil then
            v22 = false;
        else
            v22 = u3.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Image = u6.Icon,
                Size = UDim2.fromScale(1, 0.8)
            });
        end;

        if v22 then
            v20[v21 + 1] = v22;
        end;

        v20[#v20 + 1] = u3.createElement("TextLabel", {
            TextScaled = true,
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            Text = string.upper(u6.Text),
            Size = UDim2.fromScale(0.7, 1),
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextSize = DeviceUtil.isSmallScreen() and 12 or 14
        });
        v15.Content = u3.createElement(Empty, v19, v20);
        local v23 = u6[u3.Children];

        if v23 then
            for i, v in v23 do
                if type(i) == "number" then
                    v15[v18 + i] = v;
                else
                    v15[i] = v;
                end;
            end;
        end;

        return u3.createElement("ImageButton", v14, v15);
    end)
};