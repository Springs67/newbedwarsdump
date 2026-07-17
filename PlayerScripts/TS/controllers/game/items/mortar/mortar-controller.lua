-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v5 = {};
local u6 = setmetatable({}, {
    __index = v5
});
u6.default = 0;
v5[0] = "default";
u6.settingUpMortar = 1;
v5[1] = "settingUpMortar";
u6.aiming = 2;
v5[2] = "aiming";
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 45, Name: __tostring
        return "MortarController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 51
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 55
    -- upvalues: HandKnitController (copy), u3 (copy), u6 (ref)
    HandKnitController.constructor(p9);
    p9.Name = "MortarController";
    p9.mainMaid = u3.new();
    p9.aimingMaid = u3.new();
    p9.abilityMaid = u3.new();
    p9.firingMaid = u3.new();
    p9.mortarState = u6.default;
end;

function u7.onEnable(u10, p11, p12) -- Line: 64
    -- upvalues: u6 (ref), Flamework (copy), DeviceUtil (copy), AbilityId (copy), BedwarsImageId (copy), ClientSyncEvents (copy), Players (copy), InventoryUtil (copy), ItemType (copy)
    u10.mortarState = u6.default;
    local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "start-aiming-mortar",

        boundFunction = function(p13, p14, p15) -- Line: 70, Name: boundFunction
            -- upvalues: u10 (copy)
            if p14 == Enum.UserInputState.Begin then
                u10:usedActionButton();
            end;
        end
    });
    u10.mainMaid:GiveTask(v16);

    if DeviceUtil.isMobileControls() then
        local u17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.MORTAR, {
            abilityType = "ItemPrimary",
            clickToTrigger = true,
            abilityButton = {
                icon = BedwarsImageId.ANVIL_ART
            },
            inputStateToActivateAbilityOverride = Enum.UserInputState.Begin
        }):expect();
        u10.mainMaid:GiveTask(function() -- Line: 87
            -- upvalues: u17 (copy)
            u17.Destroy();
        end);
    end;

    ClientSyncEvents.AbilityUsed:connect(function(p18) -- Line: 91
        -- upvalues: AbilityId (ref), Players (ref), InventoryUtil (ref), ItemType (ref), u10 (copy)
        if p18.ability ~= AbilityId.MORTAR then
            return nil;
        end;

        if p18.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if hand ~= ItemType.DRAGON_MORTAR then
            return nil;
        end;

        u10:usedActionButton();
    end);
end;

function u7.usedActionButton(p19) -- Line: 108
    -- upvalues: InventoryUtil (copy), Players (copy), ItemType (copy), u6 (ref)
    local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    if hand ~= ItemType.DRAGON_MORTAR then
        return nil;
    end;

    local mortarState = p19.mortarState;

    if mortarState == u6.default then
        p19:initiateAiming(Players.LocalPlayer);

        return;
    end;

    if mortarState == u6.settingUpMortar or mortarState ~= u6.aiming then
        return;
    end;

    if p19.targetIndicator then
        p19:launchMortar(Players.LocalPlayer, p19.targetIndicator.Position);

        return;
    end;

    p19:launchMortar(Players.LocalPlayer, Players.LocalPlayer:GetMouse().Hit.Position);
end;

function u7.onDisable(p20) -- Line: 136
    -- upvalues: u6 (ref)
    p20.mortarState = u6.default;
    p20.mainMaid:DoCleaning();
    p20.aimingMaid:DoCleaning();
    p20.abilityMaid:DoCleaning();
    p20.firingMaid:DoCleaning();
end;

function u7.isRelevantItem(p21, p22) -- Line: 143
    -- upvalues: ItemType (copy)
    return p22.itemType == ItemType.DRAGON_MORTAR;
end;

function u7.KnitStart(u23) -- Line: 146
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), default (copy), Players (copy)
    HandKnitController.KnitStart(u23);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.DRAGON_MORTAR, {
        animations = { AnimationType.DRAGON_MORTAR_SETUP, AnimationType.DRAGON_MORTAR_FIRE, AnimationType.DRAGON_MORTAR_GET_UP }
    });
    default.Client:Get("MortarLaunchedFromServer"):Connect(function(p24) -- Line: 155
        -- upvalues: Players (ref), u23 (copy)
        if Players.LocalPlayer == p24.player then
            return nil;
        end;

        u23:launchMortar_otherClients(p24.originPosition);
    end);
    default.Client:Get("MortarHit"):Connect(function(p25) -- Line: 163
        -- upvalues: u23 (copy)
        u23:mortarHit(p25.targetPosition);
    end);
