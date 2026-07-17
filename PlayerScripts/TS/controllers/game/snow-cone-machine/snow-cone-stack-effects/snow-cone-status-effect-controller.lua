-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "SnowConeStatusEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 30
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "SnowConeStatusEffectController";
end;

function u3.KnitStart(p6) -- Line: 38
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectUtil (copy), StatusEffectType (copy), BalanceFile (copy), u1 (copy), Workspace (copy), ReplicatedStorage (copy), SyncEventPriority (copy), Players (copy), BlockEngine (copy), EffectUtil (copy), ItemType (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p6);
    ClientSyncEvents.ProjectileLaunched:connect(function(p7) -- Line: 40
        -- upvalues: StatusEffectUtil (ref), StatusEffectType (ref), BalanceFile (ref), u1 (ref), Workspace (ref), ReplicatedStorage (ref)
        if not p7.shooter then
            return nil;
        end;

        if StatusEffectUtil:getStacks(p7.shooter, StatusEffectType.SNOW_CONE) < BalanceFile.SNOW_CONE_ARROW_COST then
            return nil;
        end;

        local Handle = p7.projectile:FindFirstChild("Handle");
        local v8;

        if Handle == nil then
            v8 = Handle;
        else
            v8 = Handle:FindFirstChild("Trail");
        end;

        if v8 ~= nil then
            v8:Destroy();
        end;

        local u9 = u1("Trail", {
            FaceCamera = true,
            LightInfluence = 0,
            Lifetime = 0.35,
            Brightness = 5,
            Attachment0 = u1("Attachment", {
                Position = Vector3.new(0, 0, 0),
                Parent = Handle
            }),
            Attachment1 = u1("Attachment", {
                Position = Vector3.new(0, 0.2, 0),
                Parent = Handle
            }),
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 168, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(108, 168, 255)) }),
            WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0) }),
            Transparency = NumberSequence.new(0.5),
            Parent = Workspace
        });
        local u10 = ReplicatedStorage.Assets.Effects.Snowflake:Clone();
        u10.Parent = Handle;
        u10.Enabled = true;
        u10.Rate = 10;

        if Handle ~= nil then
            Handle.Destroying:Connect(function() -- Line: 83
                -- upvalues: u10 (copy), u9 (copy)
                u10.Enabled = false;
                task.delay(3, function() -- Line: 85
                    -- upvalues: u9 (ref), u10 (ref)
                    u9:Destroy();
                    u10:Destroy();
                end);
            end);
        end;
    end);
    ClientSyncEvents.DamageBlock:setPriority(SyncEventPriority.MONITOR):connect(function(u11) -- Line: 92
        -- upvalues: Players (ref), StatusEffectUtil (ref), StatusEffectType (ref), BalanceFile (ref), ReplicatedStorage (ref), Workspace (ref), BlockEngine (ref), EffectUtil (ref)
        if u11:isCancelled() then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        if StatusEffectUtil:getStacks(Character, StatusEffectType.SNOW_CONE) >= BalanceFile.SNOW_CONE_BLOCK_COST then
            task.spawn(function() -- Line: 101
                -- upvalues: ReplicatedStorage (ref), Workspace (ref), BlockEngine (ref), u11 (copy), EffectUtil (ref)
                local v12 = ReplicatedStorage.Assets.Effects.SnowBlast:Clone();
                v12.Parent = Workspace;
                v12.Position = BlockEngine:getWorldPosition(u11.blockPosition);
                EffectUtil:playEffects({ v12 }, nil, {
                    destroyAfterSec = 2,
                    particleMultiplier = 0.5,
                    sizeMultiplier = 0.7
                });
            end);
        end;
    end);
    ClientSyncEvents.LocalProjectileImpact:connect(function(p13) -- Line: 113
        -- upvalues: Players (ref), StatusEffectUtil (ref), StatusEffectType (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        if p13.projectile.Name ~= "arrow" then
            return nil;
        end;

        local v14 = Players:GetPlayerByUserId((p13.projectile:GetAttribute("ProjectileShooter")));

        if not v14 then
            return nil;
        end;

        local v15 = StatusEffectUtil:getActive(v14.Character, StatusEffectType.SNOW_CONE);

        if v15 ~= nil then
            v15 = v15.stacks;
        end;

        if v15 == nil then
            v15 = false;
        end;

        if v15 ~= 0 and (v15 == v15 and v15) then
            p13.projectile:SetAttribute("IgnoreDefaultImpactEffect", true);
            local u16 = ReplicatedStorage.Assets.Effects.SnowBlast:Clone();
            u16.Position = p13.hitPosition;
            u16.Parent = Workspace;
            task.spawn(function() -- Line: 136
                -- upvalues: EffectUtil (ref), u16 (copy)
                EffectUtil:playEffects(u16:GetChildren(), nil, {
                    sizeMultiplier = 0.5,
                    destroyAfterSec = 1.5
                });
            end);
        end;
    end);
    ClientSyncEvents.ItemConsumed:connect(function(p17) -- Line: 144
        -- upvalues: ItemType (ref), ReplicatedStorage (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref)
        if table.find({ ItemType.SNOW_CONE, ItemType.LUCKY_SNOW_CONE }, p17.itemType) == nil then
            return nil;
        end;

        local u18 = ReplicatedStorage.Assets.Effects.SnowBlast:Clone();
        local PrimaryPart = p17.entity:getInstance().PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if not PrimaryPart then
            return nil;
        end;

        u18.Position = PrimaryPart;
        u18.Parent = p17.entity:getInstance().PrimaryPart;
        task.spawn(function() -- Line: 161
            -- upvalues: SoundManager (ref), GameSound (ref), PrimaryPart (copy), EffectUtil (ref), u18 (copy)
            SoundManager:playSound(GameSound.SNOW_CONE_MACHINE_MAKING_FINISH, {
                position = PrimaryPart
            });
            EffectUtil:playEffects(u18:GetChildren(), nil, {
                destroyAfterSec = 1.5
            });
            task.delay(1.5, function() -- Line: 168
                -- upvalues: u18 (ref)
                u18:Destroy();
            end);
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;