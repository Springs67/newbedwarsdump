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
        return "IcyDelightEmoteController";
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
    p3.Name = "IcyDelightEmoteController";
end;

function u1.KnitStart(p4) -- Line: 31
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), EffectUtil (copy), GameQueryUtil (copy), WeldUtil (copy), AnimationType (copy), GameSound (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local ICY_DELIGHT = EmoteType.ICY_DELIGHT;
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
        -- upvalues: ReplicatedStorage (ref), EffectUtil (ref), GameQueryUtil (ref), WeldUtil (ref), AnimationType (ref), GameSound (ref)
        local u14 = ReplicatedStorage.Assets.Misc.IcyDelight:Clone();
        EffectUtil:scaleEffect({ u14.Handle.SnowBlast }, 0.3);
        EffectUtil:scaleEffect({ u14.Handle.SnowPoof }, 0.6);
        u14.Parent = u11;

        local function _(p15) -- Line: 58
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
        u13:GiveTask(u9:watchEmoteAnimation(u10, u11, AnimationType.ICY_DELIGHT, function(p16) -- Line: 67
            -- upvalues: u13 (copy), EffectUtil (ref), u14 (copy), u9 (copy), GameSound (ref), u10 (copy), u11 (copy)
            local v17;

            if p16 == nil then
                v17 = p16;
            else
                v17 = p16:GetMarkerReachedSignal("Lick"):Connect(function() -- Line: 71
                    -- upvalues: EffectUtil (ref), u14 (ref), u9 (ref), GameSound (ref), u10 (ref), u11 (ref)
                    EffectUtil:playEffects({ u14.Handle.SnowBlast }, nil, {});
                    u9:playSound(GameSound.ICY_DELIGHT_LICK, u10, {
                        rollOffMaxDistance = 50,
                        position = u11:GetPivot().Position
                    });
                end);
            end;

            u13:GiveTask(v17);
            local v18;

            if p16 == nil then
                v18 = p16;
            else
                v18 = p16:GetMarkerReachedSignal("PoofStart"):Connect(function() -- Line: 84
                    -- upvalues: EffectUtil (ref), u14 (ref), u9 (ref), GameSound (ref), u10 (ref), u11 (ref)
                    EffectUtil:playEffects({ u14.Handle.SnowPoof }, nil, {
                        destroyAfterSec = 0.8
                    });
                    u9:playSound(GameSound.SATELLITE_INTERACT, u10, {
                        rollOffMaxDistance = 50,
                        volumeMultiplier = 0.4,
                        playbackSpeedMultiplier = 2,
                        position = u11:GetPivot().Position
                    });
                end);
            end;

            u13:GiveTask(v18);

            if p16 ~= nil then
                p16 = p16:GetMarkerReachedSignal("PoofEnd"):Connect(function() -- Line: 100
                end);
            end;

            u13:GiveTask(p16);
        end));
        u13:GiveTask(function() -- Line: 104
            -- upvalues: u14 (copy)
            u14:Destroy();
        end);
    end;

    function u6.onDisable(p19, p20, p21, p22) -- Line: 108
    end;

    EmoteHandlerController:registerHandler(ICY_DELIGHT, u6);
end;

KnitClient.CreateController(u1.new());

return nil;