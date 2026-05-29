local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ServerStorage
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
return {
    ["MonsterUtil"] = {
        ["SPAWNS_ENABLED"] = true,
        ["PATH_VISUALIZER_ENABLED"] = false,
        ["setupDefaultAnimations"] = function(p4, p5) --[[ Name: setupDefaultAnimations, Line 13 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
            --]]
            local u6 = u2.Assets.Misc.AnimateServerScript:Clone()
            u6.Parent = p4
            u6.run.RunAnim.AnimationId = u3:getAssetId(p5.walk)
            u6.jump.JumpAnim.AnimationId = u3:getAssetId(p5.jump)
            u6.idle.Animation1.AnimationId = u3:getAssetId(p5.idle)
            local v7 = p5.attack
            if v7 ~= 0 and (v7 == v7 and v7) then
                p4:SetAttribute("AttackAnimId", u3:getAssetId(p5.attack))
            end
            return {
                ["animateScript"] = u6,
                ["enable"] = function() --[[ Name: enable, Line 25 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                    --]]
                    u6.Disabled = false
                end
            }
        end
    }
}