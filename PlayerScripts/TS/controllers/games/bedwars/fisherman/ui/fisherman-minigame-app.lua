-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v5.ContextActionService;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local FishermanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "fisherman", "fisherman-util").FishermanUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local FishermanMinigameCountdown = RuntimeLib.import(script, script.Parent, "fisherman-minigame-countdown").FishermanMinigameCountdown;
local u6 = ExpireList.new(3);

return {
    FishermanMinigameApp = v4.new(u3)(function(u7, p8) -- Line: 26
        -- upvalues: SoundManager (copy), GameSound (copy), u2 (copy), ContextActionService (copy), FishermanUtil (copy), RuntimeLib (copy), RunService (copy), u6 (copy), DeviceUtil (copy), KnitClient (copy), ClientSyncEvents (copy), TweenService (copy), u3 (copy), UIUtil (copy), Empty (copy), ColorUtil (copy), BedwarsImageId (copy), FishermanMinigameCountdown (copy)
        local useState = p8.useState;
        local useEffect = p8.useEffect;
        local u9, u10 = useState(false);
        local u11, u12 = useState(false);
        local u13, u14 = useState(25);
        local u15 = nil;
        local u16 = nil;
        local u17 = nil;
        local u18 = nil;
        local u19 = nil;
        local u20 = nil;
        useEffect(function() -- Line: 33
            -- upvalues: SoundManager (ref), GameSound (ref), u2 (ref), ContextActionService (ref), u15 (ref), FishermanUtil (ref), RuntimeLib (ref), u16 (ref), RunService (ref), u6 (ref), u17 (ref), u18 (ref), u19 (ref), u20 (ref)
            local u21 = SoundManager:playSound(GameSound.FISHERMAN_GAME_START);
            local u22 = false;
            local u23 = u2.new();
            ContextActionService:BindActionAtPriority("fishing-click", function(p24, p25, p26) -- Line: 38
                -- upvalues: u23 (copy), u22 (ref), SoundManager (ref), GameSound (ref), u15 (ref), FishermanUtil (ref), RuntimeLib (ref), u16 (ref)
                if p25 == Enum.UserInputState.Begin then
                    u23:DoCleaning();
                    u22 = true;
                    u23:GiveTask(function() -- Line: 42
                        -- upvalues: u22 (ref)
                        u22 = false;
                    end);
                    local v27 = 0;
                    local v28 = SoundManager:playSound(GameSound.FISHERMAN_GAME_PULLING_LOOP, {
                        looped = true
                    });

                    if v28 then
                        u23:GiveTask(v28);
                    end;

                    while u22 do
                        u15(FishermanUtil.startingMarkerIncrementSpeed - v27);
                        v27 = v27 + 0.01;
                        RuntimeLib.Promise.delay(0.05):await();
                    end;
                elseif p25 == Enum.UserInputState.End then
                    u23:DoCleaning();
                    u16();
                end;
            end, false, Enum.ContextActionPriority.High.Value, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, Enum.UserInputType.Touch);
            local u29 = nil;
            local u30 = 0;
            local u34 = RunService.Heartbeat:Connect(function(p31) -- Line: 65
                -- upvalues: u30 (ref), FishermanUtil (ref), u6 (ref), u17 (ref), u18 (ref), u29 (ref), SoundManager (ref), GameSound (ref), u19 (ref), u20 (ref)
                local v32 = math.round(u30 * 10) / 10;

                if v32 ~= 0 and (v32 % FishermanUtil.fishZoneMoveCooldown == 0 and not u6:has("moveFishZone")) then
                    u17();
                    u6:add("moveFishZone");
                end;

                if u18(p31) then
                    if not u29 then
                        u29 = SoundManager:playSound(GameSound.FISHERMAN_GAME_PROGRESS_INCREASE, {
                            looped = true
                        });
                    end;
                else
                    local v33 = u29;

                    if v33 ~= nil then
                        v33:Destroy();
                    end;

                    u29 = nil;
                end;

                if u19() then
                    u20();
                end;

                u30 = u30 + p31;
            end);
            local u35 = SoundManager:playSound(GameSound.FISHERMAN_GAME_LOOP, {
                looped = true
            });

            return function() -- Line: 95
                -- upvalues: u21 (copy), u29 (ref), u35 (copy), u23 (copy), ContextActionService (ref), u34 (copy)
                local v36 = u21;

                if v36 ~= nil then
                    v36:Destroy();
                end;

                local v37 = u29;

                if v37 ~= nil then
                    v37:Destroy();
                end;

                local v38 = u35;

                if v38 ~= nil then
                    v38:Destroy();
                end;

                u23:DoCleaning();
                ContextActionService:UnbindAction("fishing-click");

                if u34 then
                    u34:Disconnect();
                end;
            end;
        end, {});
        useEffect(function() -- Line: 115
            -- upvalues: u9 (copy), u20 (ref), DeviceUtil (ref), KnitClient (ref)
            if not u9 then
                return nil;
            end;

            u20();

            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.FishingMinigameController:closeFishingMinigameApp();
            end;
        end, { u9 });

        u20 = function() -- Line: 124
            -- upvalues: u9 (copy), ClientSyncEvents (ref), u11 (copy), u13 (copy)
            if not u9 then
                return nil;
            end;

            ClientSyncEvents.FishermanMinigameEnd:fire(u9, u11, u13);
        end;

        local u39 = nil;

        u15 = function(p40) -- Line: 132
            -- upvalues: u39 (ref), u9 (copy), FishermanUtil (ref), TweenService (ref)
            local v41 = u39:getValue();

            if u9 or not v41 then
                return nil;
            end;

            TweenService:Create(v41, TweenInfo.new(math.max(p40, FishermanUtil.holdMinimumMarkerIncrementSpeed), Enum.EasingStyle.Linear), {
                Position = UDim2.new(math.min(v41.Position.X.Scale + FishermanUtil.markerIncrementAmount, 1 - v41.Size.X.Scale), 0, 0.5, 0)
            }):Play();
        end;

        u16 = function() -- Line: 144
            -- upvalues: u39 (ref), u9 (copy), FishermanUtil (ref), TweenService (ref)
            local v42 = u39:getValue();

            if u9 or not v42 then
                return nil;
            end;

            TweenService:Create(v42, TweenInfo.new(FishermanUtil.totalDecaySpeedSec * (v42.Position.X.Scale + v42.Size.X.Scale), Enum.EasingStyle.Linear), {
                Position = UDim2.new(0, 2, 0.5, 0)
            }):Play();
        end;

        local u43 = nil;

        u17 = function() -- Line: 158
            -- upvalues: u43 (ref), u9 (copy), SoundManager (ref), GameSound (ref), FishermanUtil (ref), TweenService (ref)
            local v44 = u43:getValue();

            if u9 or not v44 then
                return nil;
            end;

            SoundManager:playSound(GameSound.FISHERMAN_GAME_FISH_MOVE);
            local X = v44.Position.X;
            local MinMoveDistance = FishermanUtil.MinMoveDistance;
            local MaxMoveDistance = FishermanUtil.MaxMoveDistance;
            local v45 = { math.max(X.Scale - MaxMoveDistance, 0 + MinMoveDistance), (math.min(X.Scale + MaxMoveDistance, 1 - MinMoveDistance)) };
            local v46 = Random.new(os.time()):NextNumber(v45[1], v45[2]) + MinMoveDistance / 2;
            local v47 = FishermanUtil.fishZoneSpeedMultiplier * math.abs(v44.Position.X.Scale - v46);
            TweenService:Create(v44, TweenInfo.new(v47, Enum.EasingStyle.Linear), {
                Position = UDim2.new(v46, 0, 0.5, 0)
            }):Play();
        end;

        local u48 = nil;

        u18 = function(p49) -- Line: 179
            -- upvalues: u39 (ref), u9 (copy), u43 (ref), u48 (ref)
            local v50 = false;
            local v51 = u39:getValue();

            if u9 or not v51 then
                return nil;
            end;

            local v52 = u43:getValue();

            if v52.AbsolutePosition.X < v51.AbsolutePosition.X or v52.AbsolutePosition.X + v52.AbsoluteSize.X > v51.AbsolutePosition.X + v51.AbsoluteSize.X then
                u48(v50, p49);

                return v50;
            end;

            local v53 = true;
            u48(v53, p49);

            return v53;
        end;

        local u54 = nil;

        u48 = function(p55, p56) -- Line: 200
            -- upvalues: u54 (ref), FishermanUtil (ref), u7 (copy)
            local v57 = u54:getValue();
            local v58 = 60 * p56;

            if p55 then
                v57.Size = UDim2.new(math.min(v57.Size.X.Scale + FishermanUtil.fillAmount * v58, 1), 0, 1, 0);

                return;
            end;

            local decaySpeedMultiplier = u7.decaySpeedMultiplier;
            v57.Size = UDim2.new(math.max(v57.Size.X.Scale - FishermanUtil.drainAmount * (decaySpeedMultiplier == nil and 1 or decaySpeedMultiplier) * v58, 0), 0, 1, 0);
        end;

        u19 = function() -- Line: 216
            -- upvalues: u54 (ref), u9 (copy), u12 (copy), u10 (copy)
            local v59 = u54:getValue();

            if u9 or not v59 then
                return nil;
            end;

            if v59.Size.X.Scale ~= 1 then
                return false;
            end;

            u12(true);
            u10(true);

            return true;
        end;

        local function v61(p60) -- Line: 230
            -- upvalues: u9 (copy), u14 (copy), u12 (copy), u10 (copy)
            if u9 then
                return nil;
            end;

            u14(p60);
            u12(false);
            u10(true);
        end;

        u39 = u3.createRef();
        u43 = u3.createRef();
        u54 = u3.createRef();
        local v62 = Color3.fromRGB(0, 255, 56);
        local fishType = u7.fishType;

        if fishType == "fish_diamond" then
            v62 = Color3.fromRGB(2, 247, 247);
        elseif fishType == "fish_gold" then
            v62 = Color3.fromRGB(247, 181, 44);
        elseif fishType == "fish_iron" then
            v62 = Color3.fromRGB(145, 140, 146);
        elseif fishType == "fish_special" then
            v62 = Color3.fromRGB(220, 111, 127);
        end;

        local v63 = {};
        local size = u7.size;

        if size == nil then
            size = DeviceUtil.isHoarceKat();
        end;

        local v64;

        if size then
            v64 = UDim2.fromScale(0.3, 0.3);
        else
            v64 = UDim2.fromScale(1, 1);
        end;

        v63.Size = v64;
        v63.SizeConstraint = "RelativeXX";
        local position = u7.position;

        if position == nil then
            position = DeviceUtil.isHoarceKat();
        end;

        local v65;

        if position then
            v65 = UIUtil:getActionBarPosition();
        else
            v65 = nil;
        end;

        v63.Position = v65;
        v63.AnchorPoint = u7.anchorPoint or Vector2.new(0.5, 0.5);
        local v66 = { u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 6.3
            }) };
        local v67 = #v66;
        local v68 = not u9;

        if v68 then
            local createFragment = u3.createFragment;
            local v69 = {};
            local v70 = u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.2, 0)
            });
            local createElement = u3.createElement;
            local v71 = {
                Size = UDim2.fromScale(1, 0.2)
            };
            local v72 = {};
            local createElement2 = u3.createElement;
            local v73 = {
                Size = UDim2.fromScale(0.6, 1)
            };
            local v74 = {
                Instructions = u3.createElement("TextLabel", {
                    AutomaticSize = "X",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(0, 1),
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    Text = (DeviceUtil.isMobileControls() and "Tap" or "Click") .. " & Hold"
                }, { u3.createElement("UIStroke", {
                        Transparency = 0.2,
                        Thickness = 1,
                        Color = ColorUtil.BLACK
                    }) })
            };
            local createElement3 = u3.createElement;
            local v75 = {
                SizeConstraint = "RelativeYY",
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ZIndex = 4,
                Position = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.new(0, 1),
                Size = UDim2.fromScale(1, 0.8)
            };
            local v76;

            if DeviceUtil.isMobileControls() then
                v76 = BedwarsImageId.MOUSE;
            else
                v76 = BedwarsImageId.TOUCH;
            end;

            v75.Image = v76;
            v74[1] = createElement3("ImageLabel", v75);
            v72[1], v72[2] = createElement2(Empty, v73, v74), u3.createElement(Empty, {
    Size = UDim2.fromScale(0.4, 1.1),
    AnchorPoint = Vector2.new(1, 0),
    Position = UDim2.fromScale(1, 0)
}, { u3.createElement(FishermanMinigameCountdown, {
        HandleRanOutOfTime = v61,
        GameOver = u9,
        Duration = u7.duration
    }) });
            v69[1], v69[2], v69[3] = v70, createElement(Empty, v71, v72), u3.createElement(Empty, {
    LayoutOrder = 2,
    Size = UDim2.fromScale(1, 0.6)
}, {
    u3.createElement("UIListLayout", {
        FillDirection = "Vertical",
        HorizontalAlignment = "Center",
        VerticalAlignment = "Center",
        Padding = UDim.new(0.3, 0)
    }),
    Minigame = u3.createElement("Frame", {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0.5)
    }, {
        u3.createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(87, 154, 253)), ColorSequenceKeypoint.new(1, Color3.fromRGB(155, 195, 255)) }),
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 0.7) })
        }),
        u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        }),
        u3.createElement("UIStroke", {
            Thickness = 2,
            Transparency = 0.3,
            Color = ColorUtil.BLACK
        }),
        Marker = u3.createElement("Frame", {
            Size = UDim2.new(FishermanUtil.markerSize.X.Scale, -4, FishermanUtil.markerSize.Y.Scale, -4),
            Position = UDim2.new(0, 2, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = FishermanUtil.markerColor,
            [u3.Ref] = u39,
            ZIndex = 3
        }, { u3.createElement("UIStroke", {
                Thickness = 1,
                Transparency = 0.7,
                Color = Color3.fromRGB(0, 0, 0)
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }) }),
        FishZone = u3.createElement(Empty, {
            Size = UDim2.new(FishermanUtil.fishZoneSize.X.Scale, -4, FishermanUtil.fishZoneSize.Y.Scale + 0.2, -4),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            [u3.Ref] = u43,
            ZIndex = 4
        }, {
            u3.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                Rotation = -20,
                ScaleType = "Fit",
                Image = "rbxassetid://7976208326",
                BackgroundTransparency = 1,
                ZIndex = 4,
                Position = UDim2.fromScale(0.5, -0.03),
                AnchorPoint = Vector2.new(0.5, 1),
                Size = UDim2.fromScale(1.5, 1)
            }),
            FishZone = u3.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 4,
                Size = UDim2.new(1, 0, FishermanUtil.fishZoneSize.Y.Scale, -4),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = v62
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), u3.createElement("UIStroke", {
                    Thickness = 1,
                    Color = ColorUtil.darken(v62, 0.7)
                }) })
        })
    }),
    ProgressBar = u3.createElement("Frame", {
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.65, 0.2),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    }, { u3.createElement("UIStroke", {
            Thickness = 1,
            Transparency = 0.3,
            Color = Color3.fromRGB(0, 0, 0)
        }), u3.createElement("Frame", {
            Size = UDim2.fromScale(0, 0),
            [u3.Ref] = u54,
            BackgroundColor3 = ColorUtil.WHITE,
            BorderSizePixel = 0
        }, { u3.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(47, 243, 86)), ColorSequenceKeypoint.new(1, FishermanUtil.markerColor) })
            }) }) })
});
            v68 = createFragment(v69);
        end;

        if v68 then
            v66[v67 + 1] = v68;
        end;

        return u3.createFragment({
            FishingMinigameApp = u3.createElement(Empty, v63, v66)
        });
    end)
};