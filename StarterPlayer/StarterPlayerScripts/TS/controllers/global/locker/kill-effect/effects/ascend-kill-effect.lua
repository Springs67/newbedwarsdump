local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "Anonymous"
    end,
    ["__index"] = u10
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, p15) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p14, p15)
    u10.setPlayDefaultKillEffect(p14, false)
end
function u11.onKill(p16, _, p17, _) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u10
        [4] = u4
        [5] = u8
        [6] = u3
        [7] = u7
        [8] = u6
    --]]
    local v18 = u9.new()
    p17.Archivable = true
    local u19 = p17:Clone()
    u19.Parent = u5
    v18:GiveTask(u19)
    u10.hideCharacter(p16, p17)
    v18:GiveTask(u4:playSound(u8.ASCEND, {
        ["position"] = u19:GetPivot().Position
    }))
    local u20 = u3:playAnimation(u19:FindFirstChild("Humanoid"):FindFirstChild("Animator"), u7:getAssetId(u6.ASCEND), {
        ["looped"] = false
    })
    v18:GiveTask(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local v21 = u20
        if v21 ~= nil then
            v21 = v21:Destroy()
        end
        return v21
    end)
    if u20 ~= nil then
        u20.Stopped:Connect(function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            u19:Destroy()
        end)
    end
    return v18
end
return u11