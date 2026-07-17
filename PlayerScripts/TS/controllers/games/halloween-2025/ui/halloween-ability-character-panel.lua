-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local getHalloweenKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kit-meta").getHalloweenKitMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    HalloweenAbilityCharacterPanel = v3.new(u2)(function(u4, p5) -- Line: 11
        -- upvalues: getHalloweenKitMeta (copy), u2 (copy), SoundManager (copy), TweenService (copy), ColorUtil (copy), Theme (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6 = getHalloweenKitMeta(u4.HalloweenKit);
        local u7 = u2.createRef();
        local u8 = u2.createRef();
        local u9, u10 = useState(nil);
        local u11, u12 = useState(nil);
        local u13, u14 = useState(nil);
        local u15, u16 = useState(nil);

        if not u4.Selected then
            if u11 then
                u11:Play();
            end;

            if u15 then
                u15:Play();
            end;
        end;

        useEffect(function() -- Line: 29
            -- upvalues: u7 (copy), u8 (copy), SoundManager (ref), TweenService (ref), u10 (copy), u12 (copy), u14 (copy), u16 (copy)
            local u17 = u7:getValue();
            local v18 = u8:getValue();

            if not (u17 and v18) then
                return nil;
            end;

            task.delay(0.4, function() -- Line: 39
                -- upvalues: SoundManager (ref)
                SoundManager:playSound("rbxassetid://10969529817", {});
            end);
            local v19 = TweenService:Create(u17, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ImageTransparency = 0.1
            });
            v19:Play();
            v19.Completed:Connect(function() -- Line: 46
                -- upvalues: TweenService (ref), u17 (copy)
                TweenService:Create(u17, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ImageTransparency = 0.5
                }):Play();
            end);
            TweenService:Create(v18, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                BackgroundTransparency = 0.3
            }):Play();
            local v20 = TweenService:Create(u17, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ImageTransparency = 0
            });
            local v21 = TweenService:Create(u17, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ImageTransparency = 0.5
            });
            local v22 = TweenService:Create(v18, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Size = UDim2.fromScale(0.27, 1.08)
            });
            local v23 = TweenService:Create(v18, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Size = UDim2.fromScale(0.25, 1)
            });
            u10(v20);
            u12(v21);
            u14(v22);
            u16(v23);
        end, {});

        return u2.createFragment({
            [u4.HalloweenKit .. "CharacterPanel"] = u2.createElement("ImageButton", {
                [u2.Ref] = u8,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = u4.Position,
                Size = UDim2.fromScale(0.15, 1),
                BackgroundColor3 = ColorUtil.BLACK,
                BackgroundTransparency = 1,

                [u2.Event.Activated] = function() -- Line: 81
                    -- upvalues: u4 (copy)
                    u4.OnClick();
                end,

                [u2.Event.MouseEnter] = function() -- Line: 84
                    -- upvalues: u4 (copy), u9 (copy), u13 (copy)
                    if u4.Selected then
                        return nil;
                    end;

                    if u9 then
                        u9:Play();
                    end;

                    if u13 then
                        u13:Play();
                    end;
                end,

                [u2.Event.MouseLeave] = function() -- Line: 95
                    -- upvalues: u4 (copy), u11 (copy), u15 (copy)
                    if u4.Selected then
                        return nil;
                    end;

                    if u11 then
                        u11:Play();
                    end;

                    if u15 then
                        u15:Play();
                    end;
                end,

                ClipsDescendants = true,
                BorderSizePixel = 0
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 8)
                }), u2.createElement("ImageLabel", {
                    [u2.Ref] = u7,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1.5, 1.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundColor3 = Theme.backgroundPrimary,
                    BorderSizePixel = 0,
                    Image = v6.renderImage,
                    BackgroundTransparency = 1,
                    ScaleType = Enum.ScaleType.Crop,
                    ImageTransparency = 1
                }) })
        });
    end)
};