-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "OrionsBeltBowController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "OrionsBeltBowController";
    p5.prevStar = {};
    p5.starNum = {};
end;

function u3.KnitStart(u6) -- Line: 35
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), KnitClient2 (copy), default (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), Workspace (copy), EffectUtil (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.ProjectileLaunched:connect(function(p7) -- Line: 37
        -- upvalues: u6 (copy), KnitClient2 (ref)
        if p7:isCancelled() then
            return nil;
        end;

        if p7.projectileType ~= "star_projectile" then
            return nil;
        end;

        if not p7.shooter then
            return nil;
        end;

        if u6.starNum[p7.shooter] == nil then
            u6.starNum[p7.shooter] = 0;
        end;

        local v8 = u6.starNum[p7.shooter];
        local v9 = v8 == nil and 0 or v8;
        local v10 = v9 * 3.141592653589793 * 2;
        local v11 = math.cos(v10) * 10;
        local v12 = math.sin(v10) * 10;
        local v13 = Vector3.new(v11, 0, v12);

        if p7.projectile.PrimaryPart then
            p7.projectile.PrimaryPart:ApplyImpulse(v13);
        end;

        u6.starNum[p7.shooter] = v9 == 0 and 0.5 or 0;

        if u6.prevStar[p7.shooter] == nil then
            if p7.projectile.PrimaryPart then
                u6.prevStar[p7.shooter] = p7.projectile.PrimaryPart;
            end;
        else
            local PrimaryPart = p7.projectile.PrimaryPart;
            local v14 = u6.prevStar[p7.shooter];

            if PrimaryPart and v14 then
                if (PrimaryPart.Position - v14.Position).Magnitude < 80 then
                    KnitClient2.Controllers.BeamController:createBeam({
                        width0 = 1.5,
                        width1 = 1.5,
                        duration = 4,
                        source = PrimaryPart,
                        target = v14,
                        color = Color3.new(255, 255, 255)
                    });
                end;

                u6.prevStar[p7.shooter] = PrimaryPart;
            end;
        end;
    end);
    default.Client:OnEvent("StarExplode", function(p15) -- Line: 105
        -- upvalues: ReplicatedStorage (ref), SoundManager (ref), GameSound (ref), Workspace (ref), EffectUtil (ref)
        local u16 = ReplicatedStorage.Assets.Effects.StarExplosion:Clone();
        SoundManager:playSound(GameSound.STAR_EXPLODE, {
            rollOffMaxDistance = 200,
            volumeMultiplier = 2,
            position = p15.position
        });
        u16.Parent = Workspace;
        u16.Color = Color3.new(255, 255, 255);
        EffectUtil:playEffects({ u16 }, nil, {
            sizeMultiplier = 3
        });
        u16:PivotTo(CFrame.new(p15.position));
        task.delay(2, function() -- Line: 118
            -- upvalues: u16 (copy)
            u16:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;