-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local HotdogBatBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "hotdog-bat-balance").HotdogBatBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "HotdogBatController";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 22
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 26
end;

function u1.onStart(u4) -- Line: 28
    -- upvalues: KnitClient (copy), ItemType (copy), GameSound (copy), AnimationType (copy), ClientSyncEvents (copy), HotdogBatBalance (copy), SoundManager (copy)
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.HOTDOG_BAT, {
        sounds = {
            GameSound.HOTDOG_BAT_HIT_1,
            GameSound.HOTDOG_BAT_HIT_2,
            GameSound.HOTDOG_BAT_HIT_3,
            GameSound.FRYING_PAN_CHARGE
        },
        animations = {
            AnimationType.INFERNO_SWORD_SPIN,
            AnimationType.FP_INFERNO_SWORD_SPIN,
            AnimationType.INFERNO_SWORD_CHARGE,
            AnimationType.FP_INFERNO_SWORD_CHARGE
        }
    });
    ClientSyncEvents.SwordChargedSwing:connect(function(p5) -- Line: 33
        -- upvalues: ItemType (ref), u4 (copy), HotdogBatBalance (ref), GameSound (ref), SoundManager (ref)
        if p5.weapon.Name ~= ItemType.HOTDOG_BAT then
            return nil;
        end;

        local v6 = not u4:hasTargets();

        if not v6 then
            local chargedAttack = p5.chargedAttack;

            if chargedAttack ~= nil then
                chargedAttack = chargedAttack.chargeTime;
            end;

            v6 = (chargedAttack == nil and 0 or chargedAttack) < HotdogBatBalance.MIN_CHARGE_TIME;
        end;

        if v6 then
            return nil;
        end;

        local chargedAttack = p5.chargedAttack;

        if chargedAttack ~= nil then
            chargedAttack = chargedAttack.chargeTime;
        end;

        local v7 = (chargedAttack == nil and 0 or chargedAttack) / HotdogBatBalance.MAX_CHARGE_TIME;
        local HOTDOG_BAT_HIT_1 = GameSound.HOTDOG_BAT_HIT_1;

        if v7 > 0.9 then
            HOTDOG_BAT_HIT_1 = GameSound.HOTDOG_BAT_HIT_3;
        elseif v7 > 0.4 then
            HOTDOG_BAT_HIT_1 = GameSound.HOTDOG_BAT_HIT_2;
        end;

        SoundManager:playSound(HOTDOG_BAT_HIT_1);
    end);
end;

function u1.hasTargets(p8) -- Line: 70
    -- upvalues: EntityUtil (copy), GameWorldUtil (copy), HotdogBatBalance (copy)
    local u9 = EntityUtil:getLocalPlayerEntity();

    if not u9 then
        return false;
    end;

    local Position = u9:getInstance():GetPivot().Position;

    local function _(p10) -- Line: 77
        -- upvalues: u9 (copy)
        local v11 = p10:getInstance();
        local v12 = u9;

        if v12 ~= nil then
            v12 = v12:getInstance();
        end;

        local v13 = v11 ~= v12 and u9:canAttack(p10);

        return v13;
    end;

    local v14 = {};
    local v15 = 0;

    for i, v in GameWorldUtil.getEntitiesWithinRadius(Position, HotdogBatBalance.ATTACK_RANGE) do
        local _ = i - 1;
        local v16 = v:getInstance();
        local v17;

        if u9 == nil then
            v17 = u9;
        else
            v17 = u9:getInstance();
        end;

        local v18 = v16 ~= v17 and u9:canAttack(v);

        if v18 == true then
            v15 = v15 + 1;
            v14[v15] = v;
        end;
    end;

    return #v14 ~= 0;
end;

Reflect.defineMetadata(u1, "identifier", "client/controllers/game/items/hotdog-bat/hotdog-bat-controller@HotdogBatController");
Reflect.defineMetadata(u1, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u1, "$:flamework@Controller", Controller, { {} });

return {
    default = u1
};