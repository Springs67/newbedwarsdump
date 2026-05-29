local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "message-templates", "out")
local u3 = v2.MessageTemplateParser
local u4 = v2.PlainTextMessageTemplateRenderer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "extra-log-data").ExtraLogDataProperties
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "ServerLogEventSink"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 24 ]]
    p10.defaultNamespace = "ClientUnknown"
end
function u7.Emit(p11, p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u3
        [4] = u6
    --]]
    local v13 = p12[u5.Namespace]
    if v13 == nil then
        v13 = p11.defaultNamespace
    end
    local v14 = tostring(v13)
    local v15 = u4.new(u3.GetTokens(p12.Template)):Render(p12)
    u6.Client:Get("LogMessage"):CallServerAsync(v15, v14, p12.Level)
end
return {
    ["ServerLogEventSink"] = u7
}