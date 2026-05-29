local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").LogLevel
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "failure-reason-codes").FailureReasonCodes
local u8 = nil
local u9 = nil
local function v11(p10) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
    --]]
    if p10 >= 0 and p10 <= u2.Fatal then
        u8 = p10
    end
end
local function v13(p12) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
    --]]
    if p12 >= 0 and p12 <= u2.Fatal then
        u9 = p12
    end
end
local function v15() --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u2
        [4] = u8
    --]]
    local v14 = u5(u4.LogLevel)
    if v14 ~= nil and (v14 >= 0 and v14 <= u2.Fatal) then
        u8 = v14
    end
end
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "LogLevelHandler"
    end
})
u16.__index = u16
function u16.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, p20, p21, p22) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u6
        [4] = u8
        [5] = u9
    --]]
    if p20 == nil then
        p20 = u2.Information
    end
    if p21 == nil then
        p21 = u2.Fatal
    end
    if p22 == nil then
        p22 = false
    end
    p19.minLogLevel = p20
    p19.maxLogLevel = p21
    p19.overridable = p22
    if p22 and u3:IsClient() then
        u6.Client:Get("OverrideConsoleOutputLogLevel"):Connect(function(p23) --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u8
                [3] = u9
            --]]
            if p23.minLogLevel ~= nil then
                local v24 = p23.minLogLevel
                if v24 >= 0 and v24 <= u2.Fatal then
                    u8 = v24
                end
            end
            if p23.maxLogLevel ~= nil then
                local v25 = p23.maxLogLevel
                if v25 >= 0 and v25 <= u2.Fatal then
                    u9 = v25
                end
            end
        end)
    end
end
function u16.handle(p26, p27) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u7
    --]]
    if p26.overridable and (p26.minLogLevel == nil and u8 ~= nil) then
        p26.minLogLevel = u8
    end
    if p26.overridable and (p26.maxLogLevel == nil and u9 ~= nil) then
        p26.maxLogLevel = u9
    end
    local v28
    if p26.overridable then
        v28 = u8
        if v28 == nil then
            v28 = p26.minLogLevel
        end
    else
        v28 = p26.minLogLevel
    end
    local v29
    if p26.overridable then
        v29 = u9
        if v29 == nil then
            v29 = p26.maxLogLevel
        end
    else
        v29 = p26.maxLogLevel
    end
    return p27.Level < v28 and {
        ["success"] = false,
        ["failureReason"] = u7.MinLogLevelNotMet
    } or (v29 < p27.Level and {
        ["success"] = false,
        ["failureReason"] = u7.MaxLogLevelNotMet
    } or {
        ["success"] = true,
        ["logEvent"] = p27
    })
end
return {
    ["setOverrideMinLogLevel"] = v11,
    ["setOverrideMaxLogLevel"] = v13,
    ["applyLogLevelConfig"] = v15,
    ["LogLevelHandler"] = u16
}