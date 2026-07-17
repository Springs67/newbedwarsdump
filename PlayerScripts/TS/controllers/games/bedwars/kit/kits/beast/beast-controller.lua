-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BeastKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "beast", "beast-util").BeastKit;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local BeastBloodlustBar = RuntimeLib.import(script, script.Parent, "ui", "beast-bloodlust-bar").BeastBloodlustBar;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "BeastController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 41
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 45
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u3 (copy)
    BaseKitController.constructor(p9, BedwarsKit.BEAST);
    p9.Name = "BeastController";
    p9.activeVisuals = {};
    p9.beastAbilityUnlockMaid = u3.new();
end;

function u7.onKitLocalActivated(u10, p11) -- Line: 51
    -- upvalues: Flamework (copy), u5 (copy), BeastBloodlustBar (copy), Players (copy)
    u10:unmountBloodlustBar();
    u10.bloodlustBarMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createElement(BeastBloodlustBar, {
        Size = UDim2.fromScale(0.36, 0.03),
        ProgressBarConfig = {
            Flip = false,
            GradientRotation = 0,
            BarGradient = ColorSequence.new(Color3.fromRGB(38, 4, 8), Color3.fromRGB(188, 28, 38))
        }
    }));
    p11:GiveTask(function() -- Line: 61
        -- upvalues: u10 (copy)
        return u10:unmountBloodlustBar();
    end);
    p11:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("BeastBloodlust"):Connect(function() -- Line: 64
        -- upvalues: u10 (copy)
        u10:updateBeastAbilityState();
    end));
    p11:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("BeastIsActive"):Connect(function() -- Line: 67
        -- upvalues: u10 (copy)
        u10:updateBeastAbilityState();
    end));
    p11:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("BeastCanDeactivateAt"):Connect(function() -- Line: 70
        -- upvalues: u10 (copy)
        u10:updateBeastAbilityState();
    end));
    p11:GiveTask(function() -- Line: 73
        -- upvalues: u10 (copy)
        return u10.beastAbilityUnlockMaid:DoCleaning();
    end);
    u10:updateBeastAbilityState();
end;

function u7.onKitLocalDeactivated(p12) -- Line: 78
    p12:unmountBloodlustBar();
end;

function u7.onKitReplicationActivated(u13, p14) -- Line: 81
    -- upvalues: default2 (copy), EntityUtil (copy), KnitClient2 (copy), BeastKit (copy), QueueType (copy), u3 (copy), RuntimeLib (copy), PlayerEntity (copy), Players (copy), getItemMeta (copy), u4 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), SoundManager (copy), GameSound (copy), default (copy), InQuad (copy)
    default2.Client:OnEvent("ActivateBeast", function(u15) -- Line: 82
        -- upvalues: EntityUtil (ref), KnitClient2 (ref), u13 (copy), BeastKit (ref), QueueType (ref), u3 (ref), RuntimeLib (ref), PlayerEntity (ref), Players (ref), getItemMeta (ref), u4 (ref), ReplicatedStorage (ref), GameQueryUtil (ref), SoundManager (ref), GameSound (ref), default (ref), InQuad (ref)
        local v16 = EntityUtil:getEntity(u15.entityInstance);

        if v16 == nil then
            return nil;
        end;

        local v17 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():expect();
        local entityInstance = u15.entityInstance;
        local v18 = u13.activeVisuals[entityInstance];

        if v18 ~= nil then
            v18:DoCleaning();
        end;

        if not u15.isActive then
            return nil;
        end;

        local v19 = v17 and v17 == QueueType.CAPTURE_POINTS and 1.15 or BeastKit.WalkSpeedMultiplier;
        local v20 = u3.new();
        u13.activeVisuals[entityInstance] = v20;
        v20:GiveTask(function() -- Line: 102
            -- upvalues: u13 (ref), entityInstance (copy)
            local v21 = u13.activeVisuals[entityInstance] ~= nil;
            u13.activeVisuals[entityInstance] = nil;

            return v21;
        end);
        local v22;

        if RuntimeLib.instanceof(v16, PlayerEntity) then
            v22 = v16:getPlayer().UserId == Players.LocalPlayer.UserId;
        else
            v22 = false;
        end;

        if v22 then
            v20:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = v19
            }));
        end;

        local u23 = u15.entityInstance:GetDescendants();

        local function u26(p24) -- Line: 116
            -- upvalues: u23 (copy), getItemMeta (ref)
            for _, v in u23 do
                if (v:IsA("BasePart") or v:IsA("Decal")) and (v.Name ~= "HumanoidRootPart" and not v:IsA("Texture")) then
                    local v25 = v:FindFirstAncestorOfClass("Accessory");

                    if not (v25 and getItemMeta(string.lower(v25.Name))) then
                        v.Transparency = p24;
                    end;
                end;
            end;
        end;

        u26(1);
        v20:GiveTask(function() -- Line: 127
            -- upvalues: u26 (copy)
            u26(0);
        end);
        local HipHeight = u15.entityInstance.Humanoid.HipHeight;
        u15.entityInstance.Humanoid.HipHeight = 2.3;
        v20:GiveTask(function() -- Line: 132
            -- upvalues: u15 (copy), HipHeight (copy)
            u15.entityInstance.Humanoid.HipHeight = HipHeight;
        end);
        local v27 = u4("Folder", {
            Name = "ExtraCharacterParts",
            Parent = u15.entityInstance
        });
        v20:GiveTask(v27);
        local v28 = ReplicatedStorage.Assets.Effects.BeastActivated:Clone();
        v28:PivotTo(u15.entityInstance:GetPrimaryPartCFrame());
        local v29 = v28:FindFirstChildOfClass("Humanoid");

        if v29 ~= nil then
            v29:Destroy();
        end;

        local HumanoidRootPart = v28:FindFirstChild("HumanoidRootPart");

        if HumanoidRootPart ~= nil then
            HumanoidRootPart:Destroy();
        end;

        local Animate = v28:FindFirstChild("Animate");

        if Animate ~= nil then
            Animate:Destroy();
        end;

        local v30 = v28:FindFirstAncestorOfClass("BodyColors");

        if v30 ~= nil then
            v30:Destroy();
        end;

        for _, descendant in v28:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.Massless = true;
                descendant.CanCollide = false;
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        v28.Parent = v27;

        for _, child in u15.entityInstance:GetChildren() do
            if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
                local v31 = v28:FindFirstChild(child.Name);

                if v31 and v31:IsA("BasePart") then
                    for _, descendant in v31:GetDescendants() do
                        if descendant:IsA("Motor6D") then
                            descendant:Destroy();
                        end;
                    end;

                    v31.Parent = v27;
                    u4("Weld", {
                        Part0 = v31,
                        Part1 = child,
                        Parent = v31
                    });
                end;
            end;
        end;

        if v22 then
            SoundManager:playSound(GameSound.BEAST_ROAR);
        else
            SoundManager:playSound(GameSound.BEAST_ROAR, {
                rollOffMaxDistance = 100,
                position = u15.entityInstance:GetPrimaryPartCFrame().Position
            });
        end;

        local u32 = {};

        for _, descendant in v27:GetDescendants() do
            if descendant:IsA("BasePart") then
                u32[descendant] = {
                    size = descendant.Size,
                    randomOffset = math.random() * 0.1
                };
            end;
        end;

        task.spawn(function() -- Line: 205
            -- upvalues: default (ref), InQuad (ref), u32 (copy)
            default(0.5, InQuad, function(p33) -- Line: 206
                -- upvalues: u32 (ref)
                for i, v in u32 do
                    i.Size = v.size * math.clamp(p33 + v.randomOffset, 0, 1);
                end;
            end, 0.6, 1):Wait();
        end);
    end);
