-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MurderBedState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderBedState;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local MurderBed = RuntimeLib.import(script, script.Parent, "ui", "murder-bed-progress").MurderBed;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "MurderBedController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "MurderBedController";
end;

function u3.KnitStart(u6) -- Line: 30
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u2 (copy), MurderBed (copy), MurderBedState (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u6);
    WatchCollectionTag("MurderGameBed", function(u7) -- Line: 32
        -- upvalues: u6 (copy), u2 (ref), MurderBed (ref), MurderBedState (ref), SoundManager (ref), GameSound (ref)
        u6.bedProgressTree = u2.mount(u2.createElement(MurderBed, {
            BedStage = 1,
            Progress = 0,
            Adornee = u7,
            BedState = MurderBedState.IDLE
        }), u7);
        u7.AttributeChanged:Connect(function(p8) -- Line: 40
            -- upvalues: u7 (copy), MurderBedState (ref), SoundManager (ref), GameSound (ref), u6 (ref), u2 (ref), MurderBed (ref)
            local v9 = u7:GetAttribute("Progress");
            local v10 = u7:GetAttribute("State");
            local v11 = u7:GetAttribute("Stage");

            if p8 == "State" and v10 == MurderBedState.IDLE then
                SoundManager:playSound(GameSound.FLAG_CAPTURE, {
                    position = u7:GetPivot().Position
                });
            end;

            SoundManager:playSound(GameSound.WOOL_PLACE, {
                position = u7:GetPivot().Position
            });

            if u6.bedProgressTree then
                u6.bedProgressTree = u2.update(u6.bedProgressTree, u2.createElement(MurderBed, {
                    Adornee = u7,
                    BedState = v10,
                    BedStage = v11,
                    Progress = v9
                }));

                return;
            end;

            u6.bedProgressTree = u2.mount(u2.createElement(MurderBed, {
                Adornee = u7,
                BedState = v10,
                BedStage = v11,
                Progress = v9
            }), u7);
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;