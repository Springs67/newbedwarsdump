-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutQuint = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuint;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "DarkFlurryController";
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
    p3.Name = "DarkFlurryController";
end;

function u1.KnitStart(p4) -- Line: 29
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), GameSound (copy), default (copy), OutQuint (copy), Workspace (copy)
    KnitController.KnitStart(p4);
    default2.Client:GetNamespace("WarlockBoss"):Get("WarlockDarkFlurry"):Connect(function(p5) -- Line: 31
        -- upvalues: SoundManager (ref), GameSound (ref), default (ref), OutQuint (ref), Workspace (ref)
        local bossEntityInstance = p5.bossEntityInstance;
        local targetCFrame = p5.targetCFrame;
        local originalCFrame = p5.originalCFrame;
        local finishedAt = p5.finishedAt;
        local numBolts = p5.numBolts;
        task.spawn(function() -- Line: 37
            -- upvalues: numBolts (copy), SoundManager (ref), GameSound (ref), originalCFrame (copy)
            local v6 = false;
            local v7 = 0;

            while true do
                if v6 then
                    v7 = v7 + 1;
                else
                    v6 = true;
                end;

                if v7 >= numBolts then
                    return;
                end;

                SoundManager:playSound(GameSound.DARK_BOLT_SHOOT, {
                    rollOffMaxDistance = 300,
                    volumeMultiplier = 9,
                    position = originalCFrame.Position,
                    playbackSpeedMultiplier = 0.1 * (v7 / numBolts) + 1
                });
                task.wait(1 / numBolts);
            end;
        end);
        default(0.5, OutQuint, function(p8) -- Line: 61
            -- upvalues: bossEntityInstance (copy)
            bossEntityInstance:PivotTo(p8);
        end, bossEntityInstance:GetPivot(), targetCFrame);
        local v9 = finishedAt - Workspace:GetServerTimeNow();
        task.delay(v9, function() -- Line: 65
            -- upvalues: default (ref), OutQuint (ref), bossEntityInstance (copy), originalCFrame (copy)
            default(0.5, OutQuint, function(p10) -- Line: 67
                -- upvalues: bossEntityInstance (ref)
                bossEntityInstance:PivotTo(p10);
            end, bossEntityInstance:GetPivot(), originalCFrame);
        end);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;