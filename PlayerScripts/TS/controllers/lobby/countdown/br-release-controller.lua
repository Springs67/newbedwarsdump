-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "BrReleaseController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BrReleaseController";
end;

function u2.KnitStart(p5) -- Line: 26
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u1 (copy), RunService (copy)
    KnitController.KnitStart(p5);
    WatchCollectionTag("br-spin", function(u6) -- Line: 28
        -- upvalues: u1 (ref), RunService (ref)
        if not u6.PrimaryPart then
            u6:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        local u7 = u6:GetPrimaryPartCFrame();
        local u8 = 0;
        local u9 = u1.new();
        u9:GiveTask(RunService.Heartbeat:Connect(function(p10) -- Line: 35
            -- upvalues: u6 (copy), u9 (copy), u8 (ref), u7 (copy)
            if u6.PrimaryPart == nil then
                u9:DoCleaning();

                return nil;
            end;

            u8 = u8 + p10;
            local v11 = u7 * CFrame.Angles(0, 6.283185307179586 * u8 * 0.22, 0);
            local v12 = math.sin(6.283185307179586 * u8 * 0.2) * 0.7 - 0.35;
            u6:PivotTo(v11 + Vector3.new(0, v12, 0));
        end));
    end);
end;

KnitClient.CreateController(u2.new());

return nil;