local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out")
local v3 = v2.default
local v4 = v2.LogLevel
local v5 = v1.import(script, script.Parent.Parent, "logger", "server-log-event-sink").ServerLogEventSink
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "log-level-handler").LogLevelHandler
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "log-sink-handler-chain").LogSinkHandlerChain
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "log-spam-handler").LogSpamHandler
return {
    ["ClientToServerLogSink"] = v7.new(v5.new(), false):withHandler(v6.new(v4.Error)):withHandler(v8.new(10)),
    ["LimitedRobloxLogSink"] = v7.new(v3.RobloxOutput({
        ["TagFormat"] = "full"
    }), true):withHandler(v6.new(v4.Information, v4.Fatal, true))
}