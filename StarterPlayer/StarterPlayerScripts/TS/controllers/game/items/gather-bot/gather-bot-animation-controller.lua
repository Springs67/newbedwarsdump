local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "GatherBotAnimationController"
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
    p12.Name = "GatherBotAnimationController"
end
function u9.KnitStart(u13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u8
        [4] = u4
    --]]
    u5.KnitStart(u13)
    u2("Monster", function(u14) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
            [3] = u4
        --]]
        if u14:GetAttribute("MonsterType") ~= u8.GATHER_BOT then
            return nil
        end
        local v15 = u14:WaitForChild("Humanoid", 3)
        local u16 = nil
        local u17 = u13:setUpAnimationTrack(v15)
        local u18 = false
        local u19 = 0
        local u20 = nil
        u20 = u4.Heartbeat:Connect(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u20
                [3] = u18
                [4] = u19
                [5] = u17
                [6] = u16
            --]]
            local v21 = u14
            v21.Destroying:Connect(function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u18
                --]]
                u20:Disconnect()
                u18 = false
            end)
            if v21.HumanoidRootPart.AssemblyLinearVelocity.Magnitude > 1 then
                if not u18 and u19 <= 0 then
                    u18 = true
                    u19 = 2
                end
                local v22 = v21:GetAttribute("HeldItemAmount")
                if v22 == nil then
                    v21:SetAttribute("HeldItemAmount", 0)
                    v22 = 0
                end
                if v22 <= 0 then
                    if not u17.walkNoItem.IsPlaying then
                        local v23 = u16
                        if v23 ~= nil then
                            v23:Stop()
                        end
                        u17.walkNoItem:Play()
                        u16 = u17.walkNoItem
                        return
                    end
                elseif not u17.walkWithItem.IsPlaying then
                    local v24 = u16
                    if v24 ~= nil then
                        v24:Stop()
                    end
                    u17.walkWithItem:Play()
                    u16 = u17.walkWithItem
                    return
                end
            else
                u18 = false
                local v25 = u19 - 0.1
                u19 = math.max(0, v25)
                local v26 = v21:GetAttribute("HeldItemAmount")
                if v26 == nil then
                    v21:SetAttribute("HeldItemAmount", 0)
                    v26 = 0
                end
                if not u17.idle.IsPlaying and v26 <= 0 then
                    local v27 = u16
                    if v27 ~= nil then
                        v27:Stop()
                    end
                    u17.idle:Play()
                    u16 = u17.idle
                end
            end
        end)
    end)
end
function u9.setUpAnimationTrack(_, p28) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    local v29 = p28:WaitForChild("Animator")
    local v30 = v29:LoadAnimation(u7:getAnimation(u6.GATHER_BOT_WALK))
    v30.Priority = Enum.AnimationPriority.Action
    v30.Looped = true
    local v31 = v29:LoadAnimation(u7:getAnimation(u6.GATHER_BOT_WALK_CARRY_ITEM))
    v31.Priority = Enum.AnimationPriority.Action
    v31.Looped = true
    local v32 = v29:LoadAnimation(u7:getAnimation(u6.GATHER_BOT_IDLE))
    v32.Priority = Enum.AnimationPriority.Action
    v32.Looped = true
    return {
        ["walkNoItem"] = v30,
        ["walkWithItem"] = v31,
        ["idle"] = v32
    }
end
v3.CreateController(u9.new())
return nil