local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InExpo
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u10 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BeachballKillEffect"
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
function u11.onKill(p16, _, p17, u18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u10
        [4] = u3
        [5] = u6
        [6] = u7
        [7] = u9
        [8] = u2
    --]]
    local u19 = u4.new()
    p17.Archivable = true
    local u20 = p17:Clone()
    u20.HumanoidRootPart.Anchored = true
    u20:PivotTo(u18)
    u20.Parent = u8
    u10.hideCharacter(p16, p17)
    u19:GiveTask(u20)
    local u21 = u3.SingleMotor.new(u18.Position.Y)
    u21:onStep(function(p22) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u18
        --]]
        u20:PivotTo(u18 * CFrame.new(0, -p22, 0))
    end)
    u19:GiveTask(function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21:destroy()
    end)
    local u23 = u6.Assets.Misc.Beachball:Clone()
    u23.Parent = u8
    u19:GiveTask(u23)
    local v24 = CFrame.Angles
    local v25 = math.random(-360, 360)
    local v26 = math.rad(v25)
    local v27 = math.random(-360, 360)
    local v28 = math.rad(v27)
    local v29 = math.random(-360, 360)
    local u30 = v24(v26, v28, (math.rad(v29)))
    local u31 = nil
    local u32 = 0.632
    u19:GiveTask(u7.Heartbeat:Connect(function(p33) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u31
            [3] = u21
            [4] = u3
            [5] = u23
            [6] = u18
            [7] = u30
        --]]
        u32 = u32 + p33
        local v34 = u32 / 1.2649110640673518
        local v35 = 0.3 ^ math.floor(v34) * (40 - (u32 % 1.2649110640673518 - 0.6324555320336759) ^ 2 * 100)
        local v36 = 0.3 ^ ((u32 - 1) / 1.2649110640673518) * 40
        local v37 = u31
        if v37 ~= 0 and (v37 == v37 and v37) then
            v37 = v36 < 0.5
        end
        if v37 == 0 or (v37 ~= v37 or not v37) then
            local v38 = u21
            local v39 = u3.Spring.new
            local v40 = u32 / 1.2649110640673518
            v38:setGoal(v39((1 - 0.5 ^ math.floor(v40)) * 6, {
                ["dampingRatio"] = 0.35,
                ["frequency"] = 4
            }))
        end
        if v36 < 3 and (u31 == 0 or (u31 ~= u31 or not u31)) and v35 < 0.5 then
            u31 = v35
        end
        local v41 = u23
        local v42 = u18
        local v43 = CFrame.new
        local v44 = 0
        if u31 ~= nil then
            v35 = u31
        end
        v41:PivotTo(v42 * v43(v44, v35, 0) * u30)
    end))
    task.delay(4, function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u23
            [3] = u2
            [4] = u19
        --]]
        u9.tweenModelSize(u23, 2, u2, 0):andThen(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            u19:DoCleaning()
        end)
    end)
    return u19
end
return u11