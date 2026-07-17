-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SpectateMode = RuntimeLib.import(script, script.Parent.Parent, "spectate", "spectate-controller").SpectateMode;
local OverwatchHud = RuntimeLib.import(script, script.Parent, "ui", "overwatch-hud").OverwatchHud;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "OverwatchController";
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
    p3.Name = "OverwatchController";
    p3.hudEnabled = false;
end;

function u1.KnitStart(u4) -- Line: 28
    -- upvalues: KnitController (copy), Flamework (copy)
    KnitController.KnitStart(u4);
    Flamework.resolveDependency("client/controllers/global/report/report-controller@ReportController").currentTicketSignal:Connect(function(p5) -- Line: 30
        -- upvalues: u4 (copy)
        u4:enableHud(p5);
    end);
    local v6 = Flamework.resolveDependency("client/controllers/global/report/report-controller@ReportController"):getCurrentTicket();

    if v6 ~= nil then
        u4:enableHud(v6);
    end;
end;

function u1.enableHud(p7, p8) -- Line: 38
    -- upvalues: KnitClient (copy), SpectateMode (copy), default (copy), Flamework (copy), OverwatchHud (copy)
    if p7.hudEnabled then
        return nil;
    end;

    p7.hudEnabled = true;
    KnitClient.Controllers.SpectateController:setSpectateMode(SpectateMode.PLAYER);
    local v9 = default.Client:Get("GetSuspectInfo"):CallServer(p8.reported);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "OverwatchHud",
        app = OverwatchHud
    }, {
        ReportTicket = p8,
        SuspectInfo = v9
    });
end;

KnitClient.CreateController(u1.new());

return nil;