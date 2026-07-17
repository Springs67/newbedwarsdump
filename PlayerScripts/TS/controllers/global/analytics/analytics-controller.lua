-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "AnalyticsController";
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
    p3.Name = "AnalyticsController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: default (copy), ReplicatedStorage (copy)
    local function handleDeletion() -- Line: 27
        -- upvalues: default (ref)
        task.wait(math.random(20, 60));
        default.Client:Get("VapeDetectionRedundancy"):SendToServer();
    end;

    task.defer(function() -- Line: 32
        -- upvalues: ReplicatedStorage (ref), handleDeletion (copy), default (ref)
        task.wait(20);
        local AnalyticsReportEvent = ReplicatedStorage:FindFirstChild("AnalyticsReportEvent");

        if not AnalyticsReportEvent then
            return handleDeletion();
        end;

        ReplicatedStorage.ChildRemoved:Connect(function(p5) -- Line: 38
            -- upvalues: AnalyticsReportEvent (copy), default (ref)
            if p5 == AnalyticsReportEvent then
                task.wait(math.random(20, 60));
                default.Client:Get("VapeDetectionRedundancy"):SendToServer();
            end;
        end);
    end);
end;

function u1.sendFunnelEvent(p6, p7, p8, p9) -- Line: 45
    -- upvalues: default (copy)
    default.Client:Get("ReportFunnelEvent"):SendToServer(p7, p8, p9);
end;

function u1.sendOnboardingFunnelEvent(p10, p11, p12) -- Line: 48
    p10:sendFunnelEvent("ONBOARDING", p11, {
        customFields = p12
    });
end;

KnitClient.CreateController(u1.new());

return nil;