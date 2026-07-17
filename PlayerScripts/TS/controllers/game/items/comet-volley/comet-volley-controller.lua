-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
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
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local CometVolleyConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "comet-volley", "comet-volley-constants").CometVolleyConstants;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 34, Name: __tostring
        return "CometVolleyController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 40
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 44
    -- upvalues: KnitController (copy), default2 (copy), AnimationType (copy), GameSound (copy)
    KnitController.constructor(p5);
    p5.Name = "CometVolleyController";
    p5.cometVolleyTargetSelectedRemote = default2.Client:Get("CometVolleyTargetSelected");
    p5.ascendingAnimation = AnimationType.COMET_VOLLEY_ASCEND;
    p5.targetingAnimation = AnimationType.COMET_VOLLEY_TARGETING_IDLE;
    p5.firingAnimation = AnimationType.COMET_VOLLEY_COMET_FIRED;
    p5.descendingAnimation = AnimationType.COMET_VOLLEY_FALLING;
    p5.fireToFallingTransitionAnimation = AnimationType.COMET_VOLLEY_SHOOTING_TO_FALLING_TRANSITION;
    p5.cometImpactSounds = {
        GameSound.COMET_VOLLEY_IMPACT_1,
        GameSound.COMET_VOLLEY_IMPACT_2,
        GameSound.COMET_VOLLEY_IMPACT_3,
        GameSound.COMET_VOLLEY_IMPACT_4
    };
end;

