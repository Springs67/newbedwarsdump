-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local ColorUtil = v1.ColorUtil;
local ConstraintType = v1.ConstraintType;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local GameTheme = v1.GameTheme;
local IndicatorUIType = v1.IndicatorUIType;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local PingGuiObject = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "ping", "ui", "ping-gui-object").PingGuiObject;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ScoreBoardWrapper = RuntimeLib.import(script, script.Parent, "ui", "flag-capture-ui").ScoreBoardWrapper;
local FlagTimerApp = RuntimeLib.import(script, script.Parent, "ui", "flag-timer-app").FlagTimerApp;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 46, Name: __tostring
        return "FlagCaptureController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 52
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 56
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p9);
    p9.Name = "FlagCaptureController";
    p9.rayMap = {};
    p9.flagMap = {};
    p9.flagLocation = {};
    p9.cooldown = 0;
    p9.flagBaseCooldown = 0;
    p9.slowMaid = u3.new();
    p9.teamPosition = 0;
end;

function u7.KnitStart(u10) -- Line: 67
    -- upvalues: KnitController (copy), u3 (copy), default (copy), ClientStore (copy), MatchState (copy), QueueType (copy), u5 (copy), ScoreBoardWrapper (copy), Players (copy), ClientSyncEvents (copy), SyncEventPriority (copy), ItemType (copy), SoundManager (copy), GameTheme (copy), GameSound (copy), KnitClient (copy), RunService (copy), CollectionTagAdded (copy), FlagTimerApp (copy), u4 (copy), Theme (copy), DeviceUtil (copy), CollectionService (copy)
    KnitController.KnitStart(u10);
    local u11 = u3.new();
    default.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p12, p13, p14) -- Line: 70
        -- upvalues: ClientStore (ref), MatchState (ref), QueueType (ref), u5 (ref), ScoreBoardWrapper (ref), Players (ref), u11 (copy)
        local queueType = ClientStore:getState().Game.queueType;

        if p12 == MatchState.RUNNING and queueType == QueueType.FLAG_CAPTURE then
            local u15 = u5.mount(ScoreBoardWrapper(), Players.LocalPlayer:WaitForChild("PlayerGui"));
            u11:GiveTask(function() -- Line: 74
                -- upvalues: u5 (ref), u15 (copy)
                u5.unmount(u15);
            end);
        end;

        if p12 == MatchState.POST then
            u11:DoCleaning();
        end;
    end);
    ClientSyncEvents.StartLaunchProjectile:setPriority(SyncEventPriority.HIGHEST):connect(function(p16) -- Line: 83
        -- upvalues: Players (ref)
        if p16:isCancelled() then
            return nil;
        end;

        if p16.projectileType ~= "telepearl" then
            return nil;
        end;

        if Players.LocalPlayer:GetAttribute("FlagHolder") ~= true then
            return nil;
        end;

        p16:setCancelled(true);
    end);
    ClientSyncEvents.BeginProjectileTargeting:setPriority(SyncEventPriority.HIGHEST):connect(function(p17) -- Line: 95
        -- upvalues: ItemType (ref), Players (ref), SoundManager (ref), GameTheme (ref)
        if p17:isCancelled() then
            return nil;
        end;

        if p17.handItem.itemType ~= ItemType.TELEPEARL then
            return nil;
        end;

        if Players.LocalPlayer:GetAttribute("FlagHolder") ~= true then
            return nil;
        end;

        SoundManager:playSound(GameTheme.sound.uiDisabled);
        p17:setCancelled(true);
    end);
    ClientSyncEvents.ZiplineMount:setPriority(SyncEventPriority.HIGHEST):connect(function(p18) -- Line: 108
        -- upvalues: Players (ref), SoundManager (ref), GameTheme (ref)
        if p18:isCancelled() then
            return nil;
        end;

        if Players.LocalPlayer:GetAttribute("FlagHolder") ~= true then
            return nil;
        end;

        SoundManager:playSound(GameTheme.sound.uiDisabled);
        p18:setCancelled(true);
    end);
    default.Client:Get("PlayerCaptureFlag"):Connect(function(p19) -- Line: 118
        -- upvalues: u10 (copy), Players (ref)
        u10:addSlow(p19.player);
        local v20 = u10:createRay(p19.player, p19.neutral);

        if p19.player ~= Players.LocalPlayer then
            u10:createIndicatorOnPlayer(p19.player, v20);
        end;
    end);
    default.Client:Get("FlagHolderRemove"):Connect(function(p21) -- Line: 126
        -- upvalues: u10 (copy)
        u10:removeSlow(p21.player);
        local v22 = u10.rayMap[p21.player];

        if v22 then
            v22:Destroy();
            u10.rayMap[p21.player] = nil;
        end;

        local v23 = u10.flagMap[p21.player];

        if v23 then
            v23:Destroy();
            u10.flagMap[p21.player] = nil;
        end;
    end);
    default.Client:Get("FlagHolderUpdate"):Connect(function(p24) -- Line: 148
        -- upvalues: SoundManager (ref), GameSound (ref)
        if not p24.teamFlag then
            SoundManager:playSound(GameSound.FLAG_CAPTURE);
        end;
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("FlagHolder"):Connect(function() -- Line: 153
        -- upvalues: Players (ref), KnitClient (ref)
        local v25 = Players.LocalPlayer:GetAttribute("FlagHolder");

        if v25 == 0 or (v25 ~= v25 or (v25 == "" or not v25)) then
            KnitClient.Controllers.WormholeController:enableWormholeAbility();

            return;
        end;

        KnitClient.Controllers.WormholeController:disableWormHoleAbility();
    end);
    RunService.Heartbeat:Connect(function() -- Line: 161
        -- upvalues: u10 (copy)
        local function _(p26, p27) -- Line: 163
            local Character = p27.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if not Character then
                p26:Destroy();
            end;

            local v28;

            if p26 then
                if p27 == nil then
                    v28 = p27;
                else
                    v28 = p27.Character;
                end;
            else
                v28 = p26;
            end;

            if v28 then
                p26.Position = p27.Character:GetPrimaryPartCFrame().Position;
            end;
        end;

        for i, v in u10.rayMap do
            local Character = i.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if not Character then
                v:Destroy();
            end;

            local v29;

            if v then
                if i == nil then
                    v29 = i;
                else
                    v29 = i.Character;
                end;
            else
                v29 = v;
            end;

            if v29 then
                v.Position = i.Character:GetPrimaryPartCFrame().Position;
            end;
        end;

        local flagMap = u10.flagMap;

        local function v35(p30, p31) -- Line: 187
            local Character = p31.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if not Character then
                p30:Destroy();
            end;

            local v32;

            if p30 then
                if p31 == nil then
                    v32 = p31;
                else
                    v32 = p31.Character;
                end;
            else
                v32 = p30;
            end;

            if v32 then
                local Character2 = p31.Character;

                if Character2 ~= nil then
                    local v33 = Character2:GetPrimaryPartCFrame();
                    local v34 = CFrame.Angles(0, 1.5707963267948966, 0);
                    Character2 = (v33 + Vector3.new(0, 8, 0)) * v34;
                end;

                p30:PivotTo(Character2);
            end;
        end;

        for i, v in flagMap do
            v35(v, i, flagMap);
        end;
    end);
    CollectionTagAdded("flag", function(u36) -- Line: 219
        -- upvalues: KnitClient (ref), Players (ref), u5 (ref), FlagTimerApp (ref), u4 (ref), Theme (ref), DeviceUtil (ref), default (ref), RunService (ref), u10 (copy)
        local v37 = u36:GetAttribute("Team");
        local v38 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v38 ~= nil then
            v38 = v38.id;
        end;

        local v39 = u36:GetAttribute("OriginalPosition");

        if v39 == 0 or v39 ~= v39 then
            v39 = false;
        elseif v39 == "" then
            v39 = false;
        end;

        if not v39 and v37 ~= "Neutral" then
            local u40 = os.time();
            local u41 = u40 + 10 - os.time();
            local u42 = u5.mount(u5.createElement("BillboardGui", {
                StudsOffsetWorldSpace = Vector3.new(0, 5.5, 0),
                MaxDistance = 110,
                ExtentsOffset = Vector3.new(0, 0, 2),
                Size = UDim2.fromScale(4.5, 1)
            }, { u5.createElement(FlagTimerApp, {
                    Countdown = u41
                }) }), u36);
            task.spawn(function() -- Line: 244
                -- upvalues: u41 (ref), u40 (copy), u5 (ref), u42 (copy), FlagTimerApp (ref)
                while true do
                    local v43 = task.wait(0.2);

                    if v43 == 0 or (v43 ~= v43 or not v43) then
                        break;
                    end;

                    if u41 <= 0 then
                        return nil;
                    end;

                    local v44 = u40 + 10 - os.time();
                    local v45 = math.round(v44);
                    local v46 = math.max(0, v45);

                    if u41 ~= v46 then
                        u41 = v46;
                        u5.update(u42, u5.createElement("BillboardGui", {
                            StudsOffsetWorldSpace = Vector3.new(0, 5.5, 0),
                            MaxDistance = 110,
                            ExtentsOffset = Vector3.new(0, 0, 2),
                            Size = UDim2.fromScale(4.5, 1)
                        }, { u5.createElement(FlagTimerApp, {
                                Countdown = u41
                            }) }));
                    end;
                end;
            end);
        end;

        if v37 == v38 then
            local v47 = u36:GetAttribute("OriginalPosition");

            if v47 == 0 or (v47 ~= v47 or (v47 == "" or not v47)) then
                u4("ProximityPrompt", {
                    ActionText = "Return Flag",
                    RequiresLineOfSight = false,
                    MaxActivationDistance = 6,
                    HoldDuration = 1.5,
                    Parent = u36,
                    KeyboardKeyCode = Theme.promptKeyboardKey,
                    ClickablePrompt = DeviceUtil.isMobileControls()
                }).PromptButtonHoldEnded:Connect(function() -- Line: 283
                    -- upvalues: default (ref), u36 (copy)
                    default.Client:Get("PlayerReturnFlag"):SendToServer({
                        flag = u36
                    });
                end);
            end;
        end;

        local u49 = RunService.Heartbeat:Connect(function(p48) -- Line: 303
            -- upvalues: Players (ref), u36 (copy), u10 (ref), default (ref)
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if not Character then
                return nil;
            end;

            if (Character - u36.Position).Magnitude < 10 then
                if tick() < u10.cooldown then
                    return nil;
                end;

                u10.cooldown = tick() + 0.2;
                default.Client:Get("TouchedBlock"):SendToServer({
                    block = u36
                });
            end;
        end);
        u36.Destroying:Connect(function() -- Line: 329
            -- upvalues: u49 (copy)
            u49:Disconnect();
        end);

        if u10.flagLocation[u36] == nil then
            u10.flagLocation[u36] = u36.Position;
        end;

        u10:createIndicatorOnFlag(u36);
    end);
    CollectionTagAdded("FlagBase", function(u50) -- Line: 342
        -- upvalues: Players (ref), u10 (copy), RunService (ref), default (ref)
        local u51 = u50:GetAttribute("TeamName");
        local v52;

        if u51 == "" or not u51 then
            v52 = u51;
        else
            local Team = Players.LocalPlayer.Team;

            if Team ~= nil then
                Team = Team.Name;
            end;

            v52 = u51 == Team;
        end;

        if v52 == "" or not v52 then
            if u51 ~= "" and u51 then
                u10.enemyFlagOrigin = u50.Position;
            end;
        else
            u10.teamFlagOrigin = u50.Position;
        end;

        local u55 = RunService.Heartbeat:Connect(function(p53) -- Line: 357
            -- upvalues: Players (ref), u50 (copy), u51 (copy), u10 (ref), default (ref)
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if not Character then
                return nil;
            end;

            if (Character - u50.Position).Magnitude < 10 then
                local v54 = u51;

                if v54 ~= "" and v54 then
                    local Team = Players.LocalPlayer.Team;

                    if Team ~= nil then
                        Team = Team.Name;
                    end;

                    v54 = u51 == Team;
                end;

                if v54 ~= "" and v54 then
                    if tick() < u10.flagBaseCooldown then
                        return nil;
                    end;

                    u10.flagBaseCooldown = tick() + 0.2;
                    default.Client:Get("FlagDeliver"):SendToServer({
                        part = u50
                    });
                end;
            end;
        end);
        u50.Destroying:Connect(function() -- Line: 391
            -- upvalues: u55 (copy)
            u55:Disconnect();
        end);
    end);
    CollectionService:GetInstanceRemovedSignal("flag"):Connect(function(p56) -- Line: 395
        -- upvalues: u10 (copy)
        u10.flagLocation[p56] = nil;
    end);
end;

function u7.createRay(p57, p58, p59) -- Line: 401
    -- upvalues: Players (copy), Workspace (copy), u4 (copy), ReplicatedStorage (copy), GameQueryUtil (copy)
    Color3.fromRGB(230, 255, 0);
    local v60;

    if p58.Team == Players.LocalPlayer.Team then
        v60 = Color3.fromRGB(0, 255, 13);
    else
        v60 = Color3.fromRGB(255, 0, 0);
    end;

    local v61 = {
        Parent = Workspace
    };
    local Character = p58.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame();
    end;

    v61.CFrame = Character;
    v61.Shape = Enum.PartType.Cylinder;
    v61.Color = v60;
    v61.Material = Enum.Material.ForceField;
    v61.CastShadow = false;
    v61.Size = Vector3.new(1200, 4, 4);
    v61.Orientation = Vector3.new(0, 0, 90);
    v61.Transparency = 0.25;
    v61.Anchored = true;
    v61.CanCollide = false;
    v61.CanQuery = false;
    v61.CanTouch = false;
    local v62 = u4("Part", v61);
    local Character2 = p58.Character;

    if Character2 ~= nil then
        Character2 = Character2:GetPrimaryPartCFrame();
    end;

    if Character2 then
        local v63 = ReplicatedStorage.Assets.Effects.Flag:Clone();
        v63.Parent = Workspace;
        local TeamIndicator1 = v63:WaitForChild("TeamIndicator1", 3);
        local TeamIndicator2 = v63:WaitForChild("TeamIndicator2", 3);
        local Team = p58.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        local v64;

        if Team == "Blue" then
            v64 = Color3.fromRGB(230, 255, 0);
        else
            v64 = Color3.fromRGB(0, 120, 255);
        end;

        if p59 then
            v64 = Color3.fromRGB(204, 0, 255);
        end;

        TeamIndicator1.Color = v64;
        TeamIndicator2.Color = v64;
        local Character3 = p58.Character;

        if Character3 ~= nil then
            Character3 = Character3:GetPrimaryPartCFrame() + Vector3.new(0, 5, 0);
        end;

        v63:PivotTo(Character3);

        if p59 then
            v63:SetAttribute("Neutral", true);
        end;

        p57.flagMap[p58] = v63;
        GameQueryUtil:setQueryIgnored(v63, true);
    end;

    GameQueryUtil:setQueryIgnored(v62, true);
    p57.rayMap[p58] = v62;

    return v62;
end;

function u7.addSlow(p65, p66) -- Line: 474
    -- upvalues: Players (copy), KnitClient2 (copy)
    if p66 == Players.LocalPlayer then
        p65.slowMaid:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = 0.8
        }));
    end;
