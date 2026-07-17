-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "GlueTrapController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 32
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "GlueTrapController";
    p5.isPreloaded = false;
end;

function u3.KnitStart(u6) -- Line: 41
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), KnitClient (copy), Players (copy), WatchCharacter (copy), default2 (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy), Workspace (copy), ClientSyncEvents (copy), TweenService (copy), ReplicatedStorage (copy), CollectionService (copy), default (copy), OutQuad (copy)
    KnitController.KnitStart(u6);
    WatchCollectionTag("GlueTrap", function(p7) -- Line: 43
        -- upvalues: KnitClient (ref), Players (ref)
        local v8 = p7:GetAttribute("TeamId");
        local v9 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v9 ~= nil then
            v9 = v9.id;
        end;

        local u10 = v8 == v9;

        local function u12(p11) -- Line: 50
            -- upvalues: u10 (copy)
            if p11:IsA("MeshPart") and (p11.Name ~= "Bucket_Steel2.001" and (p11.Name ~= "bucket_hand_mesh" and p11.Name ~= "bucket_mesh")) then
                p11.TextureID = u10 and "rbxassetid://11467440373" or "rbxassetid://11467440187";
            end;
        end;

        local function _(p13) -- Line: 58
            -- upvalues: u12 (copy)
            return u12(p13);
        end;

        for i, descendant in p7:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") and (descendant.Name ~= "Bucket_Steel2.001" and (descendant.Name ~= "bucket_hand_mesh" and descendant.Name ~= "bucket_mesh")) then
                descendant.TextureID = u10 and "rbxassetid://11467440373" or "rbxassetid://11467440187";
            end;
        end;

        p7.DescendantAdded:Connect(function(p14) -- Line: 64
            -- upvalues: u12 (copy)
            return u12(p14);
        end);
    end);
    WatchCharacter(function(u15, u16) -- Line: 68
        -- upvalues: Players (ref), u6 (copy), KnitClient (ref)
        u16:GetAttributeChangedSignal("GlueSlow"):Connect(function() -- Line: 69
            -- upvalues: u16 (copy), Players (ref), u15 (copy), u6 (ref), KnitClient (ref)
            if u16:GetAttribute("GlueSlow") == nil then
                if Players.LocalPlayer == u15 and u6.speedMaid then
                    u6.speedMaid:Destroy();
                    u6.speedMaid = nil;
                end;
            elseif Players.LocalPlayer == u15 then
                u6.speedMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    blockSprint = false,
                    moveSpeedMultiplier = u16:GetAttribute("GlueSlow")
                });
            end;
        end);
    end);
    default2.Client:OnEvent("GlueTrapPlayAlertedAnim", function(u17) -- Line: 85
        -- upvalues: u6 (copy), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref), Workspace (ref), default2 (ref)
        local Character = u17.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if Character == nil then
            return nil;
        end;

        local PrimaryPart = u17.trap.PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        local u18 = u6:getTrapAnimator(u17.trap);

        if not u18 then
            return nil;
        end;

        PrimaryPart.CFrame = CFrame.lookAt(PrimaryPart.Position, Character);
        SoundManager:playSound(GameSound.CHARGING_GLOOP_ALERT, {
            rollOffMaxDistance = 100,
            rollOffMinDistance = 30,
            position = u17.trap:GetPivot().Position
        });
        local u19 = u18:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GLUE_TRAP_CHARGING_ALERTED));
        u19:Play();
        task.delay(1, function() -- Line: 116
            -- upvalues: u17 (copy), Workspace (ref), default2 (ref), SoundManager (ref), GameSound (ref), u19 (ref), u18 (copy), GameAnimationUtil (ref), AnimationType (ref)
            if not (u17.trap:IsDescendantOf(Workspace) and u17.player.Parent) then
                return nil;
            end;

            local PrimaryPart2 = u17.trap.PrimaryPart;

            if not PrimaryPart2 then
                return nil;
            end;

            default2.Client:Get("GlueTrapStartCharging"):SendToServer({
                trap = u17.trap,
                player = u17.player
            });
            local v20 = SoundManager:createSound(GameSound.CHARGING_GLOOP_LOOP);

            if v20 then
                v20.Parent = PrimaryPart2;
                v20.Looped = true;
                v20.Name = "GloopChargingSound";
                v20.Volume = 0.5;
                v20:Play();
            end;

            u19 = u18:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GLUE_TRAP_CHARGING));
            u19:Play();
        end);
    end);
    default2.Client:OnEvent("GlueTrapStopCharging", function(p21) -- Line: 140
        -- upvalues: u6 (copy), GameAnimationUtil (ref), AnimationType (ref)
        local trap = p21.trap;

        if trap ~= nil then
            trap = trap.PrimaryPart;

            if trap ~= nil then
                trap = trap:FindFirstChild("GloopChargingSound");
            end;
        end;

        local v22 = u6:getTrapAnimator(p21.trap);

        if v22 then
            for _, v in v22:GetPlayingAnimationTracks() do
                if v.IsPlaying then
                    v:Stop();
                end;
            end;

            local v23 = v22:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GLUE_TRAP_IDLE));
            v23:AdjustSpeed(0.1);
            v23:Play();
        end;

        if trap then
            trap:Destroy();
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p24) -- Line: 164
        -- upvalues: u6 (copy), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
        local projectile = p24.projectile;

        if p24.projectileType ~= "glue_trap" then
            return nil;
        end;

        local v25 = u6:getTrapAnimator(projectile);

        if not v25 then
            return nil;
        end;

        local v26 = v25:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GLUE_TRAP_FLYING));
        v26:AdjustSpeed(0.1);
        v26:Play();
        local v27 = SoundManager:createSound(GameSound.GLOOP_LOOP);

        if v27 then
            v27.Parent = projectile:FindFirstChildWhichIsA("BasePart");
            v27.Looped = true;
            v27.Volume = 3;
            v27:Play();
        end;
    end);
    ClientSyncEvents.ProjectileHit:connect(function(p28) -- Line: 186
        -- upvalues: SoundManager (ref), GameSound (ref)
        if p28:isCancelled() then
            return nil;
        end;

        if p28.projectileType ~= "glue_trap" and p28.projectileType ~= "glue_trap_charging" then
            return nil;
        end;

        SoundManager:playSound(GameSound.GLOOP_LANDED, {
            position = p28.hitData.hitCFrame.Position
        });
    end);
    default2.Client:OnEvent("GlueTrapReplace", function(u29) -- Line: 197
        -- upvalues: TweenService (ref), ReplicatedStorage (ref), Workspace (ref), default2 (ref)
        for _, v in u29.trap do
            local v30 = v:GetDescendants();

            local function v32(p31) -- Line: 201
                -- upvalues: TweenService (ref)
                if p31:IsA("BasePart") then
                    TweenService:Create(p31, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                        Transparency = 1
                    }):Play();
                end;
            end;

            for i, v3 in v30 do
                v32(v3, i - 1, v30);
            end;

            local u33 = ReplicatedStorage.Assets.Effects.LightUpgradeEffect:Clone();
            u33.CFrame = v:GetPivot();
            u33.Parent = Workspace;
            task.delay(1, function() -- Line: 217
                -- upvalues: u33 (copy)
                u33:Destroy();
            end);
        end;

        task.delay(1, function() -- Line: 221
            -- upvalues: default2 (ref), u29 (copy)
            default2.Client:Get("GlueTrapReplaceSetup"):SendToServer({
                trap = u29.trap,
                gameTeam = u29.gameTeam
            });
        end);
    end);
    default2.Client:OnEvent("GlueTrapAddCharging", function(p34) -- Line: 228
        -- upvalues: u6 (copy), TweenService (ref)
        u6:setInitialTransparency(p34.trap, 1);
        local v35 = p34.trap:GetDescendants();

        local function v37(p36) -- Line: 231
            -- upvalues: TweenService (ref)
            if p36:IsA("BasePart") then
                TweenService:Create(p36, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    Transparency = 0
                }):Play();
            end;
        end;

        for i, v in v35 do
            v37(v, i - 1, v35);
        end;
    end);
    WatchCollectionTag("GlueTrap", function(u38) -- Line: 243
        -- upvalues: Workspace (ref), CollectionService (ref), u6 (copy), KnitClient (ref), GameSound (ref), AnimationType (ref), GameAnimationUtil (ref), SoundManager (ref), ReplicatedStorage (ref), default (ref), OutQuad (ref)
        if not u38:IsDescendantOf(Workspace) then
            u38.AncestryChanged:Wait();
        end;

        if not u38:IsDescendantOf(Workspace) or table.find(CollectionService:GetTags(u38), "GlueTrap") == nil then
            return nil;
        end;

        task.spawn(function() -- Line: 250
            -- upvalues: u6 (ref), KnitClient (ref), GameSound (ref), AnimationType (ref)
            if not u6.isPreloaded then
                KnitClient.Controllers.PreloadController:runPreload({
                    sounds = {
                        GameSound.GLOOP_POP,
                        GameSound.GLOOP_TRIGGER,
                        GameSound.CHARGING_GLOOP_ALERT,
                        GameSound.CHARGING_GLOOP_LOOP
                    },
                    animations = {
                        AnimationType.GLUE_TRAP_JUMP,
                        AnimationType.GLUE_TRAP_IDLE,
                        AnimationType.GLUE_TRAP_CHARGING,
                        AnimationType.GLUE_TRAP_CHARGING_ALERTED
                    }
                });
                u6.isPreloaded = true;
            end;
        end);
        local u39 = u6:getTrapAnimator(u38);

        if u39 then
            local v40 = u39:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GLUE_TRAP_IDLE));
            v40:AdjustSpeed(0.1);
            v40:Play();
        end;

        u38.Destroying:Connect(function() -- Line: 265
            -- upvalues: u38 (copy), CollectionService (ref), Workspace (ref), SoundManager (ref), GameSound (ref), u39 (ref), u6 (ref), GameAnimationUtil (ref), AnimationType (ref), ReplicatedStorage (ref), default (ref), OutQuad (ref)
            local v41 = u38:GetAttribute("DestroyedBySwapping");

            if v41 ~= 0 and (v41 == v41 and (v41 ~= "" and v41)) then
                return nil;
            end;

            local u42 = u38:Clone();
            CollectionService:RemoveTag(u42, "GlueTrap");
            u42.Parent = Workspace;
            local PrimaryPart = u38.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.CFrame;
            end;

            if not PrimaryPart then
                u42:Destroy();

                return nil;
            end;

            u42:PivotTo(PrimaryPart);

            local function _(p43) -- Line: 284
                if p43:IsA("BasePart") then
                    p43.CanCollide = false;
                    p43.CanQuery = false;
                end;
            end;

            for i, descendant in u42:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.CanCollide = false;
                    descendant.CanQuery = false;
                end;
            end;

            local PrimaryPart2 = u42.PrimaryPart;

            if PrimaryPart2 ~= nil then
                local GloopChargingSound = PrimaryPart2:FindFirstChild("GloopChargingSound");

                if GloopChargingSound ~= nil then
                    GloopChargingSound:Destroy();
                end;
            end;

            SoundManager:playSound(GameSound.GLOOP_TRIGGER, {
                position = PrimaryPart.Position
            });
            u39 = u6:getTrapAnimator(u42);

            if u39 then
                local v44 = u39:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.GLUE_TRAP_JUMP));
                v44:AdjustSpeed(0.1);
                v44:Play();
            end;

            local u45 = ReplicatedStorage.Assets.Effects.GlueExplosion:Clone();
            local u46 = PrimaryPart + Vector3.new(0, 5, 0);
            default(0.4, OutQuad, function(p47) -- Line: 313
                -- upvalues: u42 (copy), PrimaryPart (copy), u46 (copy)
                local PrimaryPart3 = u42.PrimaryPart;

                if PrimaryPart3 ~= nil then
                    PrimaryPart3 = PrimaryPart3.Parent;
                end;

                if not PrimaryPart3 then
                    return nil;
                end;

                u42:PivotTo(PrimaryPart:Lerp(u46, p47));
            end);
            task.delay(0.4, function() -- Line: 323
                -- upvalues: u42 (copy), u45 (copy), u46 (copy), Workspace (ref), SoundManager (ref), GameSound (ref)
                u42:Destroy();
                u45.Position = u46.Position;
                u45.Parent = Workspace;

                for _, descendant in u45:GetDescendants() do
                    if descendant:IsA("ParticleEmitter") then
                        descendant:Emit(30);
                    end;
                end;

                SoundManager:playSound(GameSound.GLOOP_POP, {
                    rollOffMinDistance = 30,
                    rollOffMaxDistance = 100,
                    position = u46.Position
                });
            end);
            task.delay(1.5, function() -- Line: 338
                -- upvalues: u45 (copy)
                u45:Destroy();
            end);
        end);
    end);
end;

function u3.setInitialTransparency(p48, p49, p50) -- Line: 344
    for _, descendant in p49:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Transparency = p50;
        end;
    end;
end;

function u3.getTrapAnimator(p51, p52) -- Line: 351
    local AnimationController = p52:WaitForChild("AnimationController", 3);

    if not AnimationController then
        return nil;
    end;

    local Animator = AnimationController:WaitForChild("Animator", 3);
    local v53;

    if Animator == nil then
        v53 = Animator;
    else
        v53 = Animator:IsA("Animator");
    end;

    if v53 then
        return Animator;
    end;

    return nil;
end;

KnitClient.CreateController(u3.new());

return nil;