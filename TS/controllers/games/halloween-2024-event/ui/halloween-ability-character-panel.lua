-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    HalloweenAbilityCharacterPanel = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: BedwarsKitMeta (copy), BedwarsKit (copy), u2 (copy), SoundManager (copy), TweenService (copy), ColorUtil (copy), Theme (copy), BedwarsImageId (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6 = BedwarsKitMeta[u4.bedwarsKit];
        local v7 = u4.bedwarsKit == BedwarsKit.SORCERER;
        local u8 = u2.createRef();
        local u9 = u2.createRef();
        local u10, u11 = useState(nil);
        local u12, u13 = useState(nil);
        local u14, u15 = useState(nil);
        local u16, u17 = useState(nil);

        if not u4.Selected then
            if u12 then
                u12:Play();
            end;

            if u16 then
                u16:Play();
            end;
        end;

        useEffect(function() -- Line: 32
            -- upvalues: u8 (copy), u9 (copy), SoundManager (ref), TweenService (ref), u11 (copy), u13 (copy), u15 (copy), u17 (copy)
            local u18 = u8:getValue();
            local v19 = u9:getValue();

            if not (u18 and v19) then
                return nil;
            end;

            task.delay(0.4, function() -- Line: 42
                -- upvalues: SoundManager (ref)
                SoundManager:playSound("rbxassetid://10969529817", {});
            end);
            local v20 = TweenService:Create(u18, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ImageTransparency = 0.1
            });
            v20:Play();
            v20.Completed:Connect(function() -- Line: 49
                -- upvalues: TweenService (ref), u18 (copy)
                TweenService:Create(u18, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    ImageTransparency = 0.5
                }):Play();
            end);
            TweenService:Create(v19, TweenInfo.new(0.6000000000000001, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                BackgroundTransparency = 0.3
            }):Play();
            local v21 = TweenService:Create(u18, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ImageTransparency = 0
            });
            local v22 = TweenService:Create(u18, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                ImageTransparency = 0.5
            });
            local v23 = TweenService:Create(v19, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Size = UDim2.fromScale(0.27, 1.08)
            });
            local v24 = TweenService:Create(v19, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Size = UDim2.fromScale(0.25, 1)
            });
            u11(v21);
            u13(v22);
            u15(v23);
            u17(v24);
        end, {});
        local createFragment = u2.createFragment;
        local v25 = {};
        local v26 = u4.bedwarsKit .. "CharacterPanel";
        local createElement = u2.createElement;
        local v27 = {
            [u2.Ref] = u9,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = u4.Position,
            Size = UDim2.fromScale(0.25, 1),
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = 1,

            [u2.Event.Activated] = function() -- Line: 84
                -- upvalues: u4 (copy)
                u4.OnClick();
            end,

            [u2.Event.MouseEnter] = function() -- Line: 87
                -- upvalues: u4 (copy), u10 (copy), u14 (copy)
                if u4.Selected then
                    return nil;
                end;

                if u10 then
                    u10:Play();
                end;

                if u14 then
                    u14:Play();
                end;
            end,

            [u2.Event.MouseLeave] = function() -- Line: 98
                -- upvalues: u4 (copy), u12 (copy), u16 (copy)
                if u4.Selected then
                    return nil;
                end;

                if u12 then
                    u12:Play();
                end;

                if u16 then
                    u16:Play();
                end;
            end,

            ClipsDescendants = true,
            BorderSizePixel = 0
        };
        local v28 = {};
        local v29 = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        });
        local createElement2 = u2.createElement;
        local v30 = {
            [u2.Ref] = u8,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1.5, 1.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = Theme.backgroundPrimary,
            BorderSizePixel = 0
        };
        local v31;

        if v7 then
            v31 = BedwarsImageId.DEATH_ADDER_FLIPPED;
        else
            v31 = v6.renderImage;
        end;

        v30.Image = v31;
        v30.BackgroundTransparency = 1;
        v30.ScaleType = Enum.ScaleType.Crop;
        v30.ImageTransparency = 1;
        v28[1], v28[2] = v29, createElement2("ImageLabel", v30);
        v25[v26] = createElement("ImageButton", v27, v28);

        return createFragment(v25);
    end)
};