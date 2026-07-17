-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local GlacialSkaterBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "glacial-skater", "glacial-skater-balance").GlacialSkaterBalance;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local AccessoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local momentumChanged = RuntimeLib.import(script, script.Parent, "momentum-bar-ui").momentumChanged;
local u6 = {
    blockSprint = true
};
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "GlacialSkaterController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 49
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 53
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), BedwarsImageId (copy), AnimationType (copy), GlacialSkaterBalance (copy), u4 (copy)
    BaseKitController.constructor(p9, BedwarsKit.GLACIAL_SKATER, {
        sounds = {
            GameSound.ICE_SKATING_FOOTSTEP_1,
            GameSound.ICE_SKATING_FOOTSTEP_2,
            GameSound.ICE_SKATING_FOOTSTEP_3,
            GameSound.ICE_SKATING_FOOTSTEP_4,
            GameSound.ICE_SKATING_FOOTSTEP_5,
            GameSound.ICE_SKATING_FOOTSTEP_6,
            GameSound.ICE_SKATING_DODGE
        },
        imageIds = { BedwarsImageId.SKATING_ON_ICE, BedwarsImageId.SKATING_MAX_SPEED, BedwarsImageId.SKATING_JUMP },
        animations = {
            AnimationType.SKATING_BUNNY_HOP,
            AnimationType.SKATING_WALK,
            AnimationType.SKATING_SLOW,
            AnimationType.SKATING_MEDIUIM,
            AnimationType.SKATING_FAST,
            AnimationType.SKATING_SPIN_JUMP
        }
    });
    p9.Name = "GlacialSkaterController";
    p9.momentum = 0;
    p9.momentumDrop = GlacialSkaterBalance.INITIAL_MOMENTUM_DROP;
    p9.lastMomentumReport = 0;
    p9.isLanded = false;
    p9.momentumTickElapsedTime = 0;
    p9.momentumIncreasingElapsedTime = 0;
    p9.serverMomentumUpdateElapsedTime = 0;
    p9.lastDodgeTime = 0;
    p9.momentumMaid = u4.new();
end;

function u7.KnitStart(p10) -- Line: 70
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p10);
end;