end;

function u7.onKitReplicationDeactivated(p34) -- Line: 216
end;

function u7.onInnateAbilityEnabled(p35, p36, p37) -- Line: 218
    -- upvalues: AbilityId (copy)
    if p36.abilityId ~= AbilityId.BEAST_FORM then
        return nil;
    end;

    p35:updateBeastAbilityState();
end;

function u7.onAbilityUsed(p38, p39, p40) -- Line: 224
end;

function u7.unmountBloodlustBar(p41) -- Line: 226
    if p41.bloodlustBarMaid then
        p41.bloodlustBarMaid:Destroy();
        p41.bloodlustBarMaid = nil;
    end;
end;

function u7.updateBeastAbilityState(p42) -- Line: 232
    -- upvalues: Flamework (copy), AbilityId (copy), Players (copy), BeastKit (copy), AbilityState (copy)
    local v43 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.BEAST_FORM);

    if not v43 then
        return nil;
    end;

    local v44 = Players.LocalPlayer:GetAttribute("BeastBloodlust");
    local v45 = Players.LocalPlayer:GetAttribute("BeastIsActive");
    local v46 = type(v44) ~= "number" and 0 or v44;

    if type(v45) ~= "boolean" then
        v45 = false;
    end;

    local v47 = v46 + 0.001 >= BeastKit.BloodlustRequired;
    local v48 = p42:canDeactivateBeastNow();
    local v49;

    if v45 then
        if v48 then
            v49 = AbilityState.READY;
        else
            v49 = AbilityState.ON_COOLDOWN;
        end;
    elseif v47 then
        v49 = AbilityState.READY;
    else
        v49 = AbilityState.DISABLED;
    end;

    if v49 ~= v43.abilityState then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v43, v49);
    end;

    if v45 and not v48 then
        p42:scheduleBeastDeactivateUnlockRefresh();

        return;
    end;

    p42.scheduledBeastUnlockAt = nil;
    p42.beastAbilityUnlockMaid:DoCleaning();
end;

function u7.canDeactivateBeastNow(p50) -- Line: 261
    -- upvalues: Players (copy), Workspace (copy)
    local v51 = Players.LocalPlayer:GetAttribute("BeastCanDeactivateAt");

    return type(v51) ~= "number" and true or v51 <= Workspace:GetServerTimeNow();
end;

function u7.scheduleBeastDeactivateUnlockRefresh(u52) -- Line: 268
    -- upvalues: Players (copy), Workspace (copy)
    local v53 = Players.LocalPlayer:GetAttribute("BeastCanDeactivateAt");

    if type(v53) ~= "number" then
        return nil;
    end;

    local v54 = v53 - Workspace:GetServerTimeNow();

    if v54 <= 0 then
        return nil;
    end;

    if u52.scheduledBeastUnlockAt == v53 then
        return nil;
    end;

    u52.scheduledBeastUnlockAt = v53;
    u52.beastAbilityUnlockMaid:DoCleaning();
    u52.beastAbilityUnlockMaid:GiveTask(task.delay(v54, function() -- Line: 282
        -- upvalues: u52 (copy)
        u52.scheduledBeastUnlockAt = nil;
        u52:updateBeastAbilityState();
    end));
end;

KnitClient.CreateController(u7.new());

return nil;