end;

function u7.removeSlow(p67, p68) -- Line: 481
    -- upvalues: Players (copy)
    if p68 == Players.LocalPlayer then
        p67.slowMaid:DoCleaning();
    end;
end;

function u7.createIndicator(p69, p70, p71) -- Line: 486
    -- upvalues: Players (copy), StringUtil (copy), Flamework (copy), IndicatorUIType (copy), PingGuiObject (copy), TweenService (copy), ConstraintType (copy)
    local function v77(p72, p73, p74, p75, p76) -- Line: 487
        -- upvalues: Players (ref), StringUtil (ref)
        local Container = p75:FindFirstChild("Container");

        if Container ~= nil then
            Container = Container:FindFirstChild("PingCreatorAvatar");
        end;

        if Container and p76 then
            if p76 ~= nil then
                p76 = p76.UserId;
            end;

            Container.Image = Players:GetUserThumbnailAsync(p76, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352);
        end;

        local Container2 = p75:FindFirstChild("Container");

        if Container2 ~= nil then
            Container2 = Container2:FindFirstChild("DistanceTracker");
        end;

        if Container2 then
            Container2.Text = "<b>" .. StringUtil.roundNumber(p72 / 3, 0) .. "m</b>";
        end;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/indicators/world-indicator-controller@WorldIndicatorController"):addIndicator({
        creator = nil,
        uiType = IndicatorUIType.Custom,
        uiConfig = {
            distanceRelativeToPlayer = true,
            scaleWithAlpha = false,
            scaleOnFade = false,
            easeOutOnAppoach = false,
            color3 = p71.color,
            template = PingGuiObject(p71.icon, p71.color),

            transparency = function(p78, p79, p80) -- Line: 515, Name: transparency
                local function _(p81) -- Line: 518
                    if p81:IsA("TextLabel") then
                        p81.TextTransparency = 0;
                    end;

                    if p81:IsA("UIStroke") then
                        p81.Transparency = 0;
                    end;

                    if p81:IsA("ImageLabel") then
                        p81.ImageTransparency = 0;
                    end;
                end;

                for i, descendant in p78:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("TextLabel") then
                        descendant.TextTransparency = 0;
                    end;

                    if descendant:IsA("UIStroke") then
                        descendant.Transparency = 0;
                    end;

                    if descendant:IsA("ImageLabel") then
                        descendant.ImageTransparency = 0;
                    end;
                end;

                return 0;
            end,

            onEnterAnimation = function(p82) -- Line: 538, Name: onEnterAnimation
                -- upvalues: TweenService (ref)
                local PingIcon = p82:FindFirstChild("PingIcon");

                if PingIcon ~= nil then
                    PingIcon = PingIcon:Clone();
                end;

                if not PingIcon then
                    return nil;
                end;

                PingIcon.Parent = p82;
                local u83 = TweenService:Create(PingIcon, TweenInfo.new(0.15), {
                    ImageTransparency = 1,
                    Size = UDim2.fromScale(1.5, 1.5)
                });
                u83:Play();
                u83.Completed:Connect(function() -- Line: 553
                    -- upvalues: u83 (copy), PingIcon (copy)
                    u83:Destroy();
                    PingIcon:Destroy();
                end);
            end
        },
        attachTo = p70,
        constraintType = ConstraintType.Constrained,
        onUpdateProperties = v77
    });
