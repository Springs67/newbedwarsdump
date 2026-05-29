local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "VipHoverboardController"
    end,
    ["__index"] = u8
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p15)
    p15.Name = "VipHoverboardController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p16)
end
function u12.mountHoverboard(p17, p18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u11
        [4] = u2
        [5] = u10
        [6] = u9
    --]]
    local v19 = u4.new()
    local v20 = p17:getHoverboardModel()
    v20.Parent = u7
    v19:GiveTask(v20)
    local v21 = p18.HumanoidRootPart
    local v22 = p18.Humanoid
    local v23 = 0.5 * v21.Size.Y + v22.HipHeight
    local v24 = v21.CFrame
    local v25 = CFrame.new(0, -v23 + 2, 0)
    local v26 = CFrame.Angles(0, 3.141592653589793, 0)
    v20.CFrame = v24 * v25 * v26
    v21.CFrame = v21.CFrame * CFrame.new(0, 2, 0)
    u11:weldParts(v21, v20)
    local v27 = v20:WaitForChild("viphoverboard", 3)
    if v27 then
        u2:playAnimation(v27, u10:getAssetId(u9.HOVERBOARD_IDLE))
    end
    local u28 = u2:playAnimation(p18, u10:getAssetId(u9.HOVER_BOARD_IDLE))
    v19:GiveTask(function() --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        local v29 = u28
        if v29 ~= nil then
            v29 = v29:Stop()
        end
        return v29
    end)
    return v19
end
function u12.getHoverboardModel(_) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    return u6.Assets.Misc.VipHoverboard:Clone()
end
v3.CreateController(u12.new())
return nil