function u3.KnitStart(u6) -- Line: 55
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), GameSound (copy), SoundManager (copy), default2 (copy), ReplicatedStorage (copy), Workspace (copy), TweenService (copy), Players (copy), EntityUtil (copy), Flamework (copy), AnimationUtil (copy), GameAnimationUtil (copy), CometVolleyConstants (copy), scaleModel (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.ItemConsumed:connect(function(p7) -- Line: 57
        -- upvalues: u6 (copy), ItemType (ref), GameSound (ref), SoundManager (ref)
        if not u6:isValidItem(p7.itemType) then
            return nil;
        end;

        local v8 = p7.entity:getInstance();

        if v8 == nil then
            return nil;
        end;

        local PrimaryPart = v8.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if PrimaryPart == nil then
            return nil;
        end;

        local v9;

        if p7.itemType == ItemType.HERO_COMET_VOLLEY then
            v9 = GameSound.COMET_VOLLEY_HERO_CONSUME;
        else
            v9 = GameSound.COMET_VOLLEY_VILLAIN_CONSUME;
        end;

        SoundManager:playSound(v9, {
            rollOffMaxDistance = 120,
            looped = false,
            volumeMultiplier = 0.8,
            position = PrimaryPart,
            parent = v8
        });
    end);
    default2.Client:OnEvent("CometVolleyOreSpawning", function(u10) -- Line: 82
        -- upvalues: ReplicatedStorage (ref), ItemType (ref), GameSound (ref), Workspace (ref), TweenService (ref), SoundManager (ref), Players (ref)
        local u11 = ReplicatedStorage.Assets.Blocks.iron_ore_mesh_block:Clone();
        local PrimaryPart = u11.PrimaryPart;

        if PrimaryPart == nil then
            return nil;
        end;

        local u12;

        if u10.itemType == ItemType.HERO_COMET_VOLLEY then
            u12 = GameSound.COMET_VOLLEY_HERO_ORE;
        else
            u12 = GameSound.COMET_VOLLEY_VILLAIN_ORE;
        end;

        u11:PivotTo(CFrame.new(u10.worldPosition));
        u11.Parent = Workspace;
        PrimaryPart.Anchored = true;
        local Root = u11:FindFirstChild("Root");

        if Root ~= nil then
            Root:SetAttribute("Block", false);
        end;

        local v13 = u11:GetDescendants();

        local function v17(p14) -- Line: 99
            -- upvalues: TweenService (ref), u10 (copy), SoundManager (ref), u12 (copy), u11 (copy), Players (ref)
            if p14:IsA("Part") or (p14:IsA("Texture") or p14:IsA("MeshPart")) then
                p14.Transparency = 1;
                local v15 = TweenService:Create(p14, TweenInfo.new(u10.spawnDuration), {
                    Transparency = 0
                });
                v15:Play();
                v15.Completed:Connect(function() -- Line: 106
                    -- upvalues: SoundManager (ref), u12 (ref), u10 (ref), u11 (ref)
                    SoundManager:playSound(u12, {
                        rollOffMaxDistance = 180,
                        looped = false,
                        volumeMultiplier = 0.2,
                        position = u10.worldPosition
                    });
                    local v16 = u11;

                    if v16 ~= nil then
                        v16:Destroy();
                    end;
                end);

                if u10.attackingPlayer == Players.LocalPlayer then
                    SoundManager:playSound(u12, {
                        rollOffMaxDistance = 180,
                        looped = false,
                        volumeMultiplier = 0.2
                    });
                end;
            end;
        end;

        for i, v in v13 do
            v17(v, i - 1, v13);
        end;
    end);
    default2.Client:OnEvent("CometVolleyInitiated", function(u18) -- Line: 131
        -- upvalues: EntityUtil (ref), Workspace (ref), ItemType (ref), GameSound (ref), ReplicatedStorage (ref), Players (ref), u6 (copy), Flamework (ref), AnimationUtil (ref), GameAnimationUtil (ref), CometVolleyConstants (ref)
        local player = u18.player;
        local Character = player.Character;

        if not Character then
            return nil;
        end;

        local u19 = EntityUtil:getEntity(player);

        if u19 ~= nil then
            u19:hideNametag();
        end;

        Character.Archivable = true;
        local u20 = Character:Clone();
        u20.Parent = Workspace;
        u20:SetAttribute("Transparency", 0);

        if not Character.PrimaryPart then
            return nil;
        end;

        Character:SetAttribute("Transparency", 1);
        local u40 = player:GetAttributeChangedSignal("CometVolleyState"):Connect(function() -- Line: 151
            -- upvalues: player (copy), ItemType (ref), GameSound (ref), ReplicatedStorage (ref), Players (ref), Workspace (ref), u20 (copy), u6 (ref), u18 (copy), Flamework (ref), AnimationUtil (ref), GameAnimationUtil (ref), CometVolleyConstants (ref)
            local v21 = player:GetAttribute("CometVolleyState");
            local v22 = player:GetAttribute("CometVolleyVariant");
            local v23;

            if v22 == ItemType.HERO_COMET_VOLLEY then
                v23 = GameSound.COMET_VOLLEY_HERO_ASCEND;
            else
                v23 = GameSound.COMET_VOLLEY_VILLAIN_ASCEND;
            end;

            local Character2 = player.Character;
            local v24;

            if v22 == ItemType.HERO_COMET_VOLLEY then
                v24 = ReplicatedStorage.Assets.Effects.CometVolleyHeroEffects:Clone();
            else
                v24 = ReplicatedStorage.Assets.Effects.CometVolleyVillainEffects:Clone();
            end;

            if not Character2 then
                return nil;
            end;

            if player == Players.LocalPlayer then
                Workspace.CurrentCamera.CameraSubject = u20.Humanoid;
            end;

            local Animator = u20.Humanoid.Animator;

            if not u20.PrimaryPart then
                return nil;
            end;

            u20.PrimaryPart.Anchored = true;
            local u25 = false;

            if v21 == "Ascending" then
                u6:handleAscendEffects(u18.targetPosition, u20.PrimaryPart, Animator, v23, v24);
            elseif v21 == "Targeting" then
                local u26, u27, u28;

                if Players.LocalPlayer == player then
                    u26 = ReplicatedStorage.Assets.Misc.CometVolleyIndicator:Clone();
                    u26.Parent = Workspace;
                    u26.Anchored = true;
                    u27 = u6:enableTargetIndicator(player, u26);
                    u28 = u6:enablePlayerRotation(player, u20, u18.targetPosition);
                else
                    u26 = nil;
                    u27 = nil;
                    u28 = nil;
                end;

                local u29 = nil;
                u29 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
                    action = "Attack",
                    actionId = "comet-volley-fire",

                    boundFunction = function(p30, p31, p32) -- Line: 190, Name: boundFunction
                        -- upvalues: u6 (ref), player (ref), u20 (ref), u18 (ref), u29 (ref), u25 (ref)
                        if p31 ~= Enum.UserInputState.Begin then
                            if p31 == Enum.UserInputState.End then
                                u29:DoCleaning();
                            end;

                            return;
                        end;

                        if not u6:requestCometVolley(player, u20, u18.targetPosition) then
                            u29:DoCleaning();

                            return nil;
                        end;

                        u25 = true;
                    end
                });
                local u33 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(u6.targetingAnimation), {
                    looped = true
                });
                u29:GiveTask(function() -- Line: 207
                    -- upvalues: u26 (ref), u27 (ref), u28 (ref), u25 (ref), u6 (ref), player (ref), u20 (ref), u18 (ref), u33 (copy)
                    local v34 = u26;

                    if v34 ~= nil then
                        v34:Destroy();
                    end;

                    local v35 = u27;

                    if v35 ~= nil then
                        v35:Disconnect();
                    end;

                    local v36 = u28;

                    if v36 ~= nil then
                        v36:Disconnect();
                    end;

                    if not u25 then
                        u6:requestCometVolley(player, u20, u18.targetPosition);
                    end;

                    local v37 = u33;

                    if v37 ~= nil then
                        v37:Stop();
                    end;
                end);
                task.delay(CometVolleyConstants.COMET_VOLLEY_TARGETING_DURATION - 0.15, function() -- Line: 229
                    -- upvalues: u33 (copy), u29 (ref)
                    local v38 = u33;

                    if v38 ~= nil then
                        v38:Stop();
                    end;

                    local v39 = u29;

                    if v39 ~= nil then
                        v39:DoCleaning();
                    end;
                end);
            elseif v21 == "Firing" then
                AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(u6.firingAnimation), {
                    looped = false
                });
            elseif v21 == "Descending" then
                u6:handleDescendEffects(u18.originPosition + Vector3.new(0, 0, 0), u20.PrimaryPart, Animator);
                task.delay(CometVolleyConstants.COMET_VOLLEY_DESCEND_DURATION, function() -- Line: 254
                    -- upvalues: Character2 (copy), player (ref), Players (ref), Workspace (ref), u20 (ref)
                    Character2:SetAttribute("Transparency", 0);

                    if player == Players.LocalPlayer then
                        Workspace.CurrentCamera.CameraSubject = Character2.Humanoid;
                    end;

                    u20:Destroy();
                end);
            end;
        end);
        task.delay(CometVolleyConstants.COMET_VOLLEY_ASCEND_DURATION + CometVolleyConstants.COMET_VOLLEY_TARGETING_DURATION + CometVolleyConstants.COMET_VOLLEY_FIRING_DURATION + CometVolleyConstants.COMET_VOLLEY_DESCEND_DURATION + 0.1, function() -- Line: 266
            -- upvalues: u40 (copy), u19 (copy)
            local v41 = u40;

            if v41 ~= nil then
                v41:Disconnect();
            end;

            local v42 = u19;

            if v42 ~= nil then
                v42:showNametag();
            end;
        end);
    end);
    default2.Client:OnEvent("CometSpawned", function(p43) -- Line: 278
        -- upvalues: ItemType (ref), ReplicatedStorage (ref), Workspace (ref), scaleModel (ref), TweenService (ref), u6 (copy)
        local u44;

        if p43.variant == ItemType.HERO_COMET_VOLLEY then
            u44 = ReplicatedStorage.Assets.Misc.HeroComet:Clone();
        else
            u44 = ReplicatedStorage.Assets.Misc.VillainComet:Clone();
        end;

        local PrimaryPart = u44.PrimaryPart;

        if PrimaryPart == nil then
            return nil;
        end;

        u44.Parent = Workspace;
        PrimaryPart.Anchored = true;
        scaleModel(u44, math.random(2, 6));
        local Comet = u44:FindFirstChild("Comet");

        if Comet ~= nil then
            local Effects = Comet:FindFirstChild("Effects");

            if Effects ~= nil then
                local function _(p45) -- Line: 293
                    if p45:IsA("ParticleEmitter") then
                        p45:Emit();
                    end;
                end;

                for i, descendant in Effects:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant:Emit();
                    end;
                end;
            end;
        end;

        local v46 = u44:GetChildren();

        local function v48(p47) -- Line: 305
            -- upvalues: TweenService (ref)
            if p47:IsA("MeshPart") then
                p47.Transparency = 1;
                TweenService:Create(p47, TweenInfo.new(0.3), {
                    Transparency = 0
                }):Play();
            end;
        end;

        for i, v in v46 do
            v48(v, i - 1, v46);
        end;

        PrimaryPart:PivotTo(CFrame.new(p43.originPosition));
        local Unit = (p43.originPosition - p43.targetPosition).Unit;
        local v49 = CFrame.lookAt(PrimaryPart.Position + Unit, p43.targetPosition + Unit);
        PrimaryPart:PivotTo(CFrame.new(p43.originPosition, v49.Position));
        local Comet2 = u44:FindFirstChild("Comet");

        if Comet2 ~= nil then
            local Effects = Comet2:FindFirstChild("Effects");

            if Effects ~= nil then
                local function _(p50) -- Line: 329
                    if p50:IsA("ParticleEmitter") then
                        p50:Emit();
                    end;
                end;

                for i, descendant in Effects:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant:Emit();
                    end;
                end;
            end;
        end;

        u6:tweenCometToTarget(PrimaryPart, p43.targetPosition, p43.travelDuration);
        task.delay(p43.travelDuration + 0.05, function() -- Line: 340
            -- upvalues: u44 (copy)
            local v51 = u44;

            if v51 ~= nil then
                v51:Destroy();
            end;

            for _, descendant in u44:GetDescendants() do
                if (descendant:IsA("Weld") or descendant:IsA("BasePart")) and descendant ~= nil then
                    descendant:Destroy();
                end;
            end;
        end);
    end);
