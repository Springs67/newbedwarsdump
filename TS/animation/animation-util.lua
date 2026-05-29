local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "definitions", "prod-animations").ProdAnimations
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "GameAnimationUtil"
    end
})
u5.__index = u5
function u5.new(...) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(_) --[[ Line: 18 ]] end
function u5.getAssetId(_, p8) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4[p8]
end
function u5.getAnimation(_, p9) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    return u3("Animation", {
        ["AnimationId"] = u5:getAssetId(p9)
    })
end
function u5.getAnimationFromCharacter(_, p10, p11) --[[ Line: 32 ]]
    local v12 = p10:FindFirstChild("Animate", true)
    if v12 ~= nil then
        v12 = v12:FindFirstChild(p11)
    end
    local v13 = nil
    local v14 = 0
    if v12 ~= nil then
        for v15, v16 in v12:GetChildren() do
            local _ = v15 - 1
            local v17 = v16:FindFirstChild("Weight").Value
            if v14 < v17 then
                local v18 = v16
                local v19 = v17
                v13 = v18
                v14 = v19
            end
        end
    end
    return v13
end
function u5.playAnimation(_, p20, p21, p22) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    return u2:playAnimation(p20, u5:getAssetId(p21), p22)
end
return {
    ["getAnimation"] = function(p23) --[[ Name: getAnimation, Line 61 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
        --]]
        return u3("Animation", {
            ["AnimationId"] = u5:getAssetId(p23)
        })
    end,
    ["getAnimationFromAssetId"] = function(p24) --[[ Name: getAnimationFromAssetId, Line 66 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3("Animation", {
            ["AnimationId"] = p24
        })
    end,
    ["GameAnimationUtil"] = u5
}