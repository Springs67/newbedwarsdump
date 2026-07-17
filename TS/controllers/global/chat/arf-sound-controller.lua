-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "ArfController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "ArfController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), default (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p4);
    local u5 = os.clock();
    default.Client:Get("ArfChatMessage"):Connect(function(p6) -- Line: 29
        -- upvalues: u5 (ref), SoundManager (ref), GameSound (ref)
        local Character = p6.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if not Character then
            return nil;
        end;

        if os.clock() - u5 < 0.5 then
            return nil;
        end;

        u5 = os.clock();
        task.delay(0.3, function() -- Line: 42
            -- upvalues: SoundManager (ref), GameSound (ref), Character (copy)
            print(32);
            SoundManager:playSound(GameSound.VOICE_ARF, {
                position = Character
            });
        end);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;