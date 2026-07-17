-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v7.CollectionService;
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local Workspace = v7.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GatherBotBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "steam-engineer", "gather-bot-constants").GatherBotBalance;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent, "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "GatherBotBasicController";
    end,

    __index = KnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 40
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 44
    -- upvalues: KnitController (copy)
    KnitController.constructor(p10);
    p10.Name = "GatherBotBasicController";
    p10.gatherBotMap = {};
    p10.gatherBotOverclockTargets = {};
    p10.lastEffectReconcileTime = {};
    p10.colorChangeConnections = {};
    p10.HP_BAR_OFFSET = Vector3.new(0, 2, 0);
end;

function u8.KnitStart(u11) -- Line: 53
    -- upvalues: KnitController (copy), default (copy), MonsterType (copy), SoundManager (copy), GameSound (copy), WatchCollectionTag (copy), KnitClient2 (copy), EntityDamageEventZap (copy), Players (copy), u6 (copy), ReplicatedStorage (copy), Workspace (copy), WeldUtil (copy), EffectUtil (copy), GatherBotBalance (copy), CollectionService (copy), Flamework (copy)
    KnitController.KnitStart(u11);
    default.Client:OnEvent("EntityDeathEvent", function(p12) -- Line: 56
        -- upvalues: MonsterType (ref), SoundManager (ref), GameSound (ref)
        if p12.entityInstance:GetAttribute("MonsterType") ~= MonsterType.GATHER_BOT then
            return nil;
        end;

        SoundManager:playSound(GameSound.GATHER_BOT_DEATH, {
            position = p12.entityInstance:GetPivot().Position
        });
    end);
    WatchCollectionTag("Monster", function(u13) -- Line: 64
        -- upvalues: MonsterType (ref), KnitClient2 (ref), GameSound (ref)
        if u13:GetAttribute("MonsterType") == MonsterType.GATHER_BOT then
            task.spawn(function() -- Line: 66
                -- upvalues: KnitClient2 (ref), u13 (copy), GameSound (ref)
                KnitClient2.Controllers.FootstepsController:hookCharacter(nil, u13, {
                    walk = { GameSound.GATHER_BOT_MOVING },
                    run = { GameSound.GATHER_BOT_MOVING }
                });
            end);
        end;
    end);
    EntityDamageEventZap.On(function(p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27) -- Line: 74
        -- upvalues: MonsterType (ref), Players (ref), u6 (ref)
        if p14:GetAttribute("MonsterType") ~= MonsterType.GATHER_BOT then
            return nil;
        end;

        if Players:GetPlayerByUserId(p14:GetAttribute("PlacedByUserId")) == Players.LocalPlayer then
            local GatherBotHighlight = p14:FindFirstChild("GatherBotHighlight");

            if GatherBotHighlight then
                GatherBotHighlight:Destroy();
            end;

            u6("Highlight", {
                Name = "GatherBotHighlight",
                FillTransparency = 0.7,
                OutlineTransparency = 0.2,
                FillColor = Color3.fromRGB(255, 61, 0),
                OutlineColor = Color3.fromRGB(255, 0, 0),
                Parent = p14,
                DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            }).Enabled = true;
        end;
    end);
    default.Client:OnEvent("GatherBotOverclockTargetsChanged", function(p28) -- Line: 96
        -- upvalues: u11 (copy)
        local gatherBot = p28.gatherBot;
        local v29 = {};

        for _, v in p28.targets do
            v29[v] = true;
        end;

        u11:reconcileEffects(gatherBot, v29);
    end);
    default.Client:OnEvent("GatherBotAddProximityPrompt", function(u30) -- Line: 105
        -- upvalues: KnitClient2 (ref), default (ref), Players (ref)
        local v31 = u30.gatherBot:GetAttribute("GatherBotIsPro");
        local u32 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "CollectPrompt",
            HoldDuration = 0,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ActionText = "Collect",
            ObjectText = (v31 == 0 or (v31 ~= v31 or (v31 == "" or not v31))) and "Diamond" or "Emerald",
            Parent = u30.gatherBot
        });
        u32.Triggered:Connect(function(p33) -- Line: 116
            -- upvalues: default (ref), Players (ref), u30 (copy), u32 (copy)
            default.Client:Get("GatherBotCollectItems"):SendToServer({
                player = Players.LocalPlayer,
                gatherBot = u30.gatherBot
            });
            u32:Destroy();
        end);
    end);
    default.Client:OnEvent("GatherBotRemoveProximityPrompt", function(p34) -- Line: 124
        local CollectPrompt = p34.gatherBot:FindFirstChild("CollectPrompt");

        if CollectPrompt ~= nil then
            CollectPrompt:Destroy();
        end;
    end);
    default.Client:OnEvent("GatherBotDangerDetected", function(p35) -- Line: 130
        -- upvalues: u6 (ref)
        local v36 = p35.gatherBot:GetAttribute("HasHighlight");

        if v36 == nil or v36 == false then
            u6("Highlight", {
                Name = "GatherBotHighlight",
                FillTransparency = 0.7,
                OutlineTransparency = 0.2,
                FillColor = Color3.fromRGB(255, 61, 0),
                OutlineColor = Color3.fromRGB(255, 0, 0),
                Parent = p35.gatherBot,
                DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            }).Enabled = true;
            p35.gatherBot:SetAttribute("HasHighlight", true);
        end;
    end);
    default.Client:OnEvent("GatherBotDangerAverted", function(p37) -- Line: 146
        local GatherBotHighlight = p37.gatherBot:FindFirstChild("GatherBotHighlight");

        if GatherBotHighlight then
            p37.gatherBot:SetAttribute("HasHighlight", false);
            GatherBotHighlight:Destroy();
        end;
    end);
    default.Client:OnEvent("SteamEngineerPlayOverclockEffect", function(u38) -- Line: 153
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), WeldUtil (ref), EffectUtil (ref), GatherBotBalance (ref), SoundManager (ref), GameSound (ref), u11 (copy)
        task.spawn(function() -- Line: 154
            -- upvalues: ReplicatedStorage (ref), Workspace (ref), u38 (copy), WeldUtil (ref), EffectUtil (ref), GatherBotBalance (ref), SoundManager (ref), GameSound (ref), u11 (ref)
            local u39 = ReplicatedStorage.Assets.Effects.GatherBotOverclockEffect:Clone();
            u39.Parent = Workspace;
            u39.Massless = true;
            u39.CFrame = u38.gatherBot:GetPivot();
            WeldUtil:weldParts(u38.gatherBot.HumanoidRootPart, u39);
            local v40 = {};
            local v41 = u39:GetDescendants();
            table.move(v41, 1, #v41, #v40 + 1, v40);
            EffectUtil:playEffects(v40, u38.gatherBot, {
                destroyAfterSec = GatherBotBalance.GATHER_BOT_OVERCLOCK_DURATION
            });
            SoundManager:playSound(GameSound.GATHER_BOT_OVERCLOCK, {
                position = u38.gatherBot:GetPivot().Position
            });
            u11:changeGatherBotEyeColor(u38.gatherBot, Color3.fromRGB(255, 0, 0));
            task.delay(GatherBotBalance.GATHER_BOT_OVERCLOCK_DURATION, function() -- Line: 172
                -- upvalues: u11 (ref), u38 (ref), u39 (copy)
                u11:changeGatherBotEyeColor(u38.gatherBot, Color3.fromRGB(246, 255, 122));
                u39:Destroy();
            end);
        end);
    end);
    CollectionService:GetInstanceAddedSignal("Monster"):Connect(function(p42) -- Line: 178
        -- upvalues: MonsterType (ref), u11 (copy)
        if p42:GetAttribute("MonsterType") == MonsterType.GATHER_BOT then
            if p42:GetAttribute("GatherBotIsPro") == true then
                u11:createGatherBotHealthbar(p42, true);
            else
                u11:createGatherBotHealthbar(p42, false);
            end;

            u11.gatherBotMap[p42] = true;
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("Monster"):Connect(function(p43) -- Line: 190
        -- upvalues: MonsterType (ref), u11 (copy), Flamework (ref)
        if p43:GetAttribute("MonsterType") == MonsterType.GATHER_BOT then
            local v44 = u11.gatherBotOverclockTargets[p43];

            if v44 == nil then
                return nil;
            end;

            for _, v in v44 do
                v:DoCleaning();
            end;

            u11.gatherBotMap[p43] = nil;
            u11.gatherBotOverclockTargets[p43] = nil;
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(p43:GetAttribute("UUID")));
        end;
    end);
