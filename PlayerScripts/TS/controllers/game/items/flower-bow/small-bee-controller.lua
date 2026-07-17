-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local ConstantManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u1 = ConstantManager.registerConstants(script, {
    ReturnBackHome = true
});
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "SmallBeeController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SmallBeeController";
    p4.random = Random.new();
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), CollectionService (copy), BlockEngine (copy), u1 (copy)
    KnitController.KnitStart(p5);

    while true do
        local v6 = task.wait(0.5);

        if v6 == 0 or (v6 ~= v6 or not v6) then
            break;
        end;

        for _, v in CollectionService:GetTagged("flower-bee") do
            if v.Parent then
                local PrimaryPart = v.Parent.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position + Vector3.new(0, 2, 0);
                end;

                if v.Parent.PrimaryPart and PrimaryPart then
                    local v7 = BlockEngine:getBlockPosition(v.Root.Position + Vector3.new(0, 0, 0));
                    local v8;

                    if BlockEngine:getStore():getBlockAt(v7) then
                        local Unit = (v.Root.Position - BlockEngine:getWorldPosition(v7)).Unit;
                        v8 = Unit.Magnitude <= 0 and Vector3.new(0, 0, 0) or Unit * 10;
                    else
                        v8 = Vector3.new(0, 0, 0);
                    end;

                    if (v.Root.Position - PrimaryPart).Magnitude > v:GetAttribute("MaxDistanceFromOrigin") and u1.ReturnBackHome == true then
                        v.Root.AlignOrientation.CFrame = CFrame.lookAt(v.Root.Position, PrimaryPart + v8);
                    else
                        local LookVector = v.Root.CFrame.LookVector;
                        local v9 = p5.random:NextNumber(-2, 2);
                        local v10 = p5.random:NextNumber(-2, 2);
                        local v11 = LookVector + Vector3.new(v9, v10, p5.random:NextNumber(-2, 2)) + v8;
                        local v12 = v11.Unit:Cross(Vector3.new(0, 1, 0));
                        local v13 = v12:Cross(v11.Unit);
                        v.Root.AlignOrientation.CFrame = CFrame.fromMatrix(v.Root.Position, v12, v13);
                    end;

                    local v14 = v.Root.CFrame.LookVector.Unit * 10;
                    local v15 = time() * 6;
                    local v16 = math.sin(v15);
                    local v17 = Vector3.new(0, v16, 0);
                    v.Root.LinearVelocity.VectorVelocity = v14 + v17;
                else
                    v:Destroy();
                end;
            else
                v:Destroy();
            end;
        end;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;