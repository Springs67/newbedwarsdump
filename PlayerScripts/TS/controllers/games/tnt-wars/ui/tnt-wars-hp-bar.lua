-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants");
local CORE_COLORS = v2.CORE_COLORS;
local CORE_HP = v2.CORE_HP;
local TNT_WARS_IMAGE_ID = v2.TNT_WARS_IMAGE_ID;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
local v4 = u1.Component:extend("TNTWarsHpBar");

function v4.init(p5) -- Line: 18
    -- upvalues: u1 (copy)
    p5.flashBarOneRef = u1.createRef();
    p5.outerBarOneRef = u1.createRef();
    p5.percentLabelOneRef = u1.createRef();
    p5.coreIconOneRef = u1.createRef();
    p5.flashBarTwoRef = u1.createRef();
    p5.outerBarTwoRef = u1.createRef();
    p5.percentLabelTwoRef = u1.createRef();
    p5.coreIconTwoRef = u1.createRef();
end;

function v4.render(p6) -- Line: 28
    -- upvalues: u1 (copy), Theme (copy), TNT_WARS_IMAGE_ID (copy), DeviceUtil (copy)
    return u1.createFragment({
        HpBarsContainer = u1.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = p6.props.containerPosition,
            Size = UDim2.fromScale(0.5, 1)
        }, {
            TeamLabel = u1.createElement("TextLabel", {
                RichText = true,
                TextScaled = true,
                TextStrokeTransparency = 0,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 4,
                Text = p6.props.teamLabel,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                Font = Enum.Font.Arcade,
                Position = p6.props.teamLabelPos,
                Size = UDim2.fromScale(0.5, 0.075)
            }),
            CoreBarOneInner = u1.createElement("Frame", {
                BackgroundTransparency = 0.5,
                BorderSizePixel = 0,
                Position = UDim2.fromScale(p6.props.barAnchorPoint.X, 0),
                Size = UDim2.fromScale(0.8, 0.055),
                AnchorPoint = p6.props.barAnchorPoint,
                BackgroundColor3 = Theme.Gray
            }, {
                u1.createElement("UIStroke", {
                    Thickness = 3,
                    Color = Color3.fromRGB(255, 255, 255)
                }),
                u1.createElement("UICorner"),
                CoreOneIcon = u1.createElement("ImageLabel", {
                    [u1.Ref] = p6.coreIconOneRef,
                    Position = UDim2.fromScale(p6.props.barAnchorPoint.X - 0.075, -0.35),
                    Size = UDim2.fromScale(0.1, 0.1),
                    SizeConstraint = Enum.SizeConstraint.RelativeXX,
                    Image = TNT_WARS_IMAGE_ID.PURPLE_CORE,
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 3
                }, {
                    CoreOnePercent = u1.createElement("TextLabel", {
                        [u1.Ref] = p6.percentLabelOneRef,
                        Text = "100%",
                        RichText = true,
                        Position = UDim2.fromScale(0.5, 0.58),
                        Size = UDim2.fromScale(1, 1),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundTransparency = 1,
                        Font = Enum.Font.LuckiestGuy,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                        TextSize = DeviceUtil.isSmallScreen() and 12 or 18,
                        TextStrokeTransparency = 0,
                        TextXAlignment = Enum.TextXAlignment.Center,
                        ZIndex = 4
                    })
                }),
                CoreBarOneFlash = u1.createElement("Frame", {
                    [u1.Ref] = p6.flashBarOneRef,
                    Position = UDim2.fromScale(p6.props.barAnchorPoint.X, 0),
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = p6.props.barAnchorPoint,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    ZIndex = 1
                }, { u1.createElement("UICorner") }),
                CoreBarOneOuter = u1.createElement("Frame", {
                    [u1.Ref] = p6.outerBarOneRef,
                    Position = UDim2.fromScale(p6.props.barAnchorPoint.X, 0),
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = p6.props.barAnchorPoint,
                    BackgroundColor3 = p6.props.barColor,
                    BorderSizePixel = 0,
                    ZIndex = 2
                }, { u1.createElement("UICorner") })
            }),
            CoreBarTwoInner = u1.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 0.5,
                Position = UDim2.fromScale(p6.props.barAnchorPoint.X, 0.125),
                Size = UDim2.fromScale(0.7, 0.055),
                BackgroundColor3 = Theme.Gray,
                AnchorPoint = p6.props.barAnchorPoint
            }, {
                u1.createElement("UIStroke", {
                    Thickness = 3,
                    Color = Color3.fromRGB(255, 255, 255)
                }),
                u1.createElement("UICorner"),
                CoreTwoIcon = u1.createElement("ImageLabel", {
                    [u1.Ref] = p6.coreIconTwoRef,
                    Position = UDim2.fromScale(p6.props.barAnchorPoint.X - 0.075, -0.35),
                    Size = UDim2.fromScale(0.1, 0.1),
                    SizeConstraint = Enum.SizeConstraint.RelativeXX,
                    Image = TNT_WARS_IMAGE_ID.YELLOW_CORE,
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 3
                }, {
                    CoreTwoPercent = u1.createElement("TextLabel", {
                        [u1.Ref] = p6.percentLabelTwoRef,
                        Text = "100%",
                        RichText = true,
                        Position = UDim2.fromScale(0.5, 0.58),
                        Size = UDim2.fromScale(1, 1),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundTransparency = 1,
                        Font = Enum.Font.LuckiestGuy,
                        TextSize = DeviceUtil.isSmallScreen() and 12 or 18,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                        TextStrokeTransparency = 0,
                        TextXAlignment = Enum.TextXAlignment.Center,
                        ZIndex = 4
                    })
                }),
                CoreBarTwoFlash = u1.createElement("Frame", {
                    [u1.Ref] = p6.flashBarTwoRef,
                    Position = UDim2.fromScale(p6.props.barAnchorPoint.X, 0),
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = p6.props.barAnchorPoint,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    ZIndex = 1
                }, { u1.createElement("UICorner") }),
                CoreBarTwoOuter = u1.createElement("Frame", {
                    [u1.Ref] = p6.outerBarTwoRef,
                    Position = UDim2.fromScale(p6.props.barAnchorPoint.X, 0),
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = p6.props.barAnchorPoint,
                    BackgroundColor3 = p6.props.barColor,
                    BorderSizePixel = 0,
                    ZIndex = 2
                }, { u1.createElement("UICorner") })
            })
        })
    });
