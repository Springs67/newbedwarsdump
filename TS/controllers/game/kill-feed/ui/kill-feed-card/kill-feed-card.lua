-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local EnchantTableUIUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "enchant-table", "ui", "enchant-table-ui-util").EnchantTableUIUtil;
local KillFeedCardEntity = RuntimeLib.import(script, script.Parent, "kill-feed-card-entity").KillFeedCardEntity;
local KillFeedPayout = RuntimeLib.import(script, script.Parent, "kill-feed-payout").KillFeedPayout;
local u4 = DeviceUtil.isSmallScreen() and 12 or 30;
local u5 = DeviceUtil.isSmallScreen() and 7 or 16;

return {
    KillFeedCard = v3.new(u2)(function(u6, p7) -- Line: 15
        -- upvalues: u2 (copy), u4 (copy), u5 (copy), TweenService (copy), DeviceUtil (copy), KillFeedCardEntity (copy), Empty (copy), KillFeedPayout (copy), EnchantTableUIUtil (copy), ColorUtil (copy)
        local _ = p7.useState;
        local useEffect = p7.useEffect;
        local u8 = u2.createRef();
        local u9 = u2.createRef();
        local v10 = u4 + ((not u6.KillFeedData.killPayout or next(u6.KillFeedData.killPayout) == nil) and 0 or u5);
        useEffect(function() -- Line: 21
            -- upvalues: u8 (copy), u9 (copy), u6 (copy), TweenService (ref)
            local u11 = u8:getValue();
            local u12 = u9:getValue();

            local function v20() -- Line: 24
                -- upvalues: u6 (ref), u12 (copy), TweenService (ref)
                local uiConfig = u6.uiConfig;

                if uiConfig ~= nil then
                    uiConfig = uiConfig.onEnterTween;
                end;

                if u12 then
                    local u13;

                    if uiConfig == nil then
                        u13 = uiConfig;
                    else
                        u13 = uiConfig.tweenInfo;
                    end;

                    if u13 == nil then
                        u13 = TweenInfo.new(0.3, Enum.EasingStyle.Exponential);
                    end;

                    local v14;

                    if uiConfig == nil then
                        v14 = uiConfig;
                    else
                        v14 = uiConfig.position;
                    end;

                    if v14 == nil then
                        v14 = UDim2.fromScale(0, 0);
                    end;

                    if uiConfig ~= nil then
                        uiConfig = uiConfig.transparency;
                    end;

                    local u15 = uiConfig == nil and 0 or uiConfig;
                    local v16 = TweenService:Create(u12, u13, {
                        Position = v14
                    });
                    local v17 = u12:GetDescendants();

                    local function v19(p18) -- Line: 62
                        -- upvalues: TweenService (ref), u13 (copy), u15 (copy)
                        if p18:IsA("TextLabel") then
                            TweenService:Create(p18, u13, {
                                TextTransparency = u15
                            }):Play();

                            return;
                        end;

                        if p18:IsA("ImageLabel") then
                            TweenService:Create(p18, u13, {
                                ImageTransparency = u15
                            }):Play();

                            return;
                        end;

                        if p18:IsA("UIStroke") then
                            TweenService:Create(p18, u13, {
                                Transparency = u15
                            }):Play();
                        end;
                    end;

                    for i, v in v17 do
                        v19(v, i - 1, v17);
                    end;

                    return v16;
                end;
            end;

            local function u28() -- Line: 83
                -- upvalues: u6 (ref), u12 (copy), TweenService (ref)
                local uiConfig = u6.uiConfig;

                if uiConfig ~= nil then
                    uiConfig = uiConfig.onExitTween;
                end;

                if u12 then
                    local u21;

                    if uiConfig == nil then
                        u21 = uiConfig;
                    else
                        u21 = uiConfig.tweenInfo;
                    end;

                    if u21 == nil then
                        u21 = TweenInfo.new(0.3, Enum.EasingStyle.Exponential);
                    end;

                    local v22;

                    if uiConfig == nil then
                        v22 = uiConfig;
                    else
                        v22 = uiConfig.position;
                    end;

                    if v22 == nil then
                        v22 = UDim2.fromScale(0, -0.25);
                    end;

                    if uiConfig ~= nil then
                        uiConfig = uiConfig.transparency;
                    end;

                    local u23 = uiConfig == nil and 1 or uiConfig;
                    local v24 = TweenService:Create(u12, u21, {
                        Position = v22,
                        BackgroundTransparency = u23
                    });
                    local v25 = u12:GetDescendants();

                    local function v27(p26) -- Line: 122
                        -- upvalues: TweenService (ref), u21 (copy), u23 (copy)
                        if p26:IsA("TextLabel") then
                            TweenService:Create(p26, u21, {
                                TextTransparency = u23
                            }):Play();

                            return;
                        end;

                        if p26:IsA("ImageLabel") then
                            TweenService:Create(p26, u21, {
                                ImageTransparency = u23
                            }):Play();

                            return;
                        end;

                        if p26:IsA("UIStroke") or p26:IsA("Frame") then
                            TweenService:Create(p26, u21, {
                                Transparency = u23
                            }):Play();
                        end;
                    end;

                    for i, v in v25 do
                        v27(v, i - 1, v25);
                    end;

                    return v24;
                end;
            end;

            if u12 then
                local v29 = v20();

                if v29 ~= nil then
                    v29:Play();
                end;
            end;

            task.spawn(function() -- Line: 149
                -- upvalues: u28 (copy), u11 (copy)
                task.delay(5, function() -- Line: 150
                    -- upvalues: u28 (ref), u11 (ref)
                    local v30 = u28();

                    if v30 ~= nil then
                        v30:Play();
                    end;

                    if v30 ~= nil then
                        v30.Completed:Wait();
                    end;

                    local v31 = u11;

                    if v31 ~= nil then
                        v31:Destroy();
                    end;
                end);
            end);

            return function() -- Line: 166
            end;
        end, {});
        local v32 = {
            Size = UDim2.new(0, 0, 0, v10),
            AutomaticSize = "X",
            BorderSizePixel = 0,
            [u2.Ref] = u8
        };
        local v33 = {};
        local _ = #v33;
        local v34 = {
            Size = UDim2.new(1, 0, 1, 0),
            AutomaticSize = "X",
            Position = UDim2.fromScale(-1, 0),
            BorderSizePixel = 0,
            LayoutOrder = 2,
            [u2.Ref] = u9
        };
        local v35 = {};
        local v36 = #v35;
        local v37 = {
            AutomaticSize = "X",
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 1, 0)
        };
        local v38 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 0)
            }) };
        local v39 = #v38;
        local killIcons = u6.KillFeedData.killIcons;

        if killIcons then
            local killIcons2 = u6.KillFeedData.killIcons;

            local function v42(p40, p41) -- Line: 205
                -- upvalues: u2 (ref)
                return u2.createFragment({
                    KillFeedIcon = u2.createElement("ImageLabel", {
                        ScaleType = "Fit",
                        SizeConstraint = "RelativeYY",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ImageTransparency = 1,
                        Size = UDim2.fromScale(1, 1),
                        Image = p40,
                        LayoutOrder = p41
                    })
                });
            end;

            local v43 = table.create(#killIcons2);

            for i, v in killIcons2 do
                v43[i] = v42(v, i - 1, killIcons2);
            end;

            local v44 = {
                AutomaticSize = "X",
                BackgroundTransparency = 0.3,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                Size = UDim2.fromScale(0, 1),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            };
            local v45 = { u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, DeviceUtil.isSmallScreen() and 2 or 6),
                    PaddingBottom = UDim.new(0, DeviceUtil.isSmallScreen() and 2 or 6),
                    PaddingLeft = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 6),
                    PaddingRight = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 6)
                }), u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    SortOrder = "LayoutOrder",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Center",
                    Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 3 or 6)
                }) };
            local v46 = #v45;

            for i, v in v43 do
                v45[v46 + i] = v;
            end;

            killIcons = u2.createFragment({
                KillFeedIconsWrapper = u2.createElement("Frame", v44, v45)
            });
        end;

        local v47 = {
            Size = UDim2.new(1, 0, 0, u4)
        };
        local v48 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0, 0)
            }),
            u2.createElement(KillFeedCardEntity, {
                Position = "left",
                Entity = u6.KillFeedData.killer
            }),
            [#v48 + 1] = killIcons,
            [#v48 + 1] = u2.createElement(KillFeedCardEntity, {
                Position = "right",
                Entity = u6.KillFeedData.victim
            })
        };
        v38[v39 + 1] = u2.createElement(Empty, v47, v48);
        local v49 = u6.KillFeedData.killPayout and u2.createElement(KillFeedPayout, {
            Size = UDim2.new(1, 0, 0, u5),
            killPayout = u6.KillFeedData.killPayout
        });

        if v49 then
            v38[v39 + 2] = v49;
        end;

        v35.KillFeedCardInner = u2.createElement(Empty, v37, v38);
        local v50;

        if u6.KillFeedData.multiKillCount == nil or u6.KillFeedData.multiKillCount <= 1 then
            v50 = false;
        else
            v50 = u2.createFragment({
                MultiKillCountBox = u2.createElement("Frame", {
                    AutomaticSize = "X",
                    BackgroundTransparency = 0.3,
                    BorderSizePixel = 0,
                    LayoutOrder = 0,
                    Size = UDim2.new(0, 0, 0, u4),
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(0, 0),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                }, {
                    u2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, DeviceUtil.isSmallScreen() and 3 or 6),
                        PaddingRight = UDim.new(0, DeviceUtil.isSmallScreen() and 3 or 6)
                    }),
                    MultiKillText = u2.createElement("TextLabel", {
                        AutomaticSize = "X",
                        AutoLocalize = false,
                        SizeConstraint = "RelativeYY",
                        TextYAlignment = "Center",
                        BackgroundTransparency = 1,
                        TextTransparency = 1,
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0, 0.5),
                        Text = EnchantTableUIUtil.convertToRoman(u6.KillFeedData.multiKillCount),
                        TextColor3 = ColorUtil.WHITE,
                        Font = Enum.Font.GothamBold,
                        TextSize = DeviceUtil.isSmallScreen() and 8 or 14
                    })
                })
            });
        end;

        if v50 then
            v35[v36 + 1] = v50;
        end;

        v33.KillFeedCard = u2.createElement(Empty, v34, v35);

        return u2.createFragment({
            KillFeedCardWrapper = u2.createElement(Empty, v32, v33)
        });
    end)
};