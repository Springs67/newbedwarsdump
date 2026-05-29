local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "JellyKillEffect"
    end,
    ["__index"] = u9
})
u10.__index = u10
function u10.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13, p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p13, p14)
    u9.setPlayDefaultKillEffect(p13, false)
end
function u10.onKill(p15, _, p16, u17) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u8
        [4] = u9
        [5] = u6
        [6] = u2
        [7] = u7
    --]]
    u3.Debug("Jelly kill effect")
    local u18 = u4.new()
    p16.Archivable = true
    local u19 = p16:Clone()
    u19.HumanoidRootPart.Anchored = true
    u18:GiveTask(u19)
    u19.Parent = u8
    local u20 = u19.Humanoid.HipHeight
    local u21 = u19:GetPrimaryPartCFrame()
    u9.hideCharacter(p15, p16)
    local u22 = u6.Assets.Effects.JellyMonster:Clone()
    u22:PivotTo(u21)
    u18:GiveTask(u22)
    u22.Parent = u8
    local u23 = u2.GroupMotor.new({
        ["x"] = u21.X,
        ["y"] = u21.Y - 200,
        ["z"] = u21.Z
    })
    local u24 = u2.GroupMotor.new({
        ["x"] = u21.X,
        ["y"] = u21.Y - 200 + 5,
        ["z"] = u21.Z
    })
    local u25 = u2.GroupMotor.new({
        ["x"] = u22.jelly.Size.X,
        ["y"] = u22.jelly.Size.Y,
        ["z"] = u22.jelly.Size.Z
    })
    u18:GiveTask(function() --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u24
            [3] = u25
        --]]
        u23:destroy()
        u24:destroy()
        u25:destroy()
    end)
    local u27 = u23:onStep(function(p26) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22.RootPart["master_bone.001"].WorldCFrame = CFrame.new(p26.x, p26.y, p26.z)
    end)
    local u29 = u24:onStep(function(p28) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22.RootPart["master_bone.001"]["jelly.V"].WorldCFrame = CFrame.new(p28.x, p28.y, p28.z)
    end)
    local u35 = u25:onStep(function(p30) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        local v31 = u22.jelly
        local v32 = p30.x
        local v33 = p30.y
        local v34 = p30.z
        v31.Size = Vector3.new(v32, v33, v34)
    end)
    u18:GiveTask(function() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u29
            [3] = u35
        --]]
        u27:disconnect()
        u29:disconnect()
        u35:disconnect()
    end)
    u18:GiveTask(u7.Heartbeat:Connect(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u22
            [3] = u20
            [4] = u17
        --]]
        local v36 = u19
        local v37 = u22.RootPart["master_bone.001"].TransformedWorldCFrame
        local v38 = CFrame.new(0, u20, 0)
        local v39 = u17
        local v40 = u17.Position
        v36:PivotTo(v37 * v38 * (v39 - v40))
    end))
    local u41 = {
        ["frequency"] = 6,
        ["dampingRatio"] = 0.6
    }
    local u42 = {
        ["frequency"] = 4,
        ["dampingRatio"] = 0.3
    }
    local u43 = {
        ["frequency"] = 2,
        ["dampingRatio"] = 0.6
    }
    u23:setGoal({
        ["x"] = u2.Spring.new(u21.X, u41),
        ["y"] = u2.Spring.new(u21.Y - u20 - 1, u41),
        ["z"] = u2.Spring.new(u21.Z, u41)
    })
    u24:setGoal({
        ["x"] = u2.Spring.new(u21.X, u42),
        ["y"] = u2.Spring.new(u21.Y + 5 - u20 - 1, u42),
        ["z"] = u2.Spring.new(u21.Z, u42)
    })
    local u44 = nil
    u44 = u24:onComplete(function() --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u23
            [3] = u2
            [4] = u21
            [5] = u41
            [6] = u24
            [7] = u42
            [8] = u25
            [9] = u43
            [10] = u18
        --]]
        u44:disconnect()
        u23:setGoal({
            ["x"] = u2.Spring.new(u21.X, u41),
            ["y"] = u2.Spring.new(u21.Y + 18, u41),
            ["z"] = u2.Spring.new(u21.Z, u41)
        })
        u24:setGoal({
            ["x"] = u2.Spring.new(u21.X, u42),
            ["y"] = u2.Spring.new(u21.Y + 18 + 5, u42),
            ["z"] = u2.Spring.new(u21.Z, u42)
        })
        u25:setGoal({
            ["x"] = u2.Spring.new(0.1, u43),
            ["y"] = u2.Spring.new(0.1, u43),
            ["z"] = u2.Spring.new(0.1, u43)
        })
        local u45 = nil
        u45 = u24:onComplete(function() --[[ Line: 128 ]]
            --[[
            Upvalues:
                [1] = u45
                [2] = u18
            --]]
            u45:disconnect()
            u18:DoCleaning()
        end)
    end)
    return u18
end
return u10