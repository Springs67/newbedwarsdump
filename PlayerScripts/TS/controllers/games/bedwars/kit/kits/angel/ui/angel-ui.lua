-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v27 = v3.new(u2)(function(p5, p6) -- Line: 13
    -- upvalues: ColorUtil (copy), DeviceUtil (copy), default (copy), Players (copy), u2 (copy), Empty (copy), ProgressBar (copy)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7, u8 = useState(0);
    local u9, u10 = useState(0);
    local v11, u12 = useState("0%");
    local v13, u14 = useState(true);
    local v15, u16 = useState("");
    local v17, u18 = useState(ColorSequence.new(ColorUtil.hexColor(14363435), ColorUtil.hexColor(14573407)));
    DeviceUtil.isMobileControls();
    useEffect(function() -- Line: 23
        -- upvalues: default (ref), u10 (copy), u8 (copy), u12 (copy), u14 (copy), Players (ref), u16 (copy), u18 (copy)
        default.Client:OnEvent("AngelProgress", function(p19) -- Line: 24
            -- upvalues: u10 (ref), u8 (ref), u12 (ref), u14 (ref)
            u10(p19.level);

            if p19.level >= 4 then
                u8(1);
                u12("");
                u14(false);

                return;
            end;

            u8(p19.newProgress);
            local v20 = math.floor(p19.newProgress * 100);
            u12(tostring(v20) .. "%");
        end);
        Players.LocalPlayer:GetAttributeChangedSignal("AngelType"):Connect(function() -- Line: 37
            -- upvalues: Players (ref), u16 (ref), u18 (ref)
            local v21 = Players.LocalPlayer:GetAttribute("AngelType");
            u16(v21);

            if v21 == "Light" then
                u18(ColorSequence.new(Color3.fromRGB(255, 217, 196), Color3.fromRGB(255, 184, 74)));

                return;
            end;

            if v21 == "Void" then
                u18(ColorSequence.new(Color3.fromRGB(173, 133, 207), Color3.fromRGB(51, 8, 87)));
            end;
        end);
    end, {});

    local function _() -- Line: 47
        -- upvalues: u9 (copy)
        return u9 >= 4 and "Angelic Tier MAX" or "Angelic Tier " .. tostring(u9);
    end;

    local v22 = {
        Size = UDim2.fromScale(0.7, 0.08),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.8)
    };
    local v23 = {
        u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder
        }),
        AngelLevelUI = u2.createElement(Empty, {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.5)
        }, { u2.createElement("TextLabel", {
                TextScaled = true,
                TextStrokeTransparency = 1,
                BackgroundTransparency = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 1),
                Text = u9 >= 4 and "Angelic Tier MAX" or "Angelic Tier " .. tostring(u9),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left
            }), u2.createElement("TextLabel", {
                TextScaled = true,
                TextStrokeTransparency = 1,
                BackgroundTransparency = 1,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 1),
                Text = v15,
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Right
            }) })
    };
    local _ = #v23;
    local v24 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.5)
    };
    local v25 = {};
    local v26 = #v25;

    if v13 then
        v13 = u2.createElement(ProgressBar, {
            AcceptZero = true,
            Title = {
                text = v11
            },
            Size = UDim2.fromScale(1, 1),
            Progress = v7,
            BarGradient = v17
        });
    end;

    if v13 then
        v25[v26 + 1] = v13;
    end;

    v23.AngelProgressBar = u2.createElement(Empty, v24, v25);

    return u2.createElement(Empty, v22, v23);
end);

return {
    AngelKitApp = v4.connect(function(p28, p29) -- Line: 117
        local v30 = {};

        for i, v in p29 do
            v30[i] = v;
        end;

        return v30;
    end)(v27)
};