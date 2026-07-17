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

local function v46(p5, p6) -- Line: 18
    -- upvalues: DeviceUtil (copy), default (copy), u2 (copy), u1 (copy), ColorUtil (copy), BedwarsImageId (copy), Theme (copy), u4 (ref)
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local u7, u8 = useState(p5.CurrentTasks);
    useEffect(function() -- Line: 23
        -- upvalues: DeviceUtil (ref), default (ref), u7 (copy), u8 (copy)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local u11 = default.Client:GetNamespace("Halloween2024Remotes"):Get("CrystalBroken"):Connect(function() -- Line: 27
            -- upvalues: u7 (ref), u8 (ref)
            local v9 = u7;

            local function _(p10) -- Line: 29
                p10.currentProgress = p10.currentProgress + 1;

                if p10.currentProgress >= p10.totalProgress then
                    p10.completed = true;
                end;
            end;

            for i, v in v9 do
                local _ = i - 1;
                v.currentProgress = v.currentProgress + 1;

                if v.currentProgress >= v.totalProgress then
                    v.completed = true;
                end;
            end;

            u8(v9);
        end);
        local u15 = default.Client:GetNamespace("Halloween2024Remotes"):Get("CrystalTurnedIn"):Connect(function(u12) -- Line: 40
            -- upvalues: u7 (ref), u8 (ref)
            local v13 = u7;

            local function _(p14) -- Line: 42
                -- upvalues: u12 (copy)
                p14.currentProgress = p14.currentProgress + u12.amount;

                if p14.currentProgress >= p14.totalProgress then
                    p14.completed = true;
                end;
            end;

            for i, v in v13 do
                local _ = i - 1;
                v.currentProgress = v.currentProgress + u12.amount;

                if v.currentProgress >= v.totalProgress then
                    v.completed = true;
                end;
            end;

            u8(v13);
        end);

        return function() -- Line: 53
            -- upvalues: u11 (copy), u15 (copy)
            u11:Disconnect();
            u15:Disconnect();
        end;
    end, {});
    local u16 = u2.createRef();
    local v17, u18 = useState(p5.ScreenSizeY / 2.1550802139037435);
    useEffect(function() -- Line: 61
        -- upvalues: u1 (ref), u16 (copy), u18 (copy)
        local u19 = u1.new();
        local u20 = u16:getValue();

        if u20 then
            u19:GiveTask(u20:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- Line: 65
                -- upvalues: u18 (ref), u20 (copy)
                u18(u20.AbsoluteSize.Y);
            end));
        end;

        return function() -- Line: 69
            -- upvalues: u19 (copy)
            u19:DoCleaning();
        end;
    end, {});
    local u21 = v17 / 28;
    local u22 = v17 * 0.1;
    local v23 = {};
    local v24 = {
        [u2.Ref] = u16,
        Size = UDim2.fromScale(0.3, 0.5),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(0.98, 0.02),
        BorderSizePixel = 0,
        BackgroundTransparency = 1
    };
    local v25 = {};
    local v26 = {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(0.9, 0, 0, u22 * #u7 + u22 * 0.5),
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        BackgroundColor3 = ColorUtil.BLACK
    };
    local v27 = {};
    local v28 = #v27;

    local function v40(p29, p30) -- Line: 100
        -- upvalues: u2 (ref), u22 (copy), BedwarsImageId (ref), Theme (ref), u21 (copy), u4 (ref), ColorUtil (ref)
        local createElement = u2.createElement;
        local v31 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.95, u22),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0)
        };
        local v32 = {};
        local v33 = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 10,
            Size = UDim2.new(0.1, 0, 0, u22 * 0.7),
            Image = BedwarsImageId.CHECK_CIRCLE_SOLID,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.03333333333333333, 0, 0, u22 * 0.5 + u22 * p30),
            ImageColor3 = Theme.backgroundSuccess,
            ImageTransparency = p29.completed and 0 or 1
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local createElement2 = u2.createElement;
        local v34 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 9,
            Size = UDim2.new(0.1, 0, 0, u22 * 0.7),
            Image = BedwarsImageId.CIRCLE_SOLID,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.03333333333333333, 0, 0, u22 * 0.5 + u22 * p30)
        };
        local v35;

        if p29.completed then
            v35 = Theme.backgroundTertiary;
        else
            v35 = Theme.backgroundPrimary;
        end;

        v34.ImageColor3 = v35;
        local v36 = createElement2("ImageLabel", v34, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local v37 = u2.createElement("TextLabel", {
            RichText = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "<b>" .. p29.description .. "</b>",
            Size = UDim2.new(0.75, 0, 0, u22),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0.1, 0, 0, u22 * 0.52 + u22 * p30),
            TextSize = u21 * 0.9,
            TextScaled = u4(p29.description),
            TextYAlignment = Enum.TextYAlignment.Center,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE
        });
        local createElement3 = u2.createElement;
        local v38 = {
            RichText = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "<b>" .. tostring(p29.currentProgress) .. "/" .. tostring(p29.totalProgress) .. "</b>",
            Size = UDim2.new(0.1, 0, 0, u22),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, 0, 0, u22 * 0.52 + u22 * p30),
            TextSize = u21,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextXAlignment = Enum.TextXAlignment.Right
        };
        local v39;

        if p29.completed then
            v39 = Theme.backgroundSuccess;
        else
            v39 = ColorUtil.WHITE;
        end;

        v38.TextColor3 = v39;
        v32[1], v32[2], v32[3], v32[4] = v33, v36, v37, createElement3("TextLabel", v38);

        return createElement("Frame", v31, v32);
    end;

    local v41 = table.create(#u7);
    local v42 = {
        ResetOnSpawn = false
    };

    for i, v in u7 do
        v41[i] = v40(v, i - 1, u7);
    end;

    local v43 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(0.95, 0, 0, u22 * #u7),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, u22 * 0.5 / 2)
    };
    local v44 = {};
    local v45 = #v44;

    for i, v in v41 do
        v44[v45 + i] = v;
    end;

    v27[v28 + 1] = u2.createElement("Frame", v43, v44);
    v27[v28 + 2] = u2.createElement("UICorner", {
        CornerRadius = UDim.new(0, 6)
    });
    v25[#v25 + 1] = u2.createElement("Frame", v26, v27);
    v23[#v23 + 1] = u2.createElement("Frame", v24, v25);

    return u2.createFragment({
        TaskTrackerGUI = u2.createElement("ScreenGui", v42, v23)
    });
end;

u4 = function(p47) -- Line: 194, Name: shouldScaleText
    return #string.gsub(p47, "<[^<>]->", "") > 27;
end;

return {
    HalloweenQuestTracker = v3.new(u2)(v46)
};