end;

function u7.createIndicatorOnPlayer(p84, p85, p86) -- Line: 565
    -- upvalues: BedwarsImageId (copy), ColorUtil (copy), TeamColorHex (copy), Players (copy)
    local FLAG_ICON = BedwarsImageId.FLAG_ICON;
    local Team = p85.Team;

    if Team ~= nil then
        local _ = Team.TeamColor.Color;
    end;

    local Team2 = p85.Team;

    if Team2 ~= nil then
        Team2 = Team2.TeamColor.Color;
    end;

    if Team2 == nil then
        Team2 = Color3.fromRGB(166, 255, 107);
    end;

    local Team3 = p85.Team;

    if Team3 ~= nil then
        Team3 = Team3.Name;
    end;

    local v87;

    if Team3 == "Blue" then
        v87 = ColorUtil.hexColor(TeamColorHex.yellow);
    else
        v87 = ColorUtil.hexColor(TeamColorHex.lightBlue);
    end;

    if p85.Team ~= Players.LocalPlayer.Team then
        v87 = Color3.fromRGB(255, 148, 148);
    end;

    p84:createIndicator(p86, {
        color = v87,
        icon = FLAG_ICON
    });
end;

function u7.createIndicatorOnFlag(p88, p89) -- Line: 600
    -- upvalues: KnitClient (copy), BedwarsImageId (copy), Players (copy)
    local v90 = p89:GetAttribute("OriginalPosition");

    if v90 ~= 0 and (v90 == v90 and (v90 ~= "" and v90)) then
        v90 = p89:GetAttribute("Team") ~= "Neutral";
    end;

    if v90 ~= 0 and (v90 == v90 and (v90 ~= "" and v90)) then
        return nil;
    end;

    local v91 = p89:GetAttribute("Team");
    local v92 = KnitClient.Controllers.TeamController:getTeamById(v91);
    local FLAG_ICON = BedwarsImageId.FLAG_ICON;

    if v92 ~= nil then
        v92 = v92.color;
    end;

    if v92 == nil then
        v92 = Color3.fromRGB(173, 255, 209);
    end;

    local v93 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

    if v93 ~= nil then
        v93 = v93.id;
    end;

    if v91 == v93 then
        v92 = Color3.fromRGB(255, 115, 115);
    end;

    if p89:GetAttribute("Team") == "Neutral" then
        v92 = Color3.fromRGB(227, 115, 255);
    end;

    p88:createIndicator(p89, {
        color = v92,
        icon = FLAG_ICON
    });