function u7.onKitLocalActivated(u11, u12) -- Line: 73
    -- upvalues: RuntimeLib (copy), Players (copy), u3 (copy), default (copy), isUsingKit (copy), BedwarsKit (copy), KnitClient (copy), MatchState (copy), ClientSyncEvents (copy), u6 (copy), GlacialSkaterBalance (copy), RunService (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy)
    u11:updateMomentum(0, "newValue");
    RuntimeLib.Promise.new(function(p13, p14) -- Line: 77
        -- upvalues: Players (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:WaitForChild("Humanoid");
        end;

        if Character then
            return p13(Character);
        end;

        return p14("Could not get local player humanoid");
    end):timeout(10):andThen(function(p15) -- Line: 88
        -- upvalues: u11 (copy)
        u11.isLanded = true;
        u11:setupHumanoidStateChanges(p15);
    end):catch(function(p16) -- Line: 92
        -- upvalues: u11 (copy), u3 (ref)
        return u11.logger:Error("Failed to setup local Krystal player on match start with reason: " .. u3(p16));
    end);
    u12:GiveTask(default.Client:Get("ServerMomentumUpdate"):Connect(function(p17) -- Line: 95
        -- upvalues: u11 (copy)
        if p17.momentumIncrement < 0 then
            u11.momentumIncreasingElapsedTime = 0;
        end;

        u11:updateMomentum(p17.momentumIncrement, "increment");
    end));
    u12:GiveTask(Players.LocalPlayer.CharacterAdded:Connect(function(u18) -- Line: 102
        -- upvalues: isUsingKit (ref), Players (ref), BedwarsKit (ref), u11 (copy), RuntimeLib (ref), KnitClient (ref), MatchState (ref), u12 (copy), ClientSyncEvents (ref), u6 (ref), u3 (ref)
        if not isUsingKit(Players.LocalPlayer, BedwarsKit.GLACIAL_SKATER) then
            return nil;
        end;

        u11:updateMomentum(0, "newValue");
        u11.isLanded = true;
        u11.momentumIncreasingElapsedTime = 0;
        RuntimeLib.Promise.new(function(p19) -- Line: 109
            -- upvalues: u18 (copy)
            p19((u18:WaitForChild("Humanoid")));
        end):timeout(10):andThen(function(u20) -- Line: 113
            -- upvalues: KnitClient (ref), MatchState (ref), u11 (ref), u12 (ref), ClientSyncEvents (ref), u6 (ref)
            if KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
                u11:setupHumanoidStateChanges(u20);
            else
                u12:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p21) -- Line: 117
                    -- upvalues: MatchState (ref), u11 (ref), u20 (copy)
                    if p21.matchState == MatchState.RUNNING then
                        u11:setupHumanoidStateChanges(u20);
                    end;
                end));
            end;

            KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier(u6);
            u12:GiveTask(function() -- Line: 125
                -- upvalues: KnitClient (ref), u6 (ref)
                return KnitClient.Controllers.SprintController:getMovementStatusModifier():removeModifier(u6);
            end);
        end):catch(function(p22) -- Line: 129
            -- upvalues: u11 (ref), u3 (ref)
            return u11.logger:Error("Failed to setup local Krystal player momentum with reason: " .. u3(p22));
        end);
    end));
    u12:GiveTask(Players.LocalPlayer.CharacterAdded:Connect(function(u23) -- Line: 133
        -- upvalues: u11 (copy), RuntimeLib (ref), KnitClient (ref), MatchState (ref), u12 (copy), ClientSyncEvents (ref), u6 (ref), u3 (ref)
        u11:updateMomentum(0, "newValue");
        u11.isLanded = true;
        u11.momentumIncreasingElapsedTime = 0;
        RuntimeLib.Promise.new(function(p24) -- Line: 137
            -- upvalues: u23 (copy)
            p24((u23:WaitForChild("Humanoid")));
        end):timeout(10):andThen(function(u25) -- Line: 141
            -- upvalues: KnitClient (ref), MatchState (ref), u11 (ref), u12 (ref), ClientSyncEvents (ref), u6 (ref)
            if KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING then
                u11:setupHumanoidStateChanges(u25);
            else
                u12:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p26) -- Line: 145
                    -- upvalues: MatchState (ref), u11 (ref), u25 (copy)
                    if p26.matchState == MatchState.RUNNING then
                        u11:setupHumanoidStateChanges(u25);
                    end;
                end));
            end;

            KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier(u6);
            u12:GiveTask(function() -- Line: 153
                -- upvalues: KnitClient (ref), u6 (ref)
                return KnitClient.Controllers.SprintController:getMovementStatusModifier():removeModifier(u6);
            end);
        end):catch(function(p27) -- Line: 157
            -- upvalues: u11 (ref), u3 (ref)
            return u11.logger:Error("Failed to setup local Krystal player momentum with reason: " .. u3(p27));
        end);
    end));
    u12:GiveTask(ClientSyncEvents.BeforeSwordSwing:connect(function(p28) -- Line: 161
        -- upvalues: u11 (copy), GlacialSkaterBalance (ref)
        if u11.lastDodgeTime + GlacialSkaterBalance.DODGE_BUFFER_TIME > os.clock() then
            p28:setCancelled(true);
        end;
    end));
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    local u29 = Character == nil and Vector3.new(0, 0, 0) or Character;
    u12:GiveTask(RunService.Heartbeat:Connect(function(p30) -- Line: 175
        -- upvalues: u11 (copy), ClientSyncEvents (ref), GlacialSkaterBalance (ref), Players (ref), u29 (ref), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref)
        local v31 = u11;
        v31.momentumTickElapsedTime = v31.momentumTickElapsedTime + p30;
        local v32 = u11;
        v32.serverMomentumUpdateElapsedTime = v32.serverMomentumUpdateElapsedTime + p30;

        if ClientSyncEvents.KitProgressModifierCheck:fire(GlacialSkaterBalance.MOMENTUM_TICK_RATE_SECONDS).amount <= u11.momentumTickElapsedTime and u11.isLanded then
            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = (Character2:GetPivot().Position - u29).Magnitude;
            end;

            local v33 = (Character2 == nil and 0 or Character2) * (1 / u11.momentumTickElapsedTime);
            local Character3 = Players.LocalPlayer.Character;

            if Character3 ~= nil then
                Character3 = Character3:GetPivot().Position;
            end;

            u29 = Character3 == nil and Vector3.new(0, 0, 0) or Character3;
            u11.momentumTickElapsedTime = 0;

            if v33 > 100 then
                return nil;
            end;

            if GlacialSkaterBalance.MOVEMENT_SPEED_MIN <= v33 then
                local v34 = u11;
                v34.momentumIncreasingElapsedTime = v34.momentumIncreasingElapsedTime + p30;
                u11.momentumDrop = GlacialSkaterBalance.INITIAL_MOMENTUM_DROP;
                local v35 = GlacialSkaterBalance.getMomentumDeltaForElapsedTime(u11.momentumIncreasingElapsedTime);
                local v36 = EntityUtil:getLocalPlayerEntity();

                if v36 ~= nil then
                    v36 = v36:getInstance();
                end;

                if v36 and StatusEffectUtil:isActive(v36, StatusEffectType.ON_ICE) then
                    v35 = v35 * GlacialSkaterBalance.ON_ICE_MOMENTUM_MULTIPLIER;
                end;

                u11:updateMomentum(v35, "increment");

                return;
            end;

            u11.momentumIncreasingElapsedTime = 0;

            if u11.momentum > 0 then
                local v37 = u11;
                v37.momentumDrop = v37.momentumDrop * GlacialSkaterBalance.MOMENTUM_DROP_MULTIPLIER_ON_TICK;
                u11:updateMomentum(u11.momentumDrop, "increment");
            end;
        end;
    end));
    KnitClient.Controllers.MomentumBarUiController:mountMomentumBarUi();
    u12:GiveTask(u11.momentumMaid);
