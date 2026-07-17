-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local TweenService = v4.TweenService;
local HalloweenUpgradeMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-upgrade-meta").HalloweenUpgradeMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    HalloweenAbilityTreeChoices = v3.new(u2)(function(u5, p6) -- Line: 16
        -- upvalues: HalloweenUpgradeMeta (copy), u2 (copy), TweenService (copy), ContextActionService (copy), SoundManager (copy), GameSound (copy), default (copy), ColorUtil (copy), AutoSizedText (copy), TooltipContainer (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7 = HalloweenUpgradeMeta[u5.halloweenAbilityType];
        local u8 = u2.createRef();
        local u9, u10 = useState(nil);
        local u11, u12 = useState(nil);
        useEffect(function() -- Line: 23
            -- upvalues: u8 (copy), TweenService (ref), u10 (copy), u12 (copy)
            local v13 = u8:getValue();

            if not v13 then
                return nil;
            end;

            local v14 = TweenService:Create(v13, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                BackgroundTransparency = 0
            });
            local v15 = TweenService:Create(v13, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                BackgroundTransparency = 0.5
            });
            u10(v14);
            u12(v15);
        end, {});
        useEffect(function() -- Line: 38
            -- upvalues: u5 (copy), ContextActionService (ref), SoundManager (ref), GameSound (ref), default (ref)
            local u16 = "halloween-event-tree-choice" .. u5.Hotkeys.Display;
            ContextActionService:BindAction(u16, function(p17, p18, p19) -- Line: 40
                -- upvalues: SoundManager (ref), GameSound (ref), default (ref), u5 (ref)
                if p18 == Enum.UserInputState.End then
                    SoundManager:playSound(GameSound.UI_CLICK_2);
                    default.Client:GetNamespace("Halloween2025Remotes"):Get("RequestSkillUpgrade"):SendToServer({
                        halloweenUpgradeType = u5.halloweenAbilityType,
                        level = u5.level
                    });
                    u5.onSelected();
                end;
            end, false, u5.Hotkeys.PC);

            return function() -- Line: 50
                -- upvalues: ContextActionService (ref), u16 (copy)
                ContextActionService:UnbindAction(u16);
            end;
        end, {});
        local v23 = {
            [u2.Ref] = u8,
            AnchorPoint = u5.AnchorPoint,
            Size = u5.Size,
            Position = u5.Position,
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            BackgroundColor3 = ColorUtil.WHITE,
            AutoButtonColor = false,

            [u2.Event.Activated] = function(p20) -- Line: 63
                -- upvalues: SoundManager (ref), GameSound (ref), default (ref), u5 (copy)
                SoundManager:playSound(GameSound.UI_CLICK_2);
                default.Client:GetNamespace("Halloween2025Remotes"):Get("RequestSkillUpgrade"):SendToServer({
                    halloweenUpgradeType = u5.halloweenAbilityType,
                    level = u5.level
                });
                u5.onSelected();
            end,

            [u2.Event.MouseEnter] = function(p21) -- Line: 71
                -- upvalues: u9 (copy)
                if u9 then
                    u9:Play();
                end;
            end,

            [u2.Event.MouseLeave] = function(p22) -- Line: 76
                -- upvalues: u11 (copy)
                if u11 then
                    u11:Play();
                end;
            end
        };
        local v24 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }) };
        local v25 = #v24;
        local v26 = {
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#999a6a")), ColorSequenceKeypoint.new(0.5, Color3.fromHex("#7a4d3c")), ColorSequenceKeypoint.new(1, Color3.fromHex("#3c3130")) })
        };
        local Rotation = u5.Rotation;
        v26.Rotation = Rotation == nil and 0 or Rotation;
        v24[v25 + 1] = u2.createElement("UIGradient", v26);
        v24[v25 + 2] = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 12,
            ZIndex = 3,
            TextScaled = true,
            Text = v7.hudDescription,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.75, 0.75),
            AutomaticSize = Enum.AutomaticSize.X,
            Font = Enum.Font.ArialBold,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextColor3 = Color3.fromHex("#F2F3F2")
        });
        local v27;

        if u5.Hotkeys.PC == nil then
            v27 = false;
        else
            local createElement = u2.createElement;
            local v28 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 3,
                TextScaled = true,
                Text = "(" .. u5.Hotkeys.PC.Name .. ")"
            };
            local v29;

            if u5.Hotkeys.Display == "LEFT" then
                v29 = Vector2.new(0.5, 0.5);
            else
                v29 = Vector2.new(0.5, 0.5);
            end;

            v28.AnchorPoint = v29;
            v28.Position = UDim2.fromScale(u5.Hotkeys.Display == "LEFT" and -0.05 or 1.05, 0.5);
            v28.Size = UDim2.fromScale(0.5, 0.75);
            v28.Font = Enum.Font.ArialBold;
            v28.TextXAlignment = Enum.TextXAlignment.Center;
            v28.TextColor3 = Color3.fromHex("#F2F3F2");
            v27 = createElement("TextLabel", v28, { u2.createElement("UIStroke", {
                    Thickness = 1,
                    Color = ColorUtil.BLACK
                }) });
        end;

        if v27 then
            v24[v25 + 3] = v27;
        end;

        local v30 = {};
        local v31 = {};
        local description = v7.description;
        v31.Text = description == nil and "" or description;
        v31.Font = Enum.Font.SourceSansBold;
        v31.TextSize = 16;
        v31.Limits = Vector2.new(300, 60);
        v30[#v30 + 1] = u2.createElement(AutoSizedText, v31);
        v24[#v24 + 1] = u2.createElement(TooltipContainer, {}, v30);

        return u2.createFragment({
            HalloweenChoices = u2.createElement("ImageButton", v23, v24)
        });
    end)
};