end;

function u7.getFlagReturnTime(p94, p95) -- Line: 637
    local v96 = p95 + 5 - os.time();

    return math.max(0, v96);
end;

function u7.getFlagPositions(u97) -- Line: 640
    -- upvalues: CollectionService (copy), Players (copy), KnitClient (copy)
    local v98 = 0;
    local v99 = 1;
    local v100 = nil;

    if not (u97.enemyFlagOrigin and u97.teamFlagOrigin) then
        print("CATCHING!");
        print("Enemy Origin: " .. tostring(u97.enemyFlagOrigin));
        print("TEAM ORIGIN: " .. tostring(u97.teamFlagOrigin));
        local v101 = CollectionService:GetTagged("FlagBase");

        local function v105(p102) -- Line: 649
            -- upvalues: Players (ref), u97 (copy)
            local v103 = p102:GetAttribute("TeamName");
            local Team = Players.LocalPlayer.Team;

            if Team ~= nil then
                Team = Team.Name;
            end;

            print("Team Name: " .. tostring(Team));
            local v104;

            if v103 == "" or not v103 then
                v104 = v103;
            else
                local Team2 = Players.LocalPlayer.Team;

                if Team2 ~= nil then
                    Team2 = Team2.Name;
                end;

                v104 = v103 == Team2;
            end;

            if v104 == "" or not v104 then
                if v103 ~= "" and v103 then
                    u97.enemyFlagOrigin = p102.Position;
                end;

                return;
            end;

            u97.teamFlagOrigin = p102.Position;
        end;

        for i, v in v101 do
            v105(v, i - 1, v101);
        end;

        if not (u97.enemyFlagOrigin and u97.teamFlagOrigin) then
            return {
                team = v98,
                enemy = v99,
                neutralFlag = v100
            };
        end;
    end;

    for i, v in u97.flagMap do
        local v106 = { i, v };
        local Character = v106[1].Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if Character then
            local Magnitude = (u97.teamFlagOrigin - Character).Magnitude;
            local v107 = Magnitude / (Magnitude + (u97.enemyFlagOrigin - Character).Magnitude);
            local v108 = v106[1].Team == Players.LocalPlayer.Team;

            if v108 then
                local v109 = v106[2]:GetAttribute("Neutral");

                if v109 == 0 or v109 ~= v109 then
                    v109 = false;
                elseif v109 == "" then
                    v109 = false;
                end;

                v108 = not v109;
            end;

            if v108 then
                v99 = v107;
            else
                local v110 = v106[2]:GetAttribute("Neutral");

                if v110 == 0 or (v110 ~= v110 or (v110 == "" or not v110)) then
                    v98 = v107;
                else
                    v100 = v107;
                end;
            end;
        end;
    end;

    for i, v in u97.flagLocation do
        local v111 = { i, v };
        local v112 = v111[1]:GetAttribute("OriginalPosition");

        if v112 == 0 or (v112 ~= v112 or (v112 == "" or not v112)) then
            local Magnitude = (u97.teamFlagOrigin - v111[2]).Magnitude;
            local v113 = Magnitude / (Magnitude + (u97.enemyFlagOrigin - v111[2]).Magnitude);
            local v114 = v111[1]:GetAttribute("Team");
            local v115 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

            if v115 ~= nil then
                v115 = v115.id;
            end;

            if v114 == "Neutral" then
                v100 = v113;
            else
                local v116;

                if v114 == "" or not v114 then
                    v116 = v114;
                else
                    v116 = v114 == v115;
                end;

                if v116 == "" or not v116 then
                    if v114 ~= "" and v114 then
                        v99 = v113;
                    end;
                else
                    v98 = v113;
                end;
            end;
        elseif v111[1]:GetAttribute("Team") == "Neutral" then
            v100 = 0.5;
        end;
    end;

    return {
        team = v98,
        enemy = v99,
        neutralFlag = v100
    };
end;

KnitClient.CreateController(u7.new());

return nil;