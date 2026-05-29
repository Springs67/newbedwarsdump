local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "SpringPunchGadgetController"
    end,
    ["__index"] = u7
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
    --]]
    u7.constructor(p16)
    p16.Name = "SpringPunchGadgetController"
    p16.shotSounds = { u12.SPRING_PUNCH_SHOT_1, u12.SPRING_PUNCH_SHOT_2, u12.SPRING_PUNCH_SHOT_3 }
    p16.hitSounds = { u12.SPRING_PUNCH_HIT_1, u12.SPRING_PUNCH_HIT_2, u12.SPRING_PUNCH_HIT_3 }
end
function u13.KnitStart(u17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u10
        [4] = u12
        [5] = u11
        [6] = u6
        [7] = u4
    --]]
    u7.KnitStart(u17)
    u5.Controllers.PreloadController:preloadForItemType(u10.LOBBY_SPRING_PUNCH, {
        ["sounds"] = {
            u12.SPRING_PUNCH_SHOT_1,
            u12.SPRING_PUNCH_SHOT_2,
            u12.SPRING_PUNCH_SHOT_3,
            u12.SPRING_PUNCH_HIT_1,
            u12.SPRING_PUNCH_HIT_2,
            u12.SPRING_PUNCH_HIT_3,
            u12.SPRING_PUNCH_RETRACT
        }
    })
    u11.Client:Get("LobbySpringPunchFromServer"):Connect(function(u18) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u4
            [3] = u17
        --]]
        if u18.userPlayer == u6.LocalPlayer then
            local v19 = u18.targetPlayer
            if v19 ~= nil then
                v19 = v19.Character
                if v19 ~= nil then
                    v19 = v19.PrimaryPart
                end
            end
            if v19 then
                local v20 = u4
                local v21 = u17.hitSounds[math.random(0, #u17.hitSounds - 1) + 1]
                local v22 = {}
                local v23 = u18.targetPlayer.Character
                if v23 ~= nil then
                    v23 = v23.PrimaryPart
                    if v23 ~= nil then
                        v23 = v23.Position
                    end
                end
                v22.position = v23
                local v24 = u18.targetPlayer.Character
                if v24 ~= nil then
                    v24 = v24.PrimaryPart
                end
                v22.parent = v24
                v20:playSound(v21, v22)
            end
            return nil
        end
        task.spawn(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u18
            --]]
            u17:animatePunch(u18.userPlayer, u18.targetPlayer)
        end)
    end)
end
function u13.animatePunch(u25, p26, u27) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u3
        [4] = u9
        [5] = u8
        [6] = u4
    --]]
    local v28
    if p26 == u6.LocalPlayer then
        if u5.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            v28 = u5.Controllers.ViewmodelController:getViewModel()
            if v28 ~= nil then
                v28 = v28:FindFirstChild("lobby_spring_punch")
                if v28 ~= nil then
                    v28 = v28:FindFirstChild("Handle")
                    if v28 ~= nil then
                        v28 = v28:FindFirstChild("AnimationController")
                        if v28 ~= nil then
                            v28 = v28:FindFirstChild("Animator")
                        end
                    end
                end
            end
        else
            v28 = u6.LocalPlayer
            if v28 ~= nil then
                v28 = v28.Character
                if v28 ~= nil then
                    v28 = v28:FindFirstChild("lobby_spring_punch")
                    if v28 ~= nil then
                        v28 = v28:FindFirstChild("Handle")
                        if v28 ~= nil then
                            v28 = v28:FindFirstChild("AnimationController")
                            if v28 ~= nil then
                                v28 = v28:FindFirstChild("Animator")
                            end
                        end
                    end
                end
            end
        end
    elseif p26 == nil then
        v28 = p26
    else
        v28 = p26.Character
        if v28 ~= nil then
            v28 = v28:FindFirstChild("lobby_spring_punch")
            if v28 ~= nil then
                v28 = v28:FindFirstChild("Handle")
                if v28 ~= nil then
                    v28 = v28:FindFirstChild("AnimationController")
                    if v28 ~= nil then
                        v28 = v28:FindFirstChild("Animator")
                    end
                end
            end
        end
    end
    if v28 then
        u3:playAnimation(v28, u9:getAssetId(u8.SPRING_PUNCH_ATTACK), {
            ["looped"] = false,
            ["speed"] = 4
        })
    end
    local v29 = p26.Character
    if v29 ~= nil then
        v29 = v29.PrimaryPart
    end
    if v29 then
        local v30 = u4
        local v31 = u25.shotSounds[math.random(0, #u25.shotSounds - 1) + 1]
        local v32 = {}
        local v33 = p26.Character
        if v33 ~= nil then
            v33 = v33.PrimaryPart
            if v33 ~= nil then
                v33 = v33.Position
            end
        end
        v32.position = v33
        local v34 = p26.Character
        if v34 ~= nil then
            v34 = v34.PrimaryPart
        end
        v32.parent = v34
        v30:playSound(v31, v32)
    end
    local v35
    if u27 == nil then
        v35 = u27
    else
        v35 = u27.Character
        if v35 ~= nil then
            v35 = v35.PrimaryPart
        end
    end
    if v35 then
        task.delay(0.2, function() --[[ Line: 184 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u25
                [3] = u27
            --]]
            local v36 = u4
            local v37 = u25.hitSounds[math.random(0, #u25.hitSounds - 1) + 1]
            local v38 = {}
            local v39 = u27.Character
            if v39 ~= nil then
                v39 = v39.PrimaryPart
                if v39 ~= nil then
                    v39 = v39.Position
                end
            end
            v38.position = v39
            local v40 = u27.Character
            if v40 ~= nil then
                v40 = v40.PrimaryPart
            end
            v38.parent = v40
            v36:playSound(v37, v38)
        end)
    end
end
u5.CreateController(u13.new())
return nil