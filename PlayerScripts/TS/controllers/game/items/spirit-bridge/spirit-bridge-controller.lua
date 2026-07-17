-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SetUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").SetUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ExpireList = v1.ExpireList;
local ExpireMap = v1.ExpireMap;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local IgnisUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "ignis", "ignis-util").IgnisUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local SpiritBridgeProgressApp = RuntimeLib.import(script, script.Parent, "spirit-bridge-progress-bar").SpiritBridgeProgressApp;
local SPIRIT_BRIDGE_DURATION = BalanceFile.SPIRIT_BRIDGE_DURATION;
local _ = BalanceFile.SPIRIT_BRIDGE_MOVEMENT_SPEED_MULTIPLIER;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "SpiritBridgeController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 45
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 49
    -- upvalues: KnitController (copy), ExpireList (copy), ExpireMap (copy), SPIRIT_BRIDGE_DURATION (copy)
    KnitController.constructor(p8);
    p8.Name = "SpiritBridgeController";
    p8.recentlyTouchedBridge = ExpireList.new(0.1);
    p8.activeBridgeWalkerMap = ExpireMap.new(SPIRIT_BRIDGE_DURATION);
    p8.recentHealAttempts = ExpireList.new(0.1);
    p8.bridgeSegmentInfo = {};
end;

function u6.KnitStart(u9) -- Line: 57
    -- upvalues: KnitController (copy), default (copy), Players (copy), SoundManager (copy), GameSound (copy), EntityUtil (copy)
    KnitController.KnitStart(u9);
    default.Client:Get("RequestSpiritBridgeDownload"):SendToServer();
    default.Client:OnEvent("SpiritBridgeCreate", function(p10) -- Line: 60
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), u9 (copy)
        for _, v in p10.newBridgeInfo do
            if v.creator == Players.LocalPlayer and v.destinationLocation then
                SoundManager:playSound(GameSound.SPIRIT_BRIDGE_PROJECTILE_LAND, {
                    position = v.destinationLocation
                });
            end;

            u9:createBridge(v.creator, v.bridge, v.destinationLocation);
        end;
    end);
    default.Client:OnEvent("SpiritBridgeExit", function(p11) -- Line: 70
        -- upvalues: u9 (copy)
        local v12 = u9.activeBridgeWalkerMap:get(p11.player);

        if v12 ~= nil then
            v12 = v12.bridge.id;
        end;

        if v12 ~= p11.bridgeId then
            return nil;
        end;

        u9:cleanBridgeWalker(p11.player);
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p13) -- Line: 80
        -- upvalues: Players (ref), u9 (copy)
        local v14 = Players:GetPlayerFromCharacter(p13.entityInstance);

        if not v14 then
            return nil;
        end;

        u9:cleanBridgeWalker(v14);
    end);
    default.Client:Get("EnteredSpiritBridge"):Connect(function(p15, p16) -- Line: 87
        -- upvalues: EntityUtil (ref), u9 (copy)
        local v17 = EntityUtil:getEntity(p16);

        if not v17 then
            return nil;
        end;

        local v18 = u9.activeBridgeWalkerMap:get(p16);

        if v18 ~= nil then
            v18 = v18.maid;
        end;

        if not v18 then
            return nil;
        end;

        local v19 = u9.activeBridgeWalkerMap:get(p16);

        if v19 ~= nil then
            v19 = v19.bridge.id;
        end;

        if p15 ~= v19 then
            return nil;
        end;

        u9:enterSpiritForm(v17:getInstance(), p16, p15, v18);
    end);
    default.Client:OnEvent("SpiritArmorCast", function(p20) -- Line: 110
        -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref)
        local v21 = u9.activeBridgeWalkerMap:get(p20.spiritPlayer);
        local v22;

        if v21 == nil then
            v22 = v21;
        else
            v22 = v21.bridge.id;
        end;

        if v22 == p20.bridgeId then
            v21.maid:DoCleaning();
            u9.activeBridgeWalkerMap:delete(p20.spiritPlayer);
        end;

        local Character = p20.spiritPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        SoundManager:playSound(GameSound.SPIRIT_BRIDGE_AOE_ACTIVATED, {
            rollOffMaxDistance = 70,
            looped = false,
            volumeMultiplier = 0.5,
            position = Character,
            parent = p20.spiritPlayer
        });
    end);
end;

