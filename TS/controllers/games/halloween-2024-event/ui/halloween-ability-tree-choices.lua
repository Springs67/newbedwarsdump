-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local HalloweenAbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-meta").HalloweenAbilityMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    HalloweenAbilityTreeChoices = v3.new(u2)(function(u4, p5) -- Line: 14
        -- upvalues: HalloweenAbilityMeta (copy), u2 (copy), TweenService (copy), ColorUtil (copy), SoundManager (copy), GameSound (copy), default (copy), AutoSizedText (copy), TooltipContainer (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6 = HalloweenAbilityMeta[u4.halloweenAbilityType];
        local u7 = u2.createRef();
        local u8, u9 = useState(nil);
        local u10, u11 = useState(nil);
        useEffect(function() -- Line: 21
            -- upvalues: u7 (copy), TweenService (ref), u9 (copy), u11 (copy)
            local v12 = u7:getValue();

            if not v12 then
                return nil;
            end;

            local v13 = TweenService:Create(v12, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                BackgroundTransparency = 0
            });
            local v14 = TweenService:Create(v12, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                BackgroundTransparency = 0.5
            });
            u9(v13);
            u11(v14);
        end, {});
        local v18 = {
            [u2.Ref] = u7,
            AnchorPoint = u4.AnchorPoint,
            Size = u4.Size,
            Position = u4.Position,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            BackgroundColor3 = ColorUtil.WHITE,
            AutoButtonColor = false,

            [u2.Event.Activated] = function(p15) -- Line: 44
                -- upvalues: SoundManager (ref), GameSound (ref), default (ref), u4 (copy)
                SoundManager:playSound(GameSound.UI_CLICK_2);
                default.Client:GetNamespace("Halloween2024Remotes"):Get("RequestSkillUpgrade"):SendToServer({
                    halloweenAbilityType = u4.halloweenAbilityType,
                    level = u4.level
                });
                u4.onSelected();
            end,

            [u2.Event.MouseEnter] = function(p16) -- Line: 52
                -- upvalues: u8 (copy)
                if u8 then
                    u8:Play();
                end;
            end,

            [u2.Event.MouseLeave] = function(p17) -- Line: 57
                -- upvalues: u10 (copy)
                if u10 then
                    u10:Play();
                end;
            end
        };
        local v19 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }) };
        local v20 = #v19;
        local v21 = {
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#999a6a")), ColorSequenceKeypoint.new(0.5, Color3.fromHex("#7a4d3c")), ColorSequenceKeypoint.new(1, Color3.fromHex("#3c3130")) })
        };
        local Rotation = u4.Rotation;
        v21.Rotation = Rotation == nil and 0 or Rotation;
        v19[v20 + 1] = u2.createElement("UIGradient", v21);
        v19[v20 + 2] = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 12,
            ZIndex = 3,
            TextScaled = true,
            Text = v6.hudDescription,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.75, 0.75),
            AutomaticSize = Enum.AutomaticSize.X,
            Font = Enum.Font.ArialBold,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextColor3 = Color3.fromHex("#F2F3F2")
        });
        local v22 = {};
        local v23 = {};
        local description = v6.description;
        v23.Text = description == nil and "" or description;
        v23.Font = Enum.Font.SourceSansBold;
        v23.TextSize = 16;
        v23.Limits = Vector2.new(300, 60);
        v22[#v22 + 1] = u2.createElement(AutoSizedText, v23);
        v19[v20 + 3] = u2.createElement(TooltipContainer, {}, v22);

        return u2.createFragment({
            HalloweenChoices = u2.createElement("ImageButton", v18, v19)
        });
    end)
};