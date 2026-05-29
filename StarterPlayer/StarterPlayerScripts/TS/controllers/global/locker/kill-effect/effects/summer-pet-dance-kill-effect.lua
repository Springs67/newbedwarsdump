local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.GameQueryUtil
local u5 = v2.RandomUtil
local u6 = v2.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u8 = v7.InCubic
local u9 = v7.OutCubic
local u10 = v7.OutExpo
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "summer-2024", "summer-event-2024-config").Summer2024EventConfig
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types").GlobalTeamKey
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-meta").PetMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u25 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "SummerPetDanceKillEffect"
    end,
    ["__index"] = u25
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29, p30) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    u25.constructor(p29, p30)
    u25.setPlayDefaultKillEffect(p29, false)
end
function u26.onKill(p31, _, p32, p33) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u25
        [3] = u21
        [4] = u3
        [5] = u16
        [6] = u19
        [7] = u5
        [8] = u20
        [9] = u22
        [10] = u11
        [11] = u4
        [12] = u14
        [13] = u13
        [14] = u18
        [15] = u17
        [16] = u6
        [17] = u23
        [18] = u15
        [19] = u9
        [20] = u24
        [21] = u8
        [22] = u10
    --]]
    local u34 = u12.new()
    u25.hideCharacter(p31, p32)
    local v35 = { u21.SUMMER_2024_CRAB, u21.SUMMER_2024_TURTLE }
    local v36
    if u3.isHoarceKat() then
        v36 = u21.SUMMER_2024_CRAB
    else
        v36 = u16:getState().Event.profileData.events[u19.SUMMER_2024]
        if v36 ~= nil then
            v36 = v36.globalTeamKey
        end
        if v36 == nil then
            v36 = u5.randomArraySelectN(v35, 1)[1]
        end
    end
    if not v36 or table.find(v35, v36) == nil then
        return u34
    end
    local v37 = u20.teamToPet[v36].pet
    local u38 = u22[v37].model:Clone()
    if u38 == nil or u38.PrimaryPart == nil then
        u11.Warn("Error creating pet {petType}. model not found", v37)
        return u34
    end
    local v39 = p33 * CFrame.Angles(0, -3.141592653589793, 0)
    u38:PivotTo(v39)
    local v40 = p31.killerPlayer.Character
    if v40 ~= nil then
        v40 = v40:GetPivot().Position
    end
    local v41 = CFrame
    local v42 = p33.Position + Vector3.new(0, 3, 0)
    local v43
    if v40 then
        local v44 = v40.X
        local v45 = p33.Y
        local v46 = v40.Z
        v43 = Vector3.new(v44, v45, v46)
    else
        v43 = p33.Position + Vector3.new(0, 3, 0)
    end
    local v47 = v41.lookAt(v42, v43)
    if u38.PrimaryPart then
        u38.PrimaryPart.Anchored = true
    end
    u38:ScaleTo(0.00001)
    u4:setQueryIgnored(u38, true)
    u38.Parent = u14
    u34:GiveTask(u38)
    local v48 = u38:FindFirstChildWhichIsA("AnimationController")
    if v48 ~= nil then
        v48 = v48:FindFirstChildWhichIsA("Animator")
    end
    local v49 = v48 or u13("Animator", {
        ["Parent"] = u38:FindFirstChildWhichIsA("AnimationController")
    })
    if v49 ~= nil then
        local v50 = u18
        local v51
        if v36 == u21.SUMMER_2024_CRAB then
            v51 = u17.CRAB_DANCE
        else
            v51 = u17.TURTLE_DANCE
        end
        v49 = v49:LoadAnimation(v50:getAnimation(v51))
    end
    if not v49 then
        return u34
    end
    v49.Looped = true
    v49:Play()
    u34:GiveTask((u6:playSound(u23.LOBBY_MUSIC_SUMMER, {
        ["volumeMultiplier"] = 2,
        ["position"] = v39.Position
    })))
    u15(1, u9, function(p52) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        local v53 = u38.PrimaryPart
        if v53 then
            v53:PivotTo(p52)
        end
    end, v39, v47)
    u24.tweenModelSizeScaleTo(u38, 0.7, u8, 1.5)
    task.delay(3, function() --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u38
            [3] = u10
            [4] = u34
        --]]
        u24.tweenModelSizeScaleTo(u38, 0.6, u10, 0.00001):andThen(function() --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            u34:DoCleaning()
        end)
    end)
    return u34
end
return u26