function u6.createBridge(u23, u24, u25, p26) -- Line: 137
    -- upvalues: Players (copy), u2 (copy), BalanceFile (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), scaleModel (copy), BLOCK_SIZE (copy), SoundManager (copy), GameSound (copy), IgnisUtil (copy), SetUtil (copy), SPIRIT_BRIDGE_DURATION (copy)
    local u27 = u24 == Players.LocalPlayer;
    local Character = u24.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame.Position;
        end;
    end;

    if Character == nil then
        return nil;
    end;

    local u28 = {};
    local v29 = u2.new();
    local u30 = true;
    local u31 = nil;
    v29:GiveTask(function() -- Line: 155
        -- upvalues: u23 (copy), u31 (ref), u28 (copy), u30 (ref)
        local function _(p32) -- Line: 156
            -- upvalues: u23 (ref), u31 (ref)
            u23:destroySpiritBridge(p32, u31);
        end;

        for i, v in u28 do
            local _ = i - 1;
            u23:destroySpiritBridge(v, u31);
        end;

        table.clear(u28);
        u30 = false;
    end);

    if u23.activeBridgeWalkerMap:get(u24) ~= nil then
        u23:cleanBridgeWalker(u24);
    end;

    local v33 = u2.new();
    v29:GiveTask(v33);
    u23.activeBridgeWalkerMap:set(u24, {
        maid = v29,
        bridge = u25
    });
    u31 = BalanceFile.SPIRIT_ARMOR_DELAY;
    local u34 = 0;
    local v35 = false;
    local u36 = {};

    while true do
        if v35 then
            u34 = u34 + 1;
        else
            v35 = true;
        end;

        if u34 >= #u25.bridgeSegments or not u30 then
            if p26 then
                local Projectiles = ReplicatedStorage.Assets:FindFirstChild("Projectiles");

                if Projectiles ~= nil then
                    Projectiles = Projectiles:FindFirstChild("spirit_bridge");

                    if Projectiles ~= nil then
                        Projectiles = Projectiles:Clone();
                    end;
                end;

                local v37;

                if Projectiles ~= nil then
                    v37 = Projectiles.PrimaryPart;
                end;

                if Projectiles and v37 then
                    Projectiles.Parent = Workspace;
                    v37.Anchored = true;
                    v37.CanCollide = false;
                    v37.CanQuery = false;
                    scaleModel(Projectiles, 2);
                    local v38 = CFrame;
                    local v39 = Vector3.new(0, BLOCK_SIZE * 2, 0);
                    Projectiles:PivotTo(v38.lookAt(p26 + v39, u28[1]:GetPivot().Position));
                    local u40 = SoundManager:playSound(GameSound.SPIRIT_BRIDGE_LOOP, {
                        volumeMultiplier = 1,
                        rollOffMaxDistance = 80,
                        looped = true,
                        position = p26,
                        parent = Projectiles
                    });
                    v29:GiveTask(function() -- Line: 265
                        -- upvalues: u40 (copy)
                        local v41 = u40;

                        if v41 ~= nil then
                            v41:Stop();
                        end;

                        local v42 = u40;

                        if v42 ~= nil then
                            v42:Destroy();
                        end;
                    end);
                    v29:GiveTask(Projectiles);
                end;
            end;

            task.spawn(function() -- Line: 279
                -- upvalues: u27 (copy), u30 (ref), u24 (copy), IgnisUtil (ref), u25 (copy), u36 (copy), u23 (copy), SetUtil (ref)
                if u27 then
                    return nil;
                end;

                local v43 = {};

                while true do
                    local v44 = task.wait(0.2);

                    if v44 ~= 0 and (v44 == v44 and v44) then
                        v44 = u30;
                    end;

                    if v44 == 0 or (v44 ~= v44 or not v44) then
                        return;
                    end;

                    local Character2 = u24.Character;

                    if Character2 ~= nil then
                        Character2 = Character2.PrimaryPart;

                        if Character2 ~= nil then
                            Character2 = Character2:GetPivot().Position;
                        end;
                    end;

                    if Character2 then
                        local v45 = IgnisUtil:getContainingBridgeSegments(Character2, u25.bridgeSegments, Vector3.new(35, 20, 35));

                        for _, v in v45 do
                            local v46 = u36[v];
                            local v47;

                            if v46 == nil then
                                v47 = v46;
                            else
                                v47 = v46.Parent;
                            end;

                            if v47 then
                                v43[v] = true;
                                u23:toggleBridgeSegmentVisibility(v46, false, true);
                            end;
                        end;

                        local v48 = {};

                        for _, v in v45 do
                            v48[v] = true;
                        end;

                        for _, v in SetUtil.values(v43) do
                            if v48[v] == nil then
                                v43[v] = nil;
                                local v49 = u36[v];
                                local v50;

                                if v49 == nil then
                                    v50 = v49;
                                else
                                    v50 = v49.Parent;
                                end;

                                if v50 then
                                    u23:toggleBridgeSegmentVisibility(v49, false, false);
                                end;
                            end;
                        end;
                    end;
                end;
            end);
            task.delay(SPIRIT_BRIDGE_DURATION + u31, function() -- Line: 339
                -- upvalues: u23 (copy), u24 (copy), u25 (copy)
                local v51 = u23.activeBridgeWalkerMap:get(u24);

                if v51 ~= nil then
                    v51 = v51.bridge.id;
                end;

                if v51 ~= u25.id then
                    return nil;
                end;

                u23:cleanBridgeWalker(u24);
            end);

            return;
        end;

        local v52 = u25.bridgeSegments[u34 + 1];
        local v53 = u23:makePart(v52, u24 == Players.LocalPlayer);
        table.insert(u28, v53);
        u36[v52] = v53;

        if u24 == Players.LocalPlayer then
            v33:GiveTask(v53.Touched:Connect(function(p54) -- Line: 200
                -- upvalues: u30 (ref), EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), Players (ref), u23 (copy), default (ref), u25 (copy), u34 (ref)
                if not u30 then
                    return nil;
                end;

                if not p54 then
                    return nil;
                end;

                if not p54.Parent then
                    return nil;
                end;

                local v55 = EntityUtil:getEntity(p54.Parent);

                if not RuntimeLib.instanceof(v55, PlayerEntity) then
                    return nil;
                end;

                if v55:getPlayer() ~= Players.LocalPlayer then
                    return nil;
                end;

                if not v55:isAlive() then
                    return nil;
                end;

                if u23.recentlyTouchedBridge:has(Players.LocalPlayer.UserId) then
                    return nil;
                end;

                default.Client:Get("SpiritBridgeEnter"):SendToServer(u25.id, u34);
                u23.recentlyTouchedBridge:add(Players.LocalPlayer.UserId);
            end));
            task.wait(0.1);
            u34 = u34;
        else
            task.wait(0.1);
            u34 = u34;
        end;
    end;
