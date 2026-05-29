local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "VoidDragonAnimationController"
    end,
    ["__index"] = u6
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p13)
    p13.Name = "VoidDragonAnimationController"
end
function u10.KnitStart(u14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u5
        [4] = u9
    --]]
    u6.KnitStart(u14)
    u2(function(u15, p16) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u14
        --]]
        if not u5.Controllers.KitController:isUsingKit(u15, u9.VOID_DRAGON) then
            return nil
        end
        local v17 = p16:WaitForChild("Humanoid")
        local u18 = u14:setUpAnimationTrack(u15)
        if u18 == nil then
            return nil
        end
        local u19 = nil
        local u20 = nil
        v17.Running:Connect(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
                [3] = u18
            --]]
            if u19 then
                u19:Stop()
            end
            if u20 then
                u20:Stop()
            end
            local v21 = u18.runningTrack
            if v21 ~= nil then
                v21:Play()
            end
            u20 = u18.runningTrack
        end)
        v17.FreeFalling:Connect(function() --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u19
                [3] = u20
                [4] = u18
            --]]
            local v22 = u15:GetAttribute("VoidDragon")
            if v22 ~= 0 and (v22 == v22 and (v22 ~= "" and v22)) then
                local v23 = u19
                if v23 ~= nil then
                    v23:Stop()
                end
                local v24 = u20
                if v24 ~= nil then
                    v24:Stop()
                end
                local v25 = u18.flyingTrack
                if v25 ~= nil then
                    v25:Play()
                end
                local v26 = u18.wingsFlyingTrack
                if v26 ~= nil then
                    v26:Play()
                end
                u19 = u18.flyingTrack
                u20 = u18.wingsFlyingTrack
            end
        end)
        v17.StateChanged:Connect(function(p27, p28) --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
            --]]
            if p28 == Enum.HumanoidStateType.Landed and p27 == Enum.HumanoidStateType.Freefall then
                local v29 = u19
                if v29 ~= nil then
                    v29:Stop()
                end
                local v30 = u20
                if v30 ~= nil then
                    v30:Stop()
                end
            end
        end)
    end)
end
function u10.setUpAnimationTrack(_, p31) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    local v32 = p31.Character
    if not v32 then
        return nil
    end
    local v33 = v32.Humanoid.Animator
    if not v33 then
        return nil
    end
    local v34 = v33:LoadAnimation(u8:getAnimation(u7.VOID_DRAGON_FLYING))
    local v35 = v33:LoadAnimation(u8:getAnimation(u7.VOID_DRAGON_GLIDE))
    v34:AdjustSpeed(0.1)
    v35.Priority = Enum.AnimationPriority.Movement
    v34.Priority = Enum.AnimationPriority.Movement
    local v36 = v33:LoadAnimation(u8:getAnimation(u7.VOID_DRAGON_IDLE))
    v36.Priority = Enum.AnimationPriority.Idle
    local v37 = v33:LoadAnimation(u8:getAnimation(u7.VOID_DRAGON_RUNNING))
    v37.Priority = Enum.AnimationPriority.Movement
    return {
        ["flyingTrack"] = v34,
        ["wingsFlyingTrack"] = v35,
        ["idleTrack"] = v36,
        ["runningTrack"] = v37
    }
end
v4.CreateController(u10.new())
return nil