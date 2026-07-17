-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "SwimmingEmoteEmoteController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "SwimmingEmoteEmoteController";
end;

function u1.KnitStart(p4) -- Line: 28
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), SoundManager (copy), GameSound (copy), BLOCK_SIZE (copy)
    KnitController.KnitStart(p4);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local SWIMMING_EMOTE = EmoteType.SWIMMING_EMOTE;
    local u5 = EmoteHandler;
    local u6 = setmetatable({}, {
        __tostring = function() -- Line: 36, Name: __tostring
            return "Anonymous";
        end,

        __index = u5
    });
    u6.__index = u6;

    function u6.new(...) -- Line: 42
        -- upvalues: u6 (ref)
        local v7 = setmetatable({}, u6);

        return v7:constructor(...) or v7;
    end;

    function u6.constructor(p8, ...) -- Line: 46
        -- upvalues: u5 (copy)
        u5.constructor(p8, ...);
    end;

    function u6.onEnable(p9, p10, u11, p12, p13) -- Line: 49
        -- upvalues: SoundManager (ref), GameSound (ref), BLOCK_SIZE (ref)
        local u14 = true;
        local u16 = task.spawn(function() -- Line: 51
            -- upvalues: u14 (ref), u11 (copy), SoundManager (ref), GameSound (ref), BLOCK_SIZE (ref)
            while true do
                local v15 = u14 and task.wait(math.random() * 1 + 0.15);

                if v15 == 0 or (v15 ~= v15 or not v15) then
                    return;
                end;

                local PrimaryPart = u11.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                if PrimaryPart then
                    SoundManager:playSound(GameSound.WAND_BUBBLE_POP, {
                        volumeMultiplier = 0.05,
                        position = PrimaryPart,
                        rollOffMinDistance = BLOCK_SIZE * 2,
                        rollOffMaxDistance = BLOCK_SIZE * 10,
                        playbackSpeedMultiplier = 1 + math.random()
                    });
                end;
            end;
        end);
        p13:GiveTask(function() -- Line: 74
            -- upvalues: u14 (ref), u16 (copy)
            u14 = false;
            task.cancel(u16);
        end);
    end;

    function u6.onDisable(p17, p18, p19, p20) -- Line: 79
    end;

    EmoteHandlerController:registerHandler(SWIMMING_EMOTE, u6);
end;

KnitClient.CreateController(u1.new());

return nil;