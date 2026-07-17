-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v20 = v4.new(u3)(function(u6, p7) -- Line: 15
    -- upvalues: u3 (copy), DeviceUtil (copy), u2 (copy), RunService (copy), SoundManager (copy), GameSound (copy), ColorUtil (copy), Padding (copy), Countdown (copy)
    local _ = p7.useState;
    local useEffect = p7.useEffect;
    local u8 = u3.createRef();
    local FrameProps = u6.FrameProps;

    if FrameProps ~= nil then
        FrameProps = FrameProps.ZIndex;
    end;

    local v9 = DeviceUtil.isMobileControls();
    local AnnouncementText = u6.AnnouncementText;
    useEffect(function() -- Line: 29
        -- upvalues: u8 (copy), u2 (ref), RunService (ref), u6 (copy), SoundManager (ref), GameSound (ref)
        local u10 = true;
        local u11 = u8:getValue();
        local u12 = u2.new();

        if not u11 then
            return nil;
        end;

        u12:GiveTask(RunService.Heartbeat:Connect(function(p13) -- Line: 37
            -- upvalues: u11 (copy)
            u11.Rotation = (u11.Rotation + 360 * p13) % 360;
        end));

        if not u6.DisableSounds then
            task.spawn(function() -- Line: 43
                -- upvalues: u10 (ref), SoundManager (ref), GameSound (ref)
                while u10 do
                    SoundManager:playSound(GameSound.COUNTDOWN_TICK);
                    task.wait(1);
                end;
            end);
        end;

        return function() -- Line: 50
            -- upvalues: u12 (copy), u10 (ref)
            u12:DoCleaning();
            u10 = false;
        end;
    end, {});
    local v14 = {
        DisplayOrder = 20,
        IgnoreGuiInset = true,
        ResetOnSpawn = false
    };
    local v15 = {};
    local createElement = u3.createElement;
    local v16 = {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.2, 0.08),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v17;

    if v9 then
        v17 = UDim2.fromScale(0.5, 0.22);
    else
        v17 = UDim2.fromScale(0.5, 0.125);
    end;

    v16.Position = v17;
    v16.BackgroundColor3 = ColorUtil.BLACK;
    v16.ZIndex = FrameProps;
    v15.BridgeDuelRoundAnnouncementFrame = createElement("Frame", v16, {
        TouchdownScoredText = u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextStrokeTransparency = 0,
            TextWrapped = true,
            Text = (AnnouncementText == "" or not AnnouncementText) and "" or AnnouncementText,
            Size = UDim2.fromScale(1, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Font = Enum.Font.GothamBold,
            TextColor3 = Color3.fromRGB(245, 245, 220),
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
    local _ = #v15;
    local v18 = {
        BackgroundTransparency = 0.3,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.08, 0.06),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v19;

    if v9 then
        v19 = UDim2.fromScale(0.5, 0.27);
    else
        v19 = UDim2.fromScale(0.5, 0.2);
    end;

    v18.Position = v19;
    v18.BackgroundColor3 = ColorUtil.BLACK;
    local FrameProps2 = u6.FrameProps;

    if FrameProps2 then
        for i, v in FrameProps2 do
            v18[i] = v;
        end;
    end;

    v18.ZIndex = FrameProps;
    v15.BridgeDuelRoundCountdownGuiFrame = u3.createElement("Frame", v18, {
        u3.createElement("UIStroke", {
            Thickness = 2,
            Color = ColorUtil.WHITE
        }, { u3.createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.3, 1), NumberSequenceKeypoint.new(1, 1) }),
                [u3.Ref] = u8
            }) }),
        u3.createElement(Padding, {
            Padding = UDim.new(0.1, 0)
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }),
        u3.createElement(Countdown, {
            DisableHideOnComplete = true,
            OnCompleteText = "DUEL!",
            EndTime = u6.EndTime,
            CountdownConfig = {
                days = false,
                hours = false,
                minutes = false
            },
            TextLabel = {
                ZIndex = FrameProps
            }
        })
    });

    return u3.createFragment({
        BridgeDuelRoundCountdownScreenGui = u3.createElement("ScreenGui", v14, v15)
    });
end);

return {
    BridgeDuelRoundCountdownGui = v5.connect(function(p21, p22) -- Line: 140
        local v23 = {};

        for i, v in p22 do
            v23[i] = v;
        end;

        return v23;
    end)(v20)
};