-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "GuardsSpearController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5);
    p5.Name = "GuardsSpearController";
    p5.animationMaid = u1.new();
    p5.nextAttack = -1;
end;

function u3.KnitStart(u6) -- Line: 37
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), Workspace (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), ChargeState (copy), getItemMeta (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.SwordChargedSwing:connect(function(p7) -- Line: 39
        -- upvalues: ItemType (ref), u6 (copy), Workspace (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
        if p7.weapon.Name ~= ItemType.GUARDS_SPEAR then
            return nil;
        end;

        local chargedAttack = p7.chargedAttack;

        if chargedAttack ~= nil then
            chargedAttack = chargedAttack.chargeTime;
        end;

        if chargedAttack == 0 or (chargedAttack ~= chargedAttack or not chargedAttack) then
            if u6.nextAttack > Workspace:GetServerTimeNow() then
                return nil;
            end;

            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.TWIRLBLADE_ATTACK_2);
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_TWIRLBLADE_ATTACK_2);
            SoundManager:playSound(GameSound.SPEAR_STAB_1);
            u6.nextAttack = Workspace:GetServerTimeNow() + 0.45;

            return nil;
        end;

        if p7.chargedAttack.chargeTime < 0.2 then
            if u6.nextAttack > Workspace:GetServerTimeNow() then
                return nil;
            end;

            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.TWIRLBLADE_ATTACK_2);
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_TWIRLBLADE_ATTACK_2);
            u6.nextAttack = Workspace:GetServerTimeNow() + 0.45;
            SoundManager:playSound(GameSound.SPEAR_STAB_2);

            return nil;
        end;

        GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.SPEAR_STAB_1);
        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_SPEAR_STAB);
        u6.nextAttack = Workspace:GetServerTimeNow() + 0.2;
        SoundManager:playSound(GameSound.SPEAR_STAB_3);
    end);
    local u8 = nil;
    local u9 = nil;
    ClientSyncEvents.SwordCharge:connect(function(u10) -- Line: 75
        -- upvalues: ItemType (ref), Workspace (ref), u6 (copy), ChargeState (ref), Players (ref), getItemMeta (ref), u8 (ref), GameAnimationUtil (ref), AnimationType (ref), u9 (ref), KnitClient (ref)
        if u10.itemType ~= ItemType.GUARDS_SPEAR then
            return nil;
        end;

        if Workspace:GetServerTimeNow() < u6.nextAttack then
            return nil;
        end;

        task.spawn(function() -- Line: 82
            -- upvalues: u10 (copy), ChargeState (ref), Players (ref), getItemMeta (ref), u6 (ref), u8 (ref), GameAnimationUtil (ref), AnimationType (ref), u9 (ref), KnitClient (ref)
            if u10.chargeState == ChargeState.Charging then
                Players.LocalPlayer:SetAttribute("IsCharging", true);
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character:FindFirstChild("Humanoid");

                    if Character ~= nil then
                        Character = Character:FindFirstChild("Animator");
                    end;
                end;

                if not Character then
                    return nil;
                end;

                local sword = getItemMeta(u10.itemType).sword;

                if sword ~= nil then
                    sword = sword.chargedAttack;
                end;

                if not sword then
                    return nil;
                end;

                u6:playSound();
                task.wait(0.1);
                local v11 = Players.LocalPlayer:GetAttribute("IsCharging");

                if v11 == 0 or (v11 ~= v11 or (v11 == "" or not v11)) then
                    return nil;
                end;

                u8 = Character:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SPEAR_CHARGE_1));
                u8:Play();
                u8:GetMarkerReachedSignal("end"):Connect(function() -- Line: 114
                    -- upvalues: u8 (ref)
                    local v12 = u8;

                    if v12 ~= nil then
                        v12:AdjustSpeed(0);
                    end;
                end);
                u9 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_SPEAR_CHARGE);

                if u9 then
                    u9:GetMarkerReachedSignal("end"):Connect(function() -- Line: 124
                        -- upvalues: u9 (ref)
                        local v13 = u9;

                        if v13 ~= nil then
                            v13:AdjustSpeed(0);
                        end;
                    end);
                end;

                u6.animationMaid:GiveTask(function() -- Line: 131
                    -- upvalues: u8 (ref), u9 (ref)
                    local v14 = u8;

                    if v14 ~= nil then
                        v14:Stop();
                    end;

                    local v15 = u8;

                    if v15 ~= nil then
                        v15:Destroy();
                    end;

                    local v16 = u9;

                    if v16 ~= nil then
                        v16:Stop();
                    end;

                    local v17 = u9;

                    if v17 ~= nil then
                        v17:Destroy();
                    end;
                end);
            else
                local _ = u10.chargeState == ChargeState.Charged;
            end;

            if u10.chargeState == ChargeState.Idle then
                Players.LocalPlayer:SetAttribute("IsCharging", false);
                local v18 = u8;

                if v18 ~= nil then
                    v18:Stop();
                end;

                local v19 = u8;

                if v19 ~= nil then
                    v19:Destroy();
                end;

                local v20 = u9;

                if v20 ~= nil then
                    v20:Stop();
                end;

                local v21 = u9;

                if v21 ~= nil then
                    v21:Destroy();
                end;

                u6.animationMaid:DoCleaning();
            end;
        end);
    end);
end;

function u3.playSound(p22) -- Line: 174
    -- upvalues: SoundManager (copy), GameSound (copy)
    local u23 = SoundManager:playSound(GameSound.SPEAR_CHARGE);

    if u23 then
        p22.animationMaid:GiveTask(function() -- Line: 177
            -- upvalues: u23 (copy)
            u23:Stop();
        end);
    end;
end;

KnitClient.CreateController(u3.new());

return nil;