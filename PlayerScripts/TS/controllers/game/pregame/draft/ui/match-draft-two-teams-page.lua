-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local OutCubic = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutCubic;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v7.Players;
local TweenService = v7.TweenService;
local Workspace = v7.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KitShopItemList = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "lobby-kit-shop", "kit-shop-item-list").KitShopItemList;
local CircleCountdown = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown").CircleCountdown;
local MatchDraftConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "draft", "match-draft-config").MatchDraftConfig;
local v8 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta");
local BedwarsKitMeta = v8.BedwarsKitMeta;
local getBedwarsKitMeta = v8.getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchDraftPhase = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase;
local MatchDraftSelectorOption = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-selector-options").MatchDraftSelectorOption;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MatchDraftBanBox = RuntimeLib.import(script, script.Parent, "match-draft-ban-box").MatchDraftBanBox;
local MatchDraftBanIcon = RuntimeLib.import(script, script.Parent, "match-draft-ban-icon").MatchDraftBanIcon;
local MatchDraftPlayerRow = RuntimeLib.import(script, script.Parent, "match-draft-player-row").MatchDraftPlayerRow;
local u9 = nil;

local function v216(u10, p11) -- Line: 39
    -- upvalues: u5 (copy), Workspace (copy), MatchDraftPhase (copy), u3 (copy), TweenService (copy), u4 (copy), BedwarsImageId (copy), MatchDraftConfig (copy), u2 (copy), DeviceUtil (copy), Players (copy), MatchDraftSelectorOption (copy), SoundManager (copy), GameSound (copy), default (copy), OutCubic (copy), default2 (copy), Flamework (copy), Theme (copy), BedwarsKitMeta (copy), getBedwarsKitMeta (copy), Empty (copy), TimedProgressBar (copy), CircleCountdown (copy), ColorUtil (copy), MatchDraftBanBox (copy), MatchDraftPlayerRow (copy), KitShopItemList (copy), ButtonComponent (copy), Padding (copy), u9 (ref), MatchDraftBanIcon (copy)
    local useEffect = p11.useEffect;
    local useState = p11.useState;
    local _ = p11.useValue;
    local useMemo = p11.useMemo;
    local myTeam = u10.store.Game.myTeam;

    local function _(p12) -- Line: 46
        -- upvalues: myTeam (copy)
        local v13 = myTeam;

        if v13 ~= nil then
            v13 = v13.id;
        end;

        return p12.id ~= v13;
    end;

    local u14 = nil;

    for i, v in u10.store.Game.teams do
        local _ = i - 1;
        local v15;

        if myTeam == nil then
            v15 = myTeam;
        else
            v15 = myTeam.id;
        end;

        if v.id ~= v15 == true then
            u14 = v;
            break;
        end;
    end;

    if not (myTeam and u14) then
        return u5.createFragment();
    end;

    local u16, u17 = useState(nil);
    local u18, u19 = useState({});
    local u20, u21 = useState({});
    local v22, u23 = useState({});
    local v24, u25 = useState("LOADING");
    local u26, u27 = useState(Workspace:GetServerTimeNow());
    local u28 = u5.createRef();
    local u29 = u5.createRef();
    local u30 = u5.createRef();
    local v31 = u5.createRef();
    local u32 = {};

    local function v62() -- Line: 78
        -- upvalues: u29 (copy), u10 (copy), MatchDraftPhase (ref), u3 (ref), TweenService (ref), u32 (copy), u30 (copy), myTeam (copy), u4 (ref), BedwarsImageId (ref), u14 (copy), MatchDraftConfig (ref), u23 (copy)
        local v33 = u29:getValue();

        if not v33 then
            return nil;
        end;

        local sharedData = u10.store.Draft.sharedData;

        if sharedData ~= nil then
            sharedData = sharedData.matchDraftPhase;
        end;

        local v34 = sharedData == MatchDraftPhase.BANNING_TRANSITION;
        local u35 = u3.new();
        local u36 = TweenService:Create(v33, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Position = UDim2.fromScale(0.5, v34 and 1.2 or 0)
        });
        u36:Play();
        u35:GiveTask(function() -- Line: 93
            -- upvalues: u36 (copy)
            u36:Cancel();
            u36:Destroy();
        end);

        if v34 then
            local v37 = 0;

            for _, v in u32 do
                local kit = v.kit;
                local containerRef = v.containerRef;
                local u38 = v.imageLabelRef:getValue();
                local u39 = containerRef:getValue();
                local u40 = u30:getValue();

                if u38 and u39 then
                    local u41 = 1 / #u32;
                    local u42 = v37 * u41;
                    task.delay(u42, function() -- Line: 114
                        -- upvalues: TweenService (ref), u38 (copy), u41 (copy), u35 (copy), u10 (ref), myTeam (ref), kit (copy), u42 (copy), u4 (ref), BedwarsImageId (ref), u40 (copy), u39 (copy)
                        local u43 = TweenService:Create(u38, TweenInfo.new(u41), {
                            ImageTransparency = 0,
                            BackgroundTransparency = 0.3,
                            Position = UDim2.fromScale(0.5, 0)
                        });
                        u43:Play();
                        u35:GiveTask(function() -- Line: 121
                            -- upvalues: u43 (copy)
                            u43:Cancel();
                            u43:Destroy();
                        end);
                        local sharedData2 = u10.store.Draft.sharedData;

                        if sharedData2 ~= nil then
                            sharedData2 = sharedData2.kitBans[myTeam.id];

                            if sharedData2 ~= nil then
                                sharedData2 = table.find(sharedData2, kit) ~= nil;
                            end;
                        end;

                        if not sharedData2 then
                            u35:GiveTask(task.delay(1 - u42 + 1, function() -- Line: 135
                                -- upvalues: TweenService (ref), u38 (ref), u41 (ref), u35 (ref)
                                local u44 = TweenService:Create(u38, TweenInfo.new(u41), {
                                    ImageTransparency = 1,
                                    BackgroundTransparency = 1,
                                    Position = UDim2.fromScale(0.5, 0.5)
                                });
                                u44:Play();
                                u35:GiveTask(function() -- Line: 142
                                    -- upvalues: u44 (copy)
                                    u44:Cancel();
                                    u44:Destroy();
                                end);
                            end));

                            return;
                        end;

                        local u45 = u4("ImageLabel", {
                            BorderSizePixel = 0,
                            ImageTransparency = 1,
                            BackgroundTransparency = 1,
                            Parent = u38,
                            Image = BedwarsImageId.BLOCK_ICON,
                            ScaleType = Enum.ScaleType.Crop,
                            Size = UDim2.fromScale(2, 2),
                            SizeConstraint = Enum.SizeConstraint.RelativeYY,
                            AnchorPoint = Vector2.new(1, 1),
                            Position = UDim2.fromScale(1, 1)
                        });
                        local u46;

                        if u40 then
                            u46 = u4("ImageLabel", {
                                BorderSizePixel = 0,
                                ImageTransparency = 1,
                                BackgroundTransparency = 1,
                                Parent = u40,
                                Image = BedwarsImageId.BLOCK_ICON,
                                ScaleType = Enum.ScaleType.Crop,
                                Size = UDim2.fromScale(2, 2),
                                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                                AnchorPoint = Vector2.new(1, 1),
                                Position = UDim2.fromScale(1, 1)
                            });
                        else
                            u46 = nil;
                        end;

                        u35:GiveTask(task.delay(1 - u42 + 1, function() -- Line: 175
                            -- upvalues: TweenService (ref), u38 (ref), u35 (ref), u39 (ref), u45 (copy), u40 (ref), u46 (ref)
                            local u47 = TweenService:Create(u38, TweenInfo.new(1), {
                                BackgroundColor3 = Color3.fromRGB(159, 49, 49)
                            });
                            u47:Play();
                            u35:GiveTask(function() -- Line: 180
                                -- upvalues: u47 (copy)
                                u47:Cancel();
                                u47:Destroy();
                            end);
                            local u48 = TweenService:Create(u39, TweenInfo.new(1), {
                                Position = UDim2.fromScale(0, 0)
                            });
                            u48:Play();
                            u35:GiveTask(function() -- Line: 188
                                -- upvalues: u48 (copy)
                                u48:Cancel();
                                u48:Destroy();
                            end);
                            local u49 = TweenService:Create(u45, TweenInfo.new(0.5), {
                                ImageTransparency = 0,
                                Size = UDim2.fromScale(0.5, 0.5)
                            });
                            u49:Play();
                            u35:GiveTask(function() -- Line: 197
                                -- upvalues: u49 (copy)
                                u49:Cancel();
                                u49:Destroy();
                            end);

                            if u40 then
                                local u50 = TweenService:Create(u40, TweenInfo.new(1), {
                                    ImageTransparency = 0,
                                    BackgroundTransparency = 0,
                                    BackgroundColor3 = Color3.fromRGB(159, 49, 49)
                                });
                                u50:Play();
                                u35:GiveTask(function() -- Line: 208
                                    -- upvalues: u50 (copy)
                                    u50:Cancel();
                                    u50:Destroy();
                                end);
                            end;

                            if u46 then
                                local u51 = TweenService:Create(u46, TweenInfo.new(0.5), {
                                    ImageTransparency = 0,
                                    Size = UDim2.fromScale(0.5, 0.5)
                                });
                                u51:Play();
                                u35:GiveTask(function() -- Line: 219
                                    -- upvalues: u51 (copy)
                                    u51:Cancel();
                                    u51:Destroy();
                                end);
                            end;
                        end));
                        u35:GiveTask(task.delay(1 - u42 + 3, function() -- Line: 225
                            -- upvalues: TweenService (ref), u38 (ref), u35 (ref), u45 (copy), u40 (ref), u46 (ref)
                            local u52 = TweenService:Create(u38, TweenInfo.new(1), {
                                ImageTransparency = 1,
                                BackgroundTransparency = 1,
                                Position = UDim2.fromScale(0.5, -0.5)
                            });
                            u52:Play();
                            u35:GiveTask(function() -- Line: 232
                                -- upvalues: u52 (copy)
                                u52:Cancel();
                                u52:Destroy();
                            end);
                            local u53 = TweenService:Create(u45, TweenInfo.new(1), {
                                ImageTransparency = 1
                            });
                            u53:Play();
                            u35:GiveTask(function() -- Line: 240
                                -- upvalues: u53 (copy)
                                u53:Cancel();
                                u53:Destroy();
                            end);

                            if u40 then
                                local u54 = TweenService:Create(u40, TweenInfo.new(1), {
                                    ImageTransparency = 1,
                                    BackgroundTransparency = 1,
                                    Position = UDim2.fromScale(0.5, -1.5)
                                });
                                u54:Play();
                                u35:GiveTask(function() -- Line: 251
                                    -- upvalues: u54 (copy)
                                    u54:Cancel();
                                    u54:Destroy();
                                end);
                            end;

                            if u46 then
                                local u55 = TweenService:Create(u46, TweenInfo.new(1), {
                                    ImageTransparency = 1
                                });
                                u55:Play();
                                u35:GiveTask(function() -- Line: 261
                                    -- upvalues: u55 (copy)
                                    u55:Cancel();
                                    u55:Destroy();
                                end);
                            end;
                        end));
                    end);
                    v37 = v37 + 1;
                end;
            end;

            local u56 = {};
            local v57 = { myTeam.id, u14.id };

            local function v61(p58) -- Line: 273
                -- upvalues: u10 (ref), u56 (copy)
                local sharedData2 = u10.store.Draft.sharedData;

                if sharedData2 ~= nil then
                    sharedData2 = sharedData2.kitBans[p58] ~= nil;
                end;

                local v59;

                if sharedData2 then
                    v59 = {};
                    local v60 = u10.store.Draft.sharedData.kitBans[p58];
                    table.move(v60, 1, #v60, #v59 + 1, v59);
                else
                    v59 = {};
                end;

                u56[p58] = v59;
            end;

            for i, v in v57 do
                v61(v, i - 1, v57);
            end;

            u35:GiveTask(task.delay(MatchDraftConfig.BANNING_TRANSITION_TIME_SECONDS - 1, function() -- Line: 299
                -- upvalues: u23 (ref), u56 (copy)
                u23(u56);
            end));
        end;

        return function() -- Line: 303
            -- upvalues: u35 (copy)
            u35:Destroy();
        end;
    end;

    local sharedData = u10.store.Draft.sharedData;

    if sharedData ~= nil then
        sharedData = sharedData.matchDraftPhase;
    end;

    useEffect(v62, { sharedData });
    useEffect(function() -- Line: 312
        -- upvalues: u18 (copy), u2 (ref), u10 (copy), u19 (copy), DeviceUtil (ref), Players (ref), MatchDraftSelectorOption (ref), MatchDraftPhase (ref), u17 (copy)
        table.clear(u18);
        local v63 = u2.entries(u10.store.Draft.teamData.kitSelection);

        local function v68(p64) -- Line: 315
            -- upvalues: u18 (ref), u19 (ref), DeviceUtil (ref), Players (ref), MatchDraftSelectorOption (ref), u10 (ref), MatchDraftPhase (ref), u17 (ref)
            local v65 = p64[1];
            local v66 = p64[2];
            u18[tonumber(v65)] = v66;
            u19(u18);
            local v67 = not DeviceUtil.isHoarceKat();

            if v67 then
                if tonumber(v65) == Players.LocalPlayer.UserId then
                    v67 = v66.selectorOption == MatchDraftSelectorOption.HOVER;
                else
                    v67 = false;
                end;
            end;

            if v67 then
                local sharedData2 = u10.store.Draft.sharedData;

                if sharedData2 ~= nil then
                    sharedData2 = sharedData2.matchDraftPhase;
                end;

                v67 = sharedData2 == MatchDraftPhase.KIT_SELECT;
            end;

            if v67 then
                u17(v66.kit);
            end;
        end;

        for i, v in v63 do
            v68(v, i - 1, v63);
        end;
    end, { u10.store.Draft.teamData.kitSelection });
    useEffect(function() -- Line: 337
        -- upvalues: u20 (copy), u2 (ref), u10 (copy), u21 (copy)
        table.clear(u20);

        local function _(p69) -- Line: 340
            -- upvalues: u20 (ref), u21 (ref)
            local v70 = p69[2];
            u20[tonumber(p69[1])] = v70;

            return u21(u20);
        end;

        for i, v in u2.entries(u10.store.Draft.teamData.votedKitBans) do
            local _ = i - 1;
            local v71 = v[2];
            u20[tonumber(v[1])] = v71;
            u21(u20);
        end;
    end, { u10.store.Draft.teamData.votedKitBans });

    local function v74() -- Line: 351
        -- upvalues: u10 (copy), MatchDraftPhase (ref), u17 (copy), SoundManager (ref), GameSound (ref), u27 (copy), Workspace (ref), u28 (copy), default (ref), OutCubic (ref)
        local sharedData2 = u10.store.Draft.sharedData;

        if sharedData2 ~= nil then
            sharedData2 = sharedData2.matchDraftPhase;
        end;

        if sharedData2 ~= MatchDraftPhase.KIT_SELECT then
            u17(nil);
        end;

        local sharedData3 = u10.store.Draft.sharedData;

        if sharedData3 ~= nil then
            local _ = sharedData3.matchDraftPhase;
        end;

        SoundManager:playSound(GameSound.SKULL_DROP_SKULL_DEPOSIT_04);
        local sharedData4 = u10.store.Draft.sharedData;

        if sharedData4 ~= nil then
            sharedData4 = sharedData4.matchDraftPhaseEndTime;
        end;

        if sharedData4 ~= 0 and (sharedData4 == sharedData4 and sharedData4) then
            u27(Workspace:GetServerTimeNow());
        end;

        local u72 = u28:getValue();

        if u72 then
            default(0.2, OutCubic, function(p73) -- Line: 378
                -- upvalues: u72 (copy)
                u72.Position = p73;
            end, UDim2.fromScale(0.5, -0.4), UDim2.fromScale(0.5, 0));
        end;
    end;

    local sharedData2 = u10.store.Draft.sharedData;

    if sharedData2 ~= nil then
        sharedData2 = sharedData2.matchDraftPhaseEndTime;
    end;

    useEffect(v74, { sharedData2 });

    local function v86() -- Line: 388
        -- upvalues: u3 (ref), u10 (copy), MatchDraftPhase (ref), u25 (copy), MatchDraftConfig (ref)
        local u75 = u3.new();

        local function v80(u76) -- Line: 390
            -- upvalues: u10 (ref)
            local function _(p77) -- Line: 392
                -- upvalues: u76 (copy)
                return p77 == u76;
            end;

            local v78 = 0;
            local v79 = {};

            for i, v in u10.store.Draft.sharedData.completedPhases do
                local _ = i - 1;

                if v == u76 == true then
                    v78 = v78 + 1;
                    v79[v78] = v;
                end;
            end;

            return #v79 + 1;
        end;

        local sharedData3 = u10.store.Draft.sharedData;

        if sharedData3 ~= nil then
            sharedData3 = sharedData3.matchDraftPhase;
        end;

        if sharedData3 == MatchDraftPhase.BANNING then
            local v81 = v80(MatchDraftPhase.BANNING);
            u25("BAN A KIT" .. (MatchDraftConfig.BANNING_ROUNDS <= 1 and "" or "\n(" .. tostring(v81) .. "/" .. tostring(MatchDraftConfig.BANNING_ROUNDS) .. ")"));
        elseif sharedData3 == MatchDraftPhase.BANNING_TRANSITION then
            local v82 = v80(MatchDraftPhase.BANNING_TRANSITION);
            u25("BANNING A KIT" .. (MatchDraftConfig.BANNING_ROUNDS <= 1 and "" or "\n(" .. tostring(v82) .. "/" .. tostring(MatchDraftConfig.BANNING_ROUNDS) .. ")"));
        elseif sharedData3 == MatchDraftPhase.KIT_SELECT then
            u25("SELECT YOUR KIT");
        elseif sharedData3 == MatchDraftPhase.KIT_SELECT_POST then
            u25("STARTING MATCH...");
        elseif sharedData3 == MatchDraftPhase.START_MATCH then
            u25("STARTING");
        elseif sharedData3 == MatchDraftPhase.LOADING then
            local u83 = true;
            u75:GiveTask(task.spawn(function() -- Line: 436
                -- upvalues: u83 (ref), u25 (ref)
                local v84 = 0;

                while u83 do
                    local v85 = v84 > 3 and 0 or v84;
                    u25("WAITING FOR PLAYERS\n" .. string.rep(".", v85));
                    v84 = v85 + 1;
                    task.wait(0.5);
                end;
            end));
            u75:GiveTask(function() -- Line: 448
                -- upvalues: u83 (ref)
                u83 = false;
            end);
        else
            u25("LOADING");
        end;

        return function() -- Line: 456
            -- upvalues: u75 (copy)
            u75:DoCleaning();
        end;
    end;

    local sharedData3 = u10.store.Draft.sharedData;

    if sharedData3 ~= nil then
        sharedData3 = sharedData3.matchDraftPhase;
    end;

    useEffect(v86, { sharedData3 });

    local function u91(p87, p88) -- Line: 465
        -- upvalues: MatchDraftSelectorOption (ref), u10 (copy), MatchDraftPhase (ref), DeviceUtil (ref), u17 (copy), default2 (ref), Flamework (ref)
        if p88 == nil then
            p88 = MatchDraftSelectorOption.HOVER;
        end;

        if not p87 then
            return false;
        end;

        local sharedData4 = u10.store.Draft.sharedData;

        if sharedData4 ~= nil then
            sharedData4 = sharedData4.matchDraftPhase;
        end;

        if sharedData4 == MatchDraftPhase.BANNING then
            if DeviceUtil.isHoarceKat() then
                u17(p87);

                return true;
            end;

            local v89 = default2.Client:Get("BanKit"):CallServer(p87, p88);

            if v89.success then
                u17(p87);

                return true;
            end;

            local message = v89.message;

            if message ~= "" and message then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = v89.message
                });
            end;
        elseif sharedData4 == MatchDraftPhase.KIT_SELECT then
            if DeviceUtil.isHoarceKat() then
                u17(p87);

                return true;
            end;

            local v90 = default2.Client:Get("SelectKit"):CallServer(p87, p88);

            if v90.success then
                u17(p87);

                return true;
            end;

            local message = v90.message;

            if message ~= "" and message then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = v90.message
                });
            end;
        end;

        return false;
    end;

    local function v92() -- Line: 518
        -- upvalues: u16 (copy), Flamework (ref), SoundManager (ref), GameSound (ref), u91 (copy), MatchDraftSelectorOption (ref)
        if not u16 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = "No Kit Selected"
            });

            return nil;
        end;

        SoundManager:playSound(GameSound.SHIELD_CHARGE_START, {
            volumeMultiplier = 0.75
        });
        u91(u16, MatchDraftSelectorOption.SELECT);
    end;

    local v103 = (function() -- Line: 530
        -- upvalues: u10 (copy), MatchDraftPhase (ref), DeviceUtil (ref), Players (ref), u20 (copy), MatchDraftSelectorOption (ref), Theme (ref), u18 (copy)
        local sharedData4 = u10.store.Draft.sharedData;

        if sharedData4 ~= nil then
            sharedData4 = sharedData4.matchDraftPhase;
        end;

        if sharedData4 == MatchDraftPhase.BANNING then
            local v93 = {
                text = "Ban"
            };
            local v94;

            if DeviceUtil.isHoarceKat() then
                v94 = Theme.mcRed;
            else
                local v95 = u20[Players.LocalPlayer.UserId];

                if v95 ~= nil then
                    v95 = v95.selectorOption;
                end;

                if v95 == MatchDraftSelectorOption.SELECT then
                    v94 = Theme.mcDarkGray;
                else
                    v94 = Theme.mcRed;
                end;
            end;

            v93.backgroundColor = v94;
            local v96;

            if DeviceUtil.isHoarceKat() then
                v96 = false;
            else
                local v97 = u20[Players.LocalPlayer.UserId];

                if v97 ~= nil then
                    v97 = v97.selectorOption;
                end;

                v96 = v97 == MatchDraftSelectorOption.SELECT;
            end;

            v93.disabled = v96;

            return v93;
        end;

        if sharedData4 ~= MatchDraftPhase.KIT_SELECT then
            return sharedData4 == MatchDraftPhase.KIT_SELECT_POST and {
                text = "SELECTED",
                disabled = true,
                backgroundColor = Theme.Gray
            } or (sharedData4 == MatchDraftPhase.START_MATCH and {
                text = "SELECTED",
                disabled = true,
                backgroundColor = Theme.Gray
            } or (sharedData4 == MatchDraftPhase.LOADING and {
                text = "SELECT",
                disabled = true,
                backgroundColor = Theme.Gray
            } or {
                text = "SELECT",
                disabled = true,
                backgroundColor = Theme.Gray
            }));
        end;

        local v98 = {
            text = "SELECT KIT"
        };
        local v99;

        if DeviceUtil.isHoarceKat() then
            v99 = Theme.backgroundSuccess;
        else
            local v100 = u20[Players.LocalPlayer.UserId];

            if v100 ~= nil then
                v100 = v100.selectorOption;
            end;

            if v100 == MatchDraftSelectorOption.SELECT then
                v99 = Theme.mcDarkGray;
            else
                v99 = Theme.backgroundSuccess;
            end;
        end;

        v98.backgroundColor = v99;
        local v101;

        if DeviceUtil.isHoarceKat() then
            v101 = false;
        else
            local v102 = u18[Players.LocalPlayer.UserId];

            if v102 ~= nil then
                v102 = v102.selectorOption;
            end;

            v101 = v102 == MatchDraftSelectorOption.SELECT;
        end;

        v98.disabled = v101;

        return v98;
    end)();

    local function u112(p104) -- Line: 629
        -- upvalues: u10 (copy), MatchDraftPhase (ref), u20 (copy), MatchDraftSelectorOption (ref), BedwarsKitMeta (ref), DeviceUtil (ref), u14 (copy), u18 (copy), getBedwarsKitMeta (ref)
        local sharedData4 = u10.store.Draft.sharedData;

        if sharedData4 ~= nil then
            sharedData4 = sharedData4.matchDraftPhase;
        end;

        if sharedData4 == MatchDraftPhase.BANNING then
            local v105 = u20[p104];
            local v106;

            if v105 == nil then
                v106 = v105;
            else
                v106 = v105.kit;
            end;

            if v106 then
                v106 = v105.selectorOption == MatchDraftSelectorOption.SELECT;
            end;

            if v106 then
                return "VOTED " .. BedwarsKitMeta[v105.kit].name;
            end;

            local v107 = not DeviceUtil.isHoarceKat();

            if v107 then
                local v108 = u10.store.Draft.enemyTeamData[u14.id];

                if v108 ~= nil then
                    v108 = v108.playersVoted;
                end;

                v107 = v108[tostring(p104)] ~= nil;
            end;

            return v107 and "" or "VOTING...";
        end;

        local sharedData5 = u10.store.Draft.sharedData;

        if sharedData5 ~= nil then
            sharedData5 = sharedData5.matchDraftPhase;
        end;

        if sharedData5 ~= MatchDraftPhase.KIT_SELECT then
            return "";
        end;

        local v109 = u18[p104];
        local v110;

        if v109 == nil then
            v110 = v109;
        else
            v110 = v109.kit;
        end;

        if v110 then
            v110 = v109.selectorOption == MatchDraftSelectorOption.SELECT;
        end;

        if v110 then
            return getBedwarsKitMeta(v109.kit).name;
        end;

        local v111 = u10.store.Draft.enemyTeamData[u14.id];

        if v111 ~= nil then
            v111 = v111.playersVoted;
        end;

        return v111[tostring(p104)] == nil and "SELECTING KIT..." or "";
    end;

    local function u117(u113) -- Line: 702
        -- upvalues: u20 (copy)
        local u114 = 0;

        local function _(p115) -- Line: 704
            -- upvalues: u113 (copy), u114 (ref)
            if p115.kit == u113 then
                u114 = u114 + 1;
            end;
        end;

        for _, v in u20 do
            if v.kit == u113 then
                u114 = u114 + 1;
            end;
        end;

        if next(u20) == nil then
            return 0;
        end;

        local v116 = 0;

        for _ in u20 do
            v116 = v116 + 1;
        end;

        return u114 / v116;
    end;

    local v118 = {
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5)
    };
    local v119 = {};
    local _ = #v119;
    local v120 = {
        Size = UDim2.fromScale(1, 0.25),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0)
    };
    local v121 = {};
    local v122 = #v121;

    local function v124() -- Line: 738
        -- upvalues: u10 (copy), u5 (ref), Empty (ref), TimedProgressBar (ref), u26 (copy), CircleCountdown (ref), GameSound (ref)
        local sharedData4 = u10.store.Draft.sharedData;

        if sharedData4 ~= nil then
            sharedData4 = sharedData4.matchDraftPhaseEndTime;
        end;

        local v123 = math.max(sharedData4 == nil and 0 or sharedData4, 0);

        return u5.createFragment({
            CountdownSection = u5.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.68)
            }, { u5.createElement(Empty, {
                    Size = UDim2.new(0.45, 0, 0.15, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromScale(0, 0.5)
                }, { u5.createElement("UIPadding", {
                        PaddingRight = UDim.new(0.1, 0),
                        PaddingLeft = UDim.new(0.1, 0)
                    }), u5.createElement(TimedProgressBar, {
                        Rotation = 180,
                        Size = UDim2.fromScale(1, 1),
                        StartTime = u26,
                        EndTime = v123,
                        BackgroundColor3 = Color3.fromRGB(64, 5, 5),
                        ProgressBarConfig = {
                            GradientRotation = 180,
                            Flip = true,
                            BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                        }
                    }) }), u5.createElement(CircleCountdown, {
                    OnlyPlaySoundLastNSec = 10,
                    EndTime = v123,
                    FrameProps = {
                        ZIndex = 3,
                        Size = UDim2.fromScale(0.2, 0.9),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    },
                    PlayCustomSoundAtTime = {
                        timeLeftSec = 3,
                        sound = GameSound.LTM_GOAL_MOVING_SOUND
                    }
                }), u5.createElement(Empty, {
                    Size = UDim2.new(0.45, 0, 0.15, 0),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.fromScale(1, 0.5)
                }, { u5.createElement("UIPadding", {
                        PaddingRight = UDim.new(0.1, 0),
                        PaddingLeft = UDim.new(0.1, 0)
                    }), u5.createElement(TimedProgressBar, {
                        Size = UDim2.fromScale(1, 1),
                        StartTime = u26,
                        EndTime = v123,
                        BackgroundColor3 = Color3.fromRGB(64, 5, 5),
                        ProgressBarConfig = {
                            GradientRotation = 180,
                            Flip = true,
                            BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                        }
                    }) }) })
        });
    end;

    local sharedData4 = u10.store.Draft.sharedData;

    if sharedData4 ~= nil then
        sharedData4 = sharedData4.matchDraftPhaseEndTime;
    end;

    local v125 = {
        Size = UDim2.fromScale(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v126 = {
        PhaseTitleContainer = u5.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.5),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            [u5.Ref] = u28
        }, { u5.createElement("TextLabel", {
                RichText = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextStrokeTransparency = 1,
                TextWrapped = true,
                TextScaled = true,
                Text = v24,
                Size = UDim2.fromScale(0.3, 0.7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextColor3 = ColorUtil.WHITE
            }) }),
        [#v126 + 1] = useMemo(v124, { sharedData4, u26 })
    };
    v121[v122 + 1] = u5.createElement(Empty, v125, v126);
    local v127 = {
        Size = UDim2.fromScale(0.25, 1),
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5)
    };
    local v128 = {};
    local _ = #v128;
    local v129 = {
        Size = UDim2.fromScale(1, 0.35),
        Position = UDim2.fromScale(1, 0.8),
        AnchorPoint = Vector2.new(1, 1)
    };
    local v130 = { u5.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Right",
            VerticalAlignment = "Center",
            Padding = UDim.new(0, 30)
        }) };
    local v131 = #v130;
    local v132 = {
        Size = UDim2.fromScale(0.25, 1)
    };
    local v133;

    if v22[myTeam.id] == nil then
        v133 = nil;
    else
        v133 = v22[myTeam.id][1];
    end;

    v132.BanData = v133 and {
        Kit = v22[myTeam.id][1],
        LockedIn = true
    } or nil;
    v130[v131 + 1] = u5.createElement(MatchDraftBanBox, v132);
    local v134 = {
        Size = UDim2.fromScale(0.25, 1)
    };
    local v135;

    if v22[myTeam.id] == nil then
        v135 = nil;
    else
        v135 = v22[myTeam.id][2];
    end;

    v134.BanData = v135 and {
        Kit = v22[myTeam.id][2],
        LockedIn = true
    } or nil;
    v130[v131 + 2] = u5.createElement(MatchDraftBanBox, v134);
    v128.Team1Bans = u5.createElement(Empty, v129, v130);
    v121[v122 + 2] = u5.createElement(Empty, v127, v128);
    local v136 = {
        Size = UDim2.fromScale(0.25, 1),
        Position = UDim2.fromScale(1, 0.5),
        AnchorPoint = Vector2.new(1, 0.5)
    };
    local v137 = {};
    local _ = #v137;
    local v138 = {
        Size = UDim2.fromScale(1, 0.35),
        Position = UDim2.fromScale(1, 0.8),
        AnchorPoint = Vector2.new(1, 1)
    };
    local v139 = { u5.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Center",
            Padding = UDim.new(0, 30)
        }) };
    local v140 = #v139;
    local v141 = {
        Size = UDim2.fromScale(0.25, 1)
    };
    local v142 = {};
    local v143;

    if v22[u14.id] == nil then
        v143 = nil;
    else
        v143 = v22[u14.id][1];
    end;

    v142.Kit = v143;
    v142.LockedIn = true;
    v141.BanData = v142;
    v139[v140 + 1] = u5.createElement(MatchDraftBanBox, v141);
    local v144 = {
        Size = UDim2.fromScale(0.25, 1)
    };
    local v145 = {};
    local v146;

    if v22[u14.id] == nil then
        v146 = nil;
    else
        v146 = v22[u14.id][2];
    end;

    v145.Kit = v146;
    v145.LockedIn = true;
    v144.BanData = v145;
    v139[v140 + 2] = u5.createElement(MatchDraftBanBox, v144);
    v137.Team2Bans = u5.createElement(Empty, v138, v139);
    v121[v122 + 3] = u5.createElement(Empty, v136, v137);
    v119.HeaderContainer = u5.createElement(Empty, v120, v121);
    local v147 = {
        Size = UDim2.fromScale(1, 0.75),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.25)
    };
    local v148 = { u5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0.04, 0),
            PaddingLeft = UDim.new(0.04, 0),
            PaddingRight = UDim.new(0.04, 0)
        }) };
    local _ = #v148;
    local v149;

    if myTeam == nil then
        v149 = myTeam;
    else
        v149 = myTeam.members;
    end;

    local v150 = u2.values(v149);

    local function v165(p151) -- Line: 1001
        -- upvalues: u20 (copy), DeviceUtil (ref), Players (ref), u10 (copy), MatchDraftPhase (ref), MatchDraftSelectorOption (ref), u18 (copy), u112 (copy), myTeam (copy), u117 (copy), u5 (ref), MatchDraftPlayerRow (ref)
        local v152 = u20[p151.userId];

        if v152 ~= nil then
            v152 = v152.kit;
        end;

        local v153 = DeviceUtil.isHoarceKat() and true or p151.userId == Players.LocalPlayer.UserId;
        local v154 = false;
        local sharedData5 = u10.store.Draft.sharedData;

        if sharedData5 ~= nil then
            sharedData5 = sharedData5.matchDraftPhase;
        end;

        local v155;

        if sharedData5 == MatchDraftPhase.BANNING then
            if DeviceUtil.isHoarceKat() then
                v155 = false;
            else
                local v156 = u20[p151.userId];

                if v156 ~= nil then
                    v156 = v156.selectorOption;
                end;

                v155 = v156 == MatchDraftSelectorOption.SELECT;
            end;
        else
            local sharedData6 = u10.store.Draft.sharedData;

            if sharedData6 ~= nil then
                sharedData6 = sharedData6.matchDraftPhase;
            end;

            if sharedData6 == MatchDraftPhase.KIT_SELECT then
                if DeviceUtil.isHoarceKat() then
                    v155 = false;
                else
                    local v157 = u10.store.Draft.teamData.kitSelection[tostring(p151.userId)];

                    if v157 ~= nil then
                        v157 = v157.selectorOption;
                    end;

                    v155 = v157 == MatchDraftSelectorOption.SELECT;
                end;
            else
                local sharedData7 = u10.store.Draft.sharedData;

                if sharedData7 ~= nil then
                    sharedData7 = sharedData7.matchDraftPhase;
                end;

                v155 = sharedData7 == MatchDraftPhase.BANNING_TRANSITION and true or v154;
            end;
        end;

        local v158 = {};
        local sharedData6 = u10.store.Draft.sharedData;

        if sharedData6 ~= nil then
            sharedData6 = sharedData6.matchDraftPhase;
        end;

        v158.HideBanBox = sharedData6 ~= MatchDraftPhase.BANNING;
        local v159 = {
            Player = p151
        };
        local v160 = u18[p151.userId];

        if v160 ~= nil then
            v160 = v160.kit;
        end;

        v159.Kit = v160;
        local v161 = u18[p151.userId];

        if v161 ~= nil then
            v161 = v161.selectorOption;
        end;

        v159.KitLockedIn = v161 == MatchDraftSelectorOption.SELECT;
        v159.ActionText = u112(p151.userId);
        local v162 = myTeam;

        if v162 ~= nil then
            v162 = v162.color;
        end;

        v159.TeamColor = v162;
        v158.CardData = v159;
        v158.BanData = {
            Kit = v152,
            Probability = not v152 and 0 or u117(v152),
            LockedIn = v155
        };
        v158.LayoutOrder = v153 and 0 or 1;
        local v163 = {};
        local v164;

        if v155 then
            v164 = Color3.fromRGB(128, 255, 133);
        elseif v153 then
            v164 = Color3.fromRGB(255, 217, 128);
        else
            v164 = nil;
        end;

        v163.Color = v164;
        v163.DisableAnimation = v155;
        v158.HighlightConfig = v163;

        return u5.createElement(MatchDraftPlayerRow, v158);
    end;

    local v166 = table.create(#v150);

    for i, v in v150 do
        v166[i] = v165(v, i - 1, v150);
    end;

    local v167 = {
        Size = UDim2.fromScale(0.22, 1),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0)
    };
    local v168 = { u5.createElement("UIListLayout", {
            FillDirection = "Vertical",
            Padding = UDim.new(0.02, 0),
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v169 = #v168;

    for i, v in v166 do
        v168[v169 + i] = v;
    end;

    v148.Team1Column = u5.createElement(Empty, v167, v168);
    local v170;

    if u14 == nil then
        v170 = u14;
    else
        v170 = u14.members;
    end;

    local v171 = u2.values(v170);

    local function v186(p172) -- Line: 1128
        -- upvalues: u10 (copy), MatchDraftPhase (ref), DeviceUtil (ref), u14 (copy), u18 (copy), MatchDraftSelectorOption (ref), u112 (copy), u5 (ref), MatchDraftPlayerRow (ref)
        local v173 = false;
        local sharedData5 = u10.store.Draft.sharedData;

        if sharedData5 ~= nil then
            sharedData5 = sharedData5.matchDraftPhase;
        end;

        local v174;

        if sharedData5 == MatchDraftPhase.BANNING then
            if DeviceUtil.isHoarceKat() then
                v174 = false;
            else
                local v175 = u10.store.Draft.enemyTeamData[u14.id];

                if v175 ~= nil then
                    v175 = v175.playersVoted;
                end;

                v174 = v175[tostring(p172.userId)] ~= nil;

                if v174 == nil then
                    v174 = false;
                end;
            end;
        else
            local sharedData6 = u10.store.Draft.sharedData;

            if sharedData6 ~= nil then
                sharedData6 = sharedData6.matchDraftPhase;
            end;

            if sharedData6 == MatchDraftPhase.KIT_SELECT then
                if DeviceUtil.isHoarceKat() then
                    v174 = false;
                else
                    local v176 = u10.store.Draft.enemyTeamData[u14.id];

                    if v176 ~= nil then
                        v176 = v176.kitSelection;
                    end;

                    v174 = v176[tostring(p172.userId)] ~= nil;

                    if v174 == nil then
                        v174 = false;
                    end;
                end;
            else
                local sharedData7 = u10.store.Draft.sharedData;

                if sharedData7 ~= nil then
                    sharedData7 = sharedData7.matchDraftPhase;
                end;

                v174 = sharedData7 == MatchDraftPhase.BANNING_TRANSITION and true or v173;
            end;
        end;

        local v177 = {
            HideBanBox = true
        };
        local v178 = {
            Player = p172
        };
        local v179 = u10.store.Draft.enemyTeamData[u14.id];

        if v179 ~= nil then
            v179 = v179.kitSelection;
        end;

        local v180;

        if v179 == nil then
            v180 = nil;
        else
            local v181 = u10.store.Draft.enemyTeamData[u14.id];

            if v181 ~= nil then
                v181 = v181.kitSelection;
            end;

            v180 = v181[tostring(p172.userId)];

            if v180 ~= nil then
                v180 = v180.kit;
            end;

            if v180 == nil then
                v180 = nil;
            end;
        end;

        v178.Kit = v180;
        local v182 = u18[p172.userId];

        if v182 ~= nil then
            v182 = v182.selectorOption;
        end;

        v178.KitLockedIn = v182 == MatchDraftSelectorOption.SELECT;
        v178.ActionText = u112(p172.userId);
        local v183 = u14;

        if v183 ~= nil then
            v183 = v183.color;
        end;

        v178.TeamColor = v183;
        v177.CardData = v178;
        local v184 = {
            Mode = "RIGHT"
        };
        local v185;

        if v174 then
            v185 = Color3.fromRGB(128, 255, 133);
        else
            v185 = nil;
        end;

        v184.Color = v185;
        v184.DisableAnimation = v174;
        v177.HighlightConfig = v184;

        return u5.createElement(MatchDraftPlayerRow, v177);
    end;

    local v187 = table.create(#v171);

    for i, v in v171 do
        v187[i] = v186(v, i - 1, v171);
    end;

    local v188 = {
        Size = UDim2.fromScale(0.22, 1),
        Position = UDim2.fromScale(1, 0),
        AnchorPoint = Vector2.new(1, 0)
    };
    local v189 = { u5.createElement("UIListLayout", {
            FillDirection = "Vertical",
            Padding = UDim.new(0.02, 0)
        }) };
    local v190 = #v189;

    for i, v in v187 do
        v189[v190 + i] = v;
    end;

    v148.Team2Column = u5.createElement(Empty, v188, v189);
    local v191 = {
        Size = UDim2.fromScale(0.5, 1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        [u5.Ref] = u29
    };
    local v192 = { u5.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Top",
            Padding = UDim.new(0.01, 0)
        }) };
    local v193 = #v192;
    local v194 = {
        SelectionMode = "SELECTION_ONLY",
        Size = UDim2.fromScale(1, 0.9),
        store = u10.store,
        SelectedKit = u16,
        SetSelectedKit = u91
    };
    local sharedData5 = u10.store.Draft.sharedData;

    if sharedData5 ~= nil then
        sharedData5 = sharedData5.matchDraftPhase;
    end;

    v194.ShowAllKits = sharedData5 == MatchDraftPhase.BANNING;
    local sharedData6 = u10.store.Draft.sharedData;

    if sharedData6 ~= nil then
        sharedData6 = sharedData6.matchDraftPhase;
    end;

    v194.ExcludeNonShopKits = sharedData6 == MatchDraftPhase.BANNING;
    local v195 = u2.values(v22);

    local function v199(u196, p197) -- Line: 1299
        local function _(p198) -- Line: 1301
            -- upvalues: u196 (copy)
            table.insert(u196, p198);
        end;

        for i, v in p197 do
            local _ = i - 1;
            table.insert(u196, v);
        end;

        return u196;
    end;

    local v200 = {};

    for i = 1, #v195 do
        v200 = v199(v200, v195[i], i - 1, v195);
    end;

    v194.BannedKits = v200;
    v192[v193 + 1] = u5.createElement(KitShopItemList, v194);
    v192[v193 + 2] = u5.createElement(ButtonComponent, {
        TextScaled = true,
        Size = UDim2.fromScale(0.4, 0.1),
        Text = string.upper(v103.text),
        BackgroundColor3 = v103.backgroundColor,
        OnClick = v92,
        Disabled = v103.disabled
    }, { u5.createElement(Padding, {
            Padding = UDim.new(0.15, 0)
        }) });
    v148.KitSelection = u5.createElement(Empty, v191, v192);
    local v201 = {
        Size = UDim2.fromScale(0.5, 1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v202 = {};
    local teamData = u10.store.Draft.teamData;

    if teamData ~= nil then
        teamData = teamData.votedKitBans;
    end;

    if teamData then
        local v203 = u2.values(u10.store.Draft.teamData.votedKitBans);

        local function v210(p204, p205) -- Line: 1347
            -- upvalues: u5 (ref), u32 (copy), u10 (copy), u9 (ref), MatchDraftBanIcon (ref)
            local v206 = u5.createRef();
            local v207 = u5.createRef();
            table.insert(u32, {
                kit = p204.kit,
                imageLabelRef = v206,
                containerRef = v207
            });
            local v208 = {
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0)
            };
            local v209 = 0;

            for _ in u10.store.Draft.teamData.votedKitBans do
                v209 = v209 + 1;
            end;

            v208.Position = UDim2.fromScale(u9(v209)[p205 + 1], 0);
            v208.Kit = p204.kit;
            v208[u5.Ref] = v207;
            v208.imageLabelRef = v206;

            return u5.createElement(MatchDraftBanIcon, v208);
        end;

        teamData = table.create(#v203);

        for i, v in v203 do
            teamData[i] = v210(v, i - 1, v203);
        end;
    end;

    local v211 = {
        Size = UDim2.fromScale(0.8, 0.25),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v212 = {};
    local v213 = #v212;

    for i, v in teamData do
        v212[v213 + i] = v;
    end;

    local v214 = #v212;
    local sharedData7 = u10.store.Draft.sharedData;

    if sharedData7 ~= nil then
        sharedData7 = sharedData7.kitBans[u14.id];
    end;

    if sharedData7 then
        local v215 = {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(1, 1),
            Kit = u10.store.Draft.sharedData.kitBans[u14.id][#u10.store.Draft.sharedData.kitBans[u14.id] - 1 + 1],
            [u5.Ref] = v31,
            imageLabelRef = u30
        };
        sharedData7 = u5.createElement(MatchDraftBanIcon, v215);
    end;

    if sharedData7 then
        v212[v214 + 1] = sharedData7;
    end;

    v202[#v202 + 1] = u5.createElement(Empty, v211, v212);
    v148.KitSelectionOverlay = u5.createElement(Empty, v201, v202);
    v119.BodyContainer = u5.createElement(Empty, v147, v148);

    return u5.createElement(Empty, v118, v119);
end;

u9 = function(p217) -- Line: 1423, Name: spaceEvenly
    if p217 <= 0 then
        return {};
    end;

    if p217 == 1 then
        return { 0.5 };
    end;

    local v218 = 1 / (p217 - 1);
    local v219 = false;
    local v220 = 0;
    local v221 = {};

    while true do
        if v219 then
            v220 = v220 + 1;
        else
            v219 = true;
        end;

        if v220 >= p217 then
            return v221;
        end;

        table.insert(v221, v220 * v218);
    end;
end;

return {
    MatchDraftTwoTeamsPage = v6.new(u5)(v216)
};