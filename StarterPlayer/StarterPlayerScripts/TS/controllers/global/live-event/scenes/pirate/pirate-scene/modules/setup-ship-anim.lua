local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
return {
    ["setupShipAnim"] = v1.async(function(p4) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local v5 = p4.AnimationController:WaitForChild("Animator", 2):LoadAnimation(u3:getAnimation(u2.PIRATE_SHIP_FLY))
        v5:Play()
        v5:AdjustSpeed(0.3)
        return v5
    end)
}