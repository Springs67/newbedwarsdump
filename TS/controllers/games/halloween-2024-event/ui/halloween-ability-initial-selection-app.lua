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
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local HalloweenAbilityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-util").HalloweenAbilityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local HalloweenAbilityCharacterPanel = RuntimeLib.import(script, script.Parent, "halloween-ability-character-panel").HalloweenAbilityCharacterPanel;
local v37 = v3.new(u2)(function(p5, p6) -- Line: 19
    -- upvalues: BedwarsKit (copy), u2 (copy), getBedwarsKitMeta (copy), SoundManager (copy), GameSound (copy), HalloweenAbilityUtil (copy), default (copy), Flamework (copy), DeviceUtil (copy), DarkBackground (copy), HalloweenAbilityCharacterPanel (copy), Theme (copy), ColorUtil (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7, u8 = useState(0);
    local u9, u10 = useState(BedwarsKit.NONE);
    local u11 = u2.createRef();
    local u12 = u2.createRef();
    local u13 = u2.createRef();

    local function u15(u14) -- Line: 28
        -- upvalues: u8 (copy), u15 (ref)
        if u14 < 4 then
            task.delay(0.5, function() -- Line: 30
                -- upvalues: u8 (ref), u14 (copy), u15 (ref)
                u8(u14 + 1);
                u15(u14 + 1);
            end);
        end;
    end;

    local function u21(p16) -- Line: 36
        -- upvalues: u11 (copy), u12 (copy), u13 (copy), getBedwarsKitMeta (ref), u10 (copy)
        local v17 = u11:getValue();
        local v18 = u12:getValue();
        local v19 = u13:getValue();
        local v20 = getBedwarsKitMeta(p16);

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

    useEffect(function() -- Line: 52
        -- upvalues: u15 (ref)
        u15(0);
    end, {});

    local function u24(p22) -- Line: 55
        -- upvalues: SoundManager (ref), GameSound (ref), HalloweenAbilityUtil (ref), default (ref), Flamework (ref)
        SoundManager:playSound(GameSound.UI_CLICK_2);
        local v23 = HalloweenAbilityUtil.halloweenStarterAbilityMap[p22];

        if v23 then
            default.Client:GetNamespace("Halloween2024Remotes"):Get("RequestSkillUpgrade"):SendToServer({
                level = 1,
                halloweenAbilityType = v23
            });
        else
            warn("Starter ability for " .. p22 .. " is undefined.");
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("HalloweenAbilityInitialSelectionApp");
    end;

    local v25 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v26 = { u2.createElement(DarkBackground, {
            BackgroundTransparency = 0.9,
            DisableCloseOnClick = true,
            AppId = p5.AppId
        }) };
    local v27 = {
        BackgroundTransparency = 1,
        Modal = true,
        Size = UDim2.fromScale(1, 0.9),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v28 = { u2.createElement("UIListLayout", {
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
    local _ = #v28;
    local v29 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.6, 0.65)
    };
    local v30 = {};
    local v31 = #v30;
    local v32;

    if v7 >= 1 then
        v32 = u2.createElement(HalloweenAbilityCharacterPanel, {
            bedwarsKit = BedwarsKit.SUMMONER,
            Position = UDim2.fromScale(-0.075, 0.5),

            OnClick = function() -- Line: 128, Name: OnClick
                -- upvalues: u21 (copy), BedwarsKit (ref)
                u21(BedwarsKit.SUMMONER);
            end,

            Selected = u9 == BedwarsKit.SUMMONER
        });
    else
        v32 = false;
    end;

    if v32 then
        v30[v31 + 1] = v32;
    end;

    local v33 = #v30;
    local v34;

    if v7 >= 2 then
        v34 = u2.createElement(HalloweenAbilityCharacterPanel, {
            bedwarsKit = BedwarsKit.SORCERER,
            Position = UDim2.fromScale(0.525, 0.5),

            OnClick = function() -- Line: 140, Name: OnClick
                -- upvalues: u21 (copy), BedwarsKit (ref)
                u21(BedwarsKit.SORCERER);
            end,

            Selected = u9 == BedwarsKit.SORCERER
        });
    else
        v34 = false;
    end;

    if v34 then
        v30[v33 + 1] = v34;
    end;

    local v35 = #v30;
    local v36;

    if v7 >= 3 then
        v36 = u2.createElement(HalloweenAbilityCharacterPanel, {
            bedwarsKit = BedwarsKit.REBELLION_LEADER,
            Position = UDim2.fromScale(0.825, 0.5),

            OnClick = function() -- Line: 152, Name: OnClick
                -- upvalues: u21 (copy), BedwarsKit (ref)
                u21(BedwarsKit.REBELLION_LEADER);
            end,

            Selected = u9 == BedwarsKit.REBELLION_LEADER
        });
    else
        v36 = false;
    end;

    if v36 then
        v30[v35 + 1] = v36;
    end;

    v28.CharacterArea = u2.createElement("Frame", v29, v30);
    v28.BottomContainer = u2.createElement("Frame", {
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

            [u2.Event.Activated] = function() -- Line: 226
                -- upvalues: u24 (copy), u9 (copy)
                u24(u9);
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
    v26[#v26 + 1] = u2.createElement("ImageButton", v27, v28);

    return u2.createElement("ScreenGui", v25, v26);
end);

return {
    HalloweenAbilityInitialSelectionApp = v4.connect(function(p38, p39) -- Line: 255
        local v40 = {};

        for i, v in p39 do
            v40[i] = v;
        end;

        return v40;
    end)(v37)
};