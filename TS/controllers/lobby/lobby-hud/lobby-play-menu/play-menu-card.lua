-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getPlayMenuCardTagMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "play-menu", "play-menu-tag-meta").getPlayMenuCardTagMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    PlayMenuCard = v4.new(u3)(function(u5, p6) -- Line: 19
        -- upvalues: u3 (copy), DeviceUtil (copy), UIUtil (copy), u2 (copy), TweenService (copy), ColorUtil (copy), getPlayMenuCardTagMeta (copy), SoundManager (copy), GameSound (copy), Empty (copy), BedwarsImageId (copy), Padding (copy), TooltipContainer (copy), AutoSizedText (copy)
        local useEffect = p6.useEffect;
        local useState = p6.useState;
        local u7, u8 = useState(false);
        local v9, u10 = useState(nil);
        local u11 = u3.createRef();
        local u12 = u3.createRef();
        local u13 = u3.createRef();
        local u14 = u3.createRef();
        local u15 = u3.createRef();
        local u16 = u3.createRef();
        useEffect(function() -- Line: 30
            -- upvalues: u5 (copy), DeviceUtil (ref), u13 (copy), UIUtil (ref)
            if u5.GamepadShouldAutoSelect and DeviceUtil.isGamepadControls() then
                UIUtil:selectGui((u13:getValue()));
            end;
        end, { u5.GamepadShouldAutoSelect });
        useEffect(function() -- Line: 36
            -- upvalues: u11 (copy), u12 (copy), u13 (copy), u2 (ref), UIUtil (ref), u5 (copy), TweenService (ref)
            local u17 = u11:getValue();
            local v18 = u12:getValue();
            local v19 = u13:getValue();

            if not (u17 and (v18 and v19)) then
                return nil;
            end;

            local u20 = u2.new();
            u17.Position = UDim2.fromScale(0.5, -0.5);
            local u21 = UIUtil:setContainerTransparency(u17, 1, {
                onSetTweenInfo = TweenInfo.new(0)
            });
            u20:GiveTask(u21);
            v18.Transparency = 1;
            v18.BackgroundTransparency = 1;
            v18.ImageTransparency = 1;
            v19.Transparency = 1;
            v19.BackgroundTransparency = 1;
            v19.ImageTransparency = 1;
            u20:GiveTask(task.delay(u5.Index * 0.1 + 0.1, function() -- Line: 55
                -- upvalues: u21 (copy), TweenService (ref), u17 (copy), u20 (copy)
                u21:DoCleaning();
                local u22 = TweenService:Create(u17, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Position = UDim2.fromScale(0.5, 0.5)
                });
                u22:Play();
                u20:GiveTask(function() -- Line: 61
                    -- upvalues: u22 (copy)
                    u22:Cancel();
                    u22:Destroy();
                end);
            end));

            return function() -- Line: 66
                -- upvalues: u20 (copy)
                u20:DoCleaning();
            end;
        end, { u5.Page });

        local function v30() -- Line: 70
            -- upvalues: u5 (copy), u12 (copy), u13 (copy), u10 (copy), u2 (ref), TweenService (ref)
            local CardData = u5.CardData;

            if CardData ~= nil then
                CardData = CardData.backgroundImages;
            end;

            if CardData == nil then
                return nil;
            end;

            if #u5.CardData.backgroundImages == 0 then
                return nil;
            end;

            local v23 = u12:getValue();
            local u24 = u13:getValue();

            if #u5.CardData.backgroundImages == 1 or not (v23 and u24) then
                u10(u5.CardData.backgroundImages[1]);

                return nil;
            end;

            u10(u5.CardData.backgroundImages[1]);
            local u25 = u2.new();
            u25:GiveTask(task.spawn(function() -- Line: 90
                -- upvalues: u5 (ref), u24 (copy), TweenService (ref), u25 (copy), u10 (ref)
                task.wait(u5.Index);
                local v26 = 0;

                while true do
                    local u27 = u5.CardData.backgroundImages[v26 % #u5.CardData.backgroundImages + 1];
                    u24.Image = u27;
                    u24.ImageTransparency = 1;
                    local u28 = TweenService:Create(u24, TweenInfo.new(1), {
                        ImageTransparency = 0
                    });
                    u28:Play();
                    u25:GiveTask(u28.Completed:Once(function() -- Line: 105
                        -- upvalues: u10 (ref), u27 (copy), u28 (copy)
                        u10(u27);
                        u28:Destroy();
                    end));
                    u25:GiveTask(function() -- Line: 109
                        -- upvalues: u28 (copy)
                        u28:Cancel();
                        u28:Destroy();
                    end);
                    local v29 = task.wait(5);

                    if v29 == 0 or (v29 ~= v29 or not v29) then
                        break;
                    end;

                    v26 = v26 + 1;
                end;
            end));

            return function() -- Line: 117
                -- upvalues: u25 (copy)
                u25:Destroy();
            end;
        end;

        local CardData = u5.CardData;

        if CardData ~= nil then
            CardData = CardData.backgroundImages;
        end;

        useEffect(v30, { CardData });
        useEffect(function() -- Line: 126
            -- upvalues: u7 (copy), u5 (copy)
            if u7 and u5.OnHover then
                u5.OnHover(u5.QueueVariant, u5.CardData);
            end;
        end, { u7 });
        useEffect(function() -- Line: 131
            -- upvalues: u11 (copy), u13 (copy), u12 (copy), u14 (copy), u15 (copy), u16 (copy), u2 (ref), TweenService (ref), u7 (copy), ColorUtil (ref)
            local v31 = u11:getValue();
            local v32 = u13:getValue();
            local v33 = u12:getValue();
            local v34 = u14:getValue();
            local v35 = u15:getValue();
            local v36 = u16:getValue();
            local u37 = u2.new();

            if v31 then
                local u38 = TweenService:Create(v31, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                    Size = UDim2.fromScale(u7 and 1.05 or 1, u7 and 1.05 or 1)
                });
                u38:Play();
                u37:GiveTask(function() -- Line: 144
                    -- upvalues: u38 (copy)
                    u38:Cancel();
                    u38:Destroy();
                end);
            end;

            if v32 then
                local u39 = TweenService:Create(v32, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                    Size = UDim2.fromScale(u7 and 1.15 or 1, u7 and 1.15 or 1)
                });
                u39:Play();
                u37:GiveTask(function() -- Line: 154
                    -- upvalues: u39 (copy)
                    u39:Cancel();
                    u39:Destroy();
                end);
            end;

            if v33 then
                local u40 = TweenService:Create(v33, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                    Size = UDim2.fromScale(u7 and 1.15 or 1, u7 and 1.15 or 1)
                });
                u40:Play();
                u37:GiveTask(function() -- Line: 164
                    -- upvalues: u40 (copy)
                    u40:Cancel();
                    u40:Destroy();
                end);
            end;

            if v34 then
                local v41 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut);
                local v42 = {};
                local v43;

                if u7 then
                    v43 = ColorUtil.WHITE;
                else
                    v43 = ColorUtil.BLACK;
                end;

                v42.BackgroundColor3 = v43;
                local u44 = TweenService:Create(v34, v41, v42);
                u44:Play();
                u37:GiveTask(function() -- Line: 174
                    -- upvalues: u44 (copy)
                    u44:Cancel();
                    u44:Destroy();
                end);
            end;

            if v35 then
                local v45 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut);
                local v46 = {};
                local v47;

                if u7 then
                    v47 = ColorUtil.brighten(ColorUtil.BLACK, 0.15);
                else
                    v47 = ColorUtil.WHITE;
                end;

                v46.TextColor3 = v47;
                local u48 = TweenService:Create(v35, v45, v46);
                u48:Play();
                u37:GiveTask(function() -- Line: 184
                    -- upvalues: u48 (copy)
                    u48:Cancel();
                    u48:Destroy();
                end);
            end;

            if v36 then
                local v49 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut);
                local v50 = {};
                local v51;

                if u7 then
                    v51 = ColorUtil.brighten(ColorUtil.BLACK, 0.15);
                else
                    v51 = ColorUtil.WHITE;
                end;

                v50.TextColor3 = v51;
                local u52 = TweenService:Create(v36, v49, v50);
                u52:Play();
                u37:GiveTask(function() -- Line: 194
                    -- upvalues: u52 (copy)
                    u52:Cancel();
                    u52:Destroy();
                end);
            end;

            return function() -- Line: 199
                -- upvalues: u37 (copy)
                u37:DoCleaning();
            end;
        end, { u7 });
        useEffect(function() -- Line: 203
            -- upvalues: u8 (copy)
            u8(false);
        end, { u5.Page });
        local v53 = {};

        for i, v in u5 do
            v53[i] = v;
        end;

        v53.CardData = nil;
        v53.Index = nil;
        v53.Page = nil;
        v53.Tag = nil;
        v53.PlayerLevelReq = nil;
        v53.QueueVariant = nil;
        v53.OnHover = nil;
        v53.OnClick = nil;
        v53.GamepadShouldAutoSelect = nil;
        local v54;

        if u5.Tag then
            v54 = getPlayMenuCardTagMeta(u5.Tag);
        else
            v54 = nil;
        end;

        local v55 = {};

        for i, v in v53 do
            v55[i] = v;
        end;

        local v56 = {};
        local _ = #v56;
        local v57 = {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            [u3.Ref] = u11
        };
        local v58 = {};
        local v59 = #v58;
        local v60 = {
            ClipsDescendants = true,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local v61 = { u3.createElement("ImageLabel", {
                [u3.Ref] = u12,
                Image = v9,
                ScaleType = Enum.ScaleType.Crop,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ImageTransparency = u5.PlayerLevelReq == nil and 0 or 0.5
            }), u3.createElement("ImageButton", {
                [u3.Ref] = u13,
                Image = v9,
                ScaleType = Enum.ScaleType.Crop,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,

                [u3.Event.Activated] = function() -- Line: 262
                    -- upvalues: SoundManager (ref), GameSound (ref), u5 (copy)
                    SoundManager:playSound(GameSound.UI_CLICK);

                    if u5.OnClick then
                        u5.OnClick(u5.QueueVariant, u5.CardData);
                    end;
                end,

                [u3.Event.MouseEnter] = function() -- Line: 268
                    -- upvalues: SoundManager (ref), GameSound (ref), u8 (copy)
                    SoundManager:playSound(GameSound.UI_HOVER);
                    u8(true);
                end,

                [u3.Event.MouseLeave] = function() -- Line: 272
                    -- upvalues: u8 (copy)
                    u8(false);
                end,

                [u3.Event.MouseButton1Click] = function() -- Line: 275
                    -- upvalues: u8 (copy)
                    u8(false);
                end
            }) };
        local v62 = #v61;

        if u7 then
            u7 = u3.createElement("UIStroke", {
                Transparency = 0,
                Thickness = 3,
                Color = Color3.fromRGB(255, 240, 69)
            }, { u3.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
                }) });
        end;

        if u7 then
            v61[v62 + 1] = u7;
        end;

        local v63 = #v61;
        local v64 = {
            Size = UDim2.fromScale(1, 0.1)
        };
        local v65 = {};
        local v66 = #v65;
        local v67;

        if v54 == nil then
            v67 = false;
        else
            v67 = u3.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                TextTransparency = 0,
                Size = UDim2.fromScale(v54.sizeXScale, 1),
                Text = u5.Tag,
                TextColor3 = ColorUtil.WHITE,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                BackgroundColor3 = v54.backgroundColor3
            }, { u3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.05),
                    PaddingRight = UDim.new(0.05)
                }) });
        end;

        if v67 then
            v65[v66 + 1] = v67;
        end;

        v61.CardHeader = u3.createElement(Empty, v64, v65);
        local v68 = {
            Size = UDim2.fromScale(1, 0.25),
            Position = UDim2.fromScale(0, 0.75),
            BackgroundColor3 = ColorUtil.BLACK,
            Transparency = 0.5,
            BorderSizePixel = 0,
            [u3.Ref] = u14
        };
        local v69 = {};
        local v70 = #v69;
        local v71 = {
            Size = UDim2.fromScale(0.98, 0.6)
        };
        local CardData2 = u5.CardData;

        if CardData2 ~= nil then
            CardData2 = CardData2.subtitle;
        end;

        v71.Position = UDim2.fromScale(0.5, CardData2 == nil and 0.5 or 0.1);
        local CardData3 = u5.CardData;

        if CardData3 ~= nil then
            CardData3 = CardData3.subtitle;
        end;

        v71.AnchorPoint = Vector2.new(0.5, CardData3 == nil and 0.5 or 0);
        local CardData4 = u5.CardData;

        if CardData4 ~= nil then
            CardData4 = CardData4.title;
        end;

        v71.Text = CardData4;
        v71.TextScaled = true;
        v71.TextColor3 = ColorUtil.WHITE;
        v71.TextXAlignment = Enum.TextXAlignment.Center;
        v71.TextYAlignment = Enum.TextYAlignment.Center;
        v71.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v71.BackgroundTransparency = 1;
        v71.TextTransparency = 0;
        v71[u3.Ref] = u15;
        v69[v70 + 1] = u3.createElement("TextLabel", v71);
        local CardData5 = u5.CardData;

        if CardData5 ~= nil then
            CardData5 = CardData5.subtitle;
        end;

        local v72 = CardData5 ~= nil and u3.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 0.3),
            Position = UDim2.fromScale(0.5, 0.9),
            AnchorPoint = Vector2.new(0.5, 1),
            Text = u5.CardData.subtitle,
            TextScaled = true,
            TextColor3 = ColorUtil.WHITE,
            Transparency = 0.3,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            BackgroundTransparency = 1,
            TextTransparency = 0,
            [u3.Ref] = u16
        });

        if v72 then
            v69[v70 + 2] = v72;
        end;

        v61.CardFooter = u3.createElement("Frame", v68, v69);
        local v73;

        if u5.PlayerLevelReq == nil then
            v73 = false;
        else
            v73 = u3.createElement("Frame", {
                Transparency = 0.2,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), u3.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1, 0.15),
                    Image = BedwarsImageId.LOCK_ART
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) }), u3.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    TextTransparency = 0,
                    Size = UDim2.fromScale(0.7, 0.15),
                    Text = "PLAYER LEVEL <font color=\"" .. ColorUtil.richTextColor(ColorUtil.WHITE) .. "\">" .. tostring(u5.PlayerLevelReq) .. "</font>",
                    TextColor3 = ColorUtil.darken(ColorUtil.WHITE, 0.68),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                }) });
        end;

        if v73 then
            v61[v63 + 1] = v73;
        end;

        v58.ClippedInnerCardContainer = u3.createElement(Empty, v60, v61);
        local helperIcons = u5.CardData.helperIcons;

        if helperIcons then
            local v74 = {
                Size = UDim2.fromScale(1, 0.65),
                Position = UDim2.fromScale(0, 0.1)
            };
            local v75 = { u3.createElement(Padding, {
                    Padding = UDim.new(0, 10)
                }) };
            local _ = #v75;
            local text = u5.CardData.helperIcons.text;
            local v76;

            if text == nil then
                v76 = text;
            else
                local function v78(p77) -- Line: 437
                    -- upvalues: u3 (ref), ColorUtil (ref), TooltipContainer (ref), AutoSizedText (ref)
                    return u3.createElement("TextLabel", {
                        TextSize = 14,
                        BackgroundTransparency = 0.25,
                        ZIndex = 10,
                        Text = p77[1],
                        Size = UDim2.new(0, 14, 0, 14),
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        BackgroundColor3 = ColorUtil.BLACK,
                        Font = Enum.Font.SourceSansBold
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                                TextSize = 14,
                                Text = p77[2],
                                Font = Enum.Font.SourceSansBold,
                                Limits = Vector2.new(300, 120)
                            }) }) });
                end;

                v76 = table.create(#text);

                for i, v in text do
                    v76[i] = v78(v, i - 1, text);
                end;
            end;

            local v79 = {
                Size = UDim2.new(1, 0, 0, 16),
                Position = UDim2.fromScale(0.5, 1),
                AnchorPoint = Vector2.new(0.5, 1)
            };
            local v80 = { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDim.new(0, 4)
                }) };
            local v81 = #v80;

            if v76 then
                for i, v in v76 do
                    v80[v81 + i] = v;
                end;
            end;

            local v82 = #v80;
            local images = u5.CardData.helperIcons.images;
            local v83;

            if images == nil then
                v83 = images;
            else
                local function v85(p84) -- Line: 490
                    -- upvalues: u3 (ref), ColorUtil (ref), TooltipContainer (ref), AutoSizedText (ref)
                    return u3.createElement("Frame", {
                        BackgroundTransparency = 0.25,
                        ZIndex = 10,
                        Size = UDim2.new(0, 20, 0, 20),
                        BackgroundColor3 = ColorUtil.BLACK
                    }, {
                        HelperIconImage = u3.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            ZIndex = 10,
                            Size = UDim2.new(0, 14, 0, 14),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Image = p84[1],
                            ScaleType = Enum.ScaleType.Fit
                        }, { u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                                    TextSize = 14,
                                    Text = p84[2],
                                    Font = Enum.Font.SourceSansBold,
                                    Limits = Vector2.new(300, 60)
                                }) }) })
                    });
                end;

                v83 = table.create(#images);

                for i, v in images do
                    v83[i] = v85(v, i - 1, images);
                end;
            end;

            if v83 then
                for i, v in v83 do
                    v80[v82 + i] = v;
                end;
            end;

            v75.HelperIconsList = u3.createElement(Empty, v79, v80);
            helperIcons = u3.createElement(Empty, v74, v75);
        end;

        if helperIcons then
            v58[v59 + 1] = helperIcons;
        end;

        local v86 = #v58;
        local CardData6 = u5.CardData;

        if CardData6 ~= nil then
            CardData6 = CardData6.AbsolutePosElements;
        end;

        if CardData6 then
            for i, v in CardData6 do
                v58[v86 + i] = v;
            end;
        end;

        v56.InnerCardContainer = u3.createElement(Empty, v57, v58);

        return u3.createElement(Empty, v55, v56);
    end)
};