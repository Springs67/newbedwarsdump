-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local FailureReasonCodes = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "failure-reason-codes").FailureReasonCodes;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 8, Name: __tostring
        return "PermissionsHandler";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 13
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5) -- Line: 17
    p3.requiredPermissions = p4;
    p3.minViewableLogLevel = p5;
end;

function u1.handle(p6, p7) -- Line: 21
    -- upvalues: KnitClient (copy), FailureReasonCodes (copy)
    local PermissionController = KnitClient.Controllers.PermissionController;

    return not PermissionController and {
        success = false,
        failureReason = FailureReasonCodes.InvalidEnvironment
    } or ((PermissionController:hasAnyPermissions(p6.requiredPermissions) or p7.Level >= p6.minViewableLogLevel) and {
        success = true,
        logEvent = p7
    } or {
        success = false,
        failureReason = FailureReasonCodes.InvalidEnvironment
    });
end;

return {
    PermissionsHandler = u1
};