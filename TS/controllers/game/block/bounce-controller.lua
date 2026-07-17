-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local Players = v1.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BounceController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4, ...);
    p4.Name = "BounceController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: ClientSyncEvents (copy), Players (copy), CollectionService (copy), getItemMeta (copy), SoundManager (copy)
    ClientSyncEvents.GroundTouch:connect(function(p6) -- Line: 31
        -- upvalues: Players (ref), CollectionService (ref), getItemMeta (ref), SoundManager (ref)
        local Character = Players.LocalPlayer.Character;
        local v7 = nil;

        if p6.landingBlock then
            if CollectionService:HasTag(p6.landingBlock, "launch-pad") then
                return nil;
            end;

            local block = getItemMeta(p6.landingBlock.Name).block;

            if block and (block.elasticity and Character.PrimaryPart) then
                v7 = block.elasticity;
            end;
        end;

        local v8;

        if v7 then
            v8 = v7.bounceSound;
        else
            v8 = v7;
        end;

        if v8 ~= "" and v8 then
            SoundManager:playSound(v7.bounceSound, {
                volumeMultiplier = math.min(p6.velocity.Y / 113, 1) * 0.8 + 0.2
            });
        end;

        if v7 ~= nil then
            v7 = v7.elasticityPercent;
        end;

        local v9 = p6.velocity.Y * Character.PrimaryPart.AssemblyMass * -((v7 == nil and 0 or v7) + 0);

        if v9 > 0 then
            local u10 = Vector3.new(0, v9, 0);
            task.delay(0.1, function() -- Line: 63
                -- upvalues: Players (ref), u10 (copy)
                local Character2 = Players.LocalPlayer.Character;

                if Character2 ~= nil then
                    local PrimaryPart = Character2.PrimaryPart;

                    if PrimaryPart ~= nil then
                        PrimaryPart:ApplyImpulse(u10);
                    end;
                end;
            end);
        end;
    end);
end;

return {
    BounceController = KnitClient.CreateController(u2.new())
};