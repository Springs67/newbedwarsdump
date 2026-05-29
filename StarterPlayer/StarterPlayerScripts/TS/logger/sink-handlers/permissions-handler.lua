local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "failure-reason-codes").FailureReasonCodes
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "PermissionsHandler"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, p8, p9) --[[ Line: 17 ]]
    p7.requiredPermissions = p8
    p7.minViewableLogLevel = p9
end
function u4.handle(p10, p11) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v12 = u2.Controllers.PermissionController
    return not v12 and {
        ["success"] = false,
        ["failureReason"] = u3.InvalidEnvironment
    } or ((v12:hasAnyPermissions(p10.requiredPermissions) or p11.Level >= p10.minViewableLogLevel) and {
        ["success"] = true,
        ["logEvent"] = p11
    } or {
        ["success"] = false,
        ["failureReason"] = u3.InvalidEnvironment
    })
end
return {
    ["PermissionsHandler"] = u4
}