local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "MountAnimationController"
    end,
    ["__index"] = u5
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p12)
    p12.Name = "MountAnimationController"
    p12.mountAnimations = {}
end
function u9.KnitStart(u13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u3
        [4] = u7
        [5] = u6
    --]]
    u5.KnitStart(u13)
    u4.GenericMountMounted:connect(function(u14) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u13
            [3] = u7
            [4] = u6
        --]]
        local v15 = u14.model:FindFirstChildOfClass("AnimationController")
        if v15 == nil then
            return nil
        end
        local u16 = u3.new()
        local v17 = u13.mountAnimations[u14.player]
        if v17 ~= nil then
            v17:DoCleaning()
        end
        u13.mountAnimations[u14.player] = u16
        local u18 = u14.character.Humanoid.Animator:LoadAnimation(u7:getAnimation(u6.SIT_ON_DODO_BIRD))
        u18.Priority = Enum.AnimationPriority.Movement
        u18:Play()
        u16:GiveTask(function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18:Stop()
        end)
        u13:makeTracksForMount(v15, u14.mountType):andThen(function(u19) --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u14
            --]]
            local u20 = "idle"
            u19.idle:Play()
            u16:GiveTask(function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                for _, v21 in pairs(u19) do
                    v21:Stop()
                    v21:Destroy()
                end
            end)
            u16:GiveTask(u14.character.Humanoid.Running:Connect(function(p22) --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u19
                --]]
                if p22 >= 1 then
                    local v23 = u20
                    if tostring(v23) ~= "walk" then
                        u19[u20]:Stop()
                        u20 = "walk"
                        u19.walk:Play()
                        return
                    end
                else
                    u19[u20]:Stop()
                    u20 = "idle"
                    u19.idle:Play()
                end
            end))
            u16:GiveTask(u14.character.Humanoid.Jumping:Connect(function(p24) --[[ Line: 74 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                if p24 and u19.jump.IsPlaying == false then
                    u19.jump:Play()
                end
            end))
            u16:GiveTask(u14.character.Humanoid.StateChanged:Connect(function(_, p25) --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                if p25 == Enum.HumanoidStateType.Landed or p25 == Enum.HumanoidStateType.Running then
                    u19.jump:Stop()
                    u19.fall:Stop()
                elseif p25 == Enum.HumanoidStateType.FallingDown or p25 == Enum.HumanoidStateType.Freefall then
                    u19.fall:Play()
                end
            end))
        end)
    end)
    u4.GenericMountDismounted:connect(function(p26) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        local v27 = u13.mountAnimations[p26.player]
        if v27 ~= nil then
            v27:DoCleaning()
        end
        u13.mountAnimations[p26.player] = nil
    end)
end
u9.makeTracksForMount = v1.async(function(_, p28, p29) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    local v30 = p28:WaitForChild("Animator", 2)
    if v30 == nil then
        error("Animator was not added to AnimationController in time")
    end
    local v31 = u8[p29]
    local v32 = v30:LoadAnimation(u7:getAnimation(v31.animations.jump))
    v32.Priority = Enum.AnimationPriority.Action
    local v33 = v30:LoadAnimation(u7:getAnimation(v31.animations.fall))
    v33.Priority = Enum.AnimationPriority.Movement
    local v34 = v30:LoadAnimation(u7:getAnimation(v31.animations.walk))
    v34.Priority = Enum.AnimationPriority.Movement
    v34:AdjustSpeed(2)
    local v35 = v30:LoadAnimation(u7:getAnimation(v31.animations.idle))
    v35.Priority = Enum.AnimationPriority.Idle
    return {
        ["jump"] = v32,
        ["walk"] = v34,
        ["idle"] = v35,
        ["fall"] = v33
    }
end)
function u9.playAnimationInMount(_, p36, p37, p38, p39) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v40 = p36:FindFirstChildOfClass("AnimationController")
    if v40 == nil then
        return nil
    end
    local v41 = v40:FindFirstChildOfClass("Animator")
    if v41 == nil then
        return nil
    end
    local v42 = v41:LoadAnimation(u7:getAnimation(p37))
    if p39 ~= nil then
        v42.Looped = p39
    end
    v42:Play()
    if p38 ~= 0 and (p38 == p38 and p38) then
        v42:AdjustSpeed(p38)
    end
    return v42
end
v2.CreateController(u9.new())
return nil