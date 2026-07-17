-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "ForceAnimationController";
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
    p3.Name = "ForceAnimationController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), default (copy), AnimationUtil (copy), Players (copy)
    KnitController.KnitStart(p4);
    default.Client:OnEvent("ForcePlayAnimation", function(p5) -- Line: 28
        -- upvalues: AnimationUtil (ref), Players (ref)
        local u6 = AnimationUtil:playAnimation(Players.LocalPlayer, p5.animation, {
            looped = p5.looped ~= nil
        });

        if p5.priority and u6 then
            u6.Priority = p5.priority;
        end;

        if p5.adjustWeight and u6 then
            u6:AdjustWeight(p5.adjustWeight.weight, p5.adjustWeight.fadeTime);
        end;

        local v7;

        if p5.looped == nil then
            v7 = false;
        else
            v7 = p5.looped ~= true;
        end;

        if v7 then
            v7 = p5.looped;

            if v7 ~= nil then
                v7 = v7.duration;
            end;
        end;

        if v7 ~= 0 and (v7 == v7 and v7) then
            task.delay(p5.looped.duration, function() -- Line: 47
                -- upvalues: u6 (copy)
                local v8 = u6;

                if v8 ~= nil then
                    v8:Stop();
                end;
            end);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;