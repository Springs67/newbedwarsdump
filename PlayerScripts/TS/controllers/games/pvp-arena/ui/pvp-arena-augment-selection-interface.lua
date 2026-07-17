-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local Countdown = v1.Countdown;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local ScaleComponent = v1.ScaleComponent;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PvPArenaAugmentCard = RuntimeLib.import(script, script.Parent, "pvp-arena-augment-card").PvPArenaAugmentCard;
local v46 = v4.new(u3)(function(u6, p7) -- Line: 23
    -- upvalues: Players (copy), u3 (copy), UIUtil (copy), u2 (copy), ScaleComponent (copy), DeviceUtil (copy), Empty (copy), TimedProgressBar (copy), Countdown (copy), PvPArenaAugmentCard (copy), Button (copy), default (copy), Padding (copy), BedwarsImageId (copy), SoundManager (copy), GameSound (copy), DarkBackground (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local v8, u9 = useState(false);
    local userIdAugmentMap = u6.userIdAugmentMap;

    if userIdAugmentMap ~= nil then
        local v10 = userIdAugmentMap[Players.LocalPlayer.UserId];
        userIdAugmentMap = v10 ~= nil and #v10 or v10;
    end;

    local u11, _ = useState(userIdAugmentMap == nil and 0 or userIdAugmentMap);
    local u12, u13 = useState(false);
    local u14 = u3.createRef();
    local u15 = u3.createRef();
    local u16 = u3.createRef();
    useEffect(function() -- Line: 44
        -- upvalues: u6 (copy), Players (ref), u11 (copy), u9 (copy), u15 (copy), u16 (copy), UIUtil (ref), u14 (copy)
        local userIdAugmentMap2 = u6.userIdAugmentMap;

        if userIdAugmentMap2 ~= nil then
            local v17 = userIdAugmentMap2[Players.LocalPlayer.UserId];
            userIdAugmentMap2 = v17 ~= nil and #v17 or v17;
        end;

        if (userIdAugmentMap2 == nil and 0 or userIdAugmentMap2) <= u11 then
            return nil;
        end;

        u9(false);
        local v18 = u15:getValue();
        local v19 = u16:getValue();

        if not (v18 and v19) then
            return nil;
        end;

        UIUtil:setContainerTransparency(v18, 1, {
            onSetTweenInfo = TweenInfo.new(0.3)
        });
        UIUtil:setContainerTransparency(v19, 1, {
            onSetTweenInfo = TweenInfo.new(0.3)
        });
        local u20 = u14:getValue();
        task.delay(1, function() -- Line: 73
            -- upvalues: u20 (copy), UIUtil (ref)
            if u20 then
                UIUtil:setContainerTransparency(u20, 1, {
                    onSetTweenInfo = TweenInfo.new(0.3)
                });
            end;
        end);
    end, { u6.userIdAugmentMap });
    useEffect(function() -- Line: 81
        -- upvalues: u2 (ref), u6 (copy), u13 (copy)
        local u21 = u2.new();
        local u22 = task.delay(#u6.Augments * 0.33, function() -- Line: 83
            -- upvalues: u13 (ref)
            u13(true);
        end);
        u21:GiveTask(function() -- Line: 86
            -- upvalues: u22 (copy)
            if u22 then
                task.cancel(u22);
            end;
        end);

        return function() -- Line: 91
            -- upvalues: u21 (copy)
            u21:DoCleaning();
        end;
    end, {});
    local v23 = {};
    local v24 = #v23;
    local v25 = {
        ResetOnSpawn = false,
        Enabled = not v8,
        DisplayOrder = 900,
        [u3.Ref] = u14
    };
    local v26 = {};
    local v27 = {};
    local _ = #v27;
    local v28 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(914, 915),
        Position = UDim2.fromScale(0.5, 0.47),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v29 = { u3.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(914, 915),
            PowerRelationshipPastMaximum = DeviceUtil.isSmallScreen() and 1 or 0.7,
            ScreenPadding = Vector2.new(403, DeviceUtil.isSmallScreen() and 50 or 168)
        }) };
    local v30 = #v29;
    local v31 = {
        Size = UDim2.fromScale(1, 0.9),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v32 = { u3.createElement("UIListLayout", {
            SortOrder = "LayoutOrder",
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0.05, 0)
        }), u3.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.125)
        }, { u3.createElement("UIListLayout", {
                SortOrder = "LayoutOrder",
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0.05, 0)
            }), u3.createElement("TextLabel", {
                Text = "SELECT YOUR RELIC",
                Size = UDim2.fromScale(1, 0.7),
                TextXAlignment = "Center",
                TextYAlignment = "Center",
                TextColor3 = Color3.fromRGB(240, 240, 240),
                Font = "SourceSansBold",
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                [u3.Ref] = u16
            }, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 48
                }) }), u3.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.25),
                LayoutOrder = 1,
                [u3.Ref] = u15
            }, { u3.createElement(TimedProgressBar, {
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0.65, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    EndTime = u6.SelectionEndTime,
                    ProgressBarConfig = {
                        Flip = true,
                        GradientRotation = 180,
                        BarGradient = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
                    }
                }), u3.createElement(Countdown, {
                    EndTime = u6.SelectionEndTime,
                    TextLabel = {
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.1, 1),
                        Position = UDim2.fromScale(0.8, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5)
                    },
                    CountdownConfig = {
                        minutes = false,
                        hours = false,
                        days = false
                    }
                }) }) }) };
    local _ = #v32;
    local Augments = u6.Augments;

    local function v38(p33, p34) -- Line: 205
        -- upvalues: u6 (copy), Players (ref), u11 (copy), u12 (copy), u3 (ref), PvPArenaAugmentCard (ref)
        local v35 = {
            Augment = p33
        };
        local v36;

        if u6.userIdAugmentMap and u6.userIdAugmentMap[Players.LocalPlayer.UserId] then
            local v37 = #u6.userIdAugmentMap[Players.LocalPlayer.UserId];

            if (v37 == nil and 0 or v37) < u11 then
                v36 = false;
            else
                v36 = u6.userIdAugmentMap[Players.LocalPlayer.UserId][u11 + 1] == p33;
            end;
        else
            v36 = false;
        end;

        v35.Active = v36;
        v35.Position = UDim2.fromScale(0.5, 0.33 * p34);
        v35.OnClickEnabled = u12;
        v35.CardNumber = p34;

        return u3.createElement(PvPArenaAugmentCard, v35);
    end;

    local v39 = table.create(#Augments);
    local v40 = {
        AppId = "PvPArenaAugmentVotingInterface",
        BackgroundTransparency = 0.4,
        DisableCloseOnClick = true,

        OnClick = function() -- Line: 108, Name: OnClick
            return false;
        end,

        ImageButtonProps = {
            Modal = true
        }
    };

    for i, v in Augments do
        v39[i] = v38(v, i - 1, Augments);
    end;

    local v41 = {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0.825)
    };
    local v42 = {};
    local v43 = #v42;

    for i, v in v39 do
        v42[v43 + i] = v;
    end;

    v32.PvPArenaAugmentContainer = u3.createElement("Frame", v41, v42);
    v29[v30 + 1] = u3.createElement(Empty, v31, v32);
    v29[v30 + 2] = u3.createElement(Empty, {
        Size = UDim2.fromScale(1, 0.1),
        Position = UDim2.fromScale(0.5, 1),
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 50)
        }), u3.createElement(Button, {
            Size = UDim2.fromOffset(200, 75),

            OnClick = function() -- Line: 272, Name: OnClick
                -- upvalues: u12 (copy), default (ref)
                if not u12 then
                    return nil;
                end;

                default.Client:Get("PvPArenaAugmentRerollRequest"):SendToServer();
            end
        }, {
            u3.createElement(Padding, {
                Padding = {
                    Left = 10,
                    Right = 10,
                    Top = 10,
                    Bottom = 10
                }
            }),
            u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.1, 0)
            }),
            u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                SizeConstraint = "RelativeYY",
                Size = UDim2.fromScale(0.5, 1),
                Image = BedwarsImageId.ROTATE_RIGHT_SOLID,
                ScaleType = Enum.ScaleType.Fit,
                ImageTransparency = u6.Rerolls > 0 and 0 or 0.5
            }),
            u3.createElement("TextLabel", {
                TextXAlignment = "Center",
                TextYAlignment = "Center",
                TextScaled = true,
                BackgroundTransparency = 1,
                Text = tostring(u6.Rerolls) .. " Rerolls",
                Size = UDim2.fromScale(0.5, 1),
                TextColor3 = Color3.fromRGB(240, 240, 240),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextTransparency = u6.Rerolls > 0 and 0 or 0.5
            })
        }), u3.createElement(Button, {
            Text = "<b>Hide Relic Voting</b>",
            LayoutOrder = 2,
            Size = UDim2.fromOffset(200, 75),
            TextLabel = {
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            },

            OnClick = function() -- Line: 319, Name: OnClick
                -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref)
                u9(true);
                SoundManager:playSound(GameSound.UI_CLICK_2);
            end
        }) });
    v27.PvPArenaAugmentVotingInterface = u3.createElement("Frame", v28, v29);
    v26[#v26 + 1] = u3.createElement(DarkBackground, v40, v27);
    v23[v24 + 1] = u3.createElement("ScreenGui", v25, v26);
    local v44 = {
        ResetOnSpawn = false,
        DisplayOrder = 901
    };

    if v8 then
        local userIdAugmentMap2 = u6.userIdAugmentMap;

        if userIdAugmentMap2 ~= nil then
            local v45 = userIdAugmentMap2[Players.LocalPlayer.UserId];
            userIdAugmentMap2 = v45 ~= nil and #v45 or v45;
        end;

        v8 = (userIdAugmentMap2 == nil and 0 or userIdAugmentMap2) <= u11;
    end;

    v44.Enabled = v8;
    v23[v24 + 2] = u3.createElement("ScreenGui", v44, { u3.createElement(Button, {
            Text = "<b>Show Relic Voting</b>",
            LayoutOrder = 2,
            Size = UDim2.fromOffset(200, 50),
            Position = UDim2.fromScale(0.5, 0.875),
            AnchorPoint = Vector2.new(0.5, 1),
            TextLabel = {
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            },

            OnClick = function() -- Line: 359, Name: OnClick
                -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref)
                u9(false);
                SoundManager:playSound(GameSound.UI_CLICK_2);
            end
        }) });

    return u3.createFragment(v23);
end);

return {
    PvPArenaAugmentSelectionInterface = v5.connect(function(p47, p48) -- Line: 369
        local v49 = {};

        for i, v in p48 do
            v49[i] = v;
        end;

        local pvpArena = p47.Bedwars.pvpArena;

        if pvpArena ~= nil then
            pvpArena = pvpArena.userIdAugmentMap;
        end;

        v49.userIdAugmentMap = pvpArena;

        return v49;
    end)(v46)
};