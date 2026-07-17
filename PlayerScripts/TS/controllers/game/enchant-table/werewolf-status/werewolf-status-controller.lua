-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local ClientStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "WerewolfStatusEffectHandler";
    end,

    __index = ClientStatusEffectHandler
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 22
    -- upvalues: ClientStatusEffectHandler (copy)
    ClientStatusEffectHandler.constructor(p4, ...);
end;

function u2.onApply(p5, p6, p7) -- Line: 25
    -- upvalues: ReplicatedStorage (copy), WeldUtil (copy)
    local v8 = ReplicatedStorage.Assets.Misc.WerewolfEars:Clone();
    p6.Humanoid:AddAccessory(v8);
    local v9 = ReplicatedStorage.Assets.Misc.WerewolfTail:Clone();
    p6.Humanoid:AddAccessory(v9);
    WeldUtil:weldCharacterAccessories(p6);
end;

function u2.onRemove(p10, p11, p12) -- Line: 33
    -- upvalues: Players (copy)
    if not Players:GetPlayerFromCharacter(p11) then
        return nil;
    end;

    local WerewolfEars = p11:FindFirstChild("WerewolfEars");

    if WerewolfEars then
        WerewolfEars:Destroy();
    end;

    local WerewolfTail = p11:FindFirstChild("WerewolfTail");

    if WerewolfTail then
        WerewolfTail:Destroy();
    end;
end;

return {
    WerewolfStatusEffectHandler = u2
};