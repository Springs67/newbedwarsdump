-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ActionButton = v1.ActionButton;
local GamepadAction = v1.GamepadAction;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "PlayerVacuumController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 38
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 42
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p8, ...);
    p8.Name = "PlayerVacuumController";
    p8.maid = u3.new();
    p8.activeVacuumingEffects = {};
    p8.activeProximityPrompts = {};
end;

function u6.KnitStart(u9) -- Line: 49
    -- upvalues: HandKnitController (copy), RunService (copy), Workspace (copy), default (copy), EntityUtil (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), RandomUtil (copy), Flamework (copy), CooldownId (copy), Players (copy), InventoryUtil (copy), ItemType (copy)
    HandKnitController.KnitStart(u9);
    RunService.Heartbeat:Connect(function() -- Line: 52
        -- upvalues: u9 (copy), Workspace (ref)
        for i, v in u9.activeVacuumingEffects do
            if Workspace:GetServerTimeNow() - v.startTime > 1.5 then
                u9:cleanVacuumingEffect(i);
            end;
        end;
    end);
    default.Client:OnEvent("PlayerReleasedFromVacuum", function(p10) -- Line: 59
        -- upvalues: EntityUtil (ref), SoundManager (ref), GameSound (ref), Workspace (ref), KnitClient2 (ref), u9 (copy)
        local v11 = EntityUtil:getEntity(p10.victimEntityInstance);
        local v12 = EntityUtil:getEntity(p10.attackerEntityInstance);
        local GHOST_VACUUM_SHOOT = GameSound.GHOST_VACUUM_SHOOT;
        local v13 = {};
        local v14;

        if v11 == nil then
            v14 = v11;
        else
            v14 = v11:isLocalPlayer();
        end;

        local v15;

        if v14 then
            v15 = nil;
        else
            v15 = p10.victimEntityInstance:GetPrimaryPartCFrame().Position;
        end;

        v13.position = v15;
        SoundManager:playSound(GHOST_VACUUM_SHOOT, v13);
        local v16;

        if v11 == nil then
            v16 = v11;
        else
            v16 = v11:isLocalPlayer();
        end;

        if v16 then
            v16 = Workspace.CurrentCamera;
        end;

        if v16 then
            Workspace.CurrentCamera.CameraSubject = p10.victimEntityInstance.Humanoid;
        end;

        local v17;

        if v12 == nil then
            v17 = v12;
        else
            v17 = v12:isLocalPlayer();
        end;

        if v17 then
            local v18 = v12:getInstance():GetPrimaryPartCFrame();
            KnitClient2.Controllers.ScreenShakeController:shake(v18.Position, v18 * Vector3.new(-0.25, 0, -1) - v18.Position, {
                magnitude = 0.15,
                duration = 0.15,
                cycles = 2
            });
        end;

        if v11 ~= nil then
            v11 = v11:isLocalPlayer();
        end;

        if v11 then
            v12 = v11;
        elseif v12 ~= nil then
            v12 = v12:isLocalPlayer();
        end;

        if v12 then
            local cooldownbarMaid = u9.cooldownbarMaid;

            if cooldownbarMaid ~= nil then
                cooldownbarMaid:DoCleaning();
            end;
        end;
    end);
    default.Client:OnEvent("PlayerVacuumed", function(p19) -- Line: 119
        -- upvalues: EntityUtil (ref), SoundManager (ref), GameSound (ref), RandomUtil (ref), KnitClient2 (ref), Workspace (ref), Flamework (ref), u9 (copy), CooldownId (ref)
        local v20 = EntityUtil:getEntity(p19.victimEntityInstance);
        local v21 = EntityUtil:getEntity(p19.attackerEntityInstance);
        local v22;

        if v21 == nil then
            v22 = v21;
        else
            v22 = v21:isLocalPlayer();
        end;

        local v23;

        if v20 == nil then
            v23 = v20;
        else
            v23 = v20:isLocalPlayer();
        end;

        local VACUUM_CATCH = GameSound.VACUUM_CATCH;
        local v24 = {};
        local v25;

        if v21 == nil then
            v25 = v21;
        else
            v25 = v21:isLocalPlayer();
        end;

        if v25 then
            v20 = v25;
        elseif v20 ~= nil then
            v20 = v20:isLocalPlayer();
        end;

        local v26;

        if v20 then
            v26 = nil;
        else
            v26 = p19.victimEntityInstance:GetPrimaryPartCFrame().Position;
        end;

        v24.position = v26;
        SoundManager:playSound(VACUUM_CATCH, v24);

        if v22 then
            SoundManager:playSound(RandomUtil.fromList(GameSound.DAMAGE_1, GameSound.DAMAGE_2, GameSound.DAMAGE_3));

            if v21 ~= nil then
                v21 = v21:getInstance():GetPrimaryPartCFrame();
            end;

            if v21 then
                KnitClient2.Controllers.ScreenShakeController:shake(v21.Position, v21 * Vector3.new(-0.25, 0, -1) - v21.Position, {
                    magnitude = 0.15,
                    duration = 0.15,
                    cycles = 2
                });
            end;
        end;

        if v23 and Workspace.CurrentCamera then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                message = "You are stuck in " .. p19.attackerEntityInstance.Name .. "\'s vacuum for the next few seconds!"
            });
            Workspace.CurrentCamera.CameraSubject = p19.attackerEntityInstance.Humanoid;
        end;

        if v22 or v23 then
            u9.cooldownbarMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.PLAYER_VACUUM);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.PLAYER_VACUUM, p19.expirationTime - Workspace:GetServerTimeNow(), {
                cooldownBar = {
                    color = Color3.fromRGB(54, 145, 224)
                }
            });
            local u27 = SoundManager:playSound(GameSound.ACTIVE_VACUUM_LOOP, {
                looped = true,
                volumeMultiplier = 0.1
            });
            u9.cooldownbarMaid:GiveTask(function() -- Line: 188
                -- upvalues: u27 (copy)
                if u27 then
                    u27:Destroy();
                end;
            end);
            task.delay(p19.expirationTime - Workspace:GetServerTimeNow(), function() -- Line: 193
                -- upvalues: u9 (ref)
                local cooldownbarMaid = u9.cooldownbarMaid;

                if cooldownbarMaid ~= nil then
                    cooldownbarMaid:DoCleaning();
                end;
            end);
        end;
    end);
    default.Client:OnEvent("PlayerVacuuming", function(p28) -- Line: 201
        -- upvalues: Players (ref), InventoryUtil (ref), ItemType (ref), u9 (copy)
        local v29 = Players:GetPlayerFromCharacter(p28.attacker);

        if v29 == nil then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(v29).hand;

        if hand == nil or hand.itemType ~= ItemType.PLAYER_VACUUM then
            return nil;
        end;

        if p28.action ~= "Start" then
            if p28.action == "Stop" then
                u9:cleanVacuumingEffect(v29);
            end;

            return;
        end;

        u9:cleanVacuumingEffect(v29);
        u9:createVacuumingEffect(v29, p28.attacker, p28.victim);
    end);