end;

function u3.requestCometVolley(p52, p53, p54, u55) -- Line: 356
    -- upvalues: CometVolleyConstants (copy), SoundManager (copy), GameSound (copy)
    if p53:GetAttribute("CometVolleyState") ~= "Targeting" then
        return false;
    end;

    local v56 = p52:getTargetPosition(p53, p54);

    if not v56 then
        return false;
    end;

    p52.cometVolleyTargetSelectedRemote:SendToServer({
        targetPosition = v56
    });
    task.delay(CometVolleyConstants.COMET_VOLLEY_FIRING_DURATION, function() -- Line: 368
        -- upvalues: SoundManager (ref), GameSound (ref), u55 (copy)
        SoundManager:playSound(GameSound.COMET_VOLLEY_FIRED, {
            rollOffMaxDistance = 180,
            looped = false,
            volumeMultiplier = 0.6,
            position = u55
        });
    end);

    return true;
end;

function u3.handleDescendEffects(p57, p58, p59, p60) -- Line: 378
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), CometVolleyConstants (copy), TweenService (copy), SoundManager (copy), GameSound (copy)
    local u61 = AnimationUtil:playAnimation(p60, GameAnimationUtil:getAssetId(p57.fireToFallingTransitionAnimation), {
        looped = false
    });
    local v62 = TweenService:Create(p59, TweenInfo.new(CometVolleyConstants.COMET_VOLLEY_DESCEND_DURATION, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
        CFrame = CFrame.new(p58)
    });
    local u63 = SoundManager:playSound(GameSound.WIND_LOOP, {
        rollOffMaxDistance = 180,
        volumeMultiplier = 1.4,
        looped = false,
        parent = p59,
        position = p59.Position
    });
    local u64 = p60:LoadAnimation(GameAnimationUtil:getAnimation(p57.descendingAnimation));
    task.delay(0.25, function() -- Line: 394
        -- upvalues: u61 (copy), u64 (copy)
        local v65 = u61;

        if v65 ~= nil then
            v65:Stop();
        end;

        u64:Play();
        u64.Looped = true;
        u64:AdjustSpeed(1);
    end);
    v62:Play();
    v62.Completed:Connect(function() -- Line: 404
        -- upvalues: u64 (copy), u63 (copy)
        local v66 = u64;

        if v66 ~= nil then
            v66:Stop();
        end;

        local v67 = u63;

        if v67 ~= nil then
            v67:Stop();
        end;
    end);
