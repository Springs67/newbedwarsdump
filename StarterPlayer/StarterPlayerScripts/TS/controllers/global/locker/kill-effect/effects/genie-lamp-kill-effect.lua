local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.RunService
local u7 = v4.TweenService
local u8 = v4.Workspace
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "GenieLampKillEffect"
    end,
    ["__index"] = u10
})
u11.__index = u11
function u11.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p14, p15)
    u10.setPlayDefaultKillEffect(p14, false)
end
function u11.onKill(p16, _, p17, _) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u10
        [4] = u5
        [5] = u2
        [6] = u9
        [7] = u7
        [8] = u6
        [9] = u1
    --]]
    local u18 = u3.new()
    p17.Archivable = true
    local v19 = p17:Clone()
    v19.Parent = u8
    u18:GiveTask(v19)
    u10.hideCharacter(p16, p17)
    for v20, v21 in v19:GetDescendants() do
        local _ = v20 - 1
        if v21:IsA("Highlight") then
            v21:Destroy()
        end
    end
    local u22 = u5.Assets.Effects.GenieLamp:Clone()
    u22.Parent = u8
    u22:PivotTo(v19:GetPivot() + v19:GetPivot().LookVector.Unit * 8)
    u18:GiveTask(u22)
    local u23 = {}
    local v24 = {}
    local v25 = #v24
    local v26 = v19:FindFirstChild("3DClothing")
    if v26 ~= nil then
        v26 = v26:GetChildren()
    end
    local v27 = v26 == nil and {} or v26
    local v28 = #v27
    table.move(v27, 1, v28, v25 + 1, v24)
    local v29 = v25 + v28
    local v30 = v19:GetChildren()
    table.move(v30, 1, #v30, v29 + 1, v24)
    for _, v31 in v24 do
        if v31:IsA("BasePart") then
            for _, v32 in v31:GetChildren() do
                if v32:IsA("Motor6D") then
                    v32:Destroy()
                end
            end
            v31.Anchored = true
            local v33 = {
                ["part"] = v31,
                ["start"] = v31:GetPivot()
            }
            table.insert(u23, v33)
        end
    end
    if #u23 == 0 then
        return u18
    end
    u18:GiveTask(u2:playSound(u9.GENIE_LAMP_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 150,
        ["rollOffMinDistance"] = 50,
        ["playbackSpeedMultiplier"] = 0.7,
        ["position"] = u22:GetPivot().Position
    }))
    local u34 = u22:GetPivot().Position
    local u35 = 1.5 / #u23
    local u36 = u35 * 2
    local u37 = u3.new()
    local v38 = u22.Cap:GetChildren()
    local function v43(u39) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u22
            [3] = u37
        --]]
        if u39:IsA("MeshPart") then
            local u40 = u39:GetPivot().UpVector.Unit * 1.2
            local v41 = u7:Create(u39, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {
                ["Position"] = u39.Position + u40
            })
            v41:Play()
            u22.Cap.Glass.Smoke.Enabled = true
            u37:GiveTask(function() --[[ Line: 111 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                local v42 = u22.Cap.Glass.Smoke
                v42.Enabled = false
                return v42.Enabled
            end)
            u37:GiveTask(v41)
            u37:GiveTask(function() --[[ Line: 117 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u39
                    [3] = u40
                --]]
                u7:Create(u39, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {
                    ["Position"] = u39.Position - u40
                }):Play()
            end)
        end
    end
    local u44 = -0.75
    for v45, v46 in v38 do
        v43(v46, v45 - 1, v38)
    end
    task.delay(2.4, function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        return u37:DoCleaning()
    end)
    u18:GiveTask(u6.Heartbeat:Connect(function(p47) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u23
            [3] = u35
            [4] = u36
            [5] = u7
            [6] = u34
        --]]
        u44 = u44 + p47
        if u44 < 0 then
            return nil
        end
        local v48 = false
        local v49 = 0
        while true do
            if v48 then
                v49 = v49 + 1
            else
                v48 = true
            end
            if v49 >= #u23 then
                return
            end
            local v50 = u23[v49 + 1]
            if v50.part.Parent ~= nil then
                local v51 = u44 - u35 * v49
                local v52 = u36
                local v53 = math.clamp(v51, 0, v52)
                if u36 <= v53 then
                    v50.part.Transparency = 1
                    local v54 = v50.tween
                    if v54 ~= nil then
                        v54:Destroy()
                    end
                    v50.part:Destroy()
                else
                    if v53 > 0.1 and v50.tween == nil then
                        v50.tween = u7:Create(v50.part, TweenInfo.new(u36 * 2, Enum.EasingStyle.Linear), {
                            ["Size"] = v50.part.Size * 0.5
                        })
                        v50.tween:Play()
                    end
                    local v55 = v53 / u36
                    local v56 = v55 * 3
                    local v57 = math.sin(v56)
                    local v58 = v55 * 2 - 1
                    local v59 = math.pow(v58, 2) * -1 + 1
                    local v60 = Vector3.new(0, v59, v57) * 5
                    local v61 = (u34 - v50.start.Position) * v55 + v60
                    v50.part.CFrame = v50.start + v61
                end
            end
        end
    end))
    u1.Promise.delay(3):andThen(function() --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        return u18:DoCleaning()
    end)
    return u18
end
return u11