end;

function v4.didMount(p7) -- Line: 180
    -- upvalues: CORE_COLORS (copy)
    local function _(p8) -- Line: 183
        -- upvalues: CORE_COLORS (ref)
        local corePart = p8.corePart;

        if corePart ~= nil then
            corePart = corePart.Color;
        end;

        return corePart == CORE_COLORS[1];
    end;

    local v9 = nil;

    for i, v in p7.props.cores do
        local _ = i - 1;
        local corePart = v.corePart;

        if corePart ~= nil then
            corePart = corePart.Color;
        end;

        if corePart == CORE_COLORS[1] == true then
            v9 = v;
            break;
        end;
    end;

    p7.coreOne = v9;

    local function _(p10) -- Line: 201
        -- upvalues: CORE_COLORS (ref)
        local corePart = p10.corePart;

        if corePart ~= nil then
            corePart = corePart.Color;
        end;

        return corePart == CORE_COLORS[2];
    end;

    local v11 = nil;

    for i, v in p7.props.cores do
        local _ = i - 1;
        local corePart = v.corePart;

        if corePart ~= nil then
            corePart = corePart.Color;
        end;

        if corePart == CORE_COLORS[2] == true then
            v11 = v;
            break;
        end;
    end;

    p7.coreTwo = v11;
    p7:setupDamageListeners();
end;

function v4.setupDamageListeners(u12) -- Line: 220
    local coreOne = u12.coreOne;

    if coreOne ~= nil then
        local corePart = coreOne.corePart;

        if corePart ~= nil then
            corePart:GetAttributeChangedSignal("Hp"):Connect(function() -- Line: 225
                -- upvalues: u12 (copy)
                u12:updateCoreOne();
            end);
        end;
    end;

    local coreTwo = u12.coreTwo;

    if coreTwo ~= nil then
        local corePart = coreTwo.corePart;

        if corePart ~= nil then
            corePart:GetAttributeChangedSignal("Hp"):Connect(function() -- Line: 234
                -- upvalues: u12 (copy)
                u12:updateCoreTwo();
            end);
        end;
    end;
end;

function v4.updateCoreOne(p13) -- Line: 240
    local coreOne = p13.coreOne;

    if coreOne ~= nil then
        coreOne = coreOne.corePart;
    end;

    if not coreOne then
        return nil;
    end;

    local v14 = p13.outerBarOneRef:getValue();
    local v15 = p13.flashBarOneRef:getValue();
    local v16 = p13.percentLabelOneRef:getValue();
    local v17 = p13.coreIconOneRef:getValue();

    if not (v14 and (v15 and (v16 and v17))) then
        return nil;
    end;

    p13:updateIcon(p13.coreOne.corePart, v17);
    p13:updateBar(p13.coreOne.corePart, v14, v15);
    p13:updatePercent(p13.coreOne.corePart, v16);
end;

function v4.updateCoreTwo(p18) -- Line: 259
    local coreTwo = p18.coreTwo;

    if coreTwo ~= nil then
        coreTwo = coreTwo.corePart;
    end;

    if not coreTwo then
        return nil;
    end;

    local v19 = p18.outerBarTwoRef:getValue();
    local v20 = p18.flashBarTwoRef:getValue();
    local v21 = p18.percentLabelTwoRef:getValue();
    local v22 = p18.coreIconTwoRef:getValue();

    if not (v19 and (v20 and (v21 and v22))) then
        return nil;
    end;

    p18:updateIcon(p18.coreTwo.corePart, v22);
    p18:updateBar(p18.coreTwo.corePart, v19, v20);
    p18:updatePercent(p18.coreTwo.corePart, v21);
end;

function v4.updateBar(p23, p24, p25, u26) -- Line: 278
    -- upvalues: CORE_HP (copy), TweenService (copy), u3 (copy)
    local v27 = p24:GetAttribute("Hp") / CORE_HP;
    local u28 = UDim2.fromScale(v27, p25.Size.Y.Scale);
    p25.Size = u28;
    task.delay(1, function() -- Line: 284
        -- upvalues: TweenService (ref), u26 (copy), u3 (ref), u28 (copy)
        TweenService:Create(u26, u3, {
            Size = u28
        }):Play();
    end);
end;

function v4.updatePercent(p29, p30, p31) -- Line: 290
    -- upvalues: CORE_HP (copy)
    local v32 = p30:GetAttribute("Hp");

    if v32 <= 0 then
        p31.Visible = false;

        return nil;
    end;

    local v33 = math.floor(v32 / CORE_HP * 100);
    p31.Text = tostring(v33) .. "%";
end;

function v4.updateIcon(p34, p35, p36) -- Line: 299
    -- upvalues: TNT_WARS_IMAGE_ID (copy)
    if p35:GetAttribute("Hp") <= 0 then
        p36.Image = TNT_WARS_IMAGE_ID.DEAD_CORE;
    end;
end;

return {
    TNTWarsHpBar = v4
};