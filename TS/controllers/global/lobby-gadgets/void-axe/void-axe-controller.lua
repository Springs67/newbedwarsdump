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
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "VoidAxeController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 39
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 43
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p8);
    p8.Name = "VoidAxeController";
    p8.maid = u3.new();
end;

function u6.KnitStart(p9) -- Line: 48
    -- upvalues: HandKnitController (copy), default (copy), Players (copy), SoundManager (copy), GameSound (copy), EntityDamageEventZap (copy), DamageType (copy)
    HandKnitController.KnitStart(p9);
    default.Client:OnEvent("VoidAxeLeap", function(p10) -- Line: 50
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref)
        if p10.entity.PrimaryPart then
            if p10.entity == Players.LocalPlayer.Character then
                return nil;
            end;

            SoundManager:playSound(GameSound.VOID_AXE_LEAP, {
                position = p10.entity.PrimaryPart.Position,
                parent = p10.entity.PrimaryPart
            });
        end;
    end);
    EntityDamageEventZap.On(function(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24) -- Line: 62
        -- upvalues: DamageType (ref), Players (ref), SoundManager (ref), GameSound (ref)
        if p13 == DamageType.VOID_AXE_SLASH then
            local VOID_AXE_HIT = GameSound.VOID_AXE_HIT;
            local v25 = {};
            local v26;

            if Players.LocalPlayer.Character == p11 then
                v26 = nil;
            else
                v26 = p11.PrimaryPart;

                if v26 ~= nil then
                    v26 = v26.Position;
                end;
            end;

            v25.position = v26;
            SoundManager:playSound(VOID_AXE_HIT, v25);
        end;
    end);
end;

function u6.useVoidAxe(u27) -- Line: 84
    -- upvalues: Flamework (copy), CooldownId (copy), AbilityId (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), Players (copy), StarterPlayer (copy), KnitClient (copy), AnimationType (copy), GameAnimationUtil (copy), EntityUtil (copy), ItemType (copy), default (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.VOID_AXE) then
        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.VOID_AXE) < 0.25 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(CooldownId.VOID_AXE, "buffer", function() -- Line: 87
                -- upvalues: u27 (copy)
                if u27:isEnabled() then
                    u27:useVoidAxe();
                end;
            end);
        end;

        return nil;
    end;

    if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(AbilityId.VOID_AXE_JUMP) then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.VOID_AXE_JUMP);
    SoundManager:playSound(GameSound.VOID_AXE_LEAP);
    local u28 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 0,
        blockSprint = true
    });
    u27.maid:GiveTask(u28);
    local Character = Players.LocalPlayer.Character;
    local PrimaryPart = Character.PrimaryPart;
    local v29 = Character:FindFirstChildOfClass("Humanoid");
    v29.JumpHeight = 3;
    v29:ChangeState(Enum.HumanoidStateType.Jumping);
    local u30 = nil;
    u30 = v29.Jumping:Connect(function() -- Line: 112
        -- upvalues: PrimaryPart (copy), u30 (ref), KnitClient2 (ref), StarterPlayer (ref)
        PrimaryPart:ApplyImpulse((PrimaryPart.CFrame * CFrame.new(Vector3.new(0, 0, -5)) - PrimaryPart.Position).Position * 13 * PrimaryPart.AssemblyMass);
        u30:Disconnect();
        KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
    end);
    u27.maid:GiveTask(u30);
    u27.maid:GiveTask(function() -- Line: 124
        -- upvalues: KnitClient2 (ref), StarterPlayer (ref)
        KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
    end);
    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
    local u31 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.JADE_HAMMER_SLAM);
    u27.maid:GiveTask(function() -- Line: 129
        -- upvalues: u31 (copy)
        local v32 = u31;

        if v32 ~= nil then
            v32:Stop();
        end;
    end);

    if u31 ~= nil then
        u31.Stopped:Connect(function() -- Line: 137
            -- upvalues: EntityUtil (ref), ItemType (ref), default (ref), u28 (copy)
            local v33 = EntityUtil:getLocalPlayerEntity();

            if v33 ~= nil then
                v33 = v33:getItemTypeInHand();
            end;

            if v33 == ItemType.VOID_AXE then
                default.Client:Get("UseVoidAxeSlash"):SendToServer();
            end;

            u28.Destroy();
        end);
    end;
end;

function u6.onEnable(u34, p35, u36) -- Line: 149
    -- upvalues: Flamework (copy), AbilityId (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), DeviceUtil (copy), BedwarsUI (copy), u4 (copy), MobileButton (copy), BedwarsImageId (copy)
    u34:setupDestroyableYield(function() -- Line: 150
        -- upvalues: Flamework (ref), AbilityId (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.VOID_AXE_JUMP, nil):expect();
    end);
    task.spawn(function() -- Line: 153
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), u36 (copy), u34 (copy)
        local u37 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.JADE_HAMMER_IDLE, {
            looped = true
        });

        if u36() then
            u34.maid:GiveTask(function() -- Line: 158
                -- upvalues: u37 (copy)
                local v38 = u37;

                if v38 ~= nil then
                    v38:Stop();
                end;
            end);

            return;
        end;

        if u37 ~= nil then
            u37:Stop();
        end;
    end);
    local v42 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "use-void-axe",

        boundFunction = function(p39, p40, p41) -- Line: 175, Name: boundFunction
            -- upvalues: u34 (copy)
            if p40 == Enum.UserInputState.Begin then
                u34:useVoidAxe();
            end;
        end
    });
    u34.maid:GiveTask(v42);

    if DeviceUtil.isMobileControls() then
        local u43 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("ItemPrimary") or BedwarsUI:getActionMobileButtonPosition();
        local u44 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("ItemPrimary");
        u34:setupYield(function() -- Line: 185
            -- upvalues: u4 (ref), MobileButton (ref), BedwarsImageId (ref), u43 (copy), u44 (copy), u34 (copy), Players (ref)
            local u45 = u4.mount(u4.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u4.createElement(MobileButton, {
                    Image = BedwarsImageId.SHOOT_MOBILE,
                    Position = u43,
                    Size = u44,

                    OnClick = function() -- Line: 193, Name: OnClick
                        -- upvalues: u34 (ref)
                        u34:useVoidAxe();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 198
                -- upvalues: u4 (ref), u45 (copy)
                u4.unmount(u45);
            end;
        end);
    end;
end;

function u6.onDisable(p46) -- Line: 204
    p46.maid:DoCleaning();
end;

function u6.isRelevantItem(p47, p48) -- Line: 207
    -- upvalues: ItemType (copy)
    return p48.itemType == ItemType.VOID_AXE;
end;

KnitClient.CreateController(u6.new());

return nil;