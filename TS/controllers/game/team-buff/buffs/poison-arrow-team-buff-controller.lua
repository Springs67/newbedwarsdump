-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local TeamBuffKnitController = RuntimeLib.import(script, script.Parent.Parent, "team-buff-base-controller").TeamBuffKnitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "PoisonArrowTeamBuffController";
    end,

    __index = TeamBuffKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: TeamBuffKnitController (copy)
    TeamBuffKnitController.constructor(p3);
    p3.Name = "PoisonArrowTeamBuffController";
end;

function u1.onGameInit(p4) -- Line: 25
    -- upvalues: ClientSyncEvents (copy), StatusEffectType (copy)
    ClientSyncEvents.ProjectileLaunched:connect(function(p5) -- Line: 26
        -- upvalues: StatusEffectType (ref)
        if p5:hasStatusEffect(StatusEffectType.SNAKE_POISON_ARROW) then
            local function _(p6) -- Line: 29
                if p6:IsA("Trail") then
                    p6.Color = ColorSequence.new(Color3.fromRGB(10, 255, 56));
                end;
            end;

            for i, descendant in p5.projectile:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("Trail") then
                    descendant.Color = ColorSequence.new(Color3.fromRGB(10, 255, 56));
                end;
            end;
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;