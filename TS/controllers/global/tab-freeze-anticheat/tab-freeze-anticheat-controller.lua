-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "TabFreezeAnticheat";
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
    p4.Name = "TabFreezeAnticheat";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy), RunService (copy), default (copy), Workspace (copy)
    KnitController.KnitStart(p5);
    RunService.RenderStepped:Connect(function(p6) -- Line: 31
        -- upvalues: default (ref), Workspace (ref)
        if p6 > 2.5 then
            default.Client:Get("TabFreezeAnticheat_ClientToServerReport"):SendToServer({
                report = {
                    frozenSeconds = p6,
                    endServerTime = Workspace:GetServerTimeNow()
                }
            });
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;