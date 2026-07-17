-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "TakeSelfieEmoteController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 22
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "TakeSelfieEmoteController";
end;

function u1.KnitStart(p4) -- Line: 30
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), WeldUtil (copy), AnimationType (copy), EffectUtil (copy), GameSound (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local TAKE_SELFIE = EmoteType.TAKE_SELFIE;
    local u5 = EmoteHandler;
    local u6 = setmetatable({}, {
        __tostring = function() -- Line: 38, Name: __tostring
            return "Anonymous";
        end,

        __index = u5
    });
    u6.__index = u6;

    function u6.new(...) -- Line: 44
        -- upvalues: u6 (ref)
        local v7 = setmetatable({}, u6);

        return v7:constructor(...) or v7;
    end;

    function u6.constructor(p8, ...) -- Line: 48
        -- upvalues: u5 (copy)
        u5.constructor(p8, ...);
    end;

    function u6.onEnable(u9, u10, u11, p12, u13) -- Line: 51
        -- upvalues: ReplicatedStorage (ref), WeldUtil (ref), AnimationType (ref), EffectUtil (ref), GameSound (ref)
        local u14 = ReplicatedStorage.Assets.Misc.SelfiePhone:Clone();
        u14.Parent = u11;
        u9:setupInstance(u14);
        WeldUtil:weldCharacterAccessories(u11);
        u13:GiveTask(u9:watchEmoteAnimation(u10, u11, AnimationType.TAKE_SELFIE, function(p15) -- Line: 58
            -- upvalues: u13 (copy), EffectUtil (ref), u14 (copy), u9 (copy), GameSound (ref), u10 (copy), u11 (copy)
            local v16;

            if p15 == nil then
                v16 = p15;
            else
                v16 = p15:GetMarkerReachedSignal("take_photo"):Connect(function() -- Line: 62
                    -- upvalues: EffectUtil (ref), u14 (ref), u9 (ref), GameSound (ref), u10 (ref), u11 (ref)
                    EffectUtil:playEffects({ u14.Handle.Flash.Flash }, nil, {
                        destroyAfterSec = 1
                    });
                    u9:playSound(GameSound.CAMERA_FLASH, u10, {
                        rollOffMaxDistance = 55,
                        position = u11:GetPivot().Position
                    });
                end);
            end;

            u13:GiveTask(v16);

            if p15 ~= nil then
                p15 = p15:GetMarkerReachedSignal("remove_phone"):Connect(function() -- Line: 77
                    -- upvalues: u14 (ref)
                    if u14 then
                        u14:Destroy();
                    end;
                end);
            end;

            u13:GiveTask(p15);
        end));
        u13:GiveTask(function() -- Line: 85
            -- upvalues: u14 (copy)
            if u14 then
                u14:Destroy();
            end;
        end);
    end;

    function u6.onDisable(p17, p18, p19, p20) -- Line: 91
    end;

    EmoteHandlerController:registerHandler(TAKE_SELFIE, u6);
end;

KnitClient.CreateController(u1.new());

return nil;