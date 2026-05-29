local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCharacter
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").SkatingSpeedAttr
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "glacial-skater", "glacial-skater-balance").GlacialSkaterBalance
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "glacial-skater", "skating-attribute-values").SkatingAttributeValues
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u18 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "GlacialSkaterAnimationController"
    end,
    ["__index"] = u18
})
u19.__index = u19
function u19.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u13
    --]]
    u18.constructor(p22, u13.GLACIAL_SKATER)
    p22.Name = "GlacialSkaterAnimationController"
    p22.playerJumpAnimationTrack = {}
end
function u19.KnitStart(p23) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.KnitStart(p23)
end
function u19.onKitLocalActivated(_, _) --[[ Line: 43 ]] end
function u19.onKitLocalDeactivated(_) --[[ Line: 45 ]] end
function u19.onKitReplicationActivated(u24, u25) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u13
        [4] = u4
        [5] = u3
        [6] = u16
        [7] = u14
        [8] = u17
        [9] = u11
        [10] = u15
    --]]
    u25:GiveTask(u5(function(p26, u27, p28) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
            [3] = u24
            [4] = u4
            [5] = u3
            [6] = u16
            [7] = u14
            [8] = u17
            [9] = u11
            [10] = u15
            [11] = u25
        --]]
        if not u8.Controllers.KitController:isUsingKit(p26, u13.GLACIAL_SKATER) then
            return nil
        end
        local v29 = u27:WaitForChild("Humanoid")
        local u30 = u24:setUpAnimationTrack(p26)
        local v31
        if u30 == nil then
            v31 = u30
        else
            v31 = u30.jumpTrack
        end
        if v31 then
            p28:GiveTask(u30.jumpTrack)
        end
        local v32
        if u30 == nil then
            v32 = u30
        else
            v32 = u30.fastSkate
        end
        if v32 then
            p28:GiveTask(u30.fastSkate)
        end
        local v33
        if u30 == nil then
            v33 = u30
        else
            v33 = u30.mediumSkate
        end
        if v33 then
            p28:GiveTask(u30.mediumSkate)
        end
        local v34
        if u30 == nil then
            v34 = u30
        else
            v34 = u30.slowSkate
        end
        if v34 then
            p28:GiveTask(u30.slowSkate)
        end
        if not u30 then
            return nil
        end
        for v35, v36 in { u30.slowSkate, u30.mediumSkate, u30.fastSkate } do
            local _ = v35 - 1
            p28:GiveTask(v36:GetMarkerReachedSignal("step"):Connect(function() --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u3
                    [3] = u16
                    [4] = u27
                --]]
                u4:playSound(u3.fromList(u16.ICE_SKATING_FOOTSTEP_1, u16.ICE_SKATING_FOOTSTEP_2, u16.ICE_SKATING_FOOTSTEP_3, u16.ICE_SKATING_FOOTSTEP_4, u16.ICE_SKATING_FOOTSTEP_5, u16.ICE_SKATING_FOOTSTEP_6), {
                    ["volumeMultiplier"] = 0.2,
                    ["position"] = u27:GetPivot().Position
                })
            end))
        end
        local u37 = nil
        p28:GiveTask(v29.Running:Connect(function(p38) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u37
                [3] = u17
                [4] = u27
                [5] = u11
                [6] = u15
                [7] = u30
            --]]
            if p38 < u14.MOVEMENT_SPEED_MIN then
                local v39 = u37
                if v39 ~= nil then
                    v39:Stop()
                end
                u37 = nil
                return nil
            end
            local v40 = u17(u27, u11) or u15.SkatingSpeed.SLOW
            local v41 = u30.slowSkate
            if v40 == u15.SkatingSpeed.SLOW then
                v41 = u30.slowSkate
            elseif v40 == u15.SkatingSpeed.MEDIUM then
                v41 = u30.mediumSkate
            elseif v40 == u15.SkatingSpeed.FAST then
                v41 = u30.fastSkate
            end
            if u37 ~= v41 then
                local v42 = u37
                if v42 ~= nil then
                    v42:Stop()
                end
                u37 = v41
                u37:Play()
            end
        end))
        p28:GiveTask(v29.StateChanged:Connect(function(p43, p44) --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u30
            --]]
            if p43 == Enum.HumanoidStateType.Running then
                local v45 = u37
                if v45 ~= nil then
                    v45:Stop()
                end
                u37 = nil
            elseif p44 == Enum.HumanoidStateType.Landed and u30.jumpTrack.IsPlaying or p44 == Enum.HumanoidStateType.Running then
                u30.StopJump()
            end
        end))
        u25:GiveTask(p28)
    end))
end
function u19.onKitReplicationDeactivated(_) --[[ Line: 147 ]] end
function u19.onInnateAbilityEnabled(_, _, _) --[[ Line: 149 ]] end
function u19.onAbilityUsed(_, _, _) --[[ Line: 151 ]] end
function u19.playJumpAnimation(p46, p47) --[[ Line: 153 ]]
    p46:spinJumpInvisibility(p47)
    local v48 = p46.playerJumpAnimationTrack[p47]
    if v48 ~= nil then
        v48:Play(nil, nil, 3)
    end
end
function u19.setUpAnimationTrack(p49, p50) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
    --]]
    local v51 = p50.Character
    if not v51 then
        return nil
    end
    local v52 = v51.Humanoid.Animator
    if not v52 then
        return nil
    end
    local u53 = v52:LoadAnimation(u10:getAnimation(u9.SKATING_SLOW))
    u53.Looped = true
    u53.Priority = Enum.AnimationPriority.Movement
    local u54 = v52:LoadAnimation(u10:getAnimation(u9.SKATING_MEDIUIM))
    u54.Looped = true
    u54.Priority = Enum.AnimationPriority.Movement
    local u55 = v52:LoadAnimation(u10:getAnimation(u9.SKATING_FAST))
    u55.Looped = true
    u55.Priority = Enum.AnimationPriority.Movement
    local u56 = v52:LoadAnimation(u10:getAnimation(u9.SKATING_SPIN_JUMP))
    u56.Priority = Enum.AnimationPriority.Movement
    u56.Looped = false
    p49.playerJumpAnimationTrack[v51] = u56
    return {
        ["slowSkate"] = u53,
        ["mediumSkate"] = u54,
        ["fastSkate"] = u55,
        ["jumpTrack"] = u56,
        ["StopSkate"] = function() --[[ Name: StopSkate, Line 191 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u54
                [3] = u55
            --]]
            u53:Stop()
            u54:Stop()
            u55:Stop()
        end,
        ["StopJump"] = function() --[[ Name: StopJump, Line 196 ]]
            --[[
            Upvalues:
                [1] = u56
            --]]
            u56:Stop()
        end
    }
end
function u19.spinJumpInvisibility(_, p57) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u1
        [4] = u14
    --]]
    local u58 = u12:getEntity(p57)
    if u58 ~= nil then
        u58 = u58:getInstance()
    end
    if not u58 then
        return nil
    end
    local u59 = {
        ["transparency"] = 0.7
    }
    u7.Controllers.CharacterTransparencyController:getTransparencyModifier(u58):addModifier(u59)
    u1.Promise.delay(u14.DODGE_BUFFER_TIME):andThen(function() --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u58
            [3] = u59
        --]]
        u7.Controllers.CharacterTransparencyController:getTransparencyModifier(u58):removeModifier(u59)
    end)
end
u7.CreateController(u19.new())
return nil