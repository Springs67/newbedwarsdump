-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "BananarangController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 27
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "BananarangController";
    p3.tier = 0;
    p3.launchCount = 0;
    p3.lastLaunchTime = 0;
end;

function u1.KnitStart(u4) -- Line: 38
    -- upvalues: KnitController (copy), default (copy), ItemType (copy), EntityUtil (copy), Players (copy), ClientSyncEvents (copy), SyncEventPriority (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("ItemUpgraded"):Connect(function(p5) -- Line: 40
        -- upvalues: ItemType (ref), u4 (copy)
        if p5.item ~= ItemType.BANANARANG then
            return nil;
        end;

        u4.tier = p5.itemTier;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p6) -- Line: 47
        -- upvalues: EntityUtil (ref), Players (ref), u4 (copy)
        if EntityUtil:getPlayerFromEntityInstance(p6.entityInstance) == Players.LocalPlayer then
            u4.tier = 0;
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:setPriority(SyncEventPriority.HIGH):connect(function(p7) -- Line: 52
        -- upvalues: Players (ref), u4 (copy), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        if p7:isCancelled() then
            return nil;
        end;

        if not p7.shooter then
            return nil;
        end;

        if p7.projectileType ~= "bananarang" then
            return nil;
        end;

        local v8 = Players:GetPlayerFromCharacter(p7.shooter);
        local v9;

        if v8 == nil then
            v9 = v8;
        else
            v9 = v8.Character;
        end;

        if not v9 then
            return nil;
        end;

        if v8 == Players.LocalPlayer then
            local launchData = p7.launchData;

            if launchData ~= nil then
                launchData = launchData.shotId;
            end;

            if launchData == "" or not launchData then
                p7.projectile:Destroy();
                p7:setCancelled(true);

                return nil;
            end;

            local v10 = u4.tier >= 2 and 2 or 1;

            if u4.lastLaunchTime + 8 < os.time() then
                u4.launchCount = 0;
            end;

            if u4.launchCount >= v10 then
                p7.projectile:Destroy();
                p7:setCancelled(true);

                return nil;
            end;

            local v11 = u4;
            v11.launchCount = v11.launchCount + 1;
            u4.lastLaunchTime = os.time();
        end;

        local v12 = SoundManager:createSound(GameSound.BANANARANG_FLYING_LOOP);

        if v12 then
            v12.Parent = p7.projectile:FindFirstChildWhichIsA("BasePart");
            v12.Looped = true;
            v12.Volume = 2;
            v12:Play();
        end;

        if v8 == Players.LocalPlayer then
            local BANANARANG_THROW = GameSound.BANANARANG_THROW;
            local v13 = {};
            local PrimaryPart = v8.Character.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            v13.position = PrimaryPart;
            v13.volumeMultiplier = 0.5;
            SoundManager:playSound(BANANARANG_THROW, v13);
            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.BOOMERANG_THROW);
        end;
    end);
    default.Client:Get("ProjectileReturned"):Connect(function(p14, p15, p16) -- Line: 116
        -- upvalues: Players (ref), u4 (copy)
        if p16 == Players.LocalPlayer and (p15 == "bananarang" and p14 ~= nil) then
            local v17 = u4;
            v17.launchCount = v17.launchCount - 1;
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;