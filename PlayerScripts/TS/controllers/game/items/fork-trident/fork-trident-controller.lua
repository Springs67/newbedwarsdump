-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ProjectileHandler = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ForkTridentBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "fork-trident", "fork-trident-balance").ForkTridentBalance;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "ForkTridentController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p5);
    p5.Name = "ForkTridentController";
    p5.swordEventMaid = u2.new();
end;

function u3.KnitStart(p6) -- Line: 37
    -- upvalues: HandKnitController (copy), KnitClient2 (copy), ItemType (copy), GameSound (copy), AnimationType (copy), default (copy), Players (copy), SoundManager (copy)
    HandKnitController.KnitStart(p6);
    KnitClient2.Controllers.PreloadController:preloadForItemType(ItemType.FORK_TRIDENT, {
        sounds = { GameSound.FORK_TRIDENT_THROW, GameSound.FORK_TRIDENT_STAB, GameSound.FORK_TRIDENT_RETURN },
        animations = {
            AnimationType.FP_DAGGER_CHARGE,
            AnimationType.SPEAR_STARTUP,
            AnimationType.FORK_TRIDENT_IDLE,
            AnimationType.FP_DAGGER_SLASH,
            AnimationType.SPEAR_THROW
        }
    });
    default.Client:Get("ProjectileReturned"):Connect(function(p7, p8, p9) -- Line: 43
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref)
        if p8 ~= "fork_trident_projectile" then
            return nil;
        end;

        local v10 = p9 == Players.LocalPlayer;
        local v11;

        if v10 then
            v11 = nil;
        else
            v11 = p9.Character;

            if v11 ~= nil then
                v11 = v11:GetPivot().Position;
            end;
        end;

        if not (v10 or v11) then
            return nil;
        end;

        SoundManager:playSound(GameSound.FORK_TRIDENT_RETURN, {
            position = v11
        });
    end);
end;

function u3.isRelevantItem(p12, p13) -- Line: 69
    -- upvalues: ItemType (copy)
    return p13.itemType == ItemType.FORK_TRIDENT;
end;

function u3.onEnable(u14, p15) -- Line: 72
    -- upvalues: ClientSyncEvents (copy), ItemType (copy), ForkTridentBalance (copy)
    local v18 = ClientSyncEvents.SwordChargedSwing:connect(function(p16) -- Line: 73
        -- upvalues: ItemType (ref), ForkTridentBalance (ref), u14 (copy)
        local v17 = p16.weapon.Name ~= ItemType.FORK_TRIDENT;

        if not v17 then
            local chargedAttack = p16.chargedAttack;

            if chargedAttack ~= nil then
                chargedAttack = chargedAttack.chargeTime;
            end;

            if chargedAttack == 0 then
                chargedAttack = false;
            elseif chargedAttack ~= chargedAttack then
                chargedAttack = false;
            end;

            v17 = not chargedAttack or p16.chargedAttack.chargeTime < ForkTridentBalance.MIN_CHARGE_TIME;
        end;

        if v17 then
            return nil;
        end;

        u14:throwTrident(p16.weapon);
    end);
    u14.swordEventMaid:GiveTask(v18);
end;

function u3.onDisable(p19) -- Line: 92
    p19.swordEventMaid:DoCleaning();
end;

function u3.throwTrident(p20, p21) -- Line: 95
    -- upvalues: getItemMeta (copy), ItemType (copy), KnitClient2 (copy), ProjectileHandler (copy)
    local v22 = getItemMeta(ItemType.FORK_TRIDENT);

    if not v22 then
        return nil;
    end;

    local v23 = KnitClient2.Controllers.DefaultProjectileSourceController:getProjectileHandler();
    local v24;

    if v23 == nil then
        v24 = v23;
    else
        v24 = v23.inputInfo;
    end;

    local v25;

    if v23 == nil then
        v25 = v23;
    else
        v25 = v23.targetPoint;
    end;

    if v23 ~= nil then
        v23 = v23.lockedAimPoint;
    end;

    local v26 = ProjectileHandler.new(1, 1, "fork_trident_projectile", v24, v25, nil, 0, v23);
    KnitClient2.Controllers.ProjectileController:launchProjectile(ItemType.FORK_TRIDENT, ItemType.FORK_TRIDENT, v26, p21, v22.projectileSource, nil, "fork_trident_projectile");
end;

KnitClient.CreateController(u3.new());

return nil;