end;

function u6.isRelevantItem(p30, p31) -- Line: 218
    -- upvalues: ItemType (copy)
    return p31.itemType == ItemType.PLAYER_VACUUM;
end;

function u6.onEnable(u32, p33, p34) -- Line: 221
    -- upvalues: u3 (copy), EntityUtil (copy), Flamework (copy), u4 (copy), ActionButton (copy), default (copy), GamepadAction (copy), Players (copy), KnitClient2 (copy), GameAnimationUtil (copy), AnimationType (copy)
    u32.maid = u3.new();
    local u35 = EntityUtil:getLocalPlayerEntity();

    if u35 ~= nil then
        u35 = u35:getInstance();
    end;

    if u35 then
        u32.maid:GiveTask(u35:GetAttributeChangedSignal("PlayerStoredInVacuum"):Connect(function() -- Line: 229
            -- upvalues: u35 (copy), u32 (copy), Flamework (ref), u4 (ref), ActionButton (ref), default (ref), GamepadAction (ref)
            if u35:GetAttribute("PlayerStoredInVacuum") == true then
                for i in u32.activeProximityPrompts do
                    i.Enabled = false;
                end;

                u32.uiMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(ActionButton, {
                    actionName = "vacuum-release",
                    text = "Release Player Early",
                    priority = 50,

                    onActivated = function() -- Line: 236, Name: onActivated
                        -- upvalues: default (ref)
                        default.Client:Get("UseVacuum"):SendToServer({
                            action = "Release"
                        });
                    end,

                    interactionKey = Enum.KeyCode.X,
                    gamepadInteractionKey = GamepadAction.CloseMenu
                }));

                return;
            end;

            for i in u32.activeProximityPrompts do
                i.Enabled = true;
            end;

            if u32.uiMaid then
                u32.uiMaid:DoCleaning();
                u32.uiMaid = nil;
            end;
        end));
    end;

    for _, v in EntityUtil:getAliveEntityInstances() do
        if v:GetAttribute("Team") ~= Players.LocalPlayer:GetAttribute("Team") and v.PrimaryPart then
            local u36 = u3.new();
            u32.activeProximityPrompts[KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                Name = "VacuumProximityPrompt",
                ActionText = "Vacuum",
                Enabled = true,
                HoldDuration = 1.5,
                MaxActivationDistance = 16,
                RequiresLineOfSight = false,
                ObjectText = v.Name,

                PromptButtonHoldBegan = function() -- Line: 268, Name: PromptButtonHoldBegan
                    -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), u36 (copy), default (ref), v (copy)
                    local u37 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.PLAYER_VACUUM_SUCK, {
                        looped = true
                    });

                    if u37 then
                        u36:GiveTask(function() -- Line: 273
                            -- upvalues: u37 (copy)
                            return u37:Stop();
                        end);
                    end;

                    default.Client:Get("UseVacuum"):SendToServer({
                        action = "BeginCharging",
                        entityInstance = v
                    });
                end,

                PromptButtonHoldEnded = function() -- Line: 282, Name: PromptButtonHoldEnded
                    -- upvalues: u36 (copy), default (ref), v (copy)
                    u36:DoCleaning();
                    default.Client:Get("UseVacuum"):SendToServer({
                        action = "StopCharging",
                        entityInstance = v
                    });
                end,

                Triggered = function() -- Line: 289, Name: Triggered
                    -- upvalues: default (ref), v (copy)
                    default.Client:Get("UseVacuum"):SendToServer({
                        action = "Suck",
                        entityInstance = v
                    });
                end,

                Parent = v.PrimaryPart
            })] = true;
        end;
    end;