end;

function u7.onKitLocalDeactivated(p38) -- Line: 230
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.MomentumBarUiController:unmountMomentumBarUi();
end;

function u7.onKitReplicationActivated(u39, p40) -- Line: 233
    -- upvalues: WatchCharacter (copy), KnitClient2 (copy), ReplicatedStorage (copy), AccessoryUtil (copy), WeldUtil (copy)
    p40:GiveTask((WatchCharacter(function(u41, u42, p43) -- Line: 234
        -- upvalues: KnitClient2 (ref), u39 (copy), ReplicatedStorage (ref), AccessoryUtil (ref), WeldUtil (ref)
        task.spawn(function() -- Line: 236
            -- upvalues: KnitClient2 (ref), u41 (copy), u39 (ref), u42 (copy), ReplicatedStorage (ref), AccessoryUtil (ref), WeldUtil (ref)
            if KnitClient2.Controllers.KitController:getPrimaryActiveKit(u41) == u39.kit and not KnitClient2.Controllers.KitController:isUsingKitModel(u41) then
                u42:WaitForChild("Humanoid");

                local function _(p44) -- Line: 242
                    -- upvalues: AccessoryUtil (ref), u42 (ref)
                    if p44:IsA("Accessory") then
                        AccessoryUtil:addAccessory(u42, (p44:Clone()));
                    end;
                end;

                for i, child in ReplicatedStorage.Assets.Misc.IceSkates:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("Accessory") then
                        AccessoryUtil:addAccessory(u42, (child:Clone()));
                    end;
                end;

                WeldUtil:weldCharacterAccessories(u42);
            end;
        end);
    end)));
end;

function u7.onKitReplicationDeactivated(p45) -- Line: 257
end;

function u7.onInnateAbilityEnabled(p46, p47, p48) -- Line: 259
    -- upvalues: AbilityId (copy), Flamework (copy), AbilityState (copy)
    local v49 = p47.abilityId == AbilityId.SKATING_JUMP and Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SKATING_JUMP);

    if v49 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v49, AbilityState.DISABLED);
    end;
end;

function u7.onAbilityUsed(p50, p51, p52) -- Line: 267
    -- upvalues: AbilityId (copy), KnitClient (copy)
    if p52.ability == AbilityId.SKATING_JUMP and not p52:isCancelled() then
        p50.lastDodgeTime = os.clock();
        local v53 = p51:FindFirstChildWhichIsA("Humanoid");

        if v53 ~= nil then
            v53:ChangeState(Enum.HumanoidStateType.Jumping);
        end;

        KnitClient.Controllers.GlacialSkaterAnimationController:playJumpAnimation(p51);
    end;
end;

