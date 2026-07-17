-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "BunnySideToSideEmoteHandlerController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BunnySideToSideEmoteHandlerController";
end;

function u2.KnitStart(p5) -- Line: 31
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local BUNNY_SIDE_TO_SIDE = EmoteType.BUNNY_SIDE_TO_SIDE;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 39, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 45
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 49
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(p10, u11, u12, p13, u14) -- Line: 52
        -- upvalues: WatchCharacterAnimation (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
        u14:GiveTask((WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.BUNNY_SIDE_TO_SIDE) }, function(p15, p16) -- Line: 53
            -- upvalues: u11 (copy), u14 (copy), u12 (copy), SoundManager (ref), GameSound (ref)
            if p15.UserId ~= u11 then
                return nil;
            end;

            if p16 ~= nil then
                p16 = p16:GetMarkerReachedSignal("bounce"):Connect(function() -- Line: 60
                    -- upvalues: u12 (ref), SoundManager (ref), GameSound (ref)
                    if not u12.PrimaryPart then
                        return nil;
                    end;

                    SoundManager:playSound(GameSound.POGO_BOUNCE, {
                        volumeMultiplier = 0.3,
                        position = u12.PrimaryPart.Position
                    });
                end);
            end;

            u14:GiveTask(p16);
        end)));
    end;

    function u7.onDisable(p17, p18, p19, p20) -- Line: 74
    end;

    EmoteHandlerController:registerHandler(BUNNY_SIDE_TO_SIDE, u7);
end;

KnitClient.CreateController(u2.new());

return nil;