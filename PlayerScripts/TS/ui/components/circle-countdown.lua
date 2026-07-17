-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local CountdownComponent = RuntimeLib.import(script, script.Parent.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "shop-tab", "countdown-component").CountdownComponent;

local function v15(p5, p6) -- Line: 11
    -- upvalues: u3 (copy), u2 (copy), RunService (copy), ColorUtil (copy), Padding (copy), CountdownComponent (copy)
    local _ = p6.useState;
    local useEffect = p6.useEffect;
    local u7 = u3.createRef();
    local FrameProps = p5.FrameProps;

    if FrameProps ~= nil then
        FrameProps = FrameProps.ZIndex;
    end;

    useEffect(function() -- Line: 20
        -- upvalues: u7 (copy), u2 (ref), RunService (ref)
        local u8 = true;
        local u9 = u7:getValue();
        local u10 = u2.new();

        if not u9 then
            return nil;
        end;

        u10:GiveTask(RunService.Heartbeat:Connect(function(p11) -- Line: 28
            -- upvalues: u9 (copy)
            u9.Rotation = (u9.Rotation + 360 * p11) % 360;
        end));

        return function() -- Line: 32
            -- upvalues: u10 (copy), u8 (ref)
            u10:DoCleaning();
            u8 = false;
        end;
    end, {});
    local v12 = {
        BackgroundTransparency = 0.3,
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = ColorUtil.BLACK
    };
    local FrameProps2 = p5.FrameProps;

    if FrameProps2 then
        for i, v in FrameProps2 do
            v12[i] = v;
        end;
    end;

    v12.ZIndex = FrameProps;
    local v13 = { u3.createElement("UIStroke", {
            Thickness = 2,
            Color = ColorUtil.WHITE
        }, { u3.createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.3, 1), NumberSequenceKeypoint.new(1, 1) }),
                [u3.Ref] = u7
            }) }), u3.createElement(Padding, {
            Padding = UDim.new(0.1, 0)
        }), u3.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }) };
    local v14 = {
        MaxTextSize = 70,
        TextXAlignment = "Center",
        TextScaled = true,
        EndTime = p5.EndTime,
        CountdownOptions = {
            days = false,
            hours = false,
            minutes = false,
            seconds = true
        },
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.75, 0.55),
        ZIndex = FrameProps,
        EnableCountdownSounds = not p5.DisableSounds
    };
    local OnlyPlaySoundLastNSec = p5.OnlyPlaySoundLastNSec;

    if OnlyPlaySoundLastNSec == nil then
        OnlyPlaySoundLastNSec = nil;
    end;

    v14.OnlyPlaySoundLastNSec = OnlyPlaySoundLastNSec;
    v14.PlayCustomSoundAtTime = p5.PlayCustomSoundAtTime;
    v13[#v13 + 1] = u3.createElement(CountdownComponent, v14);

    return u3.createFragment({
        FirstDropTimeCountdown = u3.createElement("Frame", v12, v13)
    });
end;

return {
    CircleCountdownComponent = v15,
    CircleCountdown = v4.new(u3)(v15)
};