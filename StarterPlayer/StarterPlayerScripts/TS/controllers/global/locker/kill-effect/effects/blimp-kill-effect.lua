local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u3 = v2.InSine
local u4 = v2.OutSine
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u11 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "BlimpKillEffect"
    end,
    ["__index"] = u11
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
function u12.constructor(p15, p16) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p15, p16)
    u11.setPlayDefaultKillEffect(p15, false)
end
function u12.onKill(p17, _, p18, _) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u11
        [4] = u7
        [5] = u1
        [6] = u9
        [7] = u4
        [8] = u10
        [9] = u3
    --]]
    local v19 = u5.new()
    p18.Archivable = true
    local u20 = p18:Clone()
    u20.HumanoidRootPart.Anchored = true
    u20.Parent = u8
    v19:GiveTask(u20)
    u11.hideCharacter(p17, p18)
    local u21 = u20:GetPrimaryPartCFrame() * CFrame.new(0, 100, 0)
    local u22 = u7.Assets.Misc.ReindeerBlimp:Clone()
    u22:PivotTo(u21)
    u22.Parent = u8
    v19:GiveTask(u22)
    local u31 = u1.Promise.new(function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u20
            [3] = u9
            [4] = u4
            [5] = u21
            [6] = u10
            [7] = u3
        --]]
        u9(1, u4, function(p23) --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22:PivotTo(p23)
        end, u21, u20:GetPrimaryPartCFrame() * CFrame.new(0.076, 3.698, 0.488)):Wait()
        u20.HumanoidRootPart.Anchored = false
        u10:weldPartsWithJoint(u20.HumanoidRootPart, u22.PrimaryPart, "Weld")
        task.wait(0.5)
        u9(1, u4, function(p24) --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22:PivotTo(p24)
        end, u22:GetPrimaryPartCFrame(), u20:GetPrimaryPartCFrame() * CFrame.new(0, 100, 0)):Wait()
        local function v26(p25) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22:PivotTo(p25)
        end
        local v27 = u22:GetPrimaryPartCFrame()
        local v28 = u22:GetPrimaryPartCFrame()
        local v29 = CFrame.new(0, 0, -50)
        local v30 = CFrame.Angles(-0.06981317007977318, 0, 0)
        u9(1, u3, v26, v27, v28 * v29 * v30):Wait()
        u22:Destroy()
        u20:Destroy()
    end)
    v19:GiveTask(function() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        return u31:cancel()
    end)
    return v19
end
return u12