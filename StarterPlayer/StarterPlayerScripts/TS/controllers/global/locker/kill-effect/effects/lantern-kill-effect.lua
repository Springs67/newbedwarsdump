local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u3 = v2.InOutExpo
local u4 = v2.Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.RunService
local u10 = v7.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u12 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u13 = Random.new()
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "LanternKillEffect"
    end,
    ["__index"] = u12
})
u14.__index = u14
function u14.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p17, p18)
    u12.setPlayDefaultKillEffect(p17, false)
end
function u14.onKill(p19, _, p20, u21) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u12
        [4] = u8
        [5] = u13
        [6] = u6
        [7] = u9
        [8] = u4
        [9] = u11
        [10] = u3
    --]]
    local u22 = false
    local u23 = u5.new()
    p20.Archivable = true
    local v24 = p20:Clone()
    v24.HumanoidRootPart.Anchored = true
    u23:GiveTask(v24)
    v24.Parent = u10
    u12.hideCharacter(p19, p20)
    local u25 = table.create(10)
    task.spawn(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u8
            [3] = u21
            [4] = u13
            [5] = u6
            [6] = u10
            [7] = u25
        --]]
        local v26 = false
        local v27 = 0
        while true do
            if v26 then
                v27 = v27 + 1
            else
                v26 = true
            end
            if v27 >= 10 or u22 == true then
                return
            end
            local v28 = u8.Assets.Misc.Lantern:Clone()
            v28:PivotTo(u21 * CFrame.new(u13:NextNumber(-20, 20), -4, u13:NextNumber(20, -20)))
            u6(v28, 0.5 - u13:NextNumber(0, 0.15))
            local v29, v30, v31 = v28.Lamp.Color:ToHSV()
            local v32 = v28.Lamp
            local v33 = Color3.fromHSV
            local v34 = v29 + u13:NextNumber(-0.01, 0.01)
            local v35 = math.clamp(v34, 0, 1)
            local v36 = v30 + u13:NextNumber(-0.2, 0.2)
            local v37 = math.clamp(v36, 0, 1)
            local v38 = v31 + u13:NextNumber(-0.2, 0.2)
            v32.Color = v33(v35, v37, (math.clamp(v38, 0, 1)))
            v28.Parent = u10
            local v39 = {
                ["dead"] = false,
                ["elapsedTime"] = 0,
                ["goalYPos"] = 8,
                ["part"] = v28,
                ["origin"] = v28:GetPrimaryPartCFrame().Position,
                ["seed"] = u13:NextNumber(0, 500),
                ["radius"] = 2 + u13:NextNumber(0, 7),
                ["start"] = u13:NextNumber(0, 0.3) + -4,
                ["speed"] = 1 + u13:NextNumber(0, 1),
                ["offset"] = u13:NextNumber(0, 500)
            }
            local v40 = u25
            table.insert(v40, v39)
            task.wait(0.4)
        end
    end)
    u23:GiveTask(u9.Heartbeat:Connect(function(p41) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u21
            [3] = u4
            [4] = u11
            [5] = u3
        --]]
        for _, v42 in u25 do
            v42.elapsedTime = v42.elapsedTime + p41
            local v43 = u21.Position
            local v44 = v42.elapsedTime * v42.speed + v42.offset
            local v45 = math.sin(v44) * v42.radius
            local v46 = v42.elapsedTime * v42.speed + v42.offset
            local v47 = math.cos(v46) * v42.radius
            local v48 = v43 + Vector3.new(v45, 0, v47)
            local v49 = math.noise(v42.elapsedTime * 0.5, 0, v42.seed) * 3
            local v50 = math.noise(v42.elapsedTime * 0.5, 0, -v42.seed) * 3
            local v51 = math.noise(v42.elapsedTime * 0.5, 0, v42.seed + v42.seed) * 3
            local v52 = Vector3.new(v49, v50, v51)
            local v53 = math.noise(v42.elapsedTime * 2, 0, v42.seed) * 0.3
            local v54 = math.noise(v42.elapsedTime, 0, -v42.seed) * 2
            local v55 = math.noise(v42.elapsedTime * 2, 0, v42.seed + v42.seed) * 0.3
            local v56 = v42.part
            local v57 = u4(v42.elapsedTime, v42.start, v42.goalYPos, 3)
            local v58 = Vector3.new(0, v57, 0)
            v56:PivotTo(CFrame.new(v48 + v58 + v52) * CFrame.Angles(v53, v54, v55))
            if v42.elapsedTime > 4 and v42.dead == false then
                v42.dead = true
                u11.tweenModelSize(v42.part, 0.4, u3, 0)
            end
        end
    end))
    u23:GiveTask(function() --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        for _, v59 in u25 do
            v59.part:Destroy()
        end
    end)
    u23:GiveTask(function() --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22 = true
    end)
    task.delay(8, function() --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:DoCleaning()
    end)
    return u23
end
return u14