end;

function u3.handleAscendEffects(p68, p69, p70, p71, p72, u73) -- Line: 415
    -- upvalues: WeldUtil (copy), CollectionService (copy), AnimationUtil (copy), GameAnimationUtil (copy), CometVolleyConstants (copy), TweenService (copy), SoundManager (copy)
    u73:PivotTo(CFrame.new(p70.Position));
    u73.Parent = p70;
    local Root = u73:FindFirstChild("Root");

    if Root == nil then
        return nil;
    end;

    Root.Anchored = false;

    local function _(p74) -- Line: 424
        if p74:IsA("ParticleEmitter") then
            p74.Enabled = true;
        end;

        if p74:IsA("Trail") then
            p74.Enabled = true;
        end;
    end;

    for i, descendant in u73:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant.Enabled = true;
        end;

        if descendant:IsA("Trail") then
            descendant.Enabled = true;
        end;
    end;

    WeldUtil:weldParts(Root, p70);
    u73:SetAttribute("RotationSpeed", 359);
    CollectionService:AddTag(u73, "RotatingObject");
    local u75 = AnimationUtil:playAnimation(p71, GameAnimationUtil:getAssetId(p68.ascendingAnimation), {
        looped = true,
        speed = 0.66
    });
    local v76 = TweenService:Create(p70, TweenInfo.new(CometVolleyConstants.COMET_VOLLEY_ASCEND_DURATION, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
        CFrame = CFrame.new(p69)
    });
    local u77 = SoundManager:playSound(p72, {
        rollOffMaxDistance = 180,
        volumeMultiplier = 1.4,
        looped = false,
        parent = p70,
        position = p70.Position
    });
    v76:Play();
    v76.Completed:Connect(function() -- Line: 454
        -- upvalues: u75 (copy), u77 (copy), u73 (copy)
        local v78 = u75;

        if v78 ~= nil then
            v78:Stop();
        end;

        local v79 = u77;

        if v79 ~= nil then
            v79:Stop();
        end;

        local v80 = u73;

        if v80 ~= nil then
            v80:Destroy();
        end;
    end);
