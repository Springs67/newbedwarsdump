-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularProgress = v1.CircularProgress;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local HalloweenAbilityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-type").HalloweenAbilityType;
local HalloweenLevelConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-level-config").HalloweenLevelConfig;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local HalloweenAbilityTreeChoiceArea = RuntimeLib.import(script, script.Parent, "halloween-ability-tree-choice-area").HalloweenAbilityTreeChoiceArea;
local v24 = v3.new(u2)(function(p5, p6) -- Line: 15
    -- upvalues: HalloweenAbilityType (copy), default (copy), SoundManager (copy), GameSound (copy), u2 (copy), BedwarsImageId (copy), HalloweenLevelConfig (copy), CircularProgress (copy), HalloweenAbilityTreeChoiceArea (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7, u8 = useState(1);
    local v9, u10 = useState(0);
    local v11, u12 = useState(false);
    local v13, u14 = useState(HalloweenAbilityType.DEATH_ADDER_COOLDOWN);
    local v15, u16 = useState(HalloweenAbilityType.DEATH_ADDER_COOLDOWN);
    useEffect(function() -- Line: 23
        -- upvalues: default (ref), SoundManager (ref), GameSound (ref), u8 (copy), u14 (copy), u16 (copy), u12 (copy), u10 (copy)
        default.Client:GetNamespace("Halloween2024Remotes"):Get("PlayerLevelUp"):Connect(function(p17) -- Line: 24
            -- upvalues: SoundManager (ref), GameSound (ref), u8 (ref), u14 (ref), u16 (ref), u12 (ref)
            SoundManager:playSound(GameSound.MATCH_LEVEL_UP_2);
            u8(p17.level);

            if p17.ability1 ~= nil then
                u14(p17.ability1);
            end;

            if p17.ability2 ~= nil then
                u16(p17.ability2);
            end;

            u12(true);
        end);
        default.Client:GetNamespace("Halloween2024Remotes"):Get("ExperienceProgress"):Connect(function(p18) -- Line: 35
            -- upvalues: u10 (ref)
            u10(p18.experience);
        end);
    end, { v9 });
    local v19 = {
        DisplayOrder = 10,
        ResetOnSpawn = false
    };
    local v20 = {};
    local _ = #v20;
    local v21 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.99),
        Size = UDim2.fromScale(0.6, 0.08)
    };
    local v22 = {
        u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 9
        }),
        u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 7,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.2, 1.7),
            Position = UDim2.fromScale(1.2, 0.5),
            Image = BedwarsImageId.MISSION_TICKET_GLOW,
            ImageTransparency = 1 - v9 / HalloweenLevelConfig.EXPERIENCE_NEEDED_PER_LEVEL
        }),
        BackgroundCircle = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScaleType = "Fit",
            ZIndex = 9,
            AnchorPoint = Vector2.new(0.5, 0),
            Size = UDim2.fromScale(0.1, 0.8),
            Position = UDim2.fromScale(1.2, 0),
            Image = BedwarsImageId.CIRCLE_PROGRESS_BAR,
            ImageColor3 = Color3.fromHex("#1d1a1e")
        }),
        LevelBackground = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScaleType = "Fit",
            ZIndex = 8,
            AnchorPoint = Vector2.new(0.5, 0),
            Size = UDim2.fromScale(0.1, 0.8),
            Position = UDim2.fromScale(1.2, 0),
            Image = BedwarsImageId.CIRCLE_SOILD,
            ImageColor3 = Color3.fromHex("#2f2f2d")
        }, { u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextStrokeTransparency = 0,
                TextScaled = true,
                ZIndex = 11,
                Text = tostring(v7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.4, 0.4),
                AutomaticSize = Enum.AutomaticSize.X,
                Font = Enum.Font.ArialBold,
                TextStrokeColor3 = Color3.fromHex("#aa7c47"),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextColor3 = Color3.fromHex("#f6cd8e")
            }) }),
        u2.createElement(CircularProgress, {
            ZIndex = 10,
            AnchorPoint = Vector2.new(0.5, 0),
            Size = UDim2.fromScale(0.1, 0.8),
            Position = UDim2.fromScale(1.2, 0),
            Progress = v9,
            Color = Color3.fromHex("#aa7c47")
        })
    };
    local v23 = #v22;

    if v11 then
        v11 = u2.createElement(HalloweenAbilityTreeChoiceArea, {
            level = v7,
            halloweenAbilityOne = v13,
            halloweenAbilityTwo = v15,

            onSelected = function() -- Line: 117, Name: onSelected
                -- upvalues: u12 (copy)
                return u12(false);
            end
        });
    end;

    if v11 then
        v22[v23 + 1] = v11;
    end;

    v20.HalloweenTreeArea = u2.createElement("Frame", v21, v22);

    return u2.createElement("ScreenGui", v19, v20);
end);

return {
    HalloweenAbilityTreeApp = v4.connect(function(p25, p26) -- Line: 128
        local v27 = {};

        for i, v in p26 do
            v27[i] = v;
        end;

        return v27;
    end)(v24)
};