end;

function u6.makePart(p56, p57, p58) -- Line: 351
    -- upvalues: u3 (copy), Workspace (copy)
    local v59 = u3("Part", {
        CastShadow = false,
        Anchored = true,
        Size = p57.size,
        CFrame = p57.cframe,
        CanCollide = p58,
        CanQuery = p58,
        TopSurface = Enum.SurfaceType.Smooth,
        Material = Enum.Material.Glass,
        Color = Color3.fromRGB(165, 165, 165),
        Transparency = p58 and 0.6 or 1,
        Parent = Workspace
    });
    p56:toggleBridgeSegmentVisibility(v59, p58, p58);

    return v59;
end;

function u6.toggleBridgeSegmentVisibility(u60, u61, u62, u63) -- Line: 368
    -- upvalues: ReplicatedStorage (copy), TweenService (copy)
    local v64 = u60.bridgeSegmentInfo[u61];
    local v65;

    if v64 == nil then
        v65 = v64;
    else
        v65 = v64.enabled;
    end;

    if v65 == u63 then
        return nil;
    end;

    if not v64 then
        v64 = {
            setup = false,
            enabled = u63
        };
        u60.bridgeSegmentInfo[u61] = v64;
        local u66 = nil;
        u66 = u61.AncestryChanged:Connect(function() -- Line: 389
            -- upvalues: u61 (copy), u60 (copy), u66 (ref)
            if not u61.Parent then
                u60.bridgeSegmentInfo[u61] = nil;
                u66:Disconnect();
            end;
        end);
    end;

    v64.enabled = u63;

    if not v64.setup and u63 then
        v64.setup = true;
        local v67 = ReplicatedStorage.Assets.Misc.SpiritBridge:Clone():GetChildren();

        local function v73(p68) -- Line: 403
            -- upvalues: u62 (copy), u61 (copy)
            if not u62 then
                if p68:IsA("ParticleEmitter") then
                    p68.Rate = p68.Rate / 15;
                    local Keypoints = p68.Transparency.Keypoints;

                    local function _(p69) -- Line: 410
                        local Envelope = p69.Envelope;

                        return NumberSequenceKeypoint.new(p69.Time, 1 - (1 - p69.Value) / 4, (Envelope == nil and 0 or Envelope) / 4);
                    end;

                    local v70 = table.create(#Keypoints);

                    for i, v in Keypoints do
                        local _ = i - 1;
                        local Envelope = v.Envelope;
                        v70[i] = NumberSequenceKeypoint.new(v.Time, 1 - (1 - v.Value) / 4, (Envelope == nil and 0 or Envelope) / 4);
                    end;

                    p68.Transparency = NumberSequence.new(v70);
                end;

                if p68:IsA("Beam") then
                    local Keypoints = p68.Transparency.Keypoints;

                    local function _(p71) -- Line: 429
                        local Envelope = p71.Envelope;

                        return NumberSequenceKeypoint.new(p71.Time, 1 - (1 - p71.Value) / 4, (Envelope == nil and 0 or Envelope) / 4);
                    end;

                    local v72 = table.create(#Keypoints);

                    for i, v in Keypoints do
                        local _ = i - 1;
                        local Envelope = v.Envelope;
                        v72[i] = NumberSequenceKeypoint.new(v.Time, 1 - (1 - v.Value) / 4, (Envelope == nil and 0 or Envelope) / 4);
                    end;

                    p68.Transparency = NumberSequence.new(v72);
                end;
            end;

            p68.Parent = u61;
        end;

        for i, v in v67 do
            v73(v, i - 1, v67);
        end;
    end;

    local v74 = { u61 };
    local v75 = u61:GetDescendants();
    table.move(v75, 1, #v75, #v74 + 1, v74);

    local function v79(p76) -- Line: 458
        -- upvalues: u62 (copy), TweenService (ref), u63 (copy)
        if p76:IsA("Decal") or p76:IsA("BasePart") then
            local v77 = p76:GetAttribute("InitialTransparency");

            if v77 == 0 or (v77 ~= v77 or (v77 == "" or not v77)) then
                p76:SetAttribute("InitialTransparency", p76.Transparency);
                p76.Transparency = 1;
            end;

            local v78 = p76:GetAttribute("InitialTransparency");

            if not u62 then
                v78 = 1 - (1 - v78) / 4;
            end;

            TweenService:Create(p76, TweenInfo.new(1), {
                Transparency = not u63 and 1 or v78
            }):Play();
        end;

        if p76:IsA("ParticleEmitter") then
            p76.Enabled = u63;
        end;

        if p76:IsA("Beam") then
            p76.Enabled = u63;
        end;
    end;

    for i, v in v74 do
        v79(v, i - 1, v74);
    end;
end;

function u6.destroySpiritBridge(p80, u81, u82) -- Line: 484
    -- upvalues: TweenService (copy)
    local v83 = u81:GetChildren();

    local function v85(p84) -- Line: 486
        -- upvalues: TweenService (ref), u82 (copy)
        if p84:IsA("Decal") then
            TweenService:Create(p84, TweenInfo.new(u82), {
                Transparency = 1
            }):Play();
        end;
    end;

    for i, v in v83 do
        v85(v, i - 1, v83);
    end;

    TweenService:Create(u81, TweenInfo.new(u82 - 1), {
        Transparency = 1
    }):Play();
    task.delay(u82, function() -- Line: 499
        -- upvalues: u81 (copy)
        if u81 then
            u81:Destroy();
        end;
    end);
end;

function u6.enterSpiritForm(u86, p87, u88, u89, u90) -- Line: 505
    -- upvalues: Players (copy), TweenService (copy), BalanceFile (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), ClientSyncEvents (copy), Flamework (copy), u4 (copy), SpiritBridgeProgressApp (copy), SoundManager (copy), GameSound (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), default (copy), IgnisUtil (copy)
    local v91 = p87 == Players.LocalPlayer.Character;

    for _, descendant in p87:GetDescendants() do
        if descendant:IsA("BasePart") and descendant.Transparency < 0.5 then
            local u92 = descendant:GetAttribute("SpiritTransparency");

            if u92 == nil then
                u92 = descendant.Transparency;
                descendant:SetAttribute("SpiritTransparency", u92);
            end;

            local Material = descendant.Material;
            TweenService:Create(descendant, TweenInfo.new(0.1), {
                Transparency = 0.369
            }):Play();
            descendant.Material = Enum.Material.ForceField;
            u90:GiveTask(function() -- Line: 521
                -- upvalues: descendant (copy), TweenService (ref), BalanceFile (ref), u92 (ref), Material (copy)
                if descendant.Parent then
                    TweenService:Create(descendant, TweenInfo.new(BalanceFile.SPIRIT_ARMOR_DELAY), {
                        Transparency = u92
                    }):Play();
                    descendant.Material = Material;
                end;
            end);
        end;

        if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
            descendant.Enabled = true;
            u90:GiveTask(function() -- Line: 533
                -- upvalues: descendant (copy)
                descendant.Enabled = false;
            end);
        end;
    end;

    if v91 then
        local u93 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.ROBLOX_GHOST_FLOATING));
        u90:GiveTask(function() -- Line: 542
            -- upvalues: u93 (copy)
            if not u93 then
                return nil;
            end;

            u93:Stop();
            u93:Destroy();
        end);
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("Animate");

            if Character ~= nil then
                Character = Character:FindFirstChild("walk");

                if Character ~= nil then
                    Character = Character:FindFirstChild("WalkAnim");
                end;
            end;
        end;

        if Character then
            local AnimationId = Character.AnimationId;
            Character.AnimationId = GameAnimationUtil:getAssetId(AnimationType.ROBLOX_GHOST_WALK);
            u90:GiveTask(function() -- Line: 563
                -- upvalues: Character (copy), AnimationId (copy)
                Character.AnimationId = AnimationId;
            end);
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:FindFirstChild("Animate");

            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("run");

                if Character2 ~= nil then
                    Character2 = Character2:FindFirstChild("RunAnim");
                end;
            end;
        end;

        if Character2 then
            local AnimationId = Character2.AnimationId;
            Character.AnimationId = GameAnimationUtil:getAssetId(AnimationType.ROBLOX_GHOST_RUN);
            u90:GiveTask(function() -- Line: 581
                -- upvalues: Character2 (copy), AnimationId (copy)
                Character2.AnimationId = AnimationId;
            end);
        end;

        u90:GiveTask(ClientSyncEvents.PerformCombat:connect(function(p94) -- Line: 585
            p94:setCancelled(true);
        end));
        u90:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(SpiritBridgeProgressApp, {
            character = p87
        })));
        local u95 = SoundManager:playSound(GameSound.SPIRIT_BRIDGE_LOOP, {
            volumeMultiplier = 0.9,
            looped = true,
            parent = Players.LocalPlayer.Character
        });
        u90:GiveTask(function() -- Line: 596
            -- upvalues: u95 (copy), SoundManager (ref)
            if u95 then
                SoundManager:tweenSoundVolume(u95, 0, 2);
                task.delay(2.5, function() -- Line: 599
                    -- upvalues: u95 (ref)
                    u95:Stop();
                    u95:Destroy();
                end);
            end;
        end);
        local u96 = EntityUtil:getEntity(u88);

        if u96 == nil then
            return nil;
        end;

        local u97 = u96:getHumanoid();

        if u97 ~= nil then
            u97 = u97.Touched:Connect(function(p98) -- Line: 611
                -- upvalues: EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), u96 (copy), default (ref), u86 (copy)
                if not p98 then
                    return nil;
                end;

                if not p98.Parent then
                    return nil;
                end;

                local v99 = EntityUtil:getEntity(p98.Parent);

                if not RuntimeLib.instanceof(v99, PlayerEntity) then
                    return nil;
                end;

                if not v99:isAlive() then
                    return nil;
                end;

                if u96:canAttack(v99) then
                    return nil;
                end;

                default.Client:Get("AttemptSpiritHeal"):SendToServer({
                    healedPlayer = v99:getPlayer()
                });
                u86.recentHealAttempts:add(v99:getPlayer().UserId);
            end);
        end;

        u90:GiveTask(function() -- Line: 635
            -- upvalues: u97 (copy)
            if u97 == nil then
                return nil;
            end;

            u97:Disconnect();
        end);
    end;

    task.delay(IgnisUtil.MAX_BRIDGE_LIFETIME, function() -- Line: 643
        -- upvalues: u86 (copy), u88 (copy), u89 (copy), u90 (copy)
        local v100 = u86.activeBridgeWalkerMap:get(u88);
        local v101;

        if v100 == nil then
            v101 = v100;
        else
            v101 = v100.bridge.id;
        end;

        if v101 ~= u89 then
            return nil;
        end;

        if v100 ~= nil then
            v100.maid:DoCleaning();
        end;

        if u90 ~= nil then
            u90:DoCleaning();
        end;

        u86.activeBridgeWalkerMap:delete(u88);
    end);
end;

function u6.cleanBridgeWalker(p102, p103) -- Line: 661
    local v104 = p102.activeBridgeWalkerMap:get(p103);

    if v104 == nil then
        return false;
    end;

    v104.maid:DoCleaning();
    p102.activeBridgeWalkerMap:delete(p103);

    return true;
end;

KnitClient.CreateController(u6.new());

return nil;