-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ORB_DECAY_SECONDS = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wind-walker", "wind-walker-util").WindWalkerUtil.ORB_DECAY_SECONDS;
local v2 = u1.Component:extend("WindWalkerStatus");

function v2.init(p3, p4) -- Line: 12
    -- upvalues: u1 (copy)
    p3.stackRef = u1.createRef();
    p3.timerRef = u1.createRef();
    p3:setState({
        stack = 0,
        time = 0
    });
end;

function v2.render(p5) -- Line: 20
    -- upvalues: u1 (copy)
    return u1.createFragment({
        WindWalkerEffect = u1.createElement("Frame", {
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            Size = UDim2.fromScale(1.5, 1.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        }, {
            u1.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }),
            u1.createElement("UIStroke", {
                Color = Color3.fromRGB(255, 255, 255)
            }),
            EffectImage = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 1,
                Image = "rbxassetid://9871779816",
                Size = UDim2.fromScale(0.8, 0.8),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            }),
            EffectStack = u1.createElement("TextLabel", {
                [u1.Ref] = p5.stackRef,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.8, 0.8),
                Text = tostring(p5.state.stack),
                Font = Enum.Font.Roboto,
                TextSize = 24,
                BackgroundTransparency = 1,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                TextStrokeTransparency = 0
            }),
            EffectTimer = u1.createElement("TextLabel", {
                [u1.Ref] = p5.timerRef,
                Visible = p5.state.stack > 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 1),
                Text = p5:formattedTime(p5.state.time),
                Font = Enum.Font.Roboto,
                TextSize = 24,
                BackgroundTransparency = 1,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                TextStrokeTransparency = 0
            }, { u1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 30)
                }) })
        })
    });
end;

function v2.didMount(u6) -- Line: 75
    -- upvalues: ClientSyncEvents (copy), ORB_DECAY_SECONDS (copy)
    ClientSyncEvents.WindWalkerOrbUpdate:connect(function(p7) -- Line: 76
        -- upvalues: u6 (copy), ORB_DECAY_SECONDS (ref)
        u6:setState({
            stack = p7.orbCount,
            time = p7.orbCount <= 0 and 0 or ORB_DECAY_SECONDS
        });
    end);
    u6:startTimer();
end;

function v2.startTimer(u8) -- Line: 84
    -- upvalues: RunService (copy)
    local u9 = 0;
    RunService.Heartbeat:Connect(function(p10) -- Line: 86
        -- upvalues: u9 (ref), u8 (copy)
        u9 = u9 + p10;

        if u9 >= 1 then
            u9 = 0;

            if u8.state.time > 0 then
                u8:setState({
                    time = u8.state.time - 1
                });
            end;
        end;
    end);
end;

function v2.formattedTime(p11, p12) -- Line: 99
    if p12 < 60 then
        if p12 < 10 then
            return "0:0" .. tostring(p12);
        end;

        return "0:" .. tostring(p12);
    end;

    local v13 = math.abs(60 - p12);

    if v13 < 10 then
        return "1:0" .. tostring(v13);
    end;

    return "1:" .. tostring(v13);
end;

return {
    WindWalkerStatus = v2
};