end;

function u8.reconcileEffects(u45, u46, p47) -- Line: 206
    -- upvalues: u3 (copy)
    local u48 = os.clock();
    u45.lastEffectReconcileTime[u46] = u48;
    local v49 = u45.gatherBotOverclockTargets[u46];
    local v50 = v49 == nil and {} or v49;

    for i, v in v50 do
        if p47[i] == nil then
            v:DoCleaning();
            v50[i] = nil;
        end;
    end;

    local v51 = u3.copy(v50);

    for i in p47 do
        if v50[i] == nil then
            local PrimaryPart = i.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = (PrimaryPart.Position - u46:GetPivot().Position).Magnitude;
            end;

            if (PrimaryPart == nil and 100 or PrimaryPart) <= 18 and u45.gatherBotMap[u46] ~= nil then
                v51[i] = u45:createOverclockEffect(u46, i);
            end;
        end;
    end;

    u45.gatherBotOverclockTargets[u46] = v51;
    task.delay(1, function() -- Line: 252
        -- upvalues: u45 (copy), u46 (copy), u48 (copy)
        if u45.lastEffectReconcileTime[u46] == u48 then
            u45:reconcileEffects(u46, {});
        end;
    end);
end;

function u8.createOverclockEffect(p52, p53, p54) -- Line: 260
    -- upvalues: Players (copy), ClientStore (copy), u4 (copy), u5 (copy), SoundManager (copy), GameSound (copy)
    local BodyFrontAttachment = p54:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");

    if not BodyFrontAttachment then
        error("Could not find targetAttachment");
    end;

    local BodyFrontAttachment2 = p53:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");

    if not BodyFrontAttachment2 then
        error("Could not find gatherBotAttachment");
    end;

    local u55 = Players:GetPlayerByUserId((p53:GetAttribute("PlacedByUserId")));

    if u55 == nil then
        error("No owner");
    end;

    local function _(p56) -- Line: 275
        -- upvalues: u55 (copy)
        local Team = u55.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        return p56.name == Team;
    end;

    local v57 = nil;

    for i, v in ClientStore:getState().Game.teams do
        local _ = i - 1;
        local Team = u55.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        if v.name == Team == true then
            v57 = v;
            break;
        end;
    end;

    local link = u4.link;
    local v58;

    if v57 then
        v58 = v57.color;
    else
        v58 = Color3.fromRGB(0, 0, 0);
    end;

    local u59 = link(BodyFrontAttachment, BodyFrontAttachment2, v58);
    local v60 = u5.new();
    v60:GiveTask(function() -- Line: 295
        -- upvalues: u59 (copy)
        u59:Destroy();
    end);
    local TESLA_ZAP = GameSound.TESLA_ZAP;
    local v61 = {
        looped = true
    };
    local v62;

    if p54 == Players.LocalPlayer.Character then
        v62 = nil;
    else
        v62 = p53:GetPivot().Position;
    end;

    v61.position = v62;
    local u63 = SoundManager:playSound(TESLA_ZAP, v61);

    if u63 then
        v60:GiveTask(function() -- Line: 304
            -- upvalues: u63 (copy)
            local v64 = u63;

            if v64 ~= nil then
                v64:Stop();
            end;
        end);
    end;

    return v60;
