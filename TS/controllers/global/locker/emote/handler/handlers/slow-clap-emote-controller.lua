-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ExpireList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ExpireList;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "SlowClapEmoteController";
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
    p3.Name = "SlowClapEmoteController";
end;

function u1.KnitStart(p4) -- Line: 30
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ExpireList (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), GameSound (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local SLOW_CLAP = EmoteType.SLOW_CLAP;
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
        -- upvalues: u5 (copy), ExpireList (ref)
        u5.constructor(p8, ...);
        p8.clapCooldowns = ExpireList.new(1);
    end;

    function u6.onEnable(u9, u10, u11, p12, u13) -- Line: 52
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref), Players (ref), GameSound (ref)
        u13:GiveTask((u11.Humanoid.Animator.AnimationPlayed:Connect(function(p14) -- Line: 54
            -- upvalues: GameAnimationUtil (ref), AnimationType (ref), u9 (copy), u10 (copy), Players (ref), GameSound (ref), u11 (copy), u13 (copy)
            local Animation = p14.Animation;

            if Animation ~= nil then
                Animation = Animation.AnimationId;
            end;

            if Animation == GameAnimationUtil:getAssetId(AnimationType.SLOW_CLAP) then
                if u9.clapCooldowns:has(u10) and u10 ~= Players.LocalPlayer.UserId then
                    return nil;
                end;

                u9.clapCooldowns:add(u10);
                u13:GiveTask((p14:GetMarkerReachedSignal("Clap"):Connect(function() -- Line: 64
                    -- upvalues: u9 (ref), GameSound (ref), u10 (ref), u11 (ref)
                    u9:playSound(GameSound.HAND_CLAP, u10, {
                        rollOffMaxDistance = 50,
                        volumeMultiplier = 0.25,
                        position = u11:GetPivot().Position
                    });
                end)));
            end;
        end)));
    end;

    function u6.onDisable(p15, p16, p17, p18) -- Line: 76
    end;

    EmoteHandlerController:registerHandler(SLOW_CLAP, u6);
end;

KnitClient.CreateController(u1.new());

return nil;