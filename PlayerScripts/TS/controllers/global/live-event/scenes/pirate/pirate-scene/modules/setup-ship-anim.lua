-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;

return {
    setupShipAnim = RuntimeLib.async(function(p1) -- Line: 5
        -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
        local v2 = p1.AnimationController:WaitForChild("Animator", 2):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.PIRATE_SHIP_FLY));
        v2:Play();
        v2:AdjustSpeed(0.3);

        return v2;
    end)
};