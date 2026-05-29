local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
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
        [1] = u5
        [2] = u10
        [3] = u4
        [4] = u8
        [5] = u3
        [6] = u7
        [7] = u6
        [8] = u1
        [9] = u9
    --]]
    p17.Archivable = true
    local u18 = p17:Clone()
    for _, v19 in u18:GetDescendants() do
        if v19:IsA("BasePart") then
            v19.Material = Enum.Material.Glass
            v19.Color = Color3.fromRGB(255, 215, 0)
            if v19:IsA("MeshPart") then
                v19.TextureID = ""
            end
        elseif v19:IsA("Texture") then
            v19:Destroy()
        elseif v19:IsA("Shirt") then
            v19:Destroy()
        end
    end
    u18.Parent = u5
    u10.hideCharacter(p16, p17)
    u4:playSound(u8.STATUE, {
        ["position"] = u18:GetPrimaryPartCFrame().Position
    })
    u3:playAnimation(u18:FindFirstChild("Humanoid"):FindFirstChild("Animator"), u7:getAssetId(u6.STATUE), {
        ["looped"] = false
    })
    u1.Promise.delay(2.8):andThen(function() --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18:Destroy()
    end)
    return u9.new()
end
return u11