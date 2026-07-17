-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "KnightShieldController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 30
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 34
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p5);
    p5.Name = "KnightShieldController";
    p5.shieldRaisedMaidMap = {};
    p5.charactersInShield = {};
    p5.shieldLastThresholdMap = {};
end;

function u3.isRelevantItem(p6, p7) -- Line: 41
    -- upvalues: ItemType (copy)
    return p7.itemType == ItemType.KNIGHT_SHIELD;
end;

function u3.onEnable(p8, p9, p10) -- Line: 44
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE, AbilityMeta[AbilityId.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE].triggerConfig);
end;

function u3.onDisable(p11) -- Line: 47
    -- upvalues: Flamework (copy), AbilityId (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.EXIT_KNIGHT_SHIELD_DEFENSIVE_STANCE);
end;

function u3.KnitStart(u12) -- Line: 51
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), ItemType (copy), Players (copy), KnitClient (copy), AnimationType (copy), AbilityId (copy), SoundManager (copy), GameSound (copy)
    HandKnitController.KnitStart(u12);
    ClientSyncEvents.EntityChangeHeldItem:connect(function(p13) -- Line: 53
        -- upvalues: ItemType (ref), u12 (copy)
        local item = p13.item;

        if item ~= nil then
            item = item.Name;
        end;

        local v14 = item ~= ItemType.KNIGHT_SHIELD and u12.shieldRaisedMaidMap[p13.entity:getInstance()] ~= nil;

        if v14 then
            u12:lowerShield(p13.entity:getInstance());
        end;
    end);
    ClientSyncEvents.SwordSwing:connect(function(p15) -- Line: 68
        -- upvalues: ItemType (ref), Players (ref), u12 (copy), KnitClient (ref), AnimationType (ref)
        if p15:isCancelled() then
            return nil;
        end;

        if p15.swordType ~= ItemType.KNIGHT_SHIELD then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        if u12.charactersInShield[Character] == nil then
            p15:setCancelled(true);

            return nil;
        end;

        local u16 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.KNIGHT_SHIELD_FP_BASH, {
            looped = false
        });

        if u16 ~= nil then
            u16.Stopped:Connect(function() -- Line: 88
                -- upvalues: u16 (copy)
                u16:Destroy();
            end);
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p17) -- Line: 93
        -- upvalues: AbilityId (ref), u12 (copy)
        if p17:isCancelled() then
            return nil;
        end;

        if p17.ability == AbilityId.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE then
            u12:raiseShield(p17.userCharacter);

            return;
        end;

        if p17.ability == AbilityId.EXIT_KNIGHT_SHIELD_DEFENSIVE_STANCE then
            u12:lowerShield(p17.userCharacter);
        end;
    end);
    ClientSyncEvents.ItemDurabilityBroken:connect(function(p18) -- Line: 103
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.KNIGHT_SHIELD_BROKEN, {
            volumeMultiplier = 0.6,
            position = p18.lastPosition
        });
    end);
    ClientSyncEvents.ItemDurabilityChanged:connect(function(p19) -- Line: 109
        -- upvalues: Players (ref), u12 (copy), SoundManager (ref), GameSound (ref)
        if p19.itemHolder ~= Players.LocalPlayer then
            return nil;
        end;

        local Handle = p19.itemInstance:FindFirstChild("Handle");

        if Handle ~= nil then
            Handle = Handle.Position;
        end;

        if not Handle then
            return nil;
        end;

        if u12.shieldLastThresholdMap[p19.itemInstance] == nil then
            u12.shieldLastThresholdMap[p19.itemInstance] = 0;
        end;

        if p19.newDurability < 70 and u12.shieldLastThresholdMap[p19.itemInstance] == 0 then
            u12.shieldLastThresholdMap[p19.itemInstance] = 1;
            SoundManager:playSound(GameSound.KNIGHT_SHIELD_DAMAGED_1, {
                volumeMultiplier = 0.6,
                position = Handle
            });
            u12:changeShieldLevel(p19.itemInstance, 1);

            return;
        end;

        if p19.newDurability < 30 and u12.shieldLastThresholdMap[p19.itemInstance] == 1 then
            u12.shieldLastThresholdMap[p19.itemInstance] = 2;
            SoundManager:playSound(GameSound.KNIGHT_SHIELD_DAMAGED_2, {
                volumeMultiplier = 0.6,
                position = Handle
            });
            u12:changeShieldLevel(p19.itemInstance, 2);
        end;
    end);