end;

function u3.getTargetPosition(p81, p82, p83) -- Line: 469
    -- upvalues: GameQueryUtil (copy)
    local UnitRay = p82:GetMouse().UnitRay;
    local Character = p82.Character;

    if not Character then
        return nil;
    end;

    local v84 = RaycastParams.new();
    v84.FilterDescendantsInstances = { Character, p83 };
    v84.FilterType = Enum.RaycastFilterType.Exclude;
    local v86 = GameQueryUtil:raycast(UnitRay.Origin, UnitRay.Direction.Unit * 1000, v84, {
        ignorePart = function(p85) -- Line: 480, Name: ignorePart
            return p85:IsA("BasePart") and not p85.CanCollide and true or false;
        end
    });

    if v86 ~= nil then
        v86 = v86.Position;
    end;

    return v86 or nil;
end;

function u3.enableTargetIndicator(p87, p88, u89) -- Line: 497
    -- upvalues: CometVolleyConstants (copy)
    local u90 = p88:GetMouse();
    local u91 = nil;
    u91 = u90.Move:Connect(function() -- Line: 500
        -- upvalues: u90 (copy), u89 (copy), CometVolleyConstants (ref), u91 (ref)
        u89.CFrame = CFrame.new(u90.Hit.Position);
        task.delay(CometVolleyConstants.COMET_VOLLEY_TARGETING_DURATION - 0.15, function() -- Line: 503
            -- upvalues: u89 (ref), u91 (ref)
            local v92 = u89;

            if v92 ~= nil then
                v92:Destroy();
            end;

            local v93 = u91;

            if v93 ~= nil then
                v93:Disconnect();
            end;

            return nil;
        end);
    end);

    return u91;
