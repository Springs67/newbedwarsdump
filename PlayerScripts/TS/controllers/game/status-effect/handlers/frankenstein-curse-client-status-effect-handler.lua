-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local ClientStatusEffectHandler = RuntimeLib.import(script, script.Parent, "client-status-effect-handler").ClientStatusEffectHandler;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "FrankensteinCurseClientStatusEffectHandler";
    end,

    __index = ClientStatusEffectHandler
});
u3.__index = u3;

function u3.new(...) -- Line: 19
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 23
    -- upvalues: ClientStatusEffectHandler (copy), u1 (copy)
    ClientStatusEffectHandler.constructor(p5, ...);
    p5.neckBoltMaid = u1.new();
end;

function u3.onApply(p6, p7, p8) -- Line: 27
    -- upvalues: Players (copy), EntityUtil (copy), ReplicatedStorage (copy)
    if not Players.LocalPlayer.Character or p7 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    p6.neckBoltMaid:DoCleaning();
    local v9 = EntityUtil:getEntity(Players.LocalPlayer);
    local v10 = ReplicatedStorage.Assets.Misc.FrankenBolt:Clone();

    if v9 ~= nil then
        local v11 = v9:getHumanoid();

        if v11 ~= nil then
            v11:AddAccessory(v10);
        end;
    end;

    p6.neckBoltMaid:GiveTask(v10);
end;

function u3.onRemove(p12, p13, p14) -- Line: 43
    -- upvalues: Players (copy)
    if not Players.LocalPlayer.Character or p13 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    p12.neckBoltMaid:DoCleaning();
end;

return {
    FrankensteinCurseClientStatusEffectHandler = u3
};