local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CollectionTagAdded
local v4 = v2.ConstantManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.RunService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v4.registerConstants(script, {
    ["DodoSquawkFrequencyRange"] = NumberRange.new(15, 30)
})
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "DodoBirdAnimationController"
    end,
    ["__index"] = u13
})
u17.__index = u17
function u17.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, ...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p20, ...)
    p20.Name = "DodoBirdAnimationController"
    p20.dodoBirdMountMaids = {}
    p20.dodoBirdAnimationData = {}
end
function u17.KnitStart(u21) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u3
        [3] = u11
        [4] = u8
        [5] = u12
        [6] = u16
        [7] = u7
        [8] = u10
    --]]
    u13.KnitStart(u21)
    u3("dodo-bird-mount", function(u22) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u8
            [3] = u21
            [4] = u12
            [5] = u16
            [6] = u7
        --]]
        local u23 = u22.Parent
        if u23 ~= nil and u11:GetPlayerFromCharacter(u23) ~= nil then
            local u24 = u8.new()
            u21.dodoBirdMountMaids[u22] = u24
            u21:makeTracksForDodoBirdMount(u22):andThen(function(u25) --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u23
                    [3] = u12
                    [4] = u22
                    [5] = u16
                    [6] = u7
                --]]
                local u26 = "idle"
                u25.idle:Play()
                u24:GiveTask(function() --[[ Line: 52 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    for _, v27 in pairs(u25) do
                        v27:Destroy()
                    end
                end)
                u24:GiveTask(u23.Humanoid.Running:Connect(function(p28) --[[ Line: 57 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u26
                    --]]
                    u25[u26]:Stop()
                    if p28 >= 1 then
                        u26 = "walk"
                        u25.walk:Play()
                    else
                        u26 = "idle"
                        u25.idle:Play()
                    end
                end))
                u24:GiveTask(u23.Humanoid.Jumping:Connect(function(p29) --[[ Line: 67 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    if p29 and u25.jump.IsPlaying == false then
                        u25.jump:Play()
                    end
                end))
                u24:GiveTask(u23.Humanoid.StateChanged:Connect(function(_, p30) --[[ Line: 72 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    if p30 == Enum.HumanoidStateType.Landed then
                        u25.jump:Stop()
                        u25.falling:Stop()
                    elseif p30 == Enum.HumanoidStateType.FallingDown or p30 == Enum.HumanoidStateType.Freefall then
                        u25.falling:Play()
                    end
                end))
                u24:GiveTask(u12.Heartbeat:Connect(function() --[[ Line: 80 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u16
                        [3] = u26
                        [4] = u7
                        [5] = u25
                    --]]
                    if u22:GetAttribute("NextSquawk") < time() then
                        u22:SetAttribute("NextSquawk", time() + math.random(u16.DodoSquawkFrequencyRange.Min, u16.DodoSquawkFrequencyRange.Max))
                        if u26 == "idle" then
                            u7.Controllers.DodoBirdEffectController:playSquawkSound(u22)
                            u25.squawk:Play()
                        end
                    end
                end))
            end)
        end
    end)
    u10:GetInstanceRemovedSignal("dodo-bird-mount"):Connect(function(p31) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        local v32 = u21.dodoBirdMountMaids[p31]
        if v32 then
            v32:DoCleaning()
            u21.dodoBirdMountMaids[p31] = nil
        end
    end)
    u3("dodo-bird", function(u33) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21:makeTracksForDodoBird(u33):andThen(function(p34) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u33
            --]]
            u21.dodoBirdAnimationData[u33] = {
                ["state"] = "idle",
                ["tracks"] = p34
            }
        end)
    end)
    u10:GetInstanceRemovedSignal("dodo-bird"):Connect(function(p35) --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u21
        --]]
        u21.dodoBirdAnimationData[p35] = nil
    end)
    u12.Heartbeat:Connect(function() --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u21
            [3] = u16
            [4] = u7
        --]]
        for _, v36 in u10:GetTagged("dodo-bird") do
            local v37 = u21.dodoBirdAnimationData[v36]
            if v37 ~= nil then
                local v38 = v37.state
                local v39 = v37.tracks
                if v36.RootPart.AssemblyLinearVelocity.Magnitude > 1 then
                    v37.state = "walk"
                else
                    v37.state = "idle"
                end
                if v37.state ~= v38 then
                    v39[v38]:Stop()
                    v39[v37.state]:Play()
                end
                if v36:GetAttribute("NextSquawk") < time() then
                    v36:SetAttribute("NextSquawk", time() + math.random(u16.DodoSquawkFrequencyRange.Min, u16.DodoSquawkFrequencyRange.Max))
                    if v37.state == "idle" then
                        u7.Controllers.DodoBirdEffectController:playSquawkSound(v36)
                        v39.squawk:Play()
                    end
                end
            end
        end
    end)
end
u17.makeTracksForDodoBirdMount = v1.async(function(_, p40) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u14
    --]]
    local v41 = p40:WaitForChild("AnimationController", 2)
    if v41 == nil then
        error("AnimationController was not added to dodoBirdMount in time")
    end
    local v42 = v41:WaitForChild("Animator", 2)
    if v42 == nil then
        error("Animator was not added to AnimationController in time")
    end
    local v43 = v42:LoadAnimation(u15:getAnimation(u14.DODO_BIRD_FLUTTER))
    v43.Priority = Enum.AnimationPriority.Action
    local v44 = v42:LoadAnimation(u15:getAnimation(u14.DODO_BIRD_FALL))
    v44.Priority = Enum.AnimationPriority.Movement
    local v45 = v42:LoadAnimation(u15:getAnimation(u14.DODO_BIRD_WALK))
    v45.Priority = Enum.AnimationPriority.Movement
    v45:AdjustSpeed(2)
    local v46 = v42:LoadAnimation(u15:getAnimation(u14.DODO_BIRD_IDLE))
    v46.Priority = Enum.AnimationPriority.Idle
    local v47 = v42:LoadAnimation(u15:getAnimation(u14.DODO_BIRD_SQUAWK))
    v47.Looped = false
    v47.Priority = Enum.AnimationPriority.Action
    return {
        ["jump"] = v43,
        ["walk"] = v45,
        ["idle"] = v46,
        ["falling"] = v44,
        ["squawk"] = v47
    }
end)
u17.makeTracksForDodoBird = v1.async(function(_, p48) --[[ Line: 175 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u14
    --]]
    local v49 = p48:WaitForChild("AnimationController", 2)
    if v49 == nil then
        error("AnimationController was not added to dodoBirdMount in time")
    end
    local v50 = v49:WaitForChild("Animator", 2)
    if v50 == nil then
        error("Animator was not added to AnimationController in time")
    end
    local v51 = v50:LoadAnimation(u15:getAnimation(u14.DODO_BIRD_SQUAWK))
    v51.Looped = false
    return {
        ["walk"] = v50:LoadAnimation(u15:getAnimation(u14.DODO_BIRD_WALK)),
        ["idle"] = v50:LoadAnimation(u15:getAnimation(u14.DODO_BIRD_IDLE)),
        ["squawk"] = v51
    }
end)
v6.CreateController(u17.new())
return nil