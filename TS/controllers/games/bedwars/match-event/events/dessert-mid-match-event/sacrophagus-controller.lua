-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType;
local TeamController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "SacrophagusController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 33
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 37
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SacrophagusController";
    p6.modelMap = {};
    p6.armorMap = {};
    p6.effectMap = {};
end;

function u4.KnitStart(u7) -- Line: 44
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), ReplicatedStorage (copy), u2 (copy), Workspace (copy), RunService (copy), WatchCharacter (copy), StatusEffectUtil (copy), StatusEffectType (copy), ClientSyncEvents (copy), Players (copy), default (copy), TeamController (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), VignetteType (copy)
    KnitController.KnitStart(u7);
    WatchCollectionTag("sacrophagus", function(p8) -- Line: 46
        -- upvalues: ReplicatedStorage (ref), u7 (copy), u2 (ref), Workspace (ref), RunService (ref)
        local u9 = ReplicatedStorage.Assets.Effects.sacrophagus:Clone();
        u9.Parent = p8;
        local v10 = p8:GetAttribute("OwnerTeamID");
        u7.modelMap[v10] = u9;
        local u11 = u2.new();
        local u12 = p8.Position + Vector3.new(0, 1, 0);
        local u13 = Workspace:GetServerTimeNow();
        u11:GiveTask(RunService.Heartbeat:Connect(function(p14) -- Line: 56
            -- upvalues: u13 (ref), u12 (copy), u9 (copy)
            u13 = u13 + p14;
            local v15 = math.sin(u13 / 2) * 1 + 0.3;
            local v16 = Vector3.new(0, v15, 0);
            u9:PivotTo((CFrame.new(u12 + v16)));
        end));
        p8.AncestryChanged:Connect(function(p17, p18) -- Line: 71
            -- upvalues: u11 (copy)
            if p18 == nil then
                u11:DoCleaning();
            end;
        end);
    end);
    WatchCharacter(function(p19, p20) -- Line: 77
        -- upvalues: StatusEffectUtil (ref), StatusEffectType (ref), u7 (copy)
        if StatusEffectUtil:isActive(p20, StatusEffectType.BHAA_BUFF) then
            u7:equipEgyptionArmor(p19, p20);
        end;

        local v21 = u7.effectMap[p19];

        if v21 ~= nil then
            v21:DoCleaning();
        end;
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p22) -- Line: 88
        -- upvalues: StatusEffectType (ref), Players (ref), u7 (copy)
        local v23 = p22.statusEffect == StatusEffectType.BHAA_BUFF and Players:GetPlayerFromCharacter(p22.entityInstance);

        if v23 then
            u7:equipEgyptionArmor(v23, p22.entityInstance);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p24) -- Line: 96
        -- upvalues: StatusEffectType (ref), Players (ref), u7 (copy)
        local v25 = p24.statusEffect == StatusEffectType.BHAA_BUFF and Players:GetPlayerFromCharacter(p24.entityInstance);

        if v25 then
            u7:removeEgyptionArmor(v25, p24.entityInstance);
        end;
    end);
    default.Client:Get("SacrophagusRevive"):Connect(function(u26) -- Line: 104
        -- upvalues: TeamController (ref), u7 (copy), ReplicatedStorage (ref), Workspace (ref), u2 (ref), RunService (ref), Players (ref), SoundManager (ref), GameSound (ref), KnitClient (ref), VignetteType (ref)
        local v27 = TeamController:getPlayerTeam(u26.player);

        if v27 ~= nil then
            v27 = v27.id;
        end;

        if v27 == "" or not v27 then
            return nil;
        end;

        local u28 = u7.modelMap[v27];

        if not u28 then
            return nil;
        end;

        local PrimaryPart = u28.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local u29 = ReplicatedStorage.Assets.Misc.ReviveDummy:Clone();
        local u30 = {};

        local function _(p31) -- Line: 128
            -- upvalues: u30 (copy)
            if p31:IsA("MeshPart") then
                table.insert(u30, p31);
            end;
        end;

        for i, descendant in u29:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") then
                table.insert(u30, descendant);
            end;
        end;

        u29:PivotTo(u26.spawnPosition - Vector3.new(0, 3, 0));
        local v32 = ReplicatedStorage.Assets.Effects.ReviveString:Clone();
        local Part1 = v32:WaitForChild("Part1", 1);
        local Part2 = v32:WaitForChild("Part2", 1);
        v32.Parent = Workspace;
        local v33 = u7.effectMap[u26.player];

        if v33 == nil then
            v33 = u2.new();
        end;

        v33:DoCleaning();
        v33:GiveTask(v32);
        v33:GiveTask(u29);
        u7.effectMap[u26.player] = v33;
        local respawnTime = u26.respawnTime;
        local u34 = nil;
        u34 = RunService.Heartbeat:Connect(function(p35) -- Line: 160
            -- upvalues: respawnTime (ref), u29 (copy), Workspace (ref), u34 (ref), u26 (copy), u30 (copy)
            respawnTime = respawnTime - p35 / 2;

            if respawnTime < 0 or u29.Parent ~= Workspace then
                u34:Disconnect();

                return nil;
            end;

            local function _(p36) -- Line: 166
                -- upvalues: respawnTime (ref), u26 (ref)
                p36.Transparency = respawnTime / u26.respawnTime;
            end;

            for i, v in u30 do
                local _ = i - 1;
                v.Transparency = respawnTime / u26.respawnTime;
            end;
        end);
        u29.Parent = Workspace;

        if Part1 ~= nil then
            Part1:PivotTo(u28.PrimaryPart.CFrame);
        end;

        if Part2 ~= nil then
            Part2:PivotTo(u26.spawnPosition);
        end;

        if u26.player == Players.LocalPlayer then
            v33:GiveTask(SoundManager:playSound(GameSound.WARLOCK_ALTAR_LOOP));
            v33:GiveTask(function() -- Line: 184
                -- upvalues: SoundManager (ref), GameSound (ref)
                SoundManager:playSound(GameSound.SACROPHAGUS_REVIVE);
            end);
            KnitClient.Controllers.VignetteController:createVignette(VignetteType.REVIVE);
            v33:GiveTask(function() -- Line: 188
                -- upvalues: KnitClient (ref), VignetteType (ref)
                KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.REVIVE);
            end);
            task.delay(0.2, function() -- Line: 191
                -- upvalues: u28 (copy), Workspace (ref), u29 (copy)
                if u28 then
                    local CurrentCamera = Workspace.CurrentCamera;

                    if not CurrentCamera then
                        return nil;
                    end;

                    CurrentCamera.CameraSubject = u29.PrimaryPart;
                end;
            end);
        end;

        local PrimaryPart2 = u28.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2:WaitForChild("holy", 1);
        end;

        local PrimaryPart3 = u28.PrimaryPart;

        if PrimaryPart3 ~= nil then
            local function _(p37) -- Line: 208
                if p37:IsA("ParticleEmitter") then
                    p37.Enabled = true;
                end;
            end;

            for i, child in PrimaryPart3:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child.Enabled = true;
                end;
            end;
        end;

        local soundTrack = u7.soundTrack;

        if soundTrack ~= nil then
            soundTrack:Stop();
        end;

        local soundTrack2 = u7.soundTrack;

        if soundTrack2 ~= nil then
            soundTrack2:Destroy();
        end;

        u7.soundTrack = SoundManager:playSound(GameSound.WARLOCK_ALTAR_LOOP, {
            position = PrimaryPart
        });
        task.delay(5, function() -- Line: 228
            -- upvalues: u7 (ref), u28 (copy)
            local soundTrack3 = u7.soundTrack;

            if soundTrack3 ~= nil then
                soundTrack3:Stop();
            end;

            local soundTrack4 = u7.soundTrack;

            if soundTrack4 ~= nil then
                soundTrack4:Destroy();
            end;

            local PrimaryPart4 = u28.PrimaryPart;

            if PrimaryPart4 ~= nil then
                local function _(p38) -- Line: 240
                    if p38:IsA("ParticleEmitter") then
                        p38.Enabled = false;
                    end;
                end;

                for i, child in PrimaryPart4:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("ParticleEmitter") then
                        child.Enabled = false;
                    end;
                end;
            end;
        end);
    end);
end;

function u4.equipEgyptionArmor(p39, p40, u41) -- Line: 258
    -- upvalues: u2 (copy), ReplicatedStorage (copy), WeldUtil (copy)
    local u42 = p39.armorMap[p40];

    if u42 == nil then
        u42 = u2.new();
    end;

    u42:DoCleaning();

    local function _(p43) -- Line: 269
        -- upvalues: u42 (copy), u41 (copy)
        u42:GiveTask(p43);
        p43.Parent = u41;
    end;

    for i, child in ReplicatedStorage.Assets.Effects.EgyptionArmorEffect:Clone():GetChildren() do
        local _ = i - 1;
        u42:GiveTask(child);
        child.Parent = u41;
    end;

    p39.armorMap[p40] = u42;
    WeldUtil:weldCharacterAccessories(u41);
end;

function u4.removeEgyptionArmor(p44, p45, p46) -- Line: 281
    local v47 = p44.armorMap[p45];

    if v47 then
        v47:DoCleaning();
    end;
end;

KnitClient.CreateController(u4.new());

return nil;