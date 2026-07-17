-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WorldId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "world-id").WorldId;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "VoidWorldMusicController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "VoidWorldMusicController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy), u1 (copy), KnitClient (copy), WorldId (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p5);
    local u6 = u1.new();
    KnitClient.Controllers.WorldController:watchLocalWorld(function(p7) -- Line: 30
        -- upvalues: WorldId (ref), SoundManager (ref), GameSound (ref), u6 (copy)
        if p7 ~= nil then
            p7 = p7.Name;
        end;

        if p7 ~= WorldId.VOID_WORLD then
            u6:DoCleaning();

            return;
        end;

        local u8 = SoundManager:playSound(GameSound.VOID_THEME_SONG, {
            fadeInTime = 2
        });
        u6:GiveTask(function() -- Line: 39
            -- upvalues: u8 (copy)
            local v9 = u8;

            if v9 ~= nil then
                v9:Stop();
            end;
        end);
    end);
end;

function u2.playVoidWorldMusic(p10) -- Line: 50
    -- upvalues: SoundManager (copy), GameSound (copy)
    return SoundManager:playSound(GameSound.VOID_THEME_SONG, {
        fadeInTime = 2
    });
end;

KnitClient.CreateController(u2.new());

return nil;