-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local RunService = v2.RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local PogoStickBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "pogo-stick-balance").PogoStickBalance;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local POGO_BOUNCE = GameSound.POGO_BOUNCE;
local POGO_STOMP = GameSound.POGO_STOMP;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "PogoStickController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 32
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 36
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p5);
    p5.Name = "PogoStickController";
    p5.enableMaid = u1.new();
    p5.pogoMaid = u1.new();
    p5.blocked = false;
end;

function u3.isRelevantItem(p6, p7) -- Line: 43
    -- upvalues: ItemType (copy)
    return p7.itemType == ItemType.POGO_STICK;
end;

function u3.onEnable(u8) -- Line: 46
    -- upvalues: KnitClient (copy), Players (copy), Flamework (copy), ClientSyncEvents (copy), SoundManager (copy), POGO_BOUNCE (copy), PogoStickBalance (copy), StatusEffectUtil (copy), StatusEffectType (copy), PlaceUtil (copy)
    local u9 = true;

    local function _(p10, p11) -- Line: 50
        -- upvalues: Players (ref), u9 (ref)
        if p11 == Players.LocalPlayer then
            u9 = false;
        end;
    end;

    for i, _ in KnitClient.Controllers.MountController:getActiveMounts() do
        if i == Players.LocalPlayer then
            u9 = false;
        end;
    end;

    if not u9 then
        u8.blocked = true;
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "Pogo Stick blocked while mounted on another object"
        });
    end;

    u8.enableMaid:GiveTask(ClientSyncEvents.GenericMountMounted:connect(function(p12) -- Line: 65
        -- upvalues: Players (ref), u8 (copy), Flamework (ref)
        if p12.player ~= Players.LocalPlayer then
            return nil;
        end;

        u8.blocked = true;
        u8.pogoMaid:DoCleaning();
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            message = "Pogo Stick blocked while mounted on another object"
        });
    end));
    local u13 = nil;
    u8.enableMaid:GiveTask(ClientSyncEvents.GenericMountDismounted:connect(function(p14) -- Line: 77
        -- upvalues: Players (ref), u8 (copy), u13 (ref)
        if p14.player ~= Players.LocalPlayer then
            return nil;
        end;

        u8.blocked = false;
        u13();
    end));

    u13 = function() -- Line: 84
        -- upvalues: u8 (copy), ClientSyncEvents (ref), Players (ref), SoundManager (ref), POGO_BOUNCE (ref), PogoStickBalance (ref), StatusEffectUtil (ref), StatusEffectType (ref), PlaceUtil (ref)
        u8.pogoMaid:GiveTask(ClientSyncEvents.GroundTouch:connect(function(p15) -- Line: 86
            -- upvalues: Players (ref), SoundManager (ref), POGO_BOUNCE (ref), PogoStickBalance (ref), StatusEffectUtil (ref), StatusEffectType (ref)
            local Character = Players.LocalPlayer.Character;
            SoundManager:playSound(POGO_BOUNCE, {
                volumeMultiplier = math.clamp(p15.velocity.Y / 113, 0, 1) * 0.8 + 0.2
            });
            local v16 = math.min(p15.velocity.Y * Character.PrimaryPart.AssemblyMass * -PogoStickBalance.ELASTICITY, PogoStickBalance.MAX_IMPULSE);

            if v16 > 0 then
                if StatusEffectUtil:isActive(Character, StatusEffectType.GROUNDED) then
                    v16 = v16 * 0.1;
                end;

                local u17 = Vector3.new(0, v16, 0);
                task.delay(0.1, function() -- Line: 97
                    -- upvalues: Players (ref), u17 (copy)
                    local Character2 = Players.LocalPlayer.Character;

                    if Character2 ~= nil then
                        local PrimaryPart = Character2.PrimaryPart;

                        if PrimaryPart ~= nil then
                            PrimaryPart:ApplyImpulse(u17);
                        end;
                    end;
                end);
            end;
        end));

        if PlaceUtil.isLobbyServer() then
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:WaitForChild("Humanoid", 3);
            end;

            if Character then
                u8.pogoMaid:GiveTask(Character.StateChanged:Connect(function(p18, p19) -- Line: 115
                    -- upvalues: Players (ref), SoundManager (ref), POGO_BOUNCE (ref), PogoStickBalance (ref)
                    if p18 == Enum.HumanoidStateType.Freefall and p19 == Enum.HumanoidStateType.Landed then
                        local Character2 = Players.LocalPlayer.Character;
                        SoundManager:playSound(POGO_BOUNCE, {
                            volumeMultiplier = 0.2
                        });
                        local v20 = math.min(-30 * Character2.PrimaryPart.AssemblyMass * -PogoStickBalance.ELASTICITY, PogoStickBalance.MAX_IMPULSE);

                        if v20 > 0 then
                            local u21 = Vector3.new(0, v20, 0);
                            task.delay(0.1, function() -- Line: 124
                                -- upvalues: Players (ref), u21 (copy)
                                local Character3 = Players.LocalPlayer.Character;

                                if Character3 ~= nil then
                                    local PrimaryPart = Character3.PrimaryPart;

                                    if PrimaryPart ~= nil then
                                        PrimaryPart:ApplyImpulse(u21);
                                    end;
                                end;
                            end);
                        end;
                    end;
                end));
            end;
        end;

        u8:setupPogoAnimation();
        u8:setupMovementRestrictions();
    end;

    if not u8.blocked then
        u13();
    end;
