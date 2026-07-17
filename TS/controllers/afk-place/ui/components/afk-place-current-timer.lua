-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local v20 = v3.new(u2)(function(u5, p6) -- Line: 11
    -- upvalues: u2 (copy), TweenService (copy), AfkPlaceUtils (copy), ColorUtil (copy), DeviceUtil (copy)
    local useEffect = p6.useEffect;
    local v9, u10 = p6.useState(function() -- Line: 14
        -- upvalues: u5 (copy)
        local AfkStartTime = u5.AfkStartTime;
        local v7 = math.floor(AfkStartTime / 3600);
        local v8 = math.floor(AfkStartTime % 3600 / 60);

        return string.format("%02i", v7) .. ":" .. string.format("%02i", v8) .. ":" .. string.format("%02i", AfkStartTime % 60);
    end);
    local u11 = u2.createRef();
    local u12 = u2.createRef();

    local function u14(p13) -- Line: 23
        -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
        if not p13 then
            return nil;
        end;

        TweenService:Create(p13, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            TextTransparency = 1,
            TextStrokeTransparency = 1
        }):Play();
    end;

    useEffect(function() -- Line: 33
        -- upvalues: u5 (copy), u11 (copy), u12 (copy), u14 (copy), u10 (copy), ColorUtil (ref)
        local AfkStartTime = u5.AfkStartTime;
        local v15 = u11:getValue();
        local v16 = u12:getValue();

        if u5.ReturnButtonPressed then
            u14(v15);
            u14(v16);
        end;

        local function u19() -- Line: 42
            -- upvalues: AfkStartTime (ref), u5 (ref), u10 (ref), ColorUtil (ref), u19 (ref)
            task.delay(1, function() -- Line: 43
                -- upvalues: AfkStartTime (ref), u5 (ref), u10 (ref), ColorUtil (ref), u19 (ref)
                AfkStartTime = os.time() - u5.MountedStartTime + u5.AfkStartTime;
                local v17 = math.floor(AfkStartTime / 3600);
                local v18 = math.floor(AfkStartTime % 3600 / 60);
                u10("<font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\" transparency=\"" .. tostring(0.3) .. "\">SESSION:</font> " .. string.format("%02i", v17) .. ":" .. string.format("%02i", v18) .. ":" .. string.format("%02i", AfkStartTime % 60));
                u19();
            end);
        end;

        u19();

        return function() -- Line: 53
        end;
    end, { u5.AfkStartTime, u5.ReturnButtonPressed });

    return u2.createElement("TextLabel", {
        [u2.Ref] = u11,
        Text = v9,
        Size = UDim2.fromScale(u5.size.X, u5.size.Y),
        FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Medium),
        TextScaled = true,
        Font = AfkPlaceUtils.Theme.font,
        TextStrokeTransparency = 1,
        TextSize = DeviceUtil.isSmallScreen() and 18 or 28,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        RichText = true,
        TextColor3 = Color3.fromRGB(255, 246, 165),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 3
    });
end);

return {
    AfkPlaceCurrentTimer = v4.connect(function(p21, p22) -- Line: 74
        local v23 = {};

        for i, v in p22 do
            v23[i] = v;
        end;

        return v23;
    end)(v20)
};