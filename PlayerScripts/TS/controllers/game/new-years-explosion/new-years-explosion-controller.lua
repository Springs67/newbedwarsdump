-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ExplosionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "NewYearsExplosionController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "NewYearsExplosionController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ExplosionType (copy), KnitClient (copy), FireworkType (copy)
    KnitController.KnitStart(p4);
    ClientSyncEvents.ExplosionEffect:connect(function(p5) -- Line: 29
        -- upvalues: ExplosionType (ref), KnitClient (ref), FireworkType (ref)
        if p5.explosionType == ExplosionType.NEW_YEARS_PARTY_CANNON then
            KnitClient.Controllers.FireworkController:playFireworkEffect(p5.position, FireworkType.NEW_YEARS, {
                sizeMultiplier = 0.75,
                volumeMultiplier = 0.075
            });
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;