end;

function u3.enablePlayerRotation(p94, p95, u96, u97) -- Line: 517
    -- upvalues: CometVolleyConstants (copy)
    local u98 = p95:GetMouse();
    local u99 = nil;
    u99 = u98.Move:Connect(function() -- Line: 520
        -- upvalues: u98 (copy), CometVolleyConstants (ref), u99 (ref), u97 (copy), u96 (copy)
        local Position = u98.Hit.Position;
        task.delay(CometVolleyConstants.COMET_VOLLEY_TARGETING_DURATION - 0.15, function() -- Line: 522
            -- upvalues: u99 (ref)
            local v100 = u99;

            if v100 ~= nil then
                v100:Disconnect();
            end;

            return nil;
        end);
        u96:PivotTo((CFrame.new(u97, u97 + (Position - u97))));
    end);

    return u99;
end;

function u3.tweenCometToTarget(u101, u102, u103, p104) -- Line: 536
    -- upvalues: TweenService (copy), SoundManager (copy), RandomUtil (copy), ReplicatedStorage (copy), EffectUtil (copy), Workspace (copy), default (copy), Linear (copy)
    local v105 = CFrame.lookAt(u102.Position, u103 + (u103 - u102.Position).Unit);
    local v106 = TweenService:Create(u102, TweenInfo.new(p104, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
        CFrame = CFrame.new(u103, v105.Position)
    });
    v106:Play();
    v106.Completed:Connect(function() -- Line: 546
        -- upvalues: SoundManager (ref), RandomUtil (ref), u101 (copy), u103 (copy), u102 (copy), ReplicatedStorage (ref), EffectUtil (ref), Workspace (ref), default (ref), Linear (ref)
        SoundManager:playSound(RandomUtil.fromList(unpack(u101.cometImpactSounds)), {
            rollOffMaxDistance = 140,
            volumeMultiplier = 0.8,
            position = u103
        });
        local v107 = u102;

        if v107 ~= nil then
            v107:Destroy();
        end;

        local u108 = ReplicatedStorage.Assets.Effects.WizardImpact:Clone();

        if not u108.PrimaryPart then
            return nil;
        end;

        EffectUtil:playEffects({ u108 }, nil);
        local v109 = Vector3.new(0, u108.PrimaryPart.Size.Y / 2 + 0.5, 0);
        u108:PivotTo(CFrame.new(u103 + v109));
        u108.Parent = Workspace;
        task.delay(0.5, function() -- Line: 566
            -- upvalues: u108 (copy), default (ref), Linear (ref)
            local ImageLabel = u108.Crack.SurfaceGui.ImageLabel;
            local Brightness = u108.Crack.SurfaceGui.Brightness;
            default(0.5, Linear, function(p110) -- Line: 570
                -- upvalues: u108 (ref), Brightness (copy), ImageLabel (copy)
                u108.Crack.SurfaceGui.Brightness = Brightness * (1 - p110);
                ImageLabel.ImageTransparency = p110 * 0.4;
            end);
            task.wait(1.5);
            default(1.5, Linear, function(p111) -- Line: 576
                -- upvalues: ImageLabel (copy)
                ImageLabel.ImageTransparency = 0.4 + p111 * 0.6;
            end):Wait();
            u108:Destroy();
        end);
    end);
end;

function u3.isValidItem(p112, p113) -- Line: 584
    -- upvalues: ItemType (copy)
    return p113 == ItemType.HERO_COMET_VOLLEY or p113 == ItemType.VILLAIN_COMET_VOLLEY;
end;

KnitClient.CreateController(u3.new());

return nil;