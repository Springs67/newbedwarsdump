-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local HarpoonBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").HarpoonBalance;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 37, Name: __tostring
        return "HarpoonController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 43
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 47
    -- upvalues: KnitController (copy), u2 (copy), ExpireList (copy)
    KnitController.constructor(p8);
    p8.Name = "HarpoonController";
    p8.uiMaid = u2.new();
    p8.visualCooldowns = ExpireList.new(1);
    p8.isPreloaded = false;
end;

function u6.KnitStart(u9) -- Line: 54
    -- upvalues: KnitController (copy), KnitClient (copy), BedwarsKit (copy), GameSound (copy), AnimationType (copy), SharedSyncEvents (copy), ClientSyncEvents (copy), getItemMeta (copy), ItemType (copy), Flamework (copy), CooldownId (copy), Players (copy), default (copy), HarpoonBalance (copy), u4 (copy), TimedProgressBar (copy), Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), RuntimeLib (copy), PlayerEntity (copy), SoundManager (copy), UserInputService (copy)
    KnitController.KnitStart(u9);
    KnitClient.Controllers.KitController:watchKit(function(p10, p11) -- Line: 56
        -- upvalues: BedwarsKit (ref), u9 (copy), KnitClient (ref), GameSound (ref), AnimationType (ref)
        if p11 == BedwarsKit.HARPOON and not u9.isPreloaded then
            KnitClient.Controllers.PreloadController:runPreload({
                sounds = {
                    GameSound.HARPOON_HIT_ENEMY,
                    GameSound.HARPOON_HIT_PART,
                    GameSound.HARPOON_LEAP,
                    GameSound.HARPOON_THROW
                },
                animations = {
                    AnimationType.HARPOON_ATTACK_START,
                    AnimationType.HARPOON_HANG,
                    AnimationType.HARPOON_HANG_IDLE,
                    AnimationType.HARPOON_RETURN,
                    AnimationType.HARPOON_STTACK
                }
            });
            u9.isPreloaded = true;
        end;
    end);
    SharedSyncEvents.ProjectileExpired:connect(function(p12) -- Line: 67
        -- upvalues: u9 (copy)
        if p12.projectileType == "harpoon_projectile" then
            u9:returnHarpoon(p12.player, p12.projectileModel);
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p13) -- Line: 72
        -- upvalues: ClientSyncEvents (ref), getItemMeta (ref), ItemType (ref), Flamework (ref), CooldownId (ref), Players (ref), u9 (copy)
        if p13:isLocalShooter() and p13.projectileType == "harpoon_projectile" then
            local cooldown = ClientSyncEvents.AbilityCooldownModifierCheck:fire(getItemMeta(ItemType.HARPOON).projectileSource.fireDelaySec).cooldown;
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.HARPOON, cooldown);
        end;

        if p13.projectileType == "harpoon_projectile" and p13.shooter then
            local v14 = Players:GetPlayerFromCharacter(p13.shooter);

            if not v14 then
                return nil;
            end;

            u9:hideHandItem(v14);
        end;
    end);
    default.Client:Get("TridentAttached"):Connect(function(p15) -- Line: 85
        -- upvalues: u9 (copy), HarpoonBalance (ref), Flamework (ref), u4 (ref), TimedProgressBar (ref), Workspace (ref), AnimationUtil (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref)
        if not p15.attached then
            u9.uiMaid:DoCleaning();
            local animationTrack = u9.animationTrack;

            if animationTrack ~= nil then
                animationTrack:Stop();
            end;

            local animationTrack2 = u9.animationTrack;

            if animationTrack2 ~= nil then
                animationTrack2:Destroy();
            end;

            return;
        end;

        u9.uiMaid:DoCleaning();
        local v16 = HarpoonBalance.MAX_ANCHOR_TIME - 0.4;
        local anchorTime = p15.anchorTime;

        if anchorTime ~= 0 and (anchorTime == anchorTime and anchorTime) then
            v16 = p15.anchorTime - 0.4;
        end;

        u9.uiMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(TimedProgressBar, {
            Size = UDim2.fromScale(1, 0.05),
            EndTime = Workspace:GetServerTimeNow() + v16,
            ProgressBarConfig = {
                GradientRotation = 0,
                BarGradient = ColorSequence.new(Color3.fromRGB(28, 112, 255), Color3.fromRGB(51, 148, 255))
            }
        }));
        local animationTrack = u9.animationTrack;

        if animationTrack ~= nil then
            animationTrack:Stop();
        end;

        local animationTrack2 = u9.animationTrack;

        if animationTrack2 ~= nil then
            animationTrack2:Destroy();
        end;

        u9.animationTrack = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HARPOON_HANG_IDLE));
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p17) -- Line: 122
        -- upvalues: RuntimeLib (ref), PlayerEntity (ref), GameSound (ref), u9 (copy), SoundManager (ref)
        if p17:isCancelled() then
            return nil;
        end;

        if p17.projectileType ~= "harpoon_projectile" or not RuntimeLib.instanceof(p17.shooter, PlayerEntity) then
            return nil;
        end;

        local v18 = p17.shooter:getPlayer();

        if v18 ~= nil then
            v18 = v18.Character;
        end;

        if not v18 then
            return nil;
        end;

        local Position = v18:GetPivot().Position;

        if not Position then
            return nil;
        end;

        local HARPOON_THROW = GameSound.HARPOON_THROW;
        local v19 = u9:getKitSkinData(v18);
        local v20;

        if v19 == nil then
            v20 = v19;
        else
            v20 = v19.throwSound;
        end;

        if v20 ~= "" and v20 then
            HARPOON_THROW = v19.throwSound;
        end;

        SoundManager:playSound(HARPOON_THROW, {
            position = Position
        });
    end);
    ClientSyncEvents.ProjectileHit:connect(function(p21) -- Line: 154
        -- upvalues: RuntimeLib (ref), PlayerEntity (ref), GameSound (ref), u9 (copy), SoundManager (ref)
        if p21:isCancelled() then
            return nil;
        end;

        if p21.projectileType ~= "harpoon_projectile" or not RuntimeLib.instanceof(p21.shooter, PlayerEntity) then
            return nil;
        end;

        local v22 = p21.shooter:getPlayer();

        if v22 ~= nil then
            v22 = v22.Character;
        end;

        if not v22 then
            return nil;
        end;

        local Position = p21.hitData.hitCFrame.Position;

        if not Position then
            return nil;
        end;

        local HARPOON_HIT_PART = GameSound.HARPOON_HIT_PART;
        local v23 = u9:getKitSkinData(v22);
        local v24;

        if v23 == nil then
            v24 = v23;
        else
            v24 = v23.hitPartSound;
        end;

        if v24 ~= "" and v24 then
            HARPOON_HIT_PART = v23.hitPartSound;
        end;

        SoundManager:playSound(HARPOON_HIT_PART, {
            position = Position
        });
    end);
    ClientSyncEvents.ProjectileHit:connect(function(p25) -- Line: 186
        -- upvalues: RuntimeLib (ref), PlayerEntity (ref), u9 (copy), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), SoundManager (ref)
        if p25:isCancelled() then
            return nil;
        end;

        if p25.projectileType == "harpoon_projectile" and RuntimeLib.instanceof(p25.shooter, PlayerEntity) then
            if u9.visualCooldowns:has(p25.projectileRefId) then
                return nil;
            end;

            u9.visualCooldowns:add(p25.projectileRefId);
            local u26 = p25.projectileModel:Clone();
            u26.Parent = Workspace;
            u26.PrimaryPart.Anchored = true;
            local u27 = p25.shooter:getPlayer();
            task.delay(0.55, function() -- Line: 199
                -- upvalues: u26 (copy), u9 (ref), u27 (copy)
                u26:Destroy();
                u9:showHandItem(u27);
            end);

            if p25.hitEntity then
                local v28 = p25.hitEntity:getInstance();
                local u29 = AnimationUtil:playAnimation(v28, GameAnimationUtil:getAssetId(AnimationType.R15_ANIM_EMOTE_SLEEP));
                local HARPOON_HIT_ENEMY = GameSound.HARPOON_HIT_ENEMY;
                local v30 = u9:getKitSkinData(u27.Character);
                local v31;

                if v30 == nil then
                    v31 = v30;
                else
                    v31 = v30.hitEnemySound;
                end;

                if v31 ~= "" and v31 then
                    HARPOON_HIT_ENEMY = v30.hitEnemySound;
                end;

                local v32 = {};
                local PrimaryPart = v28.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                v32.position = PrimaryPart;
                SoundManager:playSound(HARPOON_HIT_ENEMY, v32);
                task.delay(0.4, function() -- Line: 226
                    -- upvalues: AnimationUtil (ref), u27 (copy), GameAnimationUtil (ref), AnimationType (ref), u29 (copy)
                    AnimationUtil:playAnimation(u27, GameAnimationUtil:getAssetId(AnimationType.HARPOON_STTACK));
                    local v33 = u29;

                    if v33 ~= nil then
                        v33:Stop();
                    end;

                    local v34 = u29;

                    if v34 ~= nil then
                        v34:Destroy();
                    end;
                end);
            end;
        end;
    end);
    UserInputService.JumpRequest:Connect(function() -- Line: 240
        -- upvalues: default (ref), Players (ref)
        local v35 = default.Client:Get("TridentUnanchor"):CallServer() and Players.LocalPlayer.Character;

        if v35 then
            v35.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
        end;
    end);
    default.Client:Get("HarpoonTeleport"):Connect(function(p36) -- Line: 249
        -- upvalues: GameSound (ref), u9 (copy), SoundManager (ref)
        local Character = p36.shooter.Character;
        local HARPOON_LEAP = GameSound.HARPOON_LEAP;
        local v37 = u9:getKitSkinData(Character);
        local v38;

        if v37 == nil then
            v38 = v37;
        else
            v38 = v37.leapSound;
        end;

        if v38 ~= "" and v38 then
            HARPOON_LEAP = v37.leapSound;
        end;

        if Character then
            local v39 = {};

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            v39.parent = Character;
            SoundManager:playSound(HARPOON_LEAP, v39);
        end;
    end);
