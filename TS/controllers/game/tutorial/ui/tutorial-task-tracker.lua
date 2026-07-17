-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "device-util").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = nil;

local function v41(p5, p6) -- Line: 18
    -- upvalues: DeviceUtil (copy), default (copy), u2 (copy), u1 (copy), ColorUtil (copy), BedwarsImageId (copy), Theme (copy), u4 (ref)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7, u8 = useState(p5.CurrentTasks);
    useEffect(function() -- Line: 23
        -- upvalues: DeviceUtil (ref), default (ref), u8 (copy)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local u10 = default.Client:WaitFor("TutorialTasksUpdate"):expect():Connect(function(p9) -- Line: 27
            -- upvalues: u8 (ref)
            u8(p9.tutorialData.currentTasks);
        end);

        return function() -- Line: 30
            -- upvalues: u10 (copy)
            u10:Disconnect();
        end;
    end, {});
    local u11 = u2.createRef();
    local v12, u13 = useState(p5.ScreenSizeY / 2.1550802139037435);
    useEffect(function() -- Line: 37
        -- upvalues: u1 (ref), u11 (copy), u13 (copy)
        local u14 = u1.new();
        local u15 = u11:getValue();

        if u15 then
            u14:GiveTask(u15:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 41
                -- upvalues: u13 (ref), u15 (copy)
                u13(u15.AbsoluteSize.Y);
            end));
        end;

        return function() -- Line: 45
            -- upvalues: u14 (copy)
            u14:DoCleaning();
        end;
    end, {});
    local u16 = v12 / 28;
    local u17 = v12 * 0.1;
    local v18 = {};
    local v19 = {
        [u2.Ref] = u11,
        Size = UDim2.fromScale(0.3, 0.5),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(0.98, 0.02),
        BorderSizePixel = 0,
        BackgroundTransparency = 1
    };
    local v20 = {};
    local v21 = {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(0.9, 0, 0, u17 * #v7 + u17 * 0.5),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        BackgroundColor3 = ColorUtil.BLACK
    };
    local v22 = {};
    local v23 = #v22;

    local function v35(p24, p25) -- Line: 76
        -- upvalues: u2 (ref), u17 (copy), BedwarsImageId (ref), Theme (ref), u16 (copy), u4 (ref), ColorUtil (ref)
        local createElement = u2.createElement;
        local v26 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.95, u17),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0)
        };
        local v27 = {};
        local v28 = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 10,
            Size = UDim2.new(0.1, 0, 0, u17 * 0.7),
            Image = BedwarsImageId.CHECK_CIRCLE_SOLID,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.03333333333333333, 0, 0, u17 * 0.5 + u17 * p25),
            ImageColor3 = Theme.backgroundSuccess,
            ImageTransparency = p24.completed and 0 or 1
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local createElement2 = u2.createElement;
        local v29 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 9,
            Size = UDim2.new(0.1, 0, 0, u17 * 0.7),
            Image = BedwarsImageId.CIRCLE_SOLID,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.03333333333333333, 0, 0, u17 * 0.5 + u17 * p25)
        };
        local v30;

        if p24.completed then
            v30 = Theme.backgroundTertiary;
        else
            v30 = Theme.backgroundPrimary;
        end;

        v29.ImageColor3 = v30;
        local v31 = createElement2("ImageLabel", v29, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local v32 = u2.createElement("TextLabel", {
            RichText = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "<b>" .. p24.meta.description .. "</b>",
            Size = UDim2.new(0.8, 0, 0, u17),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0.1, 0, 0, u17 * 0.52 + u17 * p25),
            TextSize = u16 * 0.9,
            TextScaled = u4(p24.meta.description),
            TextYAlignment = Enum.TextYAlignment.Center,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE
        });
        local createElement3 = u2.createElement;
        local v33 = {
            RichText = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "<b>" .. tostring(p24.currentProgress) .. "/" .. tostring(p24.meta.totalProgress) .. "</b>",
            Size = UDim2.new(0.1, 0, 0, u17),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, 0, 0, u17 * 0.52 + u17 * p25),
            TextSize = u16,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextXAlignment = Enum.TextXAlignment.Right
        };
        local v34;

        if p24.completed then
            v34 = Theme.backgroundSuccess;
        else
            v34 = ColorUtil.WHITE;
        end;

        v33.TextColor3 = v34;
        v27[1], v27[2], v27[3], v27[4] = v28, v31, v32, createElement3("TextLabel", v33);

        return createElement("Frame", v26, v27);
    end;

    local v36 = table.create(#v7);
    local v37 = {
        ResetOnSpawn = false
    };

    for i, v in v7 do
        v36[i] = v35(v, i - 1, v7);
    end;

    local v38 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(0.95, 0, 0, u17 * #v7),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, u17 * 0.5 / 2)
    };
    local v39 = {};
    local v40 = #v39;

    for i, v in v36 do
        v39[v40 + i] = v;
    end;

    v22[v23 + 1] = u2.createElement("Frame", v38, v39);
    v22[v23 + 2] = u2.createElement("UICorner", {
        CornerRadius = UDim.new(0, 6)
    });
    v20[#v20 + 1] = u2.createElement("Frame", v21, v22);
    v18[#v18 + 1] = u2.createElement("Frame", v19, v20);

    return u2.createFragment({
        TaskTrackerGUI = u2.createElement("ScreenGui", v37, v18)
    });
end;

u4 = function(p42) -- Line: 170, Name: shouldScaleText
    return #string.gsub(p42, "<[^<>]->", "") > 27;
end;

return {
    TutorialTaskTracker = v3.new(u2)(v41)
};