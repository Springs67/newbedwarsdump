-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out");
local default = v1.default;
local LogLevel = v1.LogLevel;
local ServerLogEventSink = RuntimeLib.import(script, script.Parent.Parent, "logger", "server-log-event-sink").ServerLogEventSink;
local LogLevelHandler = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "log-level-handler").LogLevelHandler;
local LogSinkHandlerChain = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "log-sink-handler-chain").LogSinkHandlerChain;
local LogSpamHandler = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "sink-handlers", "log-spam-handler").LogSpamHandler;

return {
    ClientToServerLogSink = LogSinkHandlerChain.new(ServerLogEventSink.new(), false):withHandler(LogLevelHandler.new(LogLevel.Error)):withHandler(LogSpamHandler.new(10)),
    LimitedRobloxLogSink = LogSinkHandlerChain.new(default.RobloxOutput({
        TagFormat = "full"
    }), true):withHandler(LogLevelHandler.new(LogLevel.Information, LogLevel.Fatal, true))
};