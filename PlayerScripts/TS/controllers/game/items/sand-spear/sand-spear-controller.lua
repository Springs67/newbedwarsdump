-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "SandSpearController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "SandSpearController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: KnitController (copy), Players (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy)
    KnitController.KnitStart(p4);
    Players.LocalPlayer:GetAttributeChangedSignal("RecentSpearBounce"):Connect(function() -- Line: 29
        -- upvalues: Players (ref), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref)
        local LocalPlayer = Players.LocalPlayer;
        local v5 = LocalPlayer:GetAttribute("RecentSpearBounce");
        local v6 = LocalPlayer:GetAttribute("SandSpearBounceStrength");

        if v5 == 0 or (v5 ~= v5 or (v5 == "" or not v5)) then
            return nil;
        end;

        local v7 = EntityUtil:getLocalPlayerEntity();
        local Character = LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        if v7 and StatusEffectUtil:isActive(v7:getInstance(), StatusEffectType.GROUNDED) then
            return nil;
        end;

        if v7 and StatusEffectUtil:isActive(v7:getInstance(), StatusEffectType.FROSTED) then
            return nil;
        end;

        Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
        Character.PrimaryPart:ApplyImpulse((Vector3.new(0, Character.PrimaryPart.AssemblyMass * 125 * (v6 == nil and 1 or v6), 0)));
    end);
end;

KnitClient.CreateController(u1.new());

return nil;