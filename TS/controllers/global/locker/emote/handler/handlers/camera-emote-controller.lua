-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
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
    __tostring = function() -- Line: 17, Name: __tostring
        return "CameraEmoteController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 23
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "CameraEmoteController";
end;

function u1.KnitStart(p4) -- Line: 31
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), GameQueryUtil (copy), WeldUtil (copy), AnimationType (copy), EffectUtil (copy), GameSound (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local CAMERA = EmoteType.CAMERA;
    local u5 = EmoteHandler;
    local u6 = setmetatable({}, {
        __tostring = function() -- Line: 39, Name: __tostring
            return "Anonymous";
        end,

        __index = u5
    });
    u6.__index = u6;

    function u6.new(...) -- Line: 45
        -- upvalues: u6 (ref)
        local v7 = setmetatable({}, u6);

        return v7:constructor(...) or v7;
    end;

    function u6.constructor(p8, ...) -- Line: 49
        -- upvalues: u5 (copy)
        u5.constructor(p8, ...);
    end;

    function u6.onEnable(u9, u10, u11, p12, u13) -- Line: 52
        -- upvalues: ReplicatedStorage (ref), GameQueryUtil (ref), WeldUtil (ref), AnimationType (ref), EffectUtil (ref), GameSound (ref)
        local u14 = ReplicatedStorage.Assets.Misc.Camera:Clone();
        u14.Parent = u11;

        local function _(p15) -- Line: 56
            -- upvalues: GameQueryUtil (ref)
            if p15:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p15, true);
            end;
        end;

        for i, descendant in u14:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        WeldUtil:weldCharacterAccessories(u11);
        local v17 = u9:watchEmoteAnimation(u10, u11, AnimationType.CAUGHT_IN_4K, function(p16) -- Line: 66
            -- upvalues: u13 (copy), EffectUtil (ref), u14 (copy), u9 (copy), GameSound (ref), u10 (copy), u11 (copy)
            if p16 ~= nil then
                p16 = p16:GetMarkerReachedSignal("Flash"):Connect(function() -- Line: 70
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

            u13:GiveTask(p16);
        end);
        u13:GiveTask(function() -- Line: 83
            -- upvalues: u14 (copy)
            u14:Destroy();
        end);
        u13:GiveTask(v17);
    end;

    function u6.onDisable(p18, p19, p20, p21) -- Line: 88
    end;

    EmoteHandlerController:registerHandler(CAMERA, u6);
end;

KnitClient.CreateController(u1.new());

return nil;