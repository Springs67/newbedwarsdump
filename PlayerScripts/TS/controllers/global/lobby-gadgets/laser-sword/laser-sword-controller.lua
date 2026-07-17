-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local laserColorSelect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "laser-sword", "laser-sword-table").laserColorSelect;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "LaserSwordController";
    end,

    __index = HandKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 22
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 26
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p3);
    p3.Name = "LaserSwordController";
end;

function u1.isRelevantItem(p4, p5) -- Line: 30
    -- upvalues: ItemType (copy)
    return p5.itemType == ItemType.LASER_SWORD;
end;

function u1.onEnable(p6, u7, p8) -- Line: 33
    -- upvalues: SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), laserColorSelect (copy)
    SoundManager:playSound(GameSound.LASER_SWORD_EQUIP);
    p6:setupYield(function() -- Line: 36
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), laserColorSelect (ref), u7 (copy)
        local u9 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.WIZARD_BALL_CAST, {});
        task.spawn(function() -- Line: 38
            -- upvalues: laserColorSelect (ref), u7 (ref)
            local v10 = laserColorSelect:selectRandom();

            for _, descendant in u7.tool:GetDescendants() do
                if descendant:IsA("BasePart") then
                    if descendant.Name == "Inner" then
                        descendant.Color = v10.inner;
                    end;

                    if descendant.Name == "Outer" then
                        descendant.Color = v10.outer;
                    end;
                end;

                if descendant:IsA("Trail") then
                    descendant.Color = v10.trail;
                end;

                if descendant:IsA("Beam") then
                    descendant.Color = v10.trail;
                end;
            end;
        end);

        return function() -- Line: 57
            -- upvalues: u9 (copy)
            local v11 = u9;

            if v11 ~= nil then
                v11:Stop();
            end;
        end;
    end);
end;

function u1.onDisable(p12) -- Line: 65
    -- upvalues: SoundManager (copy), GameSound (copy)
    SoundManager:playSound(GameSound.LASER_SWORD_DEEQUIP);
end;

function u1.KnitStart(p13) -- Line: 68
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy)
    HandKnitController.KnitStart(p13);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.LASER_SWORD, {
        animations = { AnimationType.LASER_SWORD_SWING_2, AnimationType.LASER_SWORD_SWING_1, AnimationType.WIZARD_BALL_CAST },
        sounds = { GameSound.LASER_SWORD_SWING_1, GameSound.LASER_SWORD_SWING_2, GameSound.LASER_SWORD_SWING_3 }
    });
end;

KnitClient.CreateController(u1.new());

return nil;