function u7.updateMomentum(p54, p55, p56) -- Line: 278
    -- upvalues: GlacialSkaterBalance (copy), momentumChanged (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), default (copy), Flamework (copy), AbilityId (copy), AbilityState (copy), KnitClient (copy)
    if p56 == "increment" then
        p54.momentum = math.clamp(p54.momentum + p55, 0, GlacialSkaterBalance.MAX_MOMENTUM);
    else
        p54.momentum = math.clamp(p55, 0, GlacialSkaterBalance.MAX_MOMENTUM);
    end;

    momentumChanged:Fire(p54.momentum);
    local v57 = EntityUtil:getLocalPlayerEntity();

    if v57 ~= nil then
        v57 = v57:getInstance();
    end;

    if not v57 then
        return nil;
    end;

    if StatusEffectUtil:isActive(v57, StatusEffectType.HIGH_SPEED_SKATING) and p54.momentum < GlacialSkaterBalance.HIGH_SPEED_THRESHOLD or (not StatusEffectUtil:isActive(v57, StatusEffectType.HIGH_SPEED_SKATING) and p54.momentum >= GlacialSkaterBalance.HIGH_SPEED_THRESHOLD or (p54.momentum >= GlacialSkaterBalance.DODGE_THRESHOLD and p54.lastMomentumReport < GlacialSkaterBalance.DODGE_THRESHOLD or (p54.momentum < GlacialSkaterBalance.DODGE_THRESHOLD and p54.lastMomentumReport >= GlacialSkaterBalance.DODGE_THRESHOLD or (math.abs(p54.lastMomentumReport - p54.momentum) >= GlacialSkaterBalance.MOMENTUM_REPORT_DELTA or p54.serverMomentumUpdateElapsedTime >= 1.5)))) then
        p54.serverMomentumUpdateElapsedTime = 0;
        p54.lastMomentumReport = p54.momentum;
        default.Client:Get("MomentumUpdate"):SendToServer({
            momentumValue = p54.momentum
        });
    end;

    local v58 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.SKATING_JUMP);

    if v58 then
        if p54.momentum >= GlacialSkaterBalance.DODGE_THRESHOLD then
            if v58.abilityState ~= AbilityState.READY and v58.abilityState ~= AbilityState.ON_COOLDOWN then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v58, AbilityState.READY);
            end;
        elseif v58.abilityState ~= AbilityState.DISABLED then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v58, AbilityState.DISABLED);
        end;
    end;

    p54:handleFovBreakpoints();
    KnitClient.Controllers.SprintController:setSpeed(GlacialSkaterBalance.getMomentumSpeed(p54.momentum));
end;

function u7.handleFovBreakpoints(p59) -- Line: 319
    -- upvalues: GlacialSkaterBalance (copy), KnitClient (copy), TweenService (copy), Workspace (copy)
    local v60 = GlacialSkaterBalance.getFovMultiplier(p59.momentum);
    local v61 = KnitClient.Controllers.FovController:getBaseFOV() * v60;

    if p59.targetFov ~= v61 then
        local fovTween = p59.fovTween;

        if fovTween ~= nil then
            fovTween:Cancel();
        end;

        p59.targetFov = v61;
        p59.fovTween = TweenService:Create(Workspace.CurrentCamera, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            FieldOfView = v61
        });
        p59.fovTween:Play();
    end;
end;

function u7.setupHumanoidStateChanges(u62, p63) -- Line: 334
    -- upvalues: GlacialSkaterBalance (copy), default (copy)
    u62.momentumMaid:DoCleaning();
    u62.momentumMaid:GiveTask(p63.StateChanged:Connect(function(p64, p65) -- Line: 336
        -- upvalues: u62 (copy), GlacialSkaterBalance (ref), default (ref)
        u62.isLanded = p65 == Enum.HumanoidStateType.Landed and true or p65 == Enum.HumanoidStateType.Running;

        if p65 == Enum.HumanoidStateType.Jumping then
            if u62.momentum >= GlacialSkaterBalance.DODGE_THRESHOLD then
                default.Client:Get("MomentumUpdate"):SendToServer({
                    momentumValue = u62.momentum
                });
            end;

            u62:updateMomentum(-GlacialSkaterBalance.JUMPING_MOMENTUM_COST, "increment");
            u62.momentumIncreasingElapsedTime = 0;
        end;
    end));
end;

KnitClient.CreateController(u7.new());

return nil;