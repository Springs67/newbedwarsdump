-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local RandomUtil = v1.RandomUtil;
local ScaleComponent = v1.ScaleComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v7.MarketplaceService;
local Players = v7.Players;
local RunService = v7.RunService;
local TweenService = v7.TweenService;
local Workspace = v7.Workspace;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local Gamepass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local AFKHeader = RuntimeLib.import(script, script.Parent, "components", "afk-place-header").AFKHeader;
local AfkPlacePerksContainer = RuntimeLib.import(script, script.Parent, "components", "afk-place-perks-container").AfkPlacePerksContainer;
local AfkPlaceProgressBar = RuntimeLib.import(script, script.Parent, "components", "afk-place-progress-bar").AfkPlaceProgressBar;
local AfkPlaceReturnButton = RuntimeLib.import(script, script.Parent, "components", "afk-place-return-button").AfkPlaceReturnButton;
local v88 = v5.new(u4)(function(p8, p9) -- Line: 28
    -- upvalues: u4 (copy), TweenService (copy), AfkPlaceUtils (copy), DeviceUtil (copy), default (copy), MarketplaceService (copy), Players (copy), Gamepass (copy), RandomUtil (copy), u2 (copy), QueueMeta (copy), u3 (copy), RunService (copy), Workspace (copy), ScaleComponent (copy), AFKHeader (copy), Empty (copy), ColorUtil (copy), AfkPlaceProgressBar (copy), AfkPlacePerksContainer (copy), AfkPlaceReturnButton (copy)
    local useState = p9.useState;
    local useEffect = p9.useEffect;
    local u10, u11 = useState(false);
    local v12, u13 = useState(false);
    local v14, u15 = useState(false);
    local v16, u17 = useState(nil);
    local u18 = u4.createRef();
    local u19 = u4.createRef();
    local u20 = u4.createRef();
    local u21 = u4.createRef();
    local u22 = u4.createRef();
    local u23 = u4.createRef();

    local function u26(p24) -- Line: 41
        -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
        if not p24 then
            return nil;
        end;

        local v25 = TweenService:Create(p24, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            TextTransparency = 1,
            TextStrokeTransparency = 1
        });
        v25:Play();

        return v25;
    end;

    local function u33(p27, p28) -- Line: 52
        -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
        if not p27 then
            return nil;
        end;

        local v29 = TweenInfo.new(AfkPlaceUtils.Tween.loadingScreenTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
        local v30 = {};
        local v31;

        if p28 then
            v31 = UDim2.new(0, 0, -1.4, 0);
        else
            v31 = UDim2.new(0, 0, 0, 0);
        end;

        v30.Position = v31;
        local v32 = TweenService:Create(p27, v29, v30);
        v32:Play();

        return v32;
    end;

    local function u40(p34, p35) -- Line: 62
        -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
        if not p34 then
            return nil;
        end;

        local v36 = TweenInfo.new(AfkPlaceUtils.Tween.loadingScreenTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
        local v37 = {};
        local v38;

        if p35 then
            v38 = UDim2.new(0, 0, -1.6, 0);
        else
            v38 = UDim2.new(0, 0, -0.2, 0);
        end;

        v37.Position = v38;
        local v39 = TweenService:Create(p34, v36, v37);
        v39:Play();

        return v39;
    end;

    local function u43(p41) -- Line: 72
        -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
        if not p41 then
            return nil;
        end;

        local v42 = TweenService:Create(p41, TweenInfo.new(AfkPlaceUtils.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            TextTransparency = 0,
            TextStrokeTransparency = 1
        });
        v42:Play();

        return v42;
    end;

    local function u46(p44) -- Line: 83
        -- upvalues: TweenService (ref)
        if not p44 then
            return nil;
        end;

        local v45 = TweenService:Create(p44, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
            Rotation = 360
        });
        v45:Play();

        return v45;
    end;

    local function u49(p47) -- Line: 93
        -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
        if not p47 then
            return nil;
        end;

        local v48 = TweenService:Create(p47, TweenInfo.new(AfkPlaceUtils.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ImageTransparency = 0
        });
        v48:Play();

        return v48;
    end;

    useEffect(function() -- Line: 103
        -- upvalues: u20 (copy), u21 (copy), u22 (copy), u19 (copy), u23 (copy), u10 (copy), u46 (copy), u26 (copy), u33 (copy), u40 (copy), u43 (copy), u49 (copy)
        local u50 = u20:getValue();
        local u51 = u21:getValue();
        local u52 = u22:getValue();
        local u53 = u19:getValue();
        local v54 = u23:getValue();

        if u10 and (u50 and u53) then
            u46(u52);
            u50.BackgroundTransparency = 0;
            u53.BackgroundTransparency = 0;
            u26(v54).Completed:Connect(function() -- Line: 113
                -- upvalues: u33 (ref), u53 (copy), u40 (ref), u50 (copy), u43 (ref), u51 (copy), u49 (ref), u52 (copy)
                task.wait(0.3);
                u33(u53);
                u40(u50).Completed:Connect(function() -- Line: 116
                    -- upvalues: u33 (ref), u53 (ref), u40 (ref), u50 (ref), u43 (ref), u51 (ref), u49 (ref), u52 (ref)
                    task.wait(0.3);
                    u33(u53, true);
                    u40(u50, true).Completed:Connect(function() -- Line: 119
                        -- upvalues: u43 (ref), u51 (ref), u49 (ref), u52 (ref), u50 (ref), u53 (ref)
                        u43(u51);
                        u49(u52);
                        u50.BackgroundTransparency = 1;
                        u53.BackgroundTransparency = 1;
                    end);
                end);
            end);
        end;
    end, { u10 });
    useEffect(function() -- Line: 130
        -- upvalues: DeviceUtil (ref), default (ref), u13 (copy), MarketplaceService (ref), Players (ref), Gamepass (ref), u15 (copy)
        local v55 = DeviceUtil.isHoarceKat() and true or default.Client:Get("IsVip"):CallServer();
        u13(v55);
        local u56;

        if v55 then
            u56 = nil;
        else
            u56 = MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(p57, p58, p59) -- Line: 136
                -- upvalues: Players (ref), Gamepass (ref), u13 (ref)
                if p59 and (p57 == Players.LocalPlayer and p58 == Gamepass.VIP) then
                    u13(true);
                end;
            end);
        end;

        local v60 = DeviceUtil.isHoarceKat() and true or Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium;
        u15(v60);
        local u61;

        if v60 then
            u61 = nil;
        else
            u61 = MarketplaceService.PromptPremiumPurchaseFinished:Connect(function() -- Line: 147
                -- upvalues: u15 (ref), Players (ref)
                u15(Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium);
            end);
        end;

        return function() -- Line: 151
            -- upvalues: u56 (ref), u61 (ref)
            local v62 = u56;

            if v62 ~= nil then
                v62:Disconnect();
            end;

            local v63 = u61;

            if v63 ~= nil then
                v63:Disconnect();
            end;
        end;
    end, {});
    useEffect(function() -- Line: 163
        -- upvalues: u18 (copy), RandomUtil (ref), u2 (ref), QueueMeta (ref), u17 (copy), u3 (ref), RunService (ref), TweenService (ref)
        local u64 = u18:getValue();

        if not u64 then
            return nil;
        end;

        local function _(p65) -- Line: 171
            local backgroundImageRender = p65.backgroundImageRender;

            if backgroundImageRender ~= nil then
                backgroundImageRender = backgroundImageRender[1];
            end;

            return backgroundImageRender;
        end;

        local v66 = 0;
        local v67 = {};

        for i, v in u2.values(QueueMeta) do
            local _ = i - 1;
            local backgroundImageRender = v.backgroundImageRender;

            if backgroundImageRender ~= nil then
                backgroundImageRender = backgroundImageRender[1];
            end;

            if backgroundImageRender ~= nil then
                v66 = v66 + 1;
                v67[v66] = backgroundImageRender;
            end;
        end;

        local u68 = RandomUtil.shuffleArray(v67);
        u17(u68[1]);
        local u69 = u3.new();
        local u70 = RunService:IsStudio() and 5 or 60;
        u69:GiveTask(task.spawn(function() -- Line: 194
            -- upvalues: u70 (copy), u68 (copy), u64 (copy), TweenService (ref), u69 (copy), u17 (ref)
            local v71 = 0;

            while true do
                local v72 = task.wait(u70);

                if v72 == 0 or (v72 ~= v72 or not v72) then
                    break;
                end;

                local u73 = u68[v71 % #u68 + 1];
                u64.Image = u73;
                u64.ImageTransparency = 1;
                local u74 = TweenService:Create(u64, TweenInfo.new(1), {
                    ImageTransparency = 0.94
                });
                u74:Play();
                u69:GiveTask(u74.Completed:Once(function() -- Line: 211
                    -- upvalues: u17 (ref), u73 (copy), u74 (copy)
                    u17(u73);
                    u74:Destroy();
                end));
                u69:GiveTask(function() -- Line: 215
                    -- upvalues: u74 (copy)
                    u74:Cancel();
                    u74:Destroy();
                end);
                v71 = v71 + 1;
            end;
        end));

        return function() -- Line: 221
            -- upvalues: u69 (copy)
            u69:Destroy();
        end;
    end, {});
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.ViewportSize;
    end;

    local v75;

    if CurrentCamera == nil then
        v75 = CurrentCamera;
    else
        v75 = CurrentCamera.X;
    end;

    local v76 = (v75 == 0 or (v75 ~= v75 or not v75)) and 1280 or CurrentCamera.X * (DeviceUtil.isSmallScreen() and 0.75 or 0.65);
    local v77;

    if CurrentCamera == nil then
        v77 = CurrentCamera;
    else
        v77 = CurrentCamera.Y;
    end;

    local v78;

    if v77 == 0 or (v77 ~= v77 or not v77) then
        v78 = 750;
    else
        local Y = CurrentCamera.Y;
        DeviceUtil.isSmallScreen();
        v78 = Y * 0.9;
    end;

    local v79 = {
        DisplayOrder = 20,
        IgnoreGuiInset = true
    };
    local v80 = {
        GradientBottomGlow = u4.createElement("Frame", {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            ZIndex = 1,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, { u4.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(109, 114, 188)) }),
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.8) })
            }) })
    };
    local v81 = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ScaleType = Enum.ScaleType.Crop,
        Image = v16 == nil and "rbxassetid://140623687111669" or v16,
        BackgroundTransparency = 0,
        BackgroundColor3 = Color3.fromRGB(8, 8, 8),
        BorderSizePixel = 0,
        ImageTransparency = 0.94,
        [u4.Ref] = u18
    };
    v80.ImageBackground = u4.createElement("ImageLabel", v81);
    local v82 = {
        Size = UDim2.fromOffset(v76, v78),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v83 = {
        u4.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(v76, v78)
        }),
        u4.createElement(
            "UIListLayout",
            {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                VerticalFlex = "SpaceEvenly"
            }
        ),
        u4.createElement(AFKHeader, {
            AppId = "AFK Header",
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.2),
            AfkStartTime = p8.DailyAfkTime,
            ReturnButtonPressed = u10,
            MountedStartTime = p8.MountStartTime
        }),
        Section = u4.createElement(Empty, {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.08)
        }, { u4.createElement("TextLabel", {
                Text = "Welcome! Staying AFK will automatically earn you <b>Rewards</b> 🎁\nThe Afk Area will automatically rejoin you every <b>18 minutes</b> ♻️",
                TextTransparency = 0.2,
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1),
                FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Regular),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = ColorUtil.WHITE
            }) })
    };
    local _ = #v83;
    local v84 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.35)
    };
    local v85 = { u4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical,
            Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 10)
        }), u4.createElement("TextLabel", {
            Text = "REWARDS",
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextStrokeTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 14 or 24),
            FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
            Font = AfkPlaceUtils.Theme.font,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE
        }, { u4.createElement("UITextSizeConstraint", {
                MaxTextSize = 32
            }) }) };
    local v86 = {
        MountStartTime = p8.MountStartTime,
        BattlePassDto = p8.BattlePassDto,
        AfkStartTime = p8.DailyAfkTime,
        AfkCoinStart = p8.AfkCoinStart,
        BedCoinStart = p8.BedCoinStart,
        ReturnButtonPressed = u10,
        isVip = v12
    };
    local v87;

    if v14 == nil then
        v87 = false;
    else
        v87 = v14;
    end;

    v86.isPremium = v87;
    v85[#v85 + 1] = u4.createElement(AfkPlaceProgressBar, v86);
    v83.Section2 = u4.createElement(Empty, v84, v85);
    v83.Section3 = u4.createElement(Empty, {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.135)
    }, { u4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical,
            Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 10)
        }), u4.createElement("TextLabel", {
            Text = "EARN MORE WHILE AFK!",
            TextScaled = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextStrokeTransparency = 1,
            LayoutOrder = 0,
            Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 14 or 24),
            FontFace = Font.fromName(AfkPlaceUtils.Theme.font.Name, Enum.FontWeight.Bold),
            Font = AfkPlaceUtils.Theme.font,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE
        }, { u4.createElement("UITextSizeConstraint", {
                MaxTextSize = 32
            }) }), u4.createElement(AfkPlacePerksContainer, {
            LayoutOrder = 6,
            Size = UDim2.fromScale(0.5, 1),
            isVip = v12,
            isPremium = v14
        }) });
    v80.Content = u4.createElement(Empty, v82, v83);
    v80[#v80 + 1] = u4.createElement(AfkPlaceReturnButton, {
        Text = "Lobby",

        OnClick = function() -- Line: 400, Name: OnClick
            -- upvalues: u11 (copy), default (ref)
            u11(true);
            default.Client:Get("TeleportToLobby"):SendToServer();
        end,

        ReturnButtonPressed = u10
    });

    return u4.createFragment({
        AFKGui = u4.createElement("ScreenGui", v79, v80)
    });
end);

return {
    AfkPlaceHud = v6.connect(function(p89, p90) -- Line: 411
        local v91 = {};

        for i, v in p90 do
            v91[i] = v;
        end;

        return v91;
    end)(v88)
};