end;

function u7.initiateAiming(u26, u27) -- Line: 167
    -- upvalues: Players (copy), u6 (ref), RuntimeLib (copy), KnitClient2 (copy), RunService (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), Workspace (copy), BlockEngine (copy)
    if u27 ~= Players.LocalPlayer then
        return nil;
    end;

    local Character = u27.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u26.aimingMaid:DoCleaning();
    u26.firingMaid:DoCleaning();
    u26.mortarState = u6.settingUpMortar;
    local u43 = RuntimeLib.Promise.defer(function() -- Line: 185
        -- upvalues: KnitClient2 (ref), u26 (copy), Character (copy), RuntimeLib (ref), RunService (ref), u27 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u6 (ref), ReplicatedStorage (ref), Workspace (ref), BlockEngine (ref)
        local u28 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            constantSpeedMultiplier = 0,
            blockSprint = true
        });
        u26.mainMaid:GiveTask(u28);
        u26.aimingMaid:GiveTask(u28);

        if Character then
            local u30 = RuntimeLib.Promise.defer(function() -- Line: 195
                -- upvalues: Character (ref), RunService (ref), u26 (ref)
                local Position = Character.Position;
                local v29 = RunService.Heartbeat:Connect(function() -- Line: 197
                    -- upvalues: Character (ref), Position (copy), u26 (ref)
                    if (Character.Position - Position).Magnitude > 0.01 then
                        u26:cancelMortarAiming();
                    end;
                end);
                u26.mainMaid:GiveTask(v29);
                u26.aimingMaid:GiveTask(v29);
            end);
            u26.mainMaid:GiveTask(function() -- Line: 207
                -- upvalues: u30 (copy)
                return u30:cancel();
            end);
            u26.aimingMaid:GiveTask(function() -- Line: 210
                -- upvalues: u30 (copy)
                return u30:cancel();
            end);
        end;

        local Character2 = u27.Character;

        if Character2 ~= nil then
            Character2 = Character2:FindFirstChild("Humanoid");

            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("Animator");
            end;
        end;

        local u31 = Character2 and AnimationUtil:playAnimation(Character2, GameAnimationUtil:getAssetId(AnimationType.DRAGON_MORTAR_SETUP), {
            looped = false
        });

        if u31 then
            u26.mainMaid:GiveTask(u31);
            u26.aimingMaid:GiveTask(u31);
            local v32 = task.delay(0.8, function() -- Line: 233
                -- upvalues: u31 (copy)
                u31:AdjustSpeed(0);
            end);
            u26.mainMaid:GiveTask(v32);
            u26.mainMaid:GiveTask(function() -- Line: 238
                -- upvalues: u31 (copy)
                u31:AdjustSpeed(1);
            end);
            u26.aimingMaid:GiveTask(v32);
            u26.aimingMaid:GiveTask(function() -- Line: 242
                -- upvalues: u31 (copy)
                u31:AdjustSpeed(1);
            end);
        end;

        local v42 = task.delay(0.8, function() -- Line: 248
            -- upvalues: u26 (ref), u6 (ref), u28 (copy), ReplicatedStorage (ref), Workspace (ref), Character (ref), u27 (ref), BlockEngine (ref)
            u26.mortarState = u6.aiming;
            u28.Destroy();
            u26.targetIndicator = ReplicatedStorage.Assets.Misc.MortarTargetIndicator:Clone();
            u26.targetIndicator.Parent = Workspace;
            u26.targetIndicator.Anchored = true;
            u26.targetIndicator.CFrame = CFrame.new(Character.Position);
            u26.mainMaid:GiveTask(u26.targetIndicator);
            u26.aimingMaid:GiveTask(u26.targetIndicator);
            local u33 = u27:GetMouse();
            local v41 = u33.Move:Connect(function() -- Line: 262
                -- upvalues: u26 (ref), u33 (copy), Character (ref), BlockEngine (ref)
                if not u26.targetIndicator then
                    return nil;
                end;

                local Position = u33.Hit.Position;
                local v34 = Vector3.new(Character.Position.X, 0, Character.Position.Z);
                local v35 = Vector3.new(Position.X, 0, Position.Z);

                if (v34 - v35).Magnitude > 100 then
                    Position = v34 + (v35 - v34).Unit * 100;
                end;

                local v36 = BlockEngine:getBlockPosition(Position);
                local v37 = false;
                local v38 = 0;

                while true do
                    if v37 then
                        v38 = v38 + 1;
                    else
                        v37 = true;
                    end;

                    if v38 >= 20 then
                        break;
                    end;

                    local v39 = BlockEngine:getStore():getBlockAt((Vector3.new(v36.X, v36.Y - v38 + 1, v36.Z)));

                    if v39 then
                        local v40 = BlockEngine:getWorldPosition((Vector3.new(v36.X, v36.Y - v38 + 1, v36.Z))).Y + v39.Size.Y / 2;
                        Position = Vector3.new(Position.X, v40, Position.Z);
                        break;
                    end;
                end;

                u26.targetIndicator.CFrame = CFrame.new(Position);
            end);
            u26.mainMaid:GiveTask(v41);
            u26.aimingMaid:GiveTask(v41);
        end);
        u26.aimingMaid:GiveTask(v42);
    end);
    u26.mainMaid:GiveTask(function() -- Line: 312
        -- upvalues: u43 (copy)
        return u43:cancel();
    end);
    u26.aimingMaid:GiveTask(function() -- Line: 315
        -- upvalues: u43 (copy)
        return u43:cancel();
    end);
