local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Disambiguator
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "failure-reason-codes").FailureReasonCodes
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "LogSampleHandler"
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
    --[[
    Upvalues:
        [1] = u2
    --]]
    p7.sampleRate = p8
    p7.minOverrideLogLevel = p9
    local v10 = u2.hashDisambiguators({ game.JobId })
    p7.shouldSend = Random.new(v10):NextNumber() < p7.sampleRate
end
function u4.handle(p11, p12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v13 = p11.shouldSend
    if not v13 then
        v13 = p11.minOverrideLogLevel
        if v13 ~= 0 and (v13 == v13 and v13) then
            v13 = p12.Level >= p11.minOverrideLogLevel
        end
    end
    return (v13 == 0 or (v13 ~= v13 or not v13)) and {
        ["success"] = false,
        ["failureReason"] = u3.SampleRate
    } or {
        ["success"] = true,
        ["logEvent"] = p12
    }
end
return {
    ["LogSampleHandler"] = u4
}