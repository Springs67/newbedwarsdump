-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    InfectedClassSelectButton = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: default (copy), DeviceUtil (copy), Players (copy), ColorUtil (copy), u2 (copy), SoundManager (copy), GameSound (copy), ShineEffect (copy), ShineEffectVariation (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local u6, u7 = useState(false);
        local v8, u9 = useState(false);

        local function _(p10) -- Line: 19
            -- upvalues: default (ref)
            default.Client:Get("InfectedSelectVariant"):SendToServer({
                variantType = p10
            });
        end;

        useEffect(function() -- Line: 24
            -- upvalues: DeviceUtil (ref), Players (ref), u4 (copy), u7 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local function _() -- Line: 28
                -- upvalues: Players (ref), u4 (ref), u7 (ref)
                if Players.LocalPlayer:GetAttribute("InfectedVariantType") == u4.VariantType then
                    u7(true);

                    return;
                end;

                u7(false);
            end;

            if Players.LocalPlayer:GetAttribute("InfectedVariantType") == u4.VariantType then
                u7(true);
            else
                u7(false);
            end;

            local u11 = Players.LocalPlayer:GetAttributeChangedSignal("InfectedVariantType"):Connect(function() -- Line: 37
                -- upvalues: Players (ref), u4 (ref), u7 (ref)
                if Players.LocalPlayer:GetAttribute("InfectedVariantType") == u4.VariantType then
                    u7(true);

                    return;
                end;

                u7(false);
            end);

            return function() -- Line: 40
                -- upvalues: u11 (copy)
                return u11:Disconnect();
            end;
        end, {});
        local v12 = {
            Size = UDim2.fromScale(0.2, 0.85)
        };
        local v13;

        if v8 then
            v13 = ColorUtil.WHITE;
        else
            v13 = ColorUtil.BLACK;
        end;

        v12.BackgroundColor3 = v13;
        v12.BackgroundTransparency = 0.7;
        v12.LayoutOrder = u4.LayoutOrder;

        v12[u2.Event.Activated] = function() -- Line: 49
            -- upvalues: u6 (copy), u4 (copy), default (ref), SoundManager (ref), GameSound (ref)
            if u6 then
                return nil;
            end;

            local VariantType = u4.VariantType;
            default.Client:Get("InfectedSelectVariant"):SendToServer({
                variantType = VariantType
            });
            SoundManager:playSound(GameSound.UI_CLICK_2);
        end;

        v12[u2.Event.MouseEnter] = function() -- Line: 56
            -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref)
            u9(true);
            SoundManager:playSound(GameSound.UI_HOVER);
        end;

        v12[u2.Event.MouseLeave] = function() -- Line: 60
            -- upvalues: u9 (copy)
            u9(false);
        end;

        local v14 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }) };
        local v15 = #v14;
        local v16 = not u6 and u2.createElement(ShineEffect, {
            OnHover = true,
            ZIndex = 100,
            Variation = ShineEffectVariation.solid
        });

        if v16 then
            v14[v15 + 1] = v16;
        end;

        local v17 = #v14;

        if u6 then
            u6 = u2.createFragment({
                Overlay = u2.createElement("Frame", {
                    BackgroundTransparency = 0.3,
                    BorderSizePixel = 0,
                    ZIndex = 11,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.BLACK
                }, {
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }),
                    VariantName = u2.createElement("TextLabel", {
                        Text = "EQUIPPED",
                        TextScaled = true,
                        TextStrokeTransparency = 1,
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        ZIndex = 12,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(0.8, 0.15),
                        FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                        TextColor3 = ColorUtil.WHITE
                    })
                })
            });
        end;

        if u6 then
            v14[v17 + 1] = u6;
        end;

        local _ = #v14;
        v14.VariantRender = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            ScaleType = Enum.ScaleType.Fit,
            Image = u4.Metadata.image
        });
        v14.VariantName = u2.createElement("TextLabel", {
            TextScaled = true,
            TextStrokeTransparency = 1,
            TextYAlignment = "Center",
            BackgroundTransparency = 1,
            ZIndex = 10,
            Text = string.upper(u4.VariantType),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 0.9),
            Size = UDim2.fromScale(0.8, 0.15),
            FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
            TextColor3 = ColorUtil.WHITE
        }, { u2.createElement("UIStroke", {
                Color = ColorUtil.BLACK
            }) });

        return u2.createFragment({
            SelectBanner = u2.createElement("ImageButton", v12, v14)
        });
    end)
};