end;

function u6.returnHarpoon(u40, u41, p42) -- Line: 274
    -- upvalues: u2 (copy), EntityUtil (copy), ItemType (copy), u3 (copy), Workspace (copy), RunService (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local u43 = u2.new();
    local u44 = p42:Clone();

    if not p42.PrimaryPart then
        return nil;
    end;

    local u45 = EntityUtil:getEntity(u41);

    if not u45 then
        return nil;
    end;

    u44:PivotTo(p42.PrimaryPart.CFrame);

    local function _(p46) -- Line: 287
        if p46:IsA("BodyForce") then
            p46:Destroy();
        end;
    end;

    for i, descendant in u44:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BodyForce") then
            descendant:Destroy();
        end;
    end;

    local u47 = false;
    local u48 = u45:getHandItemInstanceFromCharacter();
    local v49;

    if u48 == nil then
        v49 = u48;
    else
        v49 = u48.Name;
    end;

    if v49 ~= ItemType.HARPOON then
        return nil;
    end;

    u44.Parent = u48;
    u3("BodyForce", {
        Name = "AntiGravity",
        Force = Vector3.new(0, u44.PrimaryPart.AssemblyMass * Workspace.Gravity, 0),
        Parent = u44.PrimaryPart
    });
    u44.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0);
    local u50 = 0;
    local u51 = 0;
    u43:GiveTask(RunService.Heartbeat:Connect(function(p52) -- Line: 313
        -- upvalues: u45 (copy), u48 (copy), u44 (copy), u43 (copy), u41 (copy), u50 (ref), u47 (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u40 (copy), u51 (ref)
        if u45:getHandItemInstanceFromCharacter() ~= u48 then
            u44:Destroy();
            u43:DoCleaning();

            return nil;
        end;

        if not u48 or u48.Parent ~= u41.Character then
            u44:Destroy();
            u43:DoCleaning();

            return nil;
        end;

        if u50 > 0.75 then
            u44:Destroy();
            u43:DoCleaning();

            return nil;
        end;

        if u50 > 0.6 and not u47 then
            u47 = true;
            AnimationUtil:playAnimation(u41, GameAnimationUtil:getAssetId(AnimationType.HARPOON_RETURN));
            u40:showHandItem(u41);
            u44:Destroy();
            u43:DoCleaning();

            return nil;
        end;

        u44.PrimaryPart.Anchored = false;
        local v53 = u48:FindFirstChild("Handle").Position - u44.PrimaryPart.Position;
        local v54 = p52 / 0.75 * (u51 + v53.Magnitude);
        u51 = u51 + v54;
        u44:PivotTo(CFrame.new(u44.PrimaryPart.Position + v53.Unit * v54) * CFrame.Angles(0, u50 * 3.141592653589793, u50 * 6 * 3.141592653589793));
        u50 = u50 + p52;
    end));
end;

function u6.hideHandItem(p55, p56) -- Line: 357
    -- upvalues: EntityUtil (copy), ItemType (copy)
    local v57 = EntityUtil:getEntity(p56);

    if not v57 then
        return nil;
    end;

    local v58 = v57:getHandItemInstanceFromCharacter();
    local v59;

    if v58 == nil then
        v59 = v58;
    else
        v59 = v58.Name;
    end;

    if v59 ~= ItemType.HARPOON then
        return nil;
    end;

    local function _(p60) -- Line: 371
        if p60:IsA("Part") or p60:IsA("MeshPart") then
            p60.Transparency = 1;
        end;
    end;

    for i, descendant in v58:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Part") or descendant:IsA("MeshPart") then
            descendant.Transparency = 1;
        end;
    end;
end;

function u6.showHandItem(p61, p62) -- Line: 380
    -- upvalues: EntityUtil (copy), ItemType (copy)
    local v63 = EntityUtil:getEntity(p62);

    if not v63 then
        return nil;
    end;

    local v64 = v63:getHandItemInstanceFromCharacter();
    local v65;

    if v64 == nil then
        v65 = v64;
    else
        v65 = v64.Name;
    end;

    if v65 ~= ItemType.HARPOON then
        return nil;
    end;

    local function _(p66) -- Line: 394
        if p66:IsA("Part") or p66:IsA("MeshPart") then
            p66.Transparency = 0;
        end;
    end;

    for i, descendant in v64:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Part") or descendant:IsA("MeshPart") then
            descendant.Transparency = 0;
        end;
    end;
end;

function u6.getKitSkinData(p67, p68) -- Line: 403
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if not p68 then
        return nil;
    end;

    local v69 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p68)];

    if v69.triton then
        return v69.triton;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;