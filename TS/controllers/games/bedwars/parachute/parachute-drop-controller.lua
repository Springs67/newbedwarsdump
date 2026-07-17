-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local Tween = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "ParachuteDropController";
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
    p3.Name = "ParachuteDropController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), Tween (copy), Workspace (copy), Linear (copy)
    KnitController.KnitStart(p4);
    default.Client:OnEvent("ParachuteDrop", function(p5) -- Line: 29
        -- upvalues: Tween (ref), Workspace (ref), Linear (ref)
        for _, v in p5 do
            task.spawn(function() -- Line: 31
                -- upvalues: v (copy), Tween (ref), Workspace (ref), Linear (ref)
                if v.model.PrimaryPart == nil then
                    v.model:GetPropertyChangedSignal("PrimaryPart"):Wait();
                end;

                Tween(v.arriveTime - 0.1 - Workspace:GetServerTimeNow(), Linear, function(p6) -- Line: 35
                    -- upvalues: v (ref)
                    if v.model.PrimaryPart then
                        v.model:PivotTo(CFrame.new(p6));
                    end;
                end, v.model:GetPrimaryPartCFrame().Position, v.position);
            end);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;