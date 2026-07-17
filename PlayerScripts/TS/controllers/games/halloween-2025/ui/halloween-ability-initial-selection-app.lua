-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local getHalloweenKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kit-meta").getHalloweenKitMeta;
local HalloweenKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local HalloweenAbilityCharacterPanel = RuntimeLib.import(script, script.Parent, "halloween-ability-character-panel").HalloweenAbilityCharacterPanel;
local v40 = v3.new(u2)(function(p5, p6) -- Line: 18
    -- upvalues: HalloweenKit (copy), u2 (copy), getHalloweenKitMeta (copy), SoundManager (copy), GameSound (copy), default (copy), Flamework (copy), DeviceUtil (copy), DarkBackground (copy), HalloweenAbilityCharacterPanel (copy), Theme (copy), ColorUtil (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7, u8 = useState(0);
    local u9, u10 = useState(HalloweenKit.NONE);
    local u11 = u2.createRef();
    local u12 = u2.createRef();
    local u13 = u2.createRef();

    local function u15(u14) -- Line: 27
        -- upvalues: u8 (copy), u15 (ref)
        if u14 < 4 then
            task.delay(0.5, function() -- Line: 29
                -- upvalues: u8 (ref), u14 (copy), u15 (ref)
                u8(u14 + 1);
                u15(u14 + 1);
            end);
        end;
    end;

    local function u21(p16) -- Line: 35
        -- upvalues: u11 (copy), u12 (copy), u13 (copy), getHalloweenKitMeta (ref), u10 (copy)
        local v17 = u11:getValue();
        local v18 = u12:getValue();
        local v19 = u13:getValue();
        local v20 = getHalloweenKitMeta(p16);

        if v18 then
            v18.Text = v20.name;
        end;

        if v19 then
            v19.Text = v20.description;
        end;

        if v17 then
            v17.Visible = true;
        end;

        u10(p16);
    end;

    useEffect(function() -- Line: 51
        -- upvalues: u15 (ref)
        u15(0);
    end, {});

    local function u23(p22) -- Line: 54
        -- upvalues: SoundManager (ref), GameSound (ref), default (ref), Flamework (ref)
        SoundManager:playSound(GameSound.UI_CLICK_2);
        default.Client:GetNamespace("Halloween2025Remotes"):Get("PlayerSelectKit"):SendToServer({
            kitSelected = p22
        });
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("HalloweenAbilityInitialSelectionApp");
    end;

    local v24 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v25 = { u2.createElement(DarkBackground, {
            BackgroundTransparency = 0.9,
            DisableCloseOnClick = true,
            AppId = p5.AppId
        }) };
    local v26 = {
        BackgroundTransparency = 1,
        Modal = true,
        Size = UDim2.fromScale(1, 0.9),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v27 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.04, 0)
        }), u2.createElement("TextLabel", {
            Text = "Select Your Power",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextStrokeTransparency = 0,
            TextScaled = true,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 0.08),
            AutomaticSize = Enum.AutomaticSize.X,
            Font = Enum.Font.LuckiestGuy,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextColor3 = Color3.fromRGB(255, 200, 0)
        }, { u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new(Color3.fromHex("#fb6809"), Color3.fromHex("#fad300"))
            }) }) };
    local _ = #v27;
    local v28 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.6, 0.65)
    };
    local v29 = {};
    local v30 = #v29;
    local v31;

    if v7 >= 1 then
        v31 = u2.createElement(HalloweenAbilityCharacterPanel, {
            HalloweenKit = HalloweenKit.NAZAR,
            Position = UDim2.fromScale(-0.075, 0.5),

            OnClick = function() -- Line: 119, Name: OnClick
                -- upvalues: u21 (copy), HalloweenKit (ref)
                u21(HalloweenKit.NAZAR);
            end,

            Selected = u9 == HalloweenKit.NAZAR
        });
    else
        v31 = false;
    end;

    if v31 then
        v29[v30 + 1] = v31;
    end;

    local v32 = #v29;
    local v33;

    if v7 >= 2 then
        v33 = u2.createElement(HalloweenAbilityCharacterPanel, {
            HalloweenKit = HalloweenKit.REBELLION_LEADER,
            Position = UDim2.fromScale(0.15, 0.5),

            OnClick = function() -- Line: 131, Name: OnClick
                -- upvalues: u21 (copy), HalloweenKit (ref)
                u21(HalloweenKit.REBELLION_LEADER);
            end,

            Selected = u9 == HalloweenKit.REBELLION_LEADER
        });
    else
        v33 = false;
    end;

    if v33 then
        v29[v32 + 1] = v33;
    end;

    local v34 = #v29;
    local v35;

    if v7 >= 2 then
        v35 = u2.createElement(HalloweenAbilityCharacterPanel, {
            HalloweenKit = HalloweenKit.MELODY,
            Position = UDim2.fromScale(0.375, 0.5),

            OnClick = function() -- Line: 143, Name: OnClick
                -- upvalues: u21 (copy), HalloweenKit (ref)
                u21(HalloweenKit.MELODY);
            end,

            Selected = u9 == HalloweenKit.MELODY
        });
    else
        v35 = false;
    end;

    if v35 then
        v29[v34 + 1] = v35;
    end;

    local v36 = #v29;
    local v37;

    if v7 >= 2 then
        v37 = u2.createElement(HalloweenAbilityCharacterPanel, {
            HalloweenKit = HalloweenKit.SUMMONER,
            Position = UDim2.fromScale(0.6, 0.5),

            OnClick = function() -- Line: 155, Name: OnClick
                -- upvalues: u21 (copy), HalloweenKit (ref)
                u21(HalloweenKit.SUMMONER);
            end,

            Selected = u9 == HalloweenKit.SUMMONER
        });
    else
        v37 = false;
    end;

    if v37 then
        v29[v36 + 1] = v37;
    end;

    local v38 = #v29;
    local v39;

    if v7 >= 2 then
        v39 = u2.createElement(HalloweenAbilityCharacterPanel, {
            HalloweenKit = HalloweenKit.SORCERER,
            Position = UDim2.fromScale(0.825, 0.5),

            OnClick = function() -- Line: 167, Name: OnClick
                -- upvalues: u21 (copy), HalloweenKit (ref)
                u21(HalloweenKit.SORCERER);
            end,

            Selected = u9 == HalloweenKit.SORCERER
        });
    else
        v39 = false;
    end;

    if v39 then
        v29[v38 + 1] = v39;
    end;

    v27.CharacterArea = u2.createElement("Frame", v28, v29);
    v27.BottomContainer = u2.createElement("Frame", {
        [u2.Ref] = u11,
        Size = UDim2.fromScale(0.7, 0.2),
        BorderSizePixel = 0,
        BackgroundColor3 = Theme.backgroundPrimary,
        BackgroundTransparency = 0,
        LayoutOrder = 2,
        Visible = false
    }, {
        u2.createElement("UIGradient", {
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 0, 64)), ColorSequenceKeypoint.new(1, Color3.fromRGB(56, 0, 64)) }),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.15, 0),
                NumberSequenceKeypoint.new(0.4, 0),
                NumberSequenceKeypoint.new(0.6, 0),
                NumberSequenceKeypoint.new(1, 1)
            })
        }),
        u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }),
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.05, 0)
        }),
        InfoArea = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.fromScale(0.75, 1)
        }, {
            u2.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new(Color3.fromHex("#fb6809"), Color3.fromHex("#fad300"))
            }),
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }),
            Name = u2.createElement("TextLabel", {
                [u2.Ref] = u12,
                Text = "Name",
                Size = UDim2.fromScale(0.9, 0.3),
                TextColor3 = Color3.fromRGB(255, 252, 135),
                BackgroundTransparency = 1,
                Font = Enum.Font.LuckiestGuy,
                TextScaled = true,
                LayoutOrder = 0
            }),
            Description = u2.createElement("TextLabel", {
                [u2.Ref] = u13,
                Text = "Description",
                Size = UDim2.fromScale(0.9, 0.5),
                TextColor3 = Color3.fromRGB(255, 252, 135),
                BackgroundTransparency = 1,
                Font = Enum.Font.Roboto,
                TextScaled = true,
                LayoutOrder = 1
            })
        }),
        ConfirmButton = u2.createElement("ImageButton", {
            Size = UDim2.fromScale(0.15, 0.9),
            BackgroundColor3 = ColorUtil.WHITE,
            BorderSizePixel = 0,
            LayoutOrder = 1,

            [u2.Event.Activated] = function() -- Line: 241
                -- upvalues: u23 (copy), u9 (copy)
                u23(u9);
            end
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("UIGradient", {
                Rotation = 45,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#fb6809")), ColorSequenceKeypoint.new(1, Color3.fromHex("#fad300")) })
            }), u2.createElement("TextLabel", {
                Text = "GO!",
                BackgroundTransparency = 1,
                TextScaled = true,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.8, 0.8),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.55),
                Font = Enum.Font.LuckiestGuy,
                TextYAlignment = Enum.TextYAlignment.Center
            }) })
    });
    v25[#v25 + 1] = u2.createElement("ImageButton", v26, v27);

    return u2.createElement("ScreenGui", v24, v25);
end);

return {
    HalloweenAbilityInitialSelectionApp = v4.connect(function(p41, p42) -- Line: 270
        local v43 = {};

        for i, v in p42 do
            v43[i] = v;
        end;

        return v43;
    end)(v40)
};