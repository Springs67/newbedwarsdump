-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "message-templates", "out");
local MessageTemplateParser = v1.MessageTemplateParser;
local PlainTextMessageTemplateRenderer = v1.PlainTextMessageTemplateRenderer;
local ExtraLogDataProperties = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "extra-log-data").ExtraLogDataProperties;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "ServerLogEventSink";
    end
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    p4.defaultNamespace = "ClientUnknown";
end;

function u2.Emit(p5, p6) -- Line: 27
    -- upvalues: ExtraLogDataProperties (copy), PlainTextMessageTemplateRenderer (copy), MessageTemplateParser (copy), default (copy)
    local v7 = p6[ExtraLogDataProperties.Namespace];

    if v7 == nil then
        v7 = p5.defaultNamespace;
    end;

    local v8 = tostring(v7);
    local v9 = PlainTextMessageTemplateRenderer.new(MessageTemplateParser.GetTokens(p6.Template)):Render(p6);
    default.Client:Get("LogMessage"):CallServerAsync(v9, v8, p6.Level);
end;

return {
    ServerLogEventSink = u2
};