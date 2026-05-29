local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "BlacksmithComponent"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(u7, u8) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    u7.sounds = { "rbxassetid://6878374361", "rbxassetid://6878374328", "rbxassetid://6878374407" }
    local v9 = u8:WaitForChild("blacksmith"):WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(u3("Animation", {
        ["AnimationId"] = "rbxassetid://6898063256"
    }))
    v9.Looped = true
    v9:Play()
    v9:GetMarkerReachedSignal("SwordHit"):Connect(function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
            [3] = u3
            [4] = u8
        --]]
        local v10 = u2.fromList
        local v11 = u7.sounds
        local u12 = u3("Sound", {
            ["RollOffMinDistance"] = 20,
            ["RollOffMaxDistance"] = 40,
            ["Volume"] = 0.06,
            ["Playing"] = true,
            ["SoundId"] = v10(unpack(v11)),
            ["Parent"] = u8
        })
        u12.Ended:Connect(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u12
            --]]
            return u12:Destroy()
        end)
    end)
end
function u4.Destroy(_) --[[ Line: 42 ]] end
u4.Tag = "Blacksmith"
return u4