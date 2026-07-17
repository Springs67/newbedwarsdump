-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "ThirstyEmoteController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 21
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "ThirstyEmoteController";
end;

function u1.KnitStart(p4) -- Line: 29
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), WeldUtil (copy), AnimationType (copy), GameSound (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local THIRSTY = EmoteType.THIRSTY;
    local u5 = EmoteHandler;
    local u6 = setmetatable({}, {
        __tostring = function() -- Line: 37, Name: __tostring
            return "Anonymous";
        end,

        __index = u5
    });
    u6.__index = u6;

    function u6.new(...) -- Line: 43
        -- upvalues: u6 (ref)
        local v7 = setmetatable({}, u6);

        return v7:constructor(...) or v7;
    end;

    function u6.constructor(p8, ...) -- Line: 47
        -- upvalues: u5 (copy)
        u5.constructor(p8, ...);
    end;

    function u6.onEnable(u9, u10, u11, p12, u13) -- Line: 50
        -- upvalues: ReplicatedStorage (ref), WeldUtil (ref), AnimationType (ref), GameSound (ref)
        local u14 = ReplicatedStorage.Assets.Misc.Flask:Clone();
        u14.Parent = u11;
        u9:setupInstance(u14);
        WeldUtil:weldCharacterAccessories(u11);
        u13:GiveTask(u9:watchEmoteAnimation(u10, u11, AnimationType.THIRSTY_EMOTE, function(p15) -- Line: 55
            -- upvalues: u13 (copy), u9 (copy), GameSound (ref), u10 (copy), u11 (copy)
            if p15 ~= nil then
                p15 = p15:GetMarkerReachedSignal("unscrew"):Connect(function() -- Line: 59
                    -- upvalues: u9 (ref), GameSound (ref), u10 (ref), u11 (ref)
                    u9:playSound(GameSound.FLASK_UNSCREW, u10, {
                        rollOffMaxDistance = 50,
                        position = u11:GetPivot().Position
                    });
                end);
            end;

            u13:GiveTask(p15);
        end));
        u13:GiveTask(function() -- Line: 68
            -- upvalues: u14 (copy)
            u14:Destroy();
        end);
    end;

    function u6.onDisable(p16, p17, p18, p19) -- Line: 72
    end;

    EmoteHandlerController:registerHandler(THIRSTY, u6);
end;

KnitClient.CreateController(u1.new());

return nil;