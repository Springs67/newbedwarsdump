local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.Signal
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "ScriptSyncController"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
    --]]
    u5.constructor(p10)
    p10.Name = "ScriptSyncController"
    p10.tokenRequested = false
    p10.syncTokenGenerated = u4.new()
end
function u7.KnitStart(u11) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    u6.Client:OnEvent("ScriptSyncEnabled", function(p12) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11.syncToken = p12.syncToken
        u11.syncTokenGenerated:Fire(p12.syncToken)
    end)
    u5.KnitStart(u11)
end
function u7.sendSyncEnableRequest(p13) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if not p13.tokenRequested then
        p13.tokenRequested = true
        u6.Client:Get("ScriptSyncEnableRequest"):SendToServer()
    end
end
v3.CreateController(u7.new())
return nil