end;

function u7.launchMortar(u44, p45, p46) -- Line: 319
    -- upvalues: SoundManager (copy), GameSound (copy), default (copy), u6 (ref), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local Character = p45.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if Character then
        SoundManager:playSound(GameSound.FIREWORK_LAUNCH, {
            position = Character
        });
        SoundManager:playSound(GameSound.GUIDED_MISSILE_FIRE, {
            position = Character
        });
    end;

    default.Client:Get("MortarLaunchedFromClient"):SendToServer({
        targetPosition = p46
    });
    u44.aimingMaid:DoCleaning();
    u44.mortarState = u6.default;
    local Character2 = p45.Character;

    if Character2 ~= nil then
        Character2 = Character2:FindFirstChild("Humanoid");

        if Character2 ~= nil then
            Character2 = Character2:FindFirstChild("Animator");
        end;
    end;

    local v47 = Character2 and AnimationUtil:playAnimation(Character2, GameAnimationUtil:getAssetId(AnimationType.DRAGON_MORTAR_FIRE), {
        looped = false
    });

    if v47 then
        u44.firingMaid:GiveTask(v47);

        if v47 ~= nil then
            v47.Stopped:Connect(function() -- Line: 362
                -- upvalues: AnimationUtil (ref), Character2 (copy), GameAnimationUtil (ref), AnimationType (ref), u44 (copy)
                local v48 = AnimationUtil:playAnimation(Character2, GameAnimationUtil:getAssetId(AnimationType.DRAGON_MORTAR_GET_UP), {
                    looped = false
                });

                if v48 then
                    u44.firingMaid:GiveTask(v48);
                end;
            end);
        end;
    end;

    u44:resetMortar();
end;

function u7.launchMortar_otherClients(p49, p50) -- Line: 376
    -- upvalues: SoundManager (copy), GameSound (copy)
    SoundManager:playSound(GameSound.FIREWORK_LAUNCH, {
        position = p50
    });
    SoundManager:playSound(GameSound.GUIDED_MISSILE_FIRE, {
        position = p50
    });
end;

function u7.mortarHit(p51, p52) -- Line: 384
    -- upvalues: SoundManager (copy), GameSound (copy)
    SoundManager:playSound(GameSound.GUIDED_MISSILE_EXPLOSION, {
        position = p52
    });
end;

function u7.cancelMortarAiming(p53) -- Line: 389
    -- upvalues: u6 (ref)
    p53.aimingMaid:DoCleaning();
    p53.firingMaid:DoCleaning();
    p53.mortarState = u6.default;
end;

function u7.resetMortar(p54) -- Line: 396
end;

KnitClient.CreateController(u7.new());

return nil;