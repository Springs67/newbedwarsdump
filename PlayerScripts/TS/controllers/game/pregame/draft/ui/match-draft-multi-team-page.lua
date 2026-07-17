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
local MatchDraftBanIcon = RuntimeLib.import(script, script.Parent, "match-draft-ban-icon").MatchDraftBanIcon;
local MatchDraftPlayerRow = RuntimeLib.import(script, script.Parent, "match-draft-player-row").MatchDraftPlayerRow;
local MatchDraftTeamCardRow = RuntimeLib.import(script, script.Parent, "match-draft-team-card-row").MatchDraftTeamCardRow;
local u9 = nil;

local function v183(u10, p11) -- Line: 39
    -- upvalues: u5 (copy), Workspace (copy), MatchDraftPhase (copy), u3 (copy), TweenService (copy), u4 (copy), BedwarsImageId (copy), u2 (copy), MatchDraftConfig (copy), DeviceUtil (copy), Players (copy), MatchDraftSelectorOption (copy), SoundManager (copy), GameSound (copy), default (copy), OutCubic (copy), default2 (copy), Flamework (copy), Theme (copy), BedwarsKitMeta (copy), getBedwarsKitMeta (copy), Empty (copy), TimedProgressBar (copy), CircleCountdown (copy), ColorUtil (copy), MatchDraftPlayerRow (copy), MatchDraftTeamCardRow (copy), KitShopItemList (copy), ButtonComponent (copy), Padding (copy), u9 (ref), MatchDraftBanIcon (copy)
    local useEffect = p11.useEffect;
    local useState = p11.useState;
    local _ = p11.useValue;
    local useMemo = p11.useMemo;
    local myTeam = u10.store.Game.myTeam;

    if not myTeam then
        return u5.createFragment();
    end;

    local u12, u13 = useState(nil);
    local u14, u15 = useState({});
    local u16, u17 = useState({});
    local v18, u19 = useState({});
    local v20, u21 = useState("LOADING");
    local u22, u23 = useState(Workspace:GetServerTimeNow());
    local u24 = u5.createRef();
    local u25 = u5.createRef();
    local u26 = {};

    local function v51() -- Line: 57
        -- upvalues: u25 (copy), u10 (copy), MatchDraftPhase (ref), u3 (ref), TweenService (ref), u26 (copy), myTeam (copy), u4 (ref), BedwarsImageId (ref), u2 (ref), MatchDraftConfig (ref), u19 (copy)
        local v27 = u25:getValue();

        if not v27 then
            return nil;
        end;

        local sharedData = u10.store.Draft.sharedData;

        if sharedData ~= nil then
            sharedData = sharedData.matchDraftPhase;
        end;

        local v28 = sharedData == MatchDraftPhase.BANNING_TRANSITION;
        local u29 = u3.new();
        local u30 = TweenService:Create(v27, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Position = UDim2.fromScale(0.5, v28 and 1.2 or 0)
        });
        u30:Play();
        u29:GiveTask(function() -- Line: 72
            -- upvalues: u30 (copy)
            u30:Cancel();
            u30:Destroy();
        end);

        if v28 then
            local v31 = 0;

            for _, v in u26 do
                local kit = v.kit;
                local containerRef = v.containerRef;
                local u32 = v.imageLabelRef:getValue();
                local u33 = containerRef:getValue();

                if u32 and u33 then
                    local u34 = 1 / #u26;
                    local u35 = v31 * u34;
                    task.delay(u35, function() -- Line: 92
                        -- upvalues: TweenService (ref), u32 (copy), u34 (copy), u29 (copy), u10 (ref), myTeam (ref), kit (copy), u35 (copy), u4 (ref), BedwarsImageId (ref), u33 (copy)
                        local u36 = TweenService:Create(u32, TweenInfo.new(u34), {
                            ImageTransparency = 0,
                            BackgroundTransparency = 0.3,
                            Position = UDim2.fromScale(0.5, 0)
                        });
                        u36:Play();
                        u29:GiveTask(function() -- Line: 99
                            -- upvalues: u36 (copy)
                            u36:Cancel();
                            u36:Destroy();
                        end);
                        local sharedData2 = u10.store.Draft.sharedData;

                        if sharedData2 ~= nil then
                            sharedData2 = sharedData2.kitBans[myTeam.id];

                            if sharedData2 ~= nil then
                                sharedData2 = table.find(sharedData2, kit) ~= nil;
                            end;
                        end;

                        if not sharedData2 then
                            u29:GiveTask(task.delay(1 - u35 + 1, function() -- Line: 113
                                -- upvalues: TweenService (ref), u32 (ref), u34 (ref), u29 (ref)
                                local u37 = TweenService:Create(u32, TweenInfo.new(u34), {
                                    ImageTransparency = 1,
                                    BackgroundTransparency = 1,
                                    Position = UDim2.fromScale(0.5, 0.5)
                                });
                                u37:Play();
                                u29:GiveTask(function() -- Line: 120
                                    -- upvalues: u37 (copy)
                                    u37:Cancel();
                                    u37:Destroy();
                                end);
                            end));

                            return;
                        end;

                        local u38 = u4("ImageLabel", {
                            BorderSizePixel = 0,
                            ImageTransparency = 1,
                            BackgroundTransparency = 1,
                            Parent = u32,
                            Image = BedwarsImageId.BLOCK_ICON,
                            ScaleType = Enum.ScaleType.Crop,
                            Size = UDim2.fromScale(2, 2),
                            SizeConstraint = Enum.SizeConstraint.RelativeYY,
                            AnchorPoint = Vector2.new(1, 1),
                            Position = UDim2.fromScale(1, 1)
                        });
                        u29:GiveTask(task.delay(1 - u35 + 1, function() -- Line: 138
                            -- upvalues: TweenService (ref), u32 (ref), u29 (ref), u33 (ref), u38 (copy)
                            local u39 = TweenService:Create(u32, TweenInfo.new(1), {
                                BackgroundColor3 = Color3.fromRGB(159, 49, 49)
                            });
                            u39:Play();
                            u29:GiveTask(function() -- Line: 143
                                -- upvalues: u39 (copy)
                                u39:Cancel();
                                u39:Destroy();
                            end);
                            local u40 = TweenService:Create(u33, TweenInfo.new(1), {
                                Position = UDim2.fromScale(0, 0)
                            });
                            u40:Play();
                            u29:GiveTask(function() -- Line: 151
                                -- upvalues: u40 (copy)
                                u40:Cancel();
                                u40:Destroy();
                            end);
                            local u41 = TweenService:Create(u38, TweenInfo.new(0.5), {
                                ImageTransparency = 0,
                                Size = UDim2.fromScale(0.5, 0.5)
                            });
                            u41:Play();
                            u29:GiveTask(function() -- Line: 160
                                -- upvalues: u41 (copy)
                                u41:Cancel();
                                u41:Destroy();
                            end);
                        end));
                        u29:GiveTask(task.delay(1 - u35 + 3, function() -- Line: 165
                            -- upvalues: TweenService (ref), u32 (ref), u29 (ref), u38 (copy)
                            local u42 = TweenService:Create(u32, TweenInfo.new(1), {
                                ImageTransparency = 1,
                                BackgroundTransparency = 1,
                                Position = UDim2.fromScale(0.5, -0.5)
                            });
                            u42:Play();
                            u29:GiveTask(function() -- Line: 172
                                -- upvalues: u42 (copy)
                                u42:Cancel();
                                u42:Destroy();
                            end);
                            local u43 = TweenService:Create(u38, TweenInfo.new(1), {
                                ImageTransparency = 1
                            });
                            u43:Play();
                            u29:GiveTask(function() -- Line: 180
                                -- upvalues: u43 (copy)
                                u43:Cancel();
                                u43:Destroy();
                            end);
                        end));
                    end);
                    v31 = v31 + 1;
                end;
            end;

            local u44 = {};
            local v45 = { myTeam.id };
            local v46 = u2.keys(u10.store.Draft.enemyTeamData);
            table.move(v46, 1, #v46, #v45 + 1, v45);

            local function v50(p47) -- Line: 195
                -- upvalues: u10 (ref), u44 (copy)
                local sharedData2 = u10.store.Draft.sharedData;

                if sharedData2 ~= nil then
                    sharedData2 = sharedData2.kitBans[p47] ~= nil;
                end;

                local v48;

                if sharedData2 then
                    v48 = {};
                    local v49 = u10.store.Draft.sharedData.kitBans[p47];
                    table.move(v49, 1, #v49, #v48 + 1, v48);
                else
                    v48 = {};
                end;

                u44[p47] = v48;
            end;

            for i, v in v45 do
                v50(v, i - 1, v45);
            end;

            u29:GiveTask(task.delay(MatchDraftConfig.BANNING_TRANSITION_TIME_SECONDS - 1, function() -- Line: 221
                -- upvalues: u19 (ref), u44 (copy)
                u19(u44);
            end));
        end;

        return function() -- Line: 225
            -- upvalues: u29 (copy)
            u29:Destroy();
        end;
    end;

    local sharedData = u10.store.Draft.sharedData;

    if sharedData ~= nil then
        sharedData = sharedData.matchDraftPhase;
    end;

    useEffect(v51, { sharedData });
    useEffect(function() -- Line: 234
        -- upvalues: u14 (copy), u2 (ref), u10 (copy), u15 (copy), DeviceUtil (ref), Players (ref), MatchDraftSelectorOption (ref), MatchDraftPhase (ref), u13 (copy)
        table.clear(u14);
        local v52 = u2.entries(u10.store.Draft.teamData.kitSelection);

        local function v57(p53) -- Line: 237
            -- upvalues: u14 (ref), u15 (ref), DeviceUtil (ref), Players (ref), MatchDraftSelectorOption (ref), u10 (ref), MatchDraftPhase (ref), u13 (ref)
            local v54 = p53[1];
            local v55 = p53[2];
            u14[tonumber(v54)] = v55;
            u15(u14);
            local v56 = not DeviceUtil.isHoarceKat();

            if v56 then
                if tonumber(v54) == Players.LocalPlayer.UserId then
                    v56 = v55.selectorOption == MatchDraftSelectorOption.HOVER;
                else
                    v56 = false;
                end;
            end;

            if v56 then
                local sharedData2 = u10.store.Draft.sharedData;

                if sharedData2 ~= nil then
                    sharedData2 = sharedData2.matchDraftPhase;
                end;

                v56 = sharedData2 == MatchDraftPhase.KIT_SELECT;
            end;

            if v56 then
                u13(v55.kit);
            end;
        end;

        for i, v in v52 do
            v57(v, i - 1, v52);
        end;
    end, { u10.store.Draft.teamData.kitSelection });
    useEffect(function() -- Line: 259
        -- upvalues: u16 (copy), u2 (ref), u10 (copy), u17 (copy)
        table.clear(u16);

        local function _(p58) -- Line: 262
            -- upvalues: u16 (ref), u17 (ref)
            local v59 = p58[2];
            u16[tonumber(p58[1])] = v59;

            return u17(u16);
        end;

        for i, v in u2.entries(u10.store.Draft.teamData.votedKitBans) do
            local _ = i - 1;
            local v60 = v[2];
            u16[tonumber(v[1])] = v60;
            u17(u16);
        end;
    end, { u10.store.Draft.teamData.votedKitBans });

    local function v63() -- Line: 273
        -- upvalues: u10 (copy), MatchDraftPhase (ref), u13 (copy), SoundManager (ref), GameSound (ref), u23 (copy), Workspace (ref), u24 (copy), default (ref), OutCubic (ref)
        local sharedData2 = u10.store.Draft.sharedData;

        if sharedData2 ~= nil then
            sharedData2 = sharedData2.matchDraftPhase;
        end;

        if sharedData2 ~= MatchDraftPhase.KIT_SELECT then
            u13(nil);
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
            u23(Workspace:GetServerTimeNow());
        end;

        local u61 = u24:getValue();

        if u61 then
            default(0.2, OutCubic, function(p62) -- Line: 301
                -- upvalues: u61 (copy)
                u61.Position = p62;
            end, UDim2.fromScale(0.5, -0.4), UDim2.fromScale(0.5, 0));
        end;
    end;

    local sharedData2 = u10.store.Draft.sharedData;

    if sharedData2 ~= nil then
        sharedData2 = sharedData2.matchDraftPhaseEndTime;
    end;

    useEffect(v63, { sharedData2 });

    local function v75() -- Line: 311
        -- upvalues: u3 (ref), u10 (copy), MatchDraftPhase (ref), u21 (copy), MatchDraftConfig (ref)
        local u64 = u3.new();

        local function v69(u65) -- Line: 313
            -- upvalues: u10 (ref)
            local function _(p66) -- Line: 315
                -- upvalues: u65 (copy)
                return p66 == u65;
            end;

            local v67 = 0;
            local v68 = {};

            for i, v in u10.store.Draft.sharedData.completedPhases do
                local _ = i - 1;

                if v == u65 == true then
                    v67 = v67 + 1;
                    v68[v67] = v;
                end;
            end;

            return #v68 + 1;
        end;

        local sharedData3 = u10.store.Draft.sharedData;

        if sharedData3 ~= nil then
            sharedData3 = sharedData3.matchDraftPhase;
        end;

        if sharedData3 == MatchDraftPhase.BANNING then
            local v70 = v69(MatchDraftPhase.BANNING);
            u21("BAN A KIT" .. (MatchDraftConfig.BANNING_ROUNDS <= 1 and "" or "\n(" .. tostring(v70) .. "/" .. tostring(MatchDraftConfig.BANNING_ROUNDS) .. ")"));
        elseif sharedData3 == MatchDraftPhase.BANNING_TRANSITION then
            local v71 = v69(MatchDraftPhase.BANNING_TRANSITION);
            u21("BANNING A KIT" .. (MatchDraftConfig.BANNING_ROUNDS <= 1 and "" or "\n(" .. tostring(v71) .. "/" .. tostring(MatchDraftConfig.BANNING_ROUNDS) .. ")"));
        elseif sharedData3 == MatchDraftPhase.KIT_SELECT then
            u21("SELECT YOUR KIT");
        elseif sharedData3 == MatchDraftPhase.KIT_SELECT_POST then
            u21("STARTING MATCH...");
        elseif sharedData3 == MatchDraftPhase.START_MATCH then
            u21("STARTING");
        elseif sharedData3 == MatchDraftPhase.LOADING then
            local u72 = true;
            u64:GiveTask(task.spawn(function() -- Line: 359
                -- upvalues: u72 (ref), u21 (ref)
                local v73 = 0;

                while u72 do
                    local v74 = v73 > 3 and 0 or v73;
                    u21("WAITING FOR PLAYERS\n" .. string.rep(".", v74));
                    v73 = v74 + 1;
                    task.wait(0.5);
                end;
            end));
            u64:GiveTask(function() -- Line: 371
                -- upvalues: u72 (ref)
                u72 = false;
            end);
        else
            u21("LOADING");
        end;

        return function() -- Line: 379
            -- upvalues: u64 (copy)
            u64:DoCleaning();
        end;
    end;

    local sharedData3 = u10.store.Draft.sharedData;

    if sharedData3 ~= nil then
        sharedData3 = sharedData3.matchDraftPhase;
    end;

    useEffect(v75, { sharedData3 });

    local function u80(p76, p77) -- Line: 388
        -- upvalues: MatchDraftSelectorOption (ref), u10 (copy), MatchDraftPhase (ref), DeviceUtil (ref), u13 (copy), default2 (ref), Flamework (ref)
        if p77 == nil then
            p77 = MatchDraftSelectorOption.HOVER;
        end;

        if not p76 then
            return false;
        end;

        local sharedData4 = u10.store.Draft.sharedData;

        if sharedData4 ~= nil then
            sharedData4 = sharedData4.matchDraftPhase;
        end;

        if sharedData4 == MatchDraftPhase.BANNING then
            if DeviceUtil.isHoarceKat() then
                u13(p76);

                return true;
            end;

            local v78 = default2.Client:Get("BanKit"):CallServer(p76, p77);

            if v78.success then
                u13(p76);

                return true;
            end;

            local message = v78.message;

            if message ~= "" and message then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = v78.message
                });
            end;
        elseif sharedData4 == MatchDraftPhase.KIT_SELECT then
            if DeviceUtil.isHoarceKat() then
                u13(p76);

                return true;
            end;

            local v79 = default2.Client:Get("SelectKit"):CallServer(p76, p77);

            if v79.success then
                u13(p76);

                return true;
            end;

            local message = v79.message;

            if message ~= "" and message then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = v79.message
                });
            end;
        end;

        return false;
    end;

    local function v81() -- Line: 441
        -- upvalues: u12 (copy), Flamework (ref), SoundManager (ref), GameSound (ref), u80 (copy), MatchDraftSelectorOption (ref)
        if not u12 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = "No Kit Selected"
            });

            return nil;
        end;

        SoundManager:playSound(GameSound.SHIELD_CHARGE_START, {
            volumeMultiplier = 0.75
        });
        u80(u12, MatchDraftSelectorOption.SELECT);
    end;

    local v92 = (function() -- Line: 453
        -- upvalues: u10 (copy), MatchDraftPhase (ref), DeviceUtil (ref), Players (ref), u16 (copy), MatchDraftSelectorOption (ref), Theme (ref), u14 (copy)
        local sharedData4 = u10.store.Draft.sharedData;

        if sharedData4 ~= nil then
            sharedData4 = sharedData4.matchDraftPhase;
        end;

        if sharedData4 == MatchDraftPhase.BANNING then
            local v82 = {
                text = "Ban"
            };
            local v83;

            if DeviceUtil.isHoarceKat() then
                v83 = Theme.mcRed;
            else
                local v84 = u16[Players.LocalPlayer.UserId];

                if v84 ~= nil then
                    v84 = v84.selectorOption;
                end;

                if v84 == MatchDraftSelectorOption.SELECT then
                    v83 = Theme.mcDarkGray;
                else
                    v83 = Theme.mcRed;
                end;
            end;

            v82.backgroundColor = v83;
            local v85;

            if DeviceUtil.isHoarceKat() then
                v85 = false;
            else
                local v86 = u16[Players.LocalPlayer.UserId];

                if v86 ~= nil then
                    v86 = v86.selectorOption;
                end;

                v85 = v86 == MatchDraftSelectorOption.SELECT;
            end;

            v82.disabled = v85;

            return v82;
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

        local v87 = {
            text = "SELECT KIT"
        };
        local v88;

        if DeviceUtil.isHoarceKat() then
            v88 = Theme.backgroundSuccess;
        else
            local v89 = u16[Players.LocalPlayer.UserId];

            if v89 ~= nil then
                v89 = v89.selectorOption;
            end;

            if v89 == MatchDraftSelectorOption.SELECT then
                v88 = Theme.mcDarkGray;
            else
                v88 = Theme.backgroundSuccess;
            end;
        end;

        v87.backgroundColor = v88;
        local v90;

        if DeviceUtil.isHoarceKat() then
            v90 = false;
        else
            local v91 = u14[Players.LocalPlayer.UserId];

            if v91 ~= nil then
                v91 = v91.selectorOption;
            end;

            v90 = v91 == MatchDraftSelectorOption.SELECT;
        end;

        v87.disabled = v90;

        return v87;
    end)();

    local function u98(p93) -- Line: 552
        -- upvalues: u10 (copy), MatchDraftPhase (ref), u16 (copy), MatchDraftSelectorOption (ref), BedwarsKitMeta (ref), u14 (copy), getBedwarsKitMeta (ref)
        local sharedData4 = u10.store.Draft.sharedData;

        if sharedData4 ~= nil then
            sharedData4 = sharedData4.matchDraftPhase;
        end;

        if sharedData4 == MatchDraftPhase.BANNING then
            local v94 = u16[p93];
            local v95;

            if v94 == nil then
                v95 = v94;
            else
                v95 = v94.kit;
            end;

            if v95 then
                v95 = v94.selectorOption == MatchDraftSelectorOption.SELECT;
            end;

            return not v95 and "" or "VOTED " .. BedwarsKitMeta[v94.kit].name;
        end;

        local sharedData5 = u10.store.Draft.sharedData;

        if sharedData5 ~= nil then
            sharedData5 = sharedData5.matchDraftPhase;
        end;

        if sharedData5 ~= MatchDraftPhase.KIT_SELECT then
            return "";
        end;

        local v96 = u14[p93];
        local v97;

        if v96 == nil then
            v97 = v96;
        else
            v97 = v96.kit;
        end;

        if v97 then
            v97 = v96.selectorOption == MatchDraftSelectorOption.SELECT;
        end;

        return not v97 and "" or getBedwarsKitMeta(v96.kit).name;
    end;

    local function u103(u99) -- Line: 600
        -- upvalues: u16 (copy)
        local u100 = 0;

        local function _(p101) -- Line: 602
            -- upvalues: u99 (copy), u100 (ref)
            if p101.kit == u99 then
                u100 = u100 + 1;
            end;
        end;

        for _, v in u16 do
            if v.kit == u99 then
                u100 = u100 + 1;
            end;
        end;

        if next(u16) == nil then
            return 0;
        end;

        local v102 = 0;

        for _ in u16 do
            v102 = v102 + 1;
        end;

        return u100 / v102;
    end;

    local v104 = {
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5)
    };
    local v105 = {};
    local _ = #v105;
    local v106 = {
        Size = UDim2.fromScale(1, 0.25),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0)
    };
    local v107 = {};

    local function v109() -- Line: 636
        -- upvalues: u10 (copy), u5 (ref), Empty (ref), TimedProgressBar (ref), u22 (copy), CircleCountdown (ref), GameSound (ref)
        local sharedData4 = u10.store.Draft.sharedData;

        if sharedData4 ~= nil then
            sharedData4 = sharedData4.matchDraftPhaseEndTime;
        end;

        local v108 = math.max(sharedData4 == nil and 0 or sharedData4, 0);

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
                        StartTime = u22,
                        EndTime = v108,
                        BackgroundColor3 = Color3.fromRGB(64, 5, 5),
                        ProgressBarConfig = {
                            GradientRotation = 180,
                            Flip = true,
                            BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                        }
                    }) }), u5.createElement(CircleCountdown, {
                    OnlyPlaySoundLastNSec = 10,
                    EndTime = v108,
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
                        StartTime = u22,
                        EndTime = v108,
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

    local v110 = {
        Size = UDim2.fromScale(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v111 = {
        PhaseTitleContainer = u5.createElement(Empty, {
            Size = UDim2.fromScale(1, 0.5),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            [u5.Ref] = u24
        }, { u5.createElement("TextLabel", {
                RichText = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextStrokeTransparency = 1,
                TextWrapped = true,
                TextScaled = true,
                Text = v20,
                Size = UDim2.fromScale(0.3, 0.7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextColor3 = ColorUtil.WHITE
            }) }),
        [#v111 + 1] = useMemo(v109, { sharedData4, u22 })
    };
    v107[#v107 + 1] = u5.createElement(Empty, v110, v111);
    v105.HeaderContainer = u5.createElement(Empty, v106, v107);
    local v112 = {
        Size = UDim2.fromScale(1, 0.75),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.25)
    };
    local v113 = { u5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0.04, 0),
            PaddingLeft = UDim.new(0.04, 0),
            PaddingRight = UDim.new(0.04, 0)
        }) };
    local _ = #v113;
    local v114;

    if myTeam == nil then
        v114 = myTeam;
    else
        v114 = myTeam.members;
    end;

    local v115 = u2.values(v114);

    local function v130(p116) -- Line: 771
        -- upvalues: u16 (copy), DeviceUtil (ref), Players (ref), u10 (copy), MatchDraftPhase (ref), MatchDraftSelectorOption (ref), u14 (copy), u98 (copy), myTeam (copy), u103 (copy), u5 (ref), MatchDraftPlayerRow (ref)
        local v117 = u16[p116.userId];

        if v117 ~= nil then
            v117 = v117.kit;
        end;

        local v118 = DeviceUtil.isHoarceKat() and true or p116.userId == Players.LocalPlayer.UserId;
        local v119 = false;
        local sharedData5 = u10.store.Draft.sharedData;

        if sharedData5 ~= nil then
            sharedData5 = sharedData5.matchDraftPhase;
        end;

        local v120;

        if sharedData5 == MatchDraftPhase.BANNING then
            if DeviceUtil.isHoarceKat() then
                v120 = false;
            else
                local v121 = u16[p116.userId];

                if v121 ~= nil then
                    v121 = v121.selectorOption;
                end;

                v120 = v121 == MatchDraftSelectorOption.SELECT;
            end;
        else
            local sharedData6 = u10.store.Draft.sharedData;

            if sharedData6 ~= nil then
                sharedData6 = sharedData6.matchDraftPhase;
            end;

            if sharedData6 == MatchDraftPhase.KIT_SELECT then
                if DeviceUtil.isHoarceKat() then
                    v120 = false;
                else
                    local v122 = u10.store.Draft.teamData.kitSelection[tostring(p116.userId)];

                    if v122 ~= nil then
                        v122 = v122.selectorOption;
                    end;

                    v120 = v122 == MatchDraftSelectorOption.SELECT;
                end;
            else
                local sharedData7 = u10.store.Draft.sharedData;

                if sharedData7 ~= nil then
                    sharedData7 = sharedData7.matchDraftPhase;
                end;

                v120 = sharedData7 == MatchDraftPhase.BANNING_TRANSITION and true or v119;
            end;
        end;

        local v123 = {};
        local sharedData6 = u10.store.Draft.sharedData;

        if sharedData6 ~= nil then
            sharedData6 = sharedData6.matchDraftPhase;
        end;

        v123.HideBanBox = sharedData6 ~= MatchDraftPhase.BANNING;
        local v124 = {
            Player = p116
        };
        local v125 = u14[p116.userId];

        if v125 ~= nil then
            v125 = v125.kit;
        end;

        v124.Kit = v125;
        local v126 = u14[p116.userId];

        if v126 ~= nil then
            v126 = v126.selectorOption;
        end;

        v124.KitLockedIn = v126 == MatchDraftSelectorOption.SELECT;
        v124.ActionText = u98(p116.userId);
        local v127 = myTeam;

        if v127 ~= nil then
            v127 = v127.color;
        end;

        v124.TeamColor = v127;
        v123.CardData = v124;
        v123.BanData = {
            Kit = v117,
            Probability = not v117 and 0 or u103(v117),
            LockedIn = v120
        };
        v123.LayoutOrder = v118 and 0 or 1;
        local v128 = {};
        local v129;

        if v120 then
            v129 = Color3.fromRGB(128, 255, 133);
        elseif v118 then
            v129 = Color3.fromRGB(255, 217, 128);
        else
            v129 = nil;
        end;

        v128.Color = v129;
        v128.DisableAnimation = v120;
        v123.HighlightConfig = v128;

        return u5.createElement(MatchDraftPlayerRow, v123);
    end;

    local v131 = table.create(#v115);

    for i, v in v115 do
        v131[i] = v130(v, i - 1, v115);
    end;

    local v132 = {
        Size = UDim2.fromScale(0.22, 1),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0)
    };
    local v133 = { u5.createElement("UIListLayout", {
            FillDirection = "Vertical",
            Padding = UDim.new(0.02, 0),
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v134 = #v133;

    for i, v in v131 do
        v133[v134 + i] = v;
    end;

    v113.Team1Column = u5.createElement(Empty, v132, v133);
    local teams = u10.store.Game.teams;

    local function _(p135, p136) -- Line: 893
        return {
            team = p135,
            index = p136
        };
    end;

    local v137 = table.create(#teams);

    for i, v in teams do
        v137[i] = {
            team = v,
            index = i - 1
        };
    end;

    table.sort(v137, function(p138, p139) -- Line: 905
        -- upvalues: myTeam (copy)
        local v140 = p138.team.id == myTeam.id;

        if v140 == (p139.team.id == myTeam.id) then
            return p138.index < p139.index;
        end;

        return v140;
    end);

    local function v155(p141) -- Line: 914
        -- upvalues: myTeam (copy), u10 (copy), MatchDraftPhase (ref), u2 (ref), MatchDraftSelectorOption (ref), u5 (ref), MatchDraftTeamCardRow (ref)
        local team = p141.team;
        local v142 = false;
        local Draft = u10.store.Draft;
        local sharedData5 = Draft.sharedData;

        if sharedData5 ~= nil then
            sharedData5 = sharedData5.matchDraftPhase;
        end;

        local v143 = sharedData5 ~= MatchDraftPhase.BANNING;

        if v143 then
            local sharedData6 = Draft.sharedData;

            if sharedData6 ~= nil then
                sharedData6 = sharedData6.matchDraftPhase;
            end;

            v143 = sharedData6 ~= MatchDraftPhase.KIT_SELECT;
        end;

        local sharedData6 = Draft.sharedData;

        if sharedData6 ~= nil then
            sharedData6 = sharedData6.matchDraftPhase;
        end;

        if team.id == myTeam.id then
            local myTeam2 = u10.store.Game.myTeam;

            if myTeam2 ~= nil then
                myTeam2 = 0;

                for _ in myTeam2.members do
                    myTeam2 = myTeam2 + 1;
                end;
            end;

            local v144 = myTeam2 == nil and 0 or myTeam2;

            if sharedData6 == MatchDraftPhase.BANNING then
                local function _(p145) -- Line: 955
                    -- upvalues: MatchDraftSelectorOption (ref)
                    return p145.selectorOption == MatchDraftSelectorOption.SELECT;
                end;

                v142 = true;

                for i, v in u2.values(Draft.teamData.votedKitBans) do
                    local _ = i - 1;

                    if v.selectorOption ~= MatchDraftSelectorOption.SELECT then
                        v142 = false;
                        break;
                    end;
                end;

                if v142 then
                    v142 = #u2.values(Draft.teamData.votedKitBans) == v144;
                end;
            elseif sharedData6 == MatchDraftPhase.KIT_SELECT then
                local function _(p146) -- Line: 974
                    -- upvalues: MatchDraftSelectorOption (ref)
                    return p146.selectorOption == MatchDraftSelectorOption.SELECT;
                end;

                v142 = true;

                for i, v in u2.values(Draft.teamData.kitSelection) do
                    local _ = i - 1;

                    if v.selectorOption ~= MatchDraftSelectorOption.SELECT then
                        v142 = false;
                        break;
                    end;
                end;

                if v142 then
                    v142 = #u2.values(Draft.teamData.kitSelection) == v144;
                end;
            end;
        else
            local v147 = Draft.enemyTeamData[team.id];

            local function _(p148) -- Line: 997
                -- upvalues: team (copy)
                return p148.id == team.id;
            end;

            local v149 = nil;

            for i, v in u10.store.Game.teams do
                local _ = i - 1;

                if v.id == team.id == true then
                    v149 = v;
                    break;
                end;
            end;

            if v149 ~= nil then
                v149 = 0;

                for _ in v149.members do
                    v149 = v149 + 1;
                end;
            end;

            if sharedData6 == MatchDraftPhase.BANNING then
                if v147 ~= nil then
                    v147 = 0;

                    for _ in v147.playersVoted do
                        v147 = v147 + 1;
                    end;
                end;

                local function _(p150) -- Line: 1032
                    -- upvalues: team (copy)
                    return p150.id == team.id;
                end;

                local v151 = nil;

                for i, v in u10.store.Game.teams do
                    local _ = i - 1;

                    if v.id == team.id == true then
                        v151 = v;
                        break;
                    end;
                end;

                if v151 ~= nil then
                    v151 = 0;

                    for _ in v151.members do
                        v151 = v151 + 1;
                    end;
                end;

                v142 = v147 == v151;
            elseif sharedData6 == MatchDraftPhase.KIT_SELECT then
                if v147 ~= nil then
                    v147 = 0;

                    for _ in v147.kitSelection do
                        v147 = v147 + 1;
                    end;
                end;

                if v147 == v149 then
                    v142 = true;
                else
                    v142 = false;
                end;
            end;
        end;

        local createElement = u5.createElement;
        local v152 = {};
        local v153 = {};
        local v154;

        if v142 or v143 then
            v154 = Color3.fromRGB(128, 255, 133);
        else
            v154 = nil;
        end;

        v153.Color = v154;
        v153.DisableAnimation = v142 or v143;
        v152.HighlightConfig = v153;
        v152.Size = UDim2.fromScale(1, 0.18);
        v152.CardData = {
            store = u10.store,
            Team = team,
            IsTeamLockedIn = v142 or v143
        };

        return createElement(MatchDraftTeamCardRow, v152);
    end;

    local v156 = table.create(#v137);

    for i, v in v137 do
        v156[i] = v155(v, i - 1, v137);
    end;

    local v157 = {
        Size = UDim2.fromScale(0.22, 1),
        Position = UDim2.fromScale(1, 0),
        AnchorPoint = Vector2.new(1, 0)
    };
    local v158 = { u5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0.02, 0),
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v159 = #v158;

    for i, v in v156 do
        v158[v159 + i] = v;
    end;

    v113.TeamsColumn = u5.createElement(Empty, v157, v158);
    local v160 = {
        Size = UDim2.fromScale(0.5, 1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        [u5.Ref] = u25
    };
    local v161 = { u5.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Top",
            Padding = UDim.new(0.01, 0)
        }) };
    local v162 = #v161;
    local v163 = {
        SelectionMode = "SELECTION_ONLY",
        Size = UDim2.fromScale(1, 0.9),
        store = u10.store,
        SelectedKit = u12,
        SetSelectedKit = u80
    };
    local sharedData5 = u10.store.Draft.sharedData;

    if sharedData5 ~= nil then
        sharedData5 = sharedData5.matchDraftPhase;
    end;

    v163.ShowAllKits = sharedData5 == MatchDraftPhase.BANNING;
    local sharedData6 = u10.store.Draft.sharedData;

    if sharedData6 ~= nil then
        sharedData6 = sharedData6.matchDraftPhase;
    end;

    v163.ExcludeNonShopKits = sharedData6 == MatchDraftPhase.BANNING;
    local v164 = u2.values(v18);

    local function v168(u165, p166) -- Line: 1140
        local function _(p167) -- Line: 1142
            -- upvalues: u165 (copy)
            table.insert(u165, p167);
        end;

        for i, v in p166 do
            local _ = i - 1;
            table.insert(u165, v);
        end;

        return u165;
    end;

    local v169 = {};

    for i = 1, #v164 do
        v169 = v168(v169, v164[i], i - 1, v164);
    end;

    v163.BannedKits = v169;
    v161[v162 + 1] = u5.createElement(KitShopItemList, v163);
    v161[v162 + 2] = u5.createElement(ButtonComponent, {
        TextScaled = true,
        Size = UDim2.fromScale(0.4, 0.1),
        Text = string.upper(v92.text),
        BackgroundColor3 = v92.backgroundColor,
        OnClick = v81,
        Disabled = v92.disabled
    }, { u5.createElement(Padding, {
            Padding = UDim.new(0.15, 0)
        }) });
    v113.KitSelection = u5.createElement(Empty, v160, v161);
    local v170 = {
        Size = UDim2.fromScale(0.5, 1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v171 = {};
    local teamData = u10.store.Draft.teamData;

    if teamData ~= nil then
        teamData = teamData.votedKitBans;
    end;

    if teamData then
        local v172 = u2.values(u10.store.Draft.teamData.votedKitBans);

        local function v179(p173, p174) -- Line: 1188
            -- upvalues: u5 (ref), u26 (copy), u10 (copy), u9 (ref), MatchDraftBanIcon (ref)
            local v175 = u5.createRef();
            local v176 = u5.createRef();
            table.insert(u26, {
                kit = p173.kit,
                imageLabelRef = v175,
                containerRef = v176
            });
            local v177 = {
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0)
            };
            local v178 = 0;

            for _ in u10.store.Draft.teamData.votedKitBans do
                v178 = v178 + 1;
            end;

            v177.Position = UDim2.fromScale(u9(v178)[p174 + 1], 0);
            v177.Kit = p173.kit;
            v177[u5.Ref] = v176;
            v177.imageLabelRef = v175;

            return u5.createElement(MatchDraftBanIcon, v177);
        end;

        teamData = table.create(#v172);

        for i, v in v172 do
            teamData[i] = v179(v, i - 1, v172);
        end;
    end;

    local v180 = {
        Size = UDim2.fromScale(0.8, 0.25),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v181 = {};
    local v182 = #v181;

    for i, v in teamData do
        v181[v182 + i] = v;
    end;

    v171[#v171 + 1] = u5.createElement(Empty, v180, v181);
    v113.KitSelectionOverlay = u5.createElement(Empty, v170, v171);
    v105.BodyContainer = u5.createElement(Empty, v112, v113);

    return u5.createElement(Empty, v104, v105);
end;

u9 = function(p184) -- Line: 1237, Name: spaceEvenly
    if p184 <= 0 then
        return {};
    end;

    if p184 == 1 then
        return { 0.5 };
    end;

    local v185 = 1 / (p184 - 1);
    local v186 = false;
    local v187 = 0;
    local v188 = {};

    while true do
        if v186 then
            v187 = v187 + 1;
        else
            v186 = true;
        end;

        if v187 >= p184 then
            return v188;
        end;

        table.insert(v188, v187 * v185);
    end;
end;

return {
    MatchDraftMultiTeamPage = v6.new(u5)(v183)
};