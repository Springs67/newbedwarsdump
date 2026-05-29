local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v2.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SkeletonAnimationController"
    end,
    ["__index"] = u9
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p18)
    p18.Name = "SkeletonAnimationController"
end
function u15.KnitStart(u19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u5
        [4] = u4
        [5] = u14
        [6] = u3
        [7] = u11
        [8] = u10
        [9] = u6
        [10] = u12
        [11] = u8
    --]]
    u9.KnitStart(u19)
    u13.Client:Get("SkeletonAttack"):Connect(function(p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u14
            [4] = u3
            [5] = u11
            [6] = u10
        --]]
        local v21
        if p20 == nil then
            v21 = p20
        else
            v21 = p20:WaitForChild("Humanoid", 3)
            if v21 ~= nil then
                v21 = v21:WaitForChild("Animator")
            end
        end
        if not v21 then
            return nil
        end
        u5:playSound(u4.fromList(u14.SKELETON_ATTACK_1, u14.SKELETON_ATTACK_2, u14.SKELETON_ATTACK_3), {
            ["volumeMultiplier"] = 0.3,
            ["rollOffMaxDistance"] = 45,
            ["position"] = p20:GetPrimaryPartCFrame().Position
        })
        u3:playAnimation(v21, u11:getAssetId(u10.SWORD_SWING))
    end)
    u6("Monster", function(u22) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u14
            [4] = u3
            [5] = u11
            [6] = u10
            [7] = u19
            [8] = u8
            [9] = u4
        --]]
        if u22:GetAttribute("MonsterType") ~= u12.SKELETON then
            return nil
        end
        task.spawn(function() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u5
                [3] = u14
            --]]
            if not u22.PrimaryPart then
                u22:GetPropertyChangedSignal("PrimaryPart"):Wait()
            end
            if u22.PrimaryPart then
                u5:playSound(u14.SKELETON_EMERGE, {
                    ["rollOffMaxDistance"] = 120,
                    ["rollOffMinDistance"] = 50,
                    ["position"] = u22:GetPrimaryPartCFrame().Position
                })
            end
        end)
        local v23 = u22:WaitForChild("Humanoid", 3)
        u3:playAnimation(v23:WaitForChild("Animator"), u11:getAssetId(u10.SKELETON_SPAWN))
        local u24 = nil
        local u25 = u19:setUpAnimationTrack(v23)
        local u26 = -1
        local u35 = u8.Heartbeat:Connect(function() --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u24
                [3] = u25
                [4] = u26
                [5] = u5
                [6] = u4
                [7] = u14
            --]]
            local v27 = u22
            if v27 then
                local v28 = v27.HumanoidRootPart
                if v28 ~= nil then
                    v28 = v28.AssemblyLinearVelocity.Magnitude
                end
                local v29 = v28 < 1
                if v29 then
                    v29 = u24 ~= u25.idle
                end
                if v29 then
                    local v30 = u24
                    if v30 ~= nil then
                        v30:Stop()
                    end
                    u25.idle:Play()
                    u24 = u25.idle
                    u26 = time() + math.random(6, 12)
                    return
                else
                    local v31 = v27.HumanoidRootPart
                    if v31 ~= nil then
                        v31 = v31.AssemblyLinearVelocity.Magnitude
                    end
                    local v32 = v31 > 1
                    if v32 then
                        v32 = u24 ~= u25.walk
                    end
                    if v32 then
                        local v33 = u24
                        if v33 ~= nil then
                            v33:Stop()
                        end
                        local v34 = u25.walk
                        if v34 ~= nil then
                            v34:Play()
                        end
                        u24 = u25.walk
                        u26 = -1
                    elseif u24 == u25.idle and (u26 > 0 and u26 < time()) then
                        u26 = time() + math.random(10, 20)
                        u5:playSound(u4.fromList(u14.SKELETON_IDLE_1, u14.SKELETON_IDLE_2, u14.SKELETON_IDLE_3, u14.SKELETON_IDLE_4), {
                            ["position"] = v27:GetPivot().Position
                        })
                    end
                end
            else
                return nil
            end
        end)
        if u22 then
            u22.Destroying:Once(function() --[[ Line: 130 ]]
                --[[
                Upvalues:
                    [1] = u35
                --]]
                u35:Disconnect()
            end)
        else
            u35:Disconnect()
        end
    end)
end
function u15.setUpAnimationTrack(_, p36) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
    --]]
    local v37 = p36:WaitForChild("Animator")
    local v38 = v37:LoadAnimation(u11:getAnimation(u10.SKELETON_WALK))
    v38.Priority = Enum.AnimationPriority.Action
    local v39 = v37:LoadAnimation(u11:getAnimation(u10.SKELETON_IDLE))
    v39.Priority = Enum.AnimationPriority.Action
    return {
        ["walk"] = v38,
        ["idle"] = v39
    }
end
v7.CreateController(u15.new())
return nil