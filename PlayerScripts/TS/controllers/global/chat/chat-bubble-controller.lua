-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "ChatBubbleController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "ChatBubbleController";
    p3.chat = game:GetService("Chat");
end;

function u1.KnitStart(u4) -- Line: 25
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("SendChatMesage"):Connect(function(p5) -- Line: 27
        -- upvalues: u4 (copy)
        u4.chat:Chat(p5.part, p5.message);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;