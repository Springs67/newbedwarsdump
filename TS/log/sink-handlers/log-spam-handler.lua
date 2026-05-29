local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireMap
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "Util", "TableUtil").EncodeJSON
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").LogLevel
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "message-templates", "out")
local u6 = v5.MessageTemplateParser
local u7 = v5.PlainTextMessageTemplateRenderer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "extra-log-data").extractExtraLogData
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "failure-reason-codes").FailureReasonCodes
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "LogSpamHandler"
    end
})
u10.__index = u10
function u10.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13, p14, p15) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    if p15 == nil then
        p15 = u4.Error
    end
    p13.timeoutSeconds = p14
    p13.maxLogLevel = p15
    p13.sentLogs = u2.new(p14)
end
function u10.handle(p16, p17) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u3
        [4] = u8
        [5] = u9
    --]]
    if p17.Level <= p16.maxLogLevel then
        local v18 = u7.new(u6.GetTokens(p17.Template)):Render(p17) .. u3(u8(p17))
        if p16.sentLogs:has(v18) then
            return {
                ["success"] = false,
                ["failureReason"] = u9.Spam
            }
        end
        p16.sentLogs:set(v18, nil)
    end
    return {
        ["success"] = true,
        ["logEvent"] = p17
    }
end
return {
    ["LogSpamHandler"] = u10
}