end;

function u8.createGatherBotHealthbar(p65, p66, p67) -- Line: 313
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    local v68;

    if p67 then
        v68 = UDim2.fromScale(3.5, 0.35);
    else
        v68 = UDim2.fromScale(3, 0.35);
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        app = StatefulEntityHpBarBillboard,
        appId = "StatefulEntityHpBarBillboard_" .. tostring(p66:GetAttribute("UUID"))
    }, {
        gameEntity = p66,
        serverInstance = p66,
        hpBarOffset = p65.HP_BAR_OFFSET,
        size = v68
    }, nil, p66);
end;

function u8.changeGatherBotEyeColor(u69, u70, u71) -- Line: 330
    -- upvalues: RunService (copy)
    local Eye = u70:FindFirstChild("Eye");

    if Eye then
        local v72 = u69.colorChangeConnections[u70];

        if v72 then
            v72:Disconnect();
            u69.colorChangeConnections[u70] = nil;
        end;

        local Color = Eye.Color;
        local u73 = 0;
        local u74 = nil;
        u74 = RunService.Heartbeat:Connect(function(p75) -- Line: 348
            -- upvalues: u73 (ref), Eye (copy), Color (copy), u71 (copy), u74 (ref), u69 (copy), u70 (copy)
            u73 = u73 + p75;
            Eye.Color = Color:Lerp(u71, u73 / 0.5);

            if u73 >= 0.5 then
                u74:Disconnect();
                Eye.Color = u71;
                u69.colorChangeConnections[u70] = nil;
            end;
        end);
        u69.colorChangeConnections[u70] = u74;
    end;
end;

KnitClient.CreateController(u8.new());

return nil;