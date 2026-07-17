-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "ScriptInputController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p4);
    p4.Name = "ScriptInputController";
    p4.trackedKeyCodeSet = {};
    p4.inputBeganConnectionMap = {};
    p4.inputEndedConnectionMap = {};
    p4.lastKeyCodeBeganMap = {};
    p4.lastKeyCodeEndedMap = {};
    p4.inputEvent = default.Client:Get("ScriptTrackedInputEvent");
end;

function u2.KnitStart(u5) -- Line: 32
    -- upvalues: KnitController (copy), default (copy), u1 (copy), UserInputService (copy)
    KnitController.KnitStart(u5);
    default.Client:OnEvent("ScriptStartTrackingInput", function(p6) -- Line: 34
        -- upvalues: u5 (copy), u1 (ref), UserInputService (ref)
        u5.trackedKeyCodeSet[p6.keyCode] = true;
        local v7 = u1.new();
        v7:GiveTask((UserInputService.InputBegan:Connect(function(p8) -- Line: 39
            -- upvalues: u5 (ref)
            local v9 = os.clock();
            local v10 = u5.lastKeyCodeBeganMap[p8.KeyCode];

            if v9 - (v10 == nil and -1 or v10) < 0.005 then
                return nil;
            end;

            u5.lastKeyCodeBeganMap[p8.KeyCode] = os.clock();

            if u5.trackedKeyCodeSet[p8.KeyCode] ~= nil then
                u5.inputEvent:SendToServer({
                    activationTime = "began",
                    keyCode = p8.KeyCode
                });
            end;
        end)));
        u5.inputBeganConnectionMap[p6.keyCode] = v7;
        local v11 = u1.new();
        v11:GiveTask((UserInputService.InputEnded:Connect(function(p12) -- Line: 69
            -- upvalues: u5 (ref)
            local v13 = os.clock();
            local v14 = u5.lastKeyCodeEndedMap[p12.KeyCode];

            if v13 - (v14 == nil and -1 or v14) < 0.005 then
                return nil;
            end;

            u5.lastKeyCodeEndedMap[p12.KeyCode] = os.clock();

            if u5.trackedKeyCodeSet[p12.KeyCode] ~= nil then
                u5.inputEvent:SendToServer({
                    activationTime = "ended",
                    keyCode = p12.KeyCode
                });
            end;
        end)));
        u5.inputEndedConnectionMap[p6.keyCode] = v11;
    end);
    default.Client:OnEvent("ScriptEndTrackingInput", function(p15) -- Line: 99
        -- upvalues: u5 (copy)
        u5.trackedKeyCodeSet[p15.keyCode] = nil;
        local v16 = u5.inputBeganConnectionMap[p15.keyCode];

        if v16 then
            v16:DoCleaning();
            u5.inputBeganConnectionMap[p15.keyCode] = nil;
            u5.lastKeyCodeBeganMap[p15.keyCode] = nil;
        end;

        local v17 = u5.inputEndedConnectionMap[p15.keyCode];

        if v17 then
            v17:DoCleaning();
            u5.inputEndedConnectionMap[p15.keyCode] = nil;
            u5.lastKeyCodeEndedMap[p15.keyCode] = nil;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;