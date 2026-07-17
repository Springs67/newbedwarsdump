-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local ConstantManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local RunService = v1.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u2 = ConstantManager.registerConstants(script, {
    ReturnBackHome = true
});
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "BeeWanderController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "BeeWanderController";
    p5.random = Random.new();
end;

function u3.KnitStart(u6) -- Line: 32
    -- upvalues: KnitController (copy), RunService (copy), CollectionService (copy), BlockEngine (copy), u2 (copy)
    KnitController.KnitStart(u6);
    RunService.Heartbeat:Connect(function() -- Line: 34
        -- upvalues: CollectionService (ref), BlockEngine (ref), u2 (ref), u6 (copy)
        for _, v in CollectionService:GetTagged("bee") do
            local v7 = v:GetAttribute("BeeOrigin");

            if v:GetAttribute("NextUpdateDirection") < time() then
                v:SetAttribute("NextUpdateDirection", time() + 0.5);
                local v8 = BlockEngine:getBlockPosition(v.Root.Position + Vector3.new(0, 0, 0));
                local v9;

                if BlockEngine:getStore():getBlockAt(v8) then
                    local Unit = (v.Root.Position - BlockEngine:getWorldPosition(v8)).Unit;
                    v9 = Unit.Magnitude <= 0 and Vector3.new(0, 0, 0) or Unit * 10;
                else
                    v9 = Vector3.new(0, 0, 0);
                end;

                if (v.Root.Position - v7).Magnitude > v:GetAttribute("MaxDistanceFromOrigin") and u2.ReturnBackHome == true then
                    v.Root.AlignOrientation.CFrame = CFrame.lookAt(v.Root.Position, v7 + v9);
                else
                    local LookVector = v.Root.CFrame.LookVector;
                    local v10 = u6.random:NextNumber(-2, 2);
                    local v11 = u6.random:NextNumber(-2, 2);
                    local v12 = LookVector + Vector3.new(v10, v11, u6.random:NextNumber(-2, 2)) + v9;
                    local v13 = v12.Unit:Cross(Vector3.new(0, 1, 0));
                    local v14 = v13:Cross(v12.Unit);
                    v.Root.AlignOrientation.CFrame = CFrame.fromMatrix(v.Root.Position, v13, v14);
                end;
            end;

            local v15 = v.Root.CFrame.LookVector.Unit * 5;
            local v16 = time() * 6;
            local v17 = math.sin(v16) / 1.5;
            local v18 = Vector3.new(0, v17, 0);
            v.Root.LinearVelocity.VectorVelocity = v15 + v18;
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;