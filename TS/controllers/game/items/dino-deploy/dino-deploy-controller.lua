-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local DinoTamerBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").DinoTamerBalance;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local MountType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "DinoDeployController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 37
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 41
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "DinoDeployController";
end;

function u6.KnitStart(u9) -- Line: 45
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), MountType (copy), Players (copy), u3 (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), KnitClient2 (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), SoundManager (copy), GameSound (copy), AnimationType (copy), RunService (copy), u4 (copy), TimedProgressBar (copy), Workspace (copy), DinoTamerBalance (copy), default (copy)
    KnitController.KnitStart(u9);
    ClientSyncEvents.GenericMountMounted:connect(function(p10) -- Line: 47
        -- upvalues: MountType (ref), Players (ref), u9 (copy), u3 (ref), Flamework (ref), AbilityId (ref), AbilityMeta (ref), KnitClient2 (ref)
        if p10.mountType == MountType.DINO and p10.player == Players.LocalPlayer then
            u9.dinoMaid = u3.new();
            local v11 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
            local DINO_CHARGE = AbilityId.DINO_CHARGE;
            local v12 = {};

            for i, v in AbilityMeta[AbilityId.DINO_CHARGE].triggerConfig do
                v12[i] = v;
            end;

            local u13 = v11:enableAbility(DINO_CHARGE, v12):expect();
            local v14 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = 1.2
            });
            u9.dinoMaid:GiveTask(v14);
            u9.dinoMaid:GiveTask(function() -- Line: 61
                -- upvalues: u13 (copy)
                u13.Destroy();
            end);
        end;
    end);
    ClientSyncEvents.GenericMountDismounted:connect(function(p15) -- Line: 66
        -- upvalues: MountType (ref), Players (ref), u9 (copy)
        if p15.mountType == MountType.DINO and p15.player == Players.LocalPlayer then
            local dinoMaid = u9.dinoMaid;

            if dinoMaid ~= nil then
                dinoMaid:DoCleaning();
            end;
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p16) -- Line: 74
        -- upvalues: EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), AbilityId (ref), u3 (ref), SoundManager (ref), GameSound (ref), Players (ref), KnitClient2 (ref), AnimationType (ref), RunService (ref), Flamework (ref), u4 (ref), TimedProgressBar (ref), Workspace (ref), DinoTamerBalance (ref), ClientSyncEvents (ref), default (ref)
        local u17 = EntityUtil:getEntity(p16.userCharacter);

        if u17 == nil or not RuntimeLib.instanceof(u17, PlayerEntity) then
            return nil;
        end;

        local u18 = u17:getPlayer();
        local u19 = p16.userCharacter:FindFirstChildOfClass("Humanoid");

        if u19 == nil then
            return nil;
        end;

        if p16.ability == AbilityId.DINO_CHARGE then
            local u20 = u3.new();
            local DINO_CHARGE_START = GameSound.DINO_CHARGE_START;
            local v21 = {
                rollOffMaxDistance = 150
            };
            local v22;

            if u18 == Players.LocalPlayer then
                v22 = nil;
            else
                v22 = u17:getInstance():GetPivot().Position;
            end;

            v21.position = v22;
            SoundManager:playSound(DINO_CHARGE_START, v21);
            local DINO_CHARGE_LOOP = GameSound.DINO_CHARGE_LOOP;
            local v23 = {
                rollOffMaxDistance = 150,
                volumeMultiplier = 1.5,
                looped = true
            };
            local v24;

            if u18 == Players.LocalPlayer then
                v24 = nil;
            else
                v24 = u17:getInstance():GetPivot().Position;
            end;

            v23.position = v24;
            v23.parent = u17:getInstance().HumanoidRootPart;
            local u25 = SoundManager:playSound(DINO_CHARGE_LOOP, v23);
            u20:GiveTask(function() -- Line: 97
                -- upvalues: u25 (copy)
                local v26 = u25;

                if v26 ~= nil then
                    v26:Destroy();
                end;
            end);
            u20:GiveTask(function() -- Line: 103
                -- upvalues: SoundManager (ref), GameSound (ref), u18 (copy), Players (ref), u17 (copy)
                local DINO_CHARGE_STOP = GameSound.DINO_CHARGE_STOP;
                local v27 = {
                    rollOffMaxDistance = 150
                };
                local v28;

                if u18 == Players.LocalPlayer then
                    v28 = nil;
                else
                    v28 = u17:getInstance():GetPivot().Position;
                end;

                v27.position = v28;
                SoundManager:playSound(DINO_CHARGE_STOP, v27);
            end);
            local u29 = KnitClient2.Controllers.MountController:getActiveMounts()[u18];

            if u29 ~= nil then
                u29 = u29.model;
            end;

            if u29 then
                local u30 = KnitClient2.Controllers.MountAnimationController:playAnimationInMount(u29, AnimationType.DINO_CHARGING);

                if u30 then
                    u30.Priority = Enum.AnimationPriority.Action;
                    u20:GiveTask(function() -- Line: 118
                        -- upvalues: u30 (copy)
                        u30:Stop();
                        u30:Destroy();
                    end);
                end;

                u20:GiveTask(function() -- Line: 123
                    -- upvalues: KnitClient2 (ref), u29 (copy), AnimationType (ref)
                    local v31 = KnitClient2.Controllers.MountAnimationController:playAnimationInMount(u29, AnimationType.DINO_HIT);

                    if v31 then
                        v31.Priority = Enum.AnimationPriority.Action;
                        v31.Looped = false;
                    end;
                end);
            end;

            if u18 == Players.LocalPlayer then
                u20:GiveTask((KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    blockSprint = true,
                    moveSpeedMultiplier = 3
                })));
                u20:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 137
                    -- upvalues: u19 (copy)
                    u19:Move(Vector3.new(0, 0, -1), true);
                end));
                u20:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(TimedProgressBar, {
                    Size = UDim2.fromScale(1, 0.05),
                    ProgressBarConfig = {
                        BarGradient = ColorSequence.new(Color3.fromRGB(230, 255, 168), Color3.fromRGB(64, 255, 94)),
                        Title = {
                            text = "MAX CHARGE"
                        }
                    },
                    StartTime = Workspace:GetServerTimeNow(),
                    EndTime = Workspace:GetServerTimeNow() + DinoTamerBalance.TIME_TO_GET_DINO_CHARGE_II
                })));
                u20:GiveTask(ClientSyncEvents.BeforeSwordSwing:connect(function(p32) -- Line: 151
                    p32:setCancelled(true);
                end));
                u20:GiveTask(ClientSyncEvents.SwordSwing:connect(function(p33) -- Line: 154
                    p33:setCancelled(true);
                end));
            end;

            u20:GiveTask(default.Client:Get("StopDinoCharging"):Connect(function(p34) -- Line: 158
                -- upvalues: u18 (copy), u20 (copy)
                if p34.player == u18 then
                    u20:DoCleaning();
                end;
            end));
            task.delay(DinoTamerBalance.DINO_CHARGE_DURATION, function() -- Line: 163
                -- upvalues: u20 (copy)
                u20:DoCleaning();
            end);
        end;
    end);
end;

KnitClient.CreateController(u6.new());

return nil;