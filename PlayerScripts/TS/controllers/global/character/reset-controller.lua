-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v2.RunService;
local StarterGui = v2.StarterGui;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "ResetController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "ResetController";
end;

function u3.KnitStart(p6) -- Line: 32
    -- upvalues: PlaceUtil (copy), KnitClient2 (copy), getQueueMeta (copy), u3 (copy), RuntimeLib (copy), StarterGui (copy), RunService (copy)
    local u7;

    if PlaceUtil.isGameServer() then
        local v8, v9 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();
        local v10 = v8;

        if v10 then
            v10 = getQueueMeta(v9);

            if v10 ~= nil then
                v10 = v10.disableCharacterReset;
            end;
        end;

        if v10 then
            u7 = false;
        else
            u7 = u3:createBindable();
        end;
    else
        u7 = u3:createBindable();
    end;

    local u11 = false;

    while not u11 do
        RuntimeLib.try(function() -- Line: 54
            -- upvalues: StarterGui (ref), u7 (ref), u11 (ref)
            StarterGui:SetCore("ResetButtonCallback", u7);
            u11 = true;
        end, function(p12) -- Line: 57
        end);
        RunService.Stepped:Wait();
    end;
end;

function u3.createBindable(p13) -- Line: 61
    -- upvalues: default (copy)
    local BindableEvent = Instance.new("BindableEvent");
    BindableEvent.Event:Connect(function() -- Line: 63
        -- upvalues: default (ref)
        default.Client:Get("ResetCharacter"):SendToServer();
    end);

    return BindableEvent;
end;

KnitClient.CreateController(u3.new());

return nil;