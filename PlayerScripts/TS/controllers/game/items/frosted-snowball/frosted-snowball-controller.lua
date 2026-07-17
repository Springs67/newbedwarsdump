-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local getProjectileTypeByEncoding = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "projectile-type-encoding").getProjectileTypeByEncoding;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "FrostedSnowballController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "FrostedSnowballController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy), EntityDamageEventZap (copy), getProjectileTypeByEncoding (copy), Players (copy), u1 (copy), KnitClient (copy)
    KnitController.KnitStart(p5);
    EntityDamageEventZap.On(function(p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19) -- Line: 29
        -- upvalues: getProjectileTypeByEncoding (ref), Players (ref), u1 (ref), KnitClient (ref)
        local v20;

        if p13 == nil then
            v20 = p13;
        else
            v20 = p13.projectileData;

            if v20 ~= nil then
                v20 = v20.projectileType;
            end;
        end;

        if v20 ~= 0 and (v20 == v20 and (v20 and (getProjectileTypeByEncoding(p13.projectileData.projectileType) == "frosted_snowball" and p6 == Players.LocalPlayer.Character))) then
            local u21 = u1.new();
            u21:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = 0.6
            }));
            task.delay(1, function() -- Line: 45
                -- upvalues: u21 (copy)
                u21:DoCleaning();
            end);
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;