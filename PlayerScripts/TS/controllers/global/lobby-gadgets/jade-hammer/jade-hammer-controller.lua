-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local StarterPlayer = v5.StarterPlayer;
local Workspace = v5.Workspace;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local JadeBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "jade-balance").JadeBalance;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "JadeHammerController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 39
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 43
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p8, ...);
    p8.Name = "JadeHammerController";
    p8.maid = u3.new();
    p8.readyTime = -1;
    p8.isHoldingAttackButton = false;
end;

function u6.KnitStart(p9) -- Line: 50
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p9);
end;

function u6.useJadeHammer(u10) -- Line: 53
    -- upvalues: Flamework (copy), CooldownId (copy), AbilityId (copy), Workspace (copy), KnitClient2 (copy), JadeBalance (copy), Players (copy), StarterPlayer (copy), KnitClient (copy), AnimationType (copy), GameAnimationUtil (copy), EntityUtil (copy), ItemType (copy), default (copy), SoundManager (copy), GameSound (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.JADE_HAMMER) then
        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.JADE_HAMMER) < 0.25 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(CooldownId.JADE_HAMMER, "buffer", function() -- Line: 56
                -- upvalues: u10 (copy)
                if u10:isEnabled() then
                    u10:useJadeHammer();
                end;
            end);
        end;

        return nil;
    end;

    if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(AbilityId.JADE_HAMMER_JUMP) then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.JADE_HAMMER_JUMP);

    if u10.readyTime > Workspace:GetServerTimeNow() then
        return nil;
    end;

    u10.readyTime = Workspace:GetServerTimeNow() + 1;
    local u11 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = true,
        moveSpeedMultiplier = JadeBalance.MOVE_SPEED_MULTIPLIER
    });
    u10.maid:GiveTask(u11);
    local Character = Players.LocalPlayer.Character;
    local PrimaryPart = Character.PrimaryPart;
    local v12 = Character:FindFirstChildOfClass("Humanoid");
    v12.JumpHeight = 3;
    v12:ChangeState(Enum.HumanoidStateType.Jumping);
    local u13 = nil;
    u13 = v12.Jumping:Connect(function() -- Line: 85
        -- upvalues: JadeBalance (ref), PrimaryPart (copy), u13 (ref), KnitClient2 (ref), StarterPlayer (ref)
        PrimaryPart:ApplyImpulse(Vector3.new(0, JadeBalance.JUMP_FORCE, 0) * PrimaryPart.AssemblyMass);
        u13:Disconnect();
        KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
    end);
    u10.maid:GiveTask(u13);
    u10.maid:GiveTask(function() -- Line: 97
        -- upvalues: KnitClient2 (ref), StarterPlayer (ref)
        KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
    end);
    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
    local u14 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.JADE_HAMMER_SLAM);
    u10.maid:GiveTask(function() -- Line: 102
        -- upvalues: u14 (copy)
        local v15 = u14;

        if v15 ~= nil then
            v15:Stop();
        end;
    end);
    local u16 = nil;
    u16 = v12.StateChanged:Connect(function(p17, p18) -- Line: 110
        -- upvalues: EntityUtil (ref), ItemType (ref), default (ref), SoundManager (ref), GameSound (ref), PrimaryPart (copy), u11 (copy), u16 (ref)
        if p18 == Enum.HumanoidStateType.Landed or p18 == Enum.HumanoidStateType.Running then
            local v19 = EntityUtil:getLocalPlayerEntity();

            if v19 ~= nil then
                v19 = v19:getItemTypeInHand();
            end;

            if v19 == ItemType.JADE_HAMMER then
                default.Client:Get("JadeHammerSlam"):SendToServer({});
                SoundManager:playSound(GameSound.JADE_HAMMER_THUD, {
                    position = PrimaryPart.Position
                });
            end;

            u11.Destroy();
            u16:Disconnect();
        end;
    end);
end;

function u6.onEnable(u20, p21, u22) -- Line: 127
    -- upvalues: Flamework (copy), AbilityId (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), DeviceUtil (copy), u4 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy)
    u20:setupDestroyableYield(function() -- Line: 128
        -- upvalues: Flamework (ref), AbilityId (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.JADE_HAMMER_JUMP, nil):expect();
    end);
    task.spawn(function() -- Line: 131
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), u22 (copy), u20 (copy)
        local u23 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.JADE_HAMMER_IDLE, {
            looped = true
        });

        if u22() then
            u20.maid:GiveTask(function() -- Line: 136
                -- upvalues: u23 (copy)
                local v24 = u23;

                if v24 ~= nil then
                    v24:Stop();
                end;
            end);

            return;
        end;

        if u23 ~= nil then
            u23:Stop();
        end;
    end);
    local v28 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "use-jade-hammer",

        boundFunction = function(p25, p26, p27) -- Line: 153, Name: boundFunction
            -- upvalues: u20 (copy)
            if p26 == Enum.UserInputState.Begin then
                u20.isHoldingAttackButton = true;
                u20:useJadeHammer();
            end;

            if p26 == Enum.UserInputState.End or p26 == Enum.UserInputState.Cancel then
                u20.isHoldingAttackButton = false;
            end;
        end
    });
    u20.maid:GiveTask(v28);

    if DeviceUtil.isMobileControls() then
        u20:setupYield(function() -- Line: 165
            -- upvalues: u4 (ref), MobileButton (ref), BedwarsImageId (ref), BedwarsUI (ref), u20 (copy), Players (ref)
            local u29 = u4.mount(u4.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u4.createElement(MobileButton, {
                    Image = BedwarsImageId.UP_MOBILE,
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnClick = function() -- Line: 172, Name: OnClick
                    end,

                    OnPressDown = function() -- Line: 173, Name: OnPressDown
                        -- upvalues: u20 (ref)
                        u20.isHoldingAttackButton = true;
                        u20:useJadeHammer();
                    end,

                    OnPressUp = function() -- Line: 177, Name: OnPressUp
                        -- upvalues: u20 (ref)
                        u20.isHoldingAttackButton = false;
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 182
                -- upvalues: u4 (ref), u29 (copy)
                u4.unmount(u29);
            end;
        end);
    end;
end;

function u6.onDisable(p30) -- Line: 188
    p30.maid:DoCleaning();
    p30.isHoldingAttackButton = false;
end;

function u6.isRelevantItem(p31, p32) -- Line: 192
    -- upvalues: ItemType (copy)
    return p32.itemType == ItemType.JADE_HAMMER;
end;

KnitClient.CreateController(u6.new());

return nil;