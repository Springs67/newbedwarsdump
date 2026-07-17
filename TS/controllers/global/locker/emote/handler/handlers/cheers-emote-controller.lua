-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "CheersEmoteController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "CheersEmoteController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), WeldUtil (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local CHEERS_BOTTLE = EmoteType.CHEERS_BOTTLE;
    local u5 = EmoteHandler;
    local u6 = setmetatable({}, {
        __tostring = function() -- Line: 35, Name: __tostring
            return "Anonymous";
        end,

        __index = u5
    });
    u6.__index = u6;

    function u6.new(...) -- Line: 41
        -- upvalues: u6 (ref)
        local v7 = setmetatable({}, u6);

        return v7:constructor(...) or v7;
    end;

    function u6.constructor(p8, ...) -- Line: 45
        -- upvalues: u5 (copy)
        u5.constructor(p8, ...);
    end;

    function u6.onEnable(u9, u10, u11, p12, u13) -- Line: 48
        -- upvalues: ReplicatedStorage (ref), WeldUtil (ref)
        local u14 = ReplicatedStorage.Assets.Misc.SparklingAppleJuice:Clone();
        u14.Parent = u11;
        u9:setupInstance(u14);
        WeldUtil:weldCharacterAccessories(u11);
        u13:GiveTask(task.delay(1, function() -- Line: 54
            -- upvalues: u13 (copy), u9 (copy), u10 (copy), u11 (copy)
            u13:GiveTask(u9:playSound("rbxassetid://10722059", u10, {
                position = u11:GetPivot().Position
            }));
        end));
        u13:GiveTask(function() -- Line: 59
            -- upvalues: u14 (copy)
            u14:Destroy();
        end);
    end;

    function u6.onDisable(p15, p16, p17, p18) -- Line: 63
    end;

    EmoteHandlerController:registerHandler(CHEERS_BOTTLE, u6);
end;

KnitClient.CreateController(u1.new());

return nil;