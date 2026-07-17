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
        return "AfkController";
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
    p4.Name = "AfkController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy), Workspace (copy), RunService (copy), default (copy)
    KnitController.KnitStart(p5);
    local CurrentCamera = Workspace.CurrentCamera;
    local v6 = CurrentCamera;

    if v6 ~= nil then
        v6 = v6.CFrame.LookVector;
    end;

    local u7 = v6;
    local v8 = CurrentCamera;

    if v8 ~= nil then
        v8 = v8.CFrame.Position;
    end;

    local u9 = v8;
    local u10 = nil;
    u10 = RunService.Heartbeat:Connect(function() -- Line: 41
        -- upvalues: Workspace (ref), CurrentCamera (ref), u7 (ref), u9 (ref), u10 (ref), default (ref)
        local CurrentCamera2 = Workspace.CurrentCamera;
        local v11;

        if CurrentCamera2 == nil then
            v11 = CurrentCamera2;
        else
            v11 = CurrentCamera2.CFrame.LookVector;
        end;

        if not v11 then
            CurrentCamera = nil;
            u7 = nil;
            u9 = nil;

            return nil;
        end;

        if not u7 then
            CurrentCamera = CurrentCamera2;
            u7 = v11;
            u9 = CurrentCamera2.CFrame.Position;

            return nil;
        end;

        local v12;

        if (u7 - v11).Magnitude > 1 then
            v12 = u9;
        else
            v12 = false;
        end;

        if v12 then
            v12 = (u9 - CurrentCamera2.CFrame.Position).Magnitude < 10;
        end;

        if v12 then
            u10:Disconnect();
            default.Client:Get("AfkInfo"):SendToServer({
                afk = false
            });

            return nil;
        end;

        u9 = CurrentCamera2.CFrame.Position;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;