end;

function u3.onDisable(p22) -- Line: 145
    p22.enableMaid:DoCleaning();
    p22.pogoMaid:DoCleaning();
    p22.blocked = false;
end;

function u3.KnitStart(p23) -- Line: 150
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), POGO_BOUNCE (copy), POGO_STOMP (copy)
    HandKnitController.KnitStart(p23);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.POGO_STICK, {
        sounds = { POGO_BOUNCE, POGO_STOMP }
    });
end;

function u3.setupPogoAnimation(p24) -- Line: 157
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    local u25 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.POGO_STICK_MOUNT, {
        looped = true
    });

    if u25 then
        u25.Priority = Enum.AnimationPriority.Action4;
    end;

    if u25 ~= nil then
        u25:GetMarkerReachedSignal("Pause"):Once(function() -- Line: 167
            -- upvalues: u25 (copy)
            u25:AdjustSpeed(0);
        end);
    end;

    p24.pogoMaid:GiveTask(function() -- Line: 171
        -- upvalues: u25 (copy)
        local v26 = u25;

        if v26 ~= nil then
            v26:Stop();
        end;

        local v27 = u25;

        if v27 ~= nil then
            v27:Destroy();
        end;
    end);
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChildWhichIsA("Humanoid");
    end;

    if Character then
        p24.pogoMaid:GiveTask(function() -- Line: 190
            -- upvalues: Character (copy)
            local v28 = Character;
            v28.HipHeight = v28.HipHeight - 1.3;
        end);
        Character.HipHeight = Character.HipHeight + 1.3;
    end;
end;

function u3.setupMovementRestrictions(p29) -- Line: 196
    -- upvalues: u1 (copy), KnitClient (copy), RunService (copy), Players (copy)
    local u30 = {
        Enum.HumanoidStateType.FallingDown,
        Enum.HumanoidStateType.Freefall,
        Enum.HumanoidStateType.Jumping,
        Enum.HumanoidStateType.Landed,
        Enum.HumanoidStateType.Running
    };
    local u31 = u1.new();
    local u32 = false;

    local function u33() -- Line: 200
        -- upvalues: u31 (copy), u32 (ref), KnitClient (ref)
        u31:DoCleaning();
        u32 = false;
        u31:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            constantSpeedMultiplier = 1
        }));
    end;

    local function u34() -- Line: 207
        -- upvalues: u31 (copy), u32 (ref), KnitClient (ref)
        u31:DoCleaning();
        u32 = false;
        u31:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            constantSpeedMultiplier = 0
        }));
    end;

    u34();
    local u35 = 0;
    local u36 = 0;
    p29.pogoMaid:GiveTask(RunService.Heartbeat:Connect(function(p37) -- Line: 220
        -- upvalues: u35 (ref), Players (ref), u30 (copy), u36 (ref), u34 (copy), u33 (copy)
        u35 = u35 + p37;

        if u35 < 0.1 then
            return nil;
        end;

        u35 = 0;
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChildWhichIsA("Humanoid");
        end;

        if Character then
            local v38 = Character:GetState();

            if table.find(u30, v38) ~= nil then
                if v38 == Enum.HumanoidStateType.Running then
                    if math.abs(Character.MoveDirection.Y) <= 0 then
                        u36 = u36 + p37;

                        if u36 >= 0.05 then
                            u34();
                        end;

                        return Enum.ContextActionResult.Pass;
                    end;

                    u36 = 0;
                    u33();

                    return Enum.ContextActionResult.Pass;
                end;

                u36 = 0;
                u33();

                return;
            end;

            u34();
        end;
    end));
    p29.pogoMaid:GiveTask(u31);
end;

KnitClient.CreateController(u3.new());

return nil;