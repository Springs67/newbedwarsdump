local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType
return {
    ["getShieldColor"] = function(p2) --[[ Name: getShieldColor, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == u1.TINKER_MACHINE then
            return ColorSequence.new(Color3.fromRGB(255, 112, 0), Color3.fromRGB(252, 153, 0))
        elseif p2 == u1.FINAL_STAND then
            return ColorSequence.new(Color3.fromRGB(255, 18, 0), Color3.fromRGB(252, 0, 0))
        else
            return ColorSequence.new(Color3.fromRGB(240, 240, 240), Color3.fromRGB(199, 199, 199))
        end
    end
}