-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ConfettiGroup = v1.ConfettiGroup;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local PlayerRender = v1.PlayerRender;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local values = u2.values;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local MatchEndScreensMeta = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta;

return {
    VictorySection = v4.new(u3)(function(u6, p7) -- Line: 25
        -- upvalues: u3 (copy), Flamework (copy), GameType (copy), OfflinePlayerUtil (copy), ColorUtil (copy), TeamColorHex (copy), DeviceUtil (copy), ClientStore (copy), Players (copy), u2 (copy), values (copy), SoundManager (copy), GameSound (copy), TweenService (copy), MatchEndScreensMeta (copy), ConfettiGroup (copy), PlayerRender (copy), Empty (copy)
        local _ = p7.useState;
        local useEffect = p7.useEffect;
        local v8 = u3.createRef();
        local u9 = u3.createRef();
        local u10 = u3.createRef();
        local u11 = u3.createRef();
        local u12 = u3.createRef();
        local u13 = {};
        local u14 = {};
        local u15 = {};
        local queueType = u6.store.Game.queueType;
        local v16 = queueType and Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(queueType).game == GameType.SURVIVAL and "Penguins Win!" or "Tie Game!";
        local v17 = {};
        local u18 = {
            id = "4",
            name = "Blue",
            members = {
                [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                [OfflinePlayerUtil.Dummy.Rascal.userId] = OfflinePlayerUtil.Dummy.Rascal
            },
            color = ColorUtil.hexColor(TeamColorHex.lightBlue)
        };
        local u19;

        if DeviceUtil.isHoarceKat() then
            u19 = u18;
        else
            local function _(p20) -- Line: 63
                -- upvalues: u6 (copy)
                return p20.id == u6.WinningTeamId;
            end;

            u19 = nil;

            for i, v in ClientStore:getState().Game.teams do
                local _ = i - 1;

                if v.id == u6.WinningTeamId == true then
                    u19 = v;
                    break;
                end;
            end;
        end;

        if u19 then
            v16 = u19.name .. " Team Wins";

            local function _(p21) -- Line: 81
                -- upvalues: u19 (copy)
                if u19.members[p21.UserId] ~= nil then
                    return p21.UserId;
                end;
            end;

            local v22 = 0;
            v17 = {};

            for i, v in Players:GetPlayers() do
                local _ = i - 1;
                local v23;

                if u19.members[v.UserId] == nil then
                    v23 = nil;
                else
                    v23 = v.UserId;
                end;

                if v23 ~= nil then
                    v22 = v22 + 1;
                    v17[v22] = v23;
                end;
            end;

            if DeviceUtil.isHoarceKat() then
                v17 = u2.keys(u18.members);
            end;
        end;

        local v24;

        if u19 == nil then
            v24 = u19;
        else
            v24 = u19.color;
        end;

        if v24 == nil then
            v24 = ColorUtil.WHITE;
        end;

        if queueType and Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(queueType).game == GameType.GUN_GAME then
            if u19 ~= nil then
                u19 = u19.members;
            end;

            if u19 then
                local v25 = values(u19)[1];

                if v25 then
                    v16 = v25.name .. " Wins!";
                end;
            end;
        end;

        local CustomTitleMessage = u6.CustomTitleMessage;

        if CustomTitleMessage ~= "" and CustomTitleMessage then
            v16 = u6.CustomTitleMessage;
        end;

        local myTeam = ClientStore:getState().Game.myTeam;
        local v26 = myTeam and myTeam.id == u6.WinningTeamId and true or true;
        useEffect(function() -- Line: 141
            -- upvalues: SoundManager (ref), GameSound (ref), u9 (copy), u10 (copy), u11 (copy), u12 (copy), DeviceUtil (ref), TweenService (ref), u13 (copy), u14 (copy), u15 (copy), MatchEndScreensMeta (ref)
            SoundManager:playSound(GameSound.END_GAME);
            local u27 = u9:getValue();
            local u28 = u10:getValue();
            local u29 = u11:getValue();
            local u30 = u12:getValue();
            local u31 = {};
            local u32 = {};
            local u33 = {};
            task.spawn(function() -- Line: 151
                -- upvalues: DeviceUtil (ref), TweenService (ref), u27 (copy), u28 (copy), u29 (copy), u31 (copy), u13 (ref), u32 (copy), u14 (ref), u33 (copy), u15 (ref)
                if DeviceUtil.isHoarceKat() then
                    task.wait(0.5);
                end;

                TweenService:Create(u27, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    Size = UDim2.fromScale(1, 1)
                }):Play();
                TweenService:Create(u28, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    Size = UDim2.fromScale(1, 1)
                }):Play();
                TweenService:Create(u29, TweenInfo.new(0.6, Enum.EasingStyle.Back), {
                    TextTransparency = 0,
                    Size = UDim2.fromScale(1, 1)
                }):Play();
                task.spawn(function() -- Line: 168
                    -- upvalues: u31 (ref), TweenService (ref), u13 (ref)
                    local function v36(p34) -- Line: 169
                        -- upvalues: u31 (ref), TweenService (ref)
                        local v35 = p34:getValue();
                        table.insert(u31, v35);
                        TweenService:Create(v35, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                            ImageTransparency = 0,
                            BackgroundTransparency = 0.7,
                            Position = UDim2.fromScale(0, 0)
                        }):Play();
                        task.wait(0.05);
                    end;

                    for i, v in u13 do
                        v36(v, i - 1, u13);
                    end;
                end);
                task.spawn(function() -- Line: 183
                    -- upvalues: u32 (ref), TweenService (ref), u14 (ref)
                    local function v39(p37) -- Line: 184
                        -- upvalues: u32 (ref), TweenService (ref)
                        local v38 = p37:getValue();
                        table.insert(u32, v38);
                        TweenService:Create(v38, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                            Size = UDim2.fromOffset(0, 14)
                        }):Play();
                        task.wait(0.05);
                    end;

                    for i, v in u14 do
                        v39(v, i - 1, u14);
                    end;
                end);
                task.spawn(function() -- Line: 196
                    -- upvalues: u33 (ref), TweenService (ref), u15 (ref)
                    local function v42(p40) -- Line: 197
                        -- upvalues: u33 (ref), TweenService (ref)
                        local v41 = p40:getValue();
                        table.insert(u33, v41);
                        TweenService:Create(v41, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                            Thickness = 1
                        }):Play();
                        task.wait(0.05);
                    end;

                    for i, v in u15 do
                        v42(v, i - 1, u15);
                    end;
                end);
            end);
            local displaySecs = MatchEndScreensMeta[1].displaySecs;
            task.delay((displaySecs == nil and 1 or displaySecs) - 0.5, function() -- Line: 216
                -- upvalues: TweenService (ref), u27 (copy), u28 (copy), u29 (copy), u30 (copy), u31 (copy), u32 (copy), u33 (copy)
                TweenService:Create(u27, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0, 1)
                }):Play();
                TweenService:Create(u28, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0, 1)
                }):Play();
                TweenService:Create(u29, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    TextTransparency = 1
                }):Play();
                TweenService:Create(u30, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                    Transparency = 1,
                    Thickness = 0
                }):Play();
                task.spawn(function() -- Line: 235
                    -- upvalues: TweenService (ref), u31 (ref), u32 (ref), u33 (ref)
                    local function v44(p43) -- Line: 236
                        -- upvalues: TweenService (ref)
                        TweenService:Create(p43, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            ImageTransparency = 1,
                            BackgroundTransparency = 1
                        }):Play();
                    end;

                    for i, v in u31 do
                        v44(v, i - 1, u31);
                    end;

                    local function v46(p45) -- Line: 245
                        -- upvalues: TweenService (ref)
                        TweenService:Create(p45, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            Size = UDim2.fromOffset(0, 0)
                        }):Play();
                    end;

                    for i, v in u32 do
                        v46(v, i - 1, u32);
                    end;

                    local function v48(p47) -- Line: 253
                        -- upvalues: TweenService (ref)
                        TweenService:Create(p47, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            Thickness = 0
                        }):Play();
                    end;

                    for i, v in u33 do
                        v48(v, i - 1, u33);
                    end;
                end);
            end);
        end, {});
        local v49 = {};

        if v26 then
            v26 = u3.createElement(ConfettiGroup, {
                Lifetime = 10
            });
        end;

        v49[1] = v26;
        local _ = #v49;
        local v50 = {
            [u3.Ref] = v8
        };

        for i, v in u6.FrameProps do
            v50[i] = v;
        end;

        local DisplayPlayers = u6.DisplayPlayers;

        if DisplayPlayers then
            local function v56(p51) -- Line: 279
                -- upvalues: u3 (ref), u13 (copy), u14 (copy), u15 (copy), DeviceUtil (ref), u18 (copy), Players (ref), PlayerRender (ref), ColorUtil (ref)
                local v52 = u3.createRef();
                local v53 = u3.createRef();
                local v54 = u3.createRef();
                table.insert(u13, v52);
                table.insert(u14, v53);
                table.insert(u15, v54);
                local v55;

                if DeviceUtil.isHoarceKat() then
                    v55 = u18.members[p51];

                    if v55 ~= nil then
                        v55 = v55.displayName;
                    end;
                else
                    v55 = Players:GetPlayerByUserId(p51);

                    if v55 ~= nil then
                        v55 = v55.DisplayName;
                    end;
                end;

                return u3.createFragment({
                    PlayerRenderWrapper = u3.createElement("Frame", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0, 1),
                        AutomaticSize = Enum.AutomaticSize.X
                    }, {
                        u3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 7)
                        }),
                        PlayerRender = u3.createElement(PlayerRender, {
                            Size = UDim2.fromScale(1, 1),
                            Position = UDim2.fromScale(0, -0.5),
                            SizeConstraint = Enum.SizeConstraint.RelativeYY,
                            BorderSizePixel = 0,
                            BackgroundColor3 = ColorUtil.WHITE,
                            ImageTransparency = 1,
                            BackgroundTransparency = 1,
                            PlayerUserId = p51,
                            [u3.Ref] = v52,
                            LayoutOrder = 0
                        }, { u3.createElement("UICorner", {
                                CornerRadius = UDim.new(1, 0)
                            }) }),
                        u3.createElement("TextLabel", {
                            Size = UDim2.fromOffset(0, 0),
                            AutomaticSize = Enum.AutomaticSize.X,
                            Text = v55,
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                            TextColor3 = ColorUtil.WHITE,
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            TextScaled = true,
                            [u3.Ref] = v53
                        }, { u3.createElement("UIStroke", {
                                Color = ColorUtil.BLACK,
                                Thickness = 0,
                                [u3.Ref] = v54
                            }) })
                    })
                });
            end;

            local v57 = table.create(#v17);

            for i, v in v17 do
                v57[i] = v56(v, i - 1, v17);
            end;

            local v58 = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.3),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0)
            };
            local v59 = { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    Padding = UDim.new(0.02, 0)
                }) };
            local v60 = #v59;

            for i, v in v57 do
                v59[v60 + i] = v;
            end;

            DisplayPlayers = u3.createFragment({
                PlayerRenderList = u3.createElement(Empty, v58, v59)
            });
        end;

        local v61 = {
            u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 3.5889830508474576,
                DominantAxis = "Height"
            }),
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 20)
            }),
            WinningTeamWrapper = u3.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.55)
            }, {
                WinningTeamPrimaryBanner = u3.createElement("Frame", {
                    BackgroundColor3 = ColorUtil.WHITE,
                    Size = UDim2.fromScale(0, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BorderSizePixel = 0,
                    ZIndex = 1,
                    [u3.Ref] = u9
                }, {
                    TopWhiteBorder = u3.createElement("Frame", {
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(1, 0.025),
                        BackgroundColor3 = ColorUtil.WHITE
                    }, { u3.createElement("UIGradient", {
                            Rotation = 0,
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.1, 0.5),
                                NumberSequenceKeypoint.new(0.5, 0.5),
                                NumberSequenceKeypoint.new(0.9, 0.5),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        }) }),
                    BottomWhiteBorder = u3.createElement("Frame", {
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(1, 0.025),
                        AnchorPoint = Vector2.new(0, 1),
                        Position = UDim2.fromScale(0, 1),
                        BackgroundColor3 = ColorUtil.WHITE
                    }, { u3.createElement("UIGradient", {
                            Rotation = 0,
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.1, 0.5),
                                NumberSequenceKeypoint.new(0.5, 0.5),
                                NumberSequenceKeypoint.new(0.9, 0.5),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        }) }),
                    u3.createElement("UIGradient", {
                        Rotation = 0,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v24), ColorSequenceKeypoint.new(1, v24) }),
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.2, 0.6),
                            NumberSequenceKeypoint.new(0.5, 0.6),
                            NumberSequenceKeypoint.new(0.8, 0.6),
                            NumberSequenceKeypoint.new(1, 1)
                        })
                    })
                }),
                WinningTeamSecondaryBannerWrapper = u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.9, 0.8),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5)
                }, {
                    WinningTeamSecondaryBanner = u3.createElement("Frame", {
                        BackgroundColor3 = ColorUtil.WHITE,
                        Size = UDim2.fromScale(0, 1),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        [u3.Ref] = u10
                    }, { u3.createElement("UIGradient", {
                            Rotation = 0,
                            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v24), ColorSequenceKeypoint.new(1, v24) }),
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.1, 0.5),
                                NumberSequenceKeypoint.new(0.5, 0.5),
                                NumberSequenceKeypoint.new(0.9, 0.5),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                        }) })
                }),
                WinningTeamTitleWrapper = u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.8, 0.45),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.55)
                }, {
                    WinningTeamTitle = u3.createElement("TextLabel", {
                        Text = v16,
                        Size = UDim2.fromScale(0, 0),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        BackgroundTransparency = 1,
                        TextTransparency = 1,
                        BorderSizePixel = 0,
                        RichText = true,
                        TextScaled = true,
                        Font = Enum.Font.LuckiestGuy,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        ZIndex = 3,
                        [u3.Ref] = u11
                    }, { u3.createElement("UIStroke", {
                            Color = ColorUtil.darken(v24, 0.8),
                            Thickness = 3,
                            [u3.Ref] = u12
                        }) })
                })
            })
        };
        local v62 = #v61;

        if DisplayPlayers then
            v61[v62 + 1] = DisplayPlayers;
        end;

        v49.VictorySection = u3.createFragment({
            VictorySection = u3.createElement(Empty, v50, v61)
        });

        return u3.createFragment(v49);
    end)
};