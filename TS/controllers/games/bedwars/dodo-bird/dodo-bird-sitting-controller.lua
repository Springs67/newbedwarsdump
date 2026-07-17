-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local RunService = v1.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "DodoBirdSittingController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4, ...);
    p4.Name = "DodoBirdSittingController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), RunService (copy), CollectionService (copy)
    KnitController.KnitStart(p5);
    RunService.Stepped:Connect(function() -- Line: 32
        -- upvalues: CollectionService (ref)
        for _, v in CollectionService:GetTagged("dodo-bird-mount") do
            local Parent = v.Parent;

            if Parent and Parent.PrimaryPart then
                local v6 = (Parent.HumanoidRootPart.CFrame * CFrame.new(0, -1.3, 0)):ToObjectSpace(v.RootPart.master.torso["torso.001"].TransformedWorldCFrame);
                local v7 = CFrame.Angles(1.2217304763960306, 0, 0);
                Parent.LowerTorso.Root.Transform = v6 * v7;
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;