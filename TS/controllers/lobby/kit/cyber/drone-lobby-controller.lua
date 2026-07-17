-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "DroneLobbyController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "DroneLobbyController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), RunService (copy)
    KnitController.KnitStart(p4);
    WatchCollectionTag("LobbyDrone", function(u5) -- Line: 27
        -- upvalues: RunService (ref)
        local u6 = math.random();
        local u7 = u5:GetPrimaryPartCFrame();
        local u8 = u6 * 5;
        RunService.RenderStepped:Connect(function(p9) -- Line: 31
            -- upvalues: u8 (ref), u6 (copy), u7 (copy), u5 (copy)
            u8 = u8 + p9;
            local v10 = math.sin(6.283185307179586 * u8 * 0.2) * (u6 * 0.8 + 0.2);
            u5:PivotTo(u7 + Vector3.new(0, v10, 0));
        end);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;