end;

function u3.raiseShield(u20, u21) -- Line: 163
    -- upvalues: u2 (copy), Players (copy), KnitClient2 (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy)
    if u20.shieldRaisedMaidMap[u21] == nil then
        local v22 = u2.new();
        u20.shieldRaisedMaidMap[u21] = v22;
    end;

    u20.charactersInShield[u21] = true;

    if Players.LocalPlayer.Character == u21 then
        local v23 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = 0.6
        });
        local v24 = u20.shieldRaisedMaidMap[u21];

        if v24 ~= nil then
            v24:GiveTask(v23);
        end;
    end;

    local v25 = u20.shieldRaisedMaidMap[u21];

    if v25 ~= nil then
        v25:GiveTask(function() -- Line: 190
            -- upvalues: u21 (copy), u20 (copy)
            if u21 then
                u20.shieldRaisedMaidMap[u21] = nil;
                u20.charactersInShield[u21] = nil;
            end;
        end);
    end;

    local v26;

    if u21 == nil then
        v26 = u21;
    else
        v26 = u21:FindFirstChild("Humanoid");
    end;

    local v27;

    if v26 == nil then
        v27 = v26;
    else
        v27 = v26:FindFirstChild("Animator");
    end;

    if v26 and v27 then
        local u28 = v27:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.KNIGHT_SHIELD_RAISE_SHIELD));
        u28.Looped = true;
        u28:Play();
        local v29 = u20.shieldRaisedMaidMap[u21];

        if v29 ~= nil then
            v29:GiveTask(function() -- Line: 219
                -- upvalues: u28 (copy)
                local v30 = u28;

                if v30 ~= nil then
                    v30:Stop();
                end;

                local v31 = u28;

                if v31 ~= nil then
                    v31:Destroy();
                end;
            end);
        end;

        if u21 == Players.LocalPlayer.Character then
            local u32 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.KNIGHT_SHIELD_FP_DEFEND, {
                looped = true
            });
            local v33 = u20.shieldRaisedMaidMap[u21];

            if v33 ~= nil then
                v33:GiveTask(function() -- Line: 238
                    -- upvalues: u32 (copy)
                    local v34 = u32;

                    if v34 ~= nil then
                        v34:Stop();
                    end;
                end);
            end;
        end;
    end;
end;

function u3.lowerShield(p35, p36) -- Line: 248
    local v37 = p35.shieldRaisedMaidMap[p36];

    if v37 ~= nil then
        v37:DoCleaning();
    end;
end;

function u3.changeShieldLevel(p38, p39, p40) -- Line: 256
    local Handle = p39:FindFirstChild("Handle");

    if not Handle then
        return nil;
    end;

    local Level0Body = Handle:FindFirstChild("Level0Body");
    local Level1Body = Handle:FindFirstChild("Level1Body");
    local Level2Body = Handle:FindFirstChild("Level2Body");

    if not (Level0Body and (Level1Body and Level2Body)) then
        return nil;
    end;

    Level0Body.Transparency = 1;
    Level1Body.Transparency = 1;
    Level2Body.Transparency = 1;

    local function _(p41, p42) -- Line: 271
        if p41 then
            p41.Transparency = p42;
            local Border = p41:FindFirstChild("Border");

            if Border then
                Border.Transparency = p42;
            end;
        end;
    end;

    if p40 == 1 then
        if Level1Body then
            Level1Body.Transparency = 0;
            local Border = Level1Body:FindFirstChild("Border");

            if Border then
                Border.Transparency = 0;
            end;
        end;
    elseif p40 == 2 then
        if Level2Body then
            Level2Body.Transparency = 0;
            local Border = Level2Body:FindFirstChild("Border");

            if Border then
                Border.Transparency = 0;
            end;
        end;
    elseif Level0Body then
        Level0Body.Transparency = 0;
        local Border = Level0Body:FindFirstChild("Border");

        if Border then
            Border.Transparency = 0;
        end;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;