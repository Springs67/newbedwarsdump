local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.ReplicatedStorage
local u10 = v7.TweenService
local u11 = v7.Workspace
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "RavenExplosionKillEffect"
    end,
    ["__index"] = u15
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, p20) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p19, p20)
    p19.ravenPositionMap = {}
    u15.setPlayDefaultKillEffect(p19, false)
end
function u16.onKill(u21, _, p22, p23) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u15
        [4] = u3
        [5] = u13
        [6] = u12
        [7] = u1
        [8] = u5
        [9] = u14
        [10] = u9
        [11] = u4
    --]]
    local u24 = u6.new()
    p22.Archivable = true
    local u25 = p22:Clone()
    u25.HumanoidRootPart.Anchored = true
    u25:PivotTo(p23)
    u25.Parent = u11
    u15.hideCharacter(u21, p22)
    u24:GiveTask(u25)
    for v26, v27 in u25:GetDescendants() do
        local _ = v26 - 1
        if v27:IsA("GuiObject") then
            v27.Transparency = 1
        elseif v27:IsA("UIStroke") then
            v27.Transparency = 1
        elseif v27:IsA("Decal") then
            v27.Transparency = 1
        end
    end
    task.delay(1.2, function() --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u3
            [3] = u13
            [4] = u12
        --]]
        local v28 = u25:FindFirstChild("Humanoid")
        if v28 ~= nil then
            v28 = v28:FindFirstChild("Animator")
        end
        local v29 = u3:playAnimation(v28, u13:getAssetId(u12.RAVEN_ATTACK_KILL_EFFECT), {
            ["looped"] = false
        })
        if v29 ~= nil then
            v29.Stopped:Connect(function() --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:Destroy()
            end)
        end
    end)
    local u30 = {}
    local v31 = u25.PrimaryPart
    if v31 ~= nil then
        v31 = v31.CFrame.LookVector
    end
    local v32 = u25.PrimaryPart
    if v32 ~= nil then
        v32 = v32.CFrame.RightVector
    end
    local v33 = false
    local v34 = 0
    while true do
        if v33 then
            v34 = v34 + 1
        else
            v33 = true
        end
        if v34 >= 5 then
            local u35 = u25.PrimaryPart
            if u35 ~= nil then
                u35 = u35.Position
            end
            if v31 ~= nil then
                v31 = v31 * 15
            end
            local v36
            if u35 == nil then
                v36 = u35
            else
                v36 = u35 + (v31 or Vector3.new()) + Vector3.new(0, 10, 0)
            end
            local v37 = CFrame
            local v38 = v36 or Vector3.new()
            local v39 = u25.PrimaryPart
            if v39 ~= nil then
                v39 = v39.Position
            end
            if v39 == nil then
                v39 = Vector3.new()
            end
            local v40 = v37.lookAt(v38, v39)
            local v41 = CFrame
            local v42 = u30[3]
            local v43 = u25.PrimaryPart
            if v43 ~= nil then
                v43 = v43.Position
            end
            if v43 == nil then
                v43 = Vector3.new()
            end
            u21:createAndAnimateRaven(v40, v41.lookAt(v42, v43), u24)
            local u57 = u1.Promise.delay(2.3):andThen(function() --[[ Line: 173 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u35
                    [3] = u25
                    [4] = u21
                    [5] = u24
                --]]
                local v44 = false
                local v45 = 0
                while true do
                    if v44 then
                        v45 = v45 + 1
                    else
                        v44 = true
                    end
                    if v45 >= 5 then
                        return
                    end
                    if v45 ~= 2 then
                        local v46 = u30[v45 + 1] - (u35 or Vector3.new())
                        local v47 = v46 / v46.Magnitude * 15
                        local v48 = u35
                        if v48 ~= nil then
                            v48 = v48 + v47 + Vector3.new(0, 10, 0)
                        end
                        local v49 = CFrame
                        local v50 = v48 or Vector3.new()
                        local v51 = u25.PrimaryPart
                        if v51 ~= nil then
                            v51 = v51.Position
                        end
                        if v51 == nil then
                            v51 = Vector3.new()
                        end
                        local v52 = v49.lookAt(v50, v51)
                        local v53 = u21
                        local v54 = CFrame
                        local v55 = u30[v45 + 1]
                        local v56 = u25.PrimaryPart
                        if v56 ~= nil then
                            v56 = v56.Position
                        end
                        if v56 == nil then
                            v56 = Vector3.new()
                        end
                        v53:createAndAnimateRaven(v52, v54.lookAt(v55, v56), u24)
                        task.wait(0.3)
                    end
                end
            end)
            u24:GiveTask(function() --[[ Line: 230 ]]
                --[[
                Upvalues:
                    [1] = u57
                --]]
                return u57:cancel()
            end)
            local u66 = u1.Promise.delay(4.6):andThen(function() --[[ Line: 234 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u24
                    [3] = u5
                    [4] = u14
                    [5] = u9
                    [6] = u4
                    [7] = u11
                --]]
                local v58 = u21.ravenPositionMap
                local function v63(p59, p60) --[[ Line: 236 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u5
                        [3] = u14
                        [4] = u9
                        [5] = u4
                        [6] = u11
                    --]]
                    u24:GiveTask(u5:playSound(u14.TNT_EXPLODE_1, {
                        ["position"] = p59
                    }))
                    local v61 = u9:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("Explosion"):Clone()
                    u4:setQueryIgnored(v61, true)
                    v61.Position = p59
                    v61.Parent = u11
                    for _, v62 in v61:GetDescendants() do
                        if v62:IsA("ParticleEmitter") then
                            v62:Emit(v62.Rate)
                        end
                    end
                    p60:Destroy()
                    u24:GiveTask(v61)
                    task.wait(0.2)
                end
                for v64, v65 in v58 do
                    v63(v65, v64, v58)
                end
            end)
            u24:GiveTask(function() --[[ Line: 258 ]]
                --[[
                Upvalues:
                    [1] = u66
                --]]
                return u66:cancel()
            end)
            task.delay(5.4, function() --[[ Line: 261 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:DoCleaning()
            end)
            return u24
        end
        local v67 = 0.7853981633974483 * v34 - 1.5707963267948966
        local v68 = math.sin(v67) * 4
        local v69 = math.cos(v67) * 4
        local v70
        if v31 == nil then
            v70 = v31
        else
            local v71 = v31 * v69
            local v72
            if v32 == nil then
                v72 = v32
            else
                v72 = v32 * v68
            end
            if v72 == nil then
                v72 = Vector3.new()
            end
            v70 = v71 + v72
        end
        local v73 = u25.PrimaryPart
        if v73 ~= nil then
            v73 = v73.Position + (v70 or Vector3.new()) + Vector3.new(0, -1, 0)
        end
        local v74 = v73 or Vector3.new()
        table.insert(u30, v74)
    end
end
function u16.createAndAnimateRaven(p75, p76, p77, p78) --[[ Line: 266 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
        [3] = u8
        [4] = u10
    --]]
    local v79 = u9:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("Raven"):Clone()
    v79.Parent = u11
    if v79.PrimaryPart then
        v79.PrimaryPart.CanCollide = false
        v79.PrimaryPart.Anchored = true
    end
    v79:SetAttribute("FromKillEffect", true)
    u8:AddTag(v79, "raven")
    v79:PivotTo(p76)
    if v79.PrimaryPart then
        u10:Create(v79.PrimaryPart, TweenInfo.new(2.1, Enum.EasingStyle.Sine), {
            ["CFrame"] = p77
        }):Play()
    end
    p75.ravenPositionMap[v79] = p77.Position
    p78:GiveTask(v79)
end
return u16