end;

function u6.onDisable(p38) -- Line: 302
    p38.maid:DoCleaning();
    local uiMaid = p38.uiMaid;

    if uiMaid ~= nil then
        uiMaid:DoCleaning();
    end;

    for i in p38.activeProximityPrompts do
        i:Destroy();
    end;
end;

function u6.cleanVacuumingEffect(p39, p40) -- Line: 312
    local v41 = p39.activeVacuumingEffects[p40];

    if v41 then
        p39.activeVacuumingEffects[p40] = nil;
        v41.beam:Destroy();
        v41.sound:Destroy();
        local shakeMaid = v41.shakeMaid;

        if shakeMaid ~= nil then
            shakeMaid:DoCleaning();
        end;
    end;
end;

function u6.createVacuumingEffect(p42, p43, p44, p45) -- Line: 328
    -- upvalues: InventoryUtil (copy), Players (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), ReplicatedStorage (copy), Workspace (copy)
    local hand = InventoryUtil.getInventory(p43).hand;

    if hand == nil then
        return nil;
    end;

    local v46 = p43 == Players.LocalPlayer;
    local GHOST_VACUUM_SUCKING_LOOP = GameSound.GHOST_VACUUM_SUCKING_LOOP;
    local v47 = {};
    local v48;

    if v46 then
        v48 = nil;
    else
        v48 = p44:GetPrimaryPartCFrame().Position;
    end;

    v47.position = v48;
    local v49;

    if v46 then
        v49 = nil;
    else
        v49 = p44.PrimaryPart;
    end;

    v47.parent = v49;
    local v50 = SoundManager:playSound(GHOST_VACUUM_SUCKING_LOOP, v47);

    if v50 == nil then
        return nil;
    end;

    local v51;

    if v46 == true then
        local v52 = p45:GetPrimaryPartCFrame();
        v51 = KnitClient2.Controllers.ScreenShakeController:shake(v52.Position, v52 * Vector3.new(-0.25, 0, -1) - v52.Position, {
            magnitude = 0.2,
            duration = 1.5,
            cycles = 40
        });
    else
        v51 = nil;
    end;

    local v53 = ReplicatedStorage.Assets.Effects.VacuumBeam:Clone();
    v53.Name = "PlayerVacuumBeam";
    local Handle = hand.tool:FindFirstChild("Handle");

    if Handle ~= nil then
        Handle = Handle:FindFirstChild("BeamAttachment");
    end;

    v53.Attachment0 = Handle;
    v53.Attachment1 = p45.HumanoidRootPart.RootRigAttachment;
    v53.Parent = p44;
    p42.activeVacuumingEffects[p43] = {
        startTime = Workspace:GetServerTimeNow(),
        beam = v53,
        sound = v50,
        shakeMaid = v51
    };
end;

KnitClient.CreateController(u6.new());

return nil;