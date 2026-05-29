local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.PhysicsService
local u10 = v8.ReplicatedStorage
local u11 = v8.TweenService
local u12 = v8.Workspace
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "balloon", "balloon-skin").BalloonSkin
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "FloatAwayKillEffect"
    end,
    ["__index"] = u17
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21, p22) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.constructor(p21, p22)
    u17.setPlayDefaultKillEffect(p21, false)
end
function u18.onKill(u23, _, p24, p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
        [3] = u17
        [4] = u3
        [5] = u14
        [6] = u13
        [7] = u11
        [8] = u1
    --]]
    local u26 = u6.new()
    p24.Archivable = true
    local u27 = p24:Clone()
    u27.HumanoidRootPart.Anchored = true
    u27:PivotTo(p25)
    u27.Parent = u12
    u17.hideCharacter(u23, p24)
    u26:GiveTask(u27)
    local v28 = u27:FindFirstChild("_DamageHighlight_")
    if v28 then
        v28:Destroy()
    end
    for v29, v30 in u27:GetDescendants() do
        local _ = v29 - 1
        if v30:IsA("GuiObject") then
            v30.Transparency = 1
        elseif v30:IsA("UIStroke") then
            v30.Transparency = 1
        elseif v30:IsA("Decal") then
            v30.Transparency = 1
        end
    end
    local u31 = u27:FindFirstChild("Humanoid"):FindFirstChild("Animator")
    local u32 = u3:playAnimation(u31, u14:getAssetId(u13.FLOAT_AWAY_HIT), {
        ["looped"] = false
    })
    u26:GiveTask(function() --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        local v33 = u32
        if v33 ~= nil then
            v33 = v33:Destroy()
        end
        return v33
    end)
    if u32 ~= nil then
        u32.Stopped:Connect(function() --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u31
                [3] = u14
                [4] = u13
                [5] = u26
            --]]
            local v34 = u3:playAnimation(u31, u14:getAssetId(u13.FLOAT_AWAY_LOOP), {
                ["looped"] = true
            })
            if v34 then
                u26:GiveTask(v34)
            end
        end)
    end
    local v35 = p25 + Vector3.new(0, 200, 0)
    local u36 = u27.PrimaryPart
    if not u36 then
        return u26
    end
    local v37 = u11:Create(u36, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        ["CFrame"] = v35
    })
    v37:Play()
    u26:GiveTask(v37)
    v37.Completed:Connect(function() --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26:DoCleaning()
    end)
    local u52 = u1.Promise.new(function() --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u27
            [3] = u26
            [4] = u11
            [5] = u36
        --]]
        local v38 = false
        local v39 = 0
        local u40 = {}
        while true do
            if v38 then
                v39 = v39 + 1
            else
                v38 = true
            end
            if v39 >= 3 then
                task.delay(4, function() --[[ Line: 127 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u11
                        [3] = u36
                        [4] = u40
                    --]]
                    local v41 = u27:GetDescendants()
                    local function v43(p42) --[[ Line: 129 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u36
                        --]]
                        if p42:IsA("BasePart") or p42:IsA("Decal") then
                            u11:Create(u36, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                ["Transparency"] = 1
                            }):Play()
                        end
                    end
                    for v44, v45 in v41 do
                        v43(v45, v44 - 1, v41)
                    end
                    local v46 = u40
                    local function v48(p47) --[[ Line: 140 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                        --]]
                        u11:Create(p47.Balloon, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            ["Transparency"] = 1
                        }):Play()
                    end
                    for v49, v50 in v46 do
                        v48(v50, v49 - 1, v46)
                    end
                end)
                return
            end
            local v51 = u23:createBalloon(u27)
            table.insert(u40, v51)
            u23:hookBalloon(u27, v51)
            u26:GiveTask(v51)
            task.wait(0.5)
        end
    end)
    u26:GiveTask(function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        return u52:cancel()
    end)
    return u26
end
function u18.createBalloon(_, p53) --[[ Line: 155 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u4
        [3] = u10
        [4] = u9
        [5] = u7
        [6] = u12
        [7] = u5
        [8] = u16
    --]]
    local v54 = u15.BALLOON_FLOAT_AWAY_SKIN_MODELS
    local v55 = (not v54 or #v54 <= 0) and "InflatedBalloon" or u4.fromList(unpack(v54))
    local v56 = u10:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild(v55):Clone()
    v56.Balloon:SetAttribute("IgnoreProjectileCollision", true)
    v56.Balloon:PivotTo(p53.PrimaryPart.CFrame)
    v56.Parent = p53
    u9:SetPartCollisionGroup(v56.Balloon, "InflatedBalloons")
    local v57 = u7
    local v58 = {
        ["Name"] = "BodyForce"
    }
    local v59 = u12.Gravity * v56.Balloon.Mass * 1.3
    v58.Force = Vector3.new(0, v59, 0)
    v58.Parent = v56.Balloon
    v57("BodyForce", v58)
    u7("BodyGyro", {
        ["D"] = 1000,
        ["P"] = 10,
        ["CFrame"] = v56.Balloon.CFrame,
        ["Parent"] = v56.Balloon
    })
    u5:playSound(u16.BALLOON_INFLATE, {
        ["position"] = v56.Balloon.Position
    })
    return v56
end
function u18.hookBalloon(_, p60, p61) --[[ Line: 182 ]]
    local v62 = p61:WaitForChild("RopeConstraint")
    v62.Attachment0 = p61.Balloon.Attachment
    local v63 = p60:FindFirstChild("UpperTorso")
    if v63 ~= nil then
        v63 = v63:FindFirstChild("BodyBackAttachment")
    end
    if v63 then
        v62.Attachment1 = v63
    end
end
return u18