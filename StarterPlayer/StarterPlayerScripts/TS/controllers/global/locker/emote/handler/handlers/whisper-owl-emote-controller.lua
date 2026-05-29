local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.RunService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u16 = {
    u14.OWL_HOOT,
    u14.OWL_HOOT_1,
    u14.OWL_HOOT_2,
    u14.OWL_HOOT_3,
    u14.OWL_HOOT_4
}
local u17 = { u14.OWL_CUTE_1, u14.OWL_CUTE_2 }
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "WhisperOwlEmoteController"
    end,
    ["__index"] = u9
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
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p21)
    p21.Name = "WhisperOwlEmoteController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u13
        [4] = u15
        [5] = u7
        [6] = u3
        [7] = u12
        [8] = u8
        [9] = u11
        [10] = u10
        [11] = u4
        [12] = u16
        [13] = u14
        [14] = u17
    --]]
    u9.KnitStart(p22)
    local v23 = u5.Controllers.EmoteHandlerController
    local v24 = u13.SPIRIT_OWL
    local u25 = u15
    local u26 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
            return "Anonymous"
        end,
        ["__index"] = u25
    })
    u26.__index = u26
    function u26.new(...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        local v27 = u26
        local v28 = setmetatable({}, v27)
        return v28:constructor(...) or v28
    end
    function u26.constructor(p29, ...) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25.constructor(p29, ...)
    end
    function u26.onEnable(u30, u31, u32, _, u33) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u12
            [4] = u8
            [5] = u11
            [6] = u10
            [7] = u4
            [8] = u16
            [9] = u14
            [10] = u17
        --]]
        local u34 = true
        u33:GiveTask(function() --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            u34 = false
        end)
        local u35 = u7.Assets.Pets.Owl:Clone()
        local v36
        if u35 == nil then
            v36 = u35
        else
            v36 = u35.PrimaryPart
        end
        if not v36 then
            return nil
        end
        u33:GiveTask(u35)
        u35.PrimaryPart.Anchored = true
        local u37 = u34
        for v38, v39 in u35:GetDescendants() do
            local _ = v38 - 1
            if v39:IsA("BasePart") then
                u3:setQueryIgnored(v39, true)
                v39.CanCollide = false
                v39.CanQuery = false
                v39.CanTouch = false
            end
        end
        u30:setupInstance(u35)
        local v40 = u32:GetPivot().RightVector.X
        local v41 = u32:GetPivot().RightVector.Z
        local v42 = Vector3.new(v40, 0, v41).Unit
        local v43 = u32:GetPivot().LookVector.X
        local v44 = u32:GetPivot().LookVector.Z
        local v45 = Vector3.new(v43, 0, v44).Unit
        u35:PivotTo(u32:GetPivot() + (v42 * 1.5 + (v45 * -1 + Vector3.new(0, -2.5, 0))))
        u12.rotateLocalDegrees(u35, Vector3.new(0, 180, 0))
        local u46 = u32:FindFirstChild("RightHand")
        if u46 then
            local u47 = u35:GetPivot().Position - u46:GetPivot().Position
            u8.Heartbeat:Connect(function() --[[ Line: 100 ]]
                --[[
                Upvalues:
                    [1] = u46
                    [2] = u47
                    [3] = u35
                    [4] = u12
                --]]
                local v48 = u46.Position + u47
                local v49 = v48.X
                local v50 = u35:GetPivot().Y
                local v51 = v48.Z
                local v52 = Vector3.new(v49, v50, v51)
                u35:PivotTo(u12.setCframePositionWithoutChangingRotation(u35:GetPivot(), v52))
            end)
        end
        u35.Parent = u32
        u11:playAnimation(u35, u10.SPIRIT_OWL_EMOTE_OWL)
        task.delay(2, function() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u30
                [3] = u4
                [4] = u16
                [5] = u31
                [6] = u32
            --]]
            if not u37 then
                return nil
            end
            local v53 = u16
            u30:playSound(u4.fromList(unpack(v53)), u31, {
                ["position"] = u32:GetPivot().Position
            })
        end)
        local u54 = nil
        u33:GiveTask((u30:watchEmoteAnimation(u31, u32, u10.SPIRIT_OWL_EMOTE_CHARACTER, function(p55) --[[ Line: 129 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u37
                [3] = u54
                [4] = u30
                [5] = u14
                [6] = u31
                [7] = u32
                [8] = u4
                [9] = u17
            --]]
            local v56 = u33
            local v57
            if p55 == nil then
                v57 = p55
            else
                v57 = p55:GetMarkerReachedSignal("fly_start"):Connect(function() --[[ Line: 133 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u54
                        [3] = u30
                        [4] = u14
                        [5] = u31
                        [6] = u32
                    --]]
                    if not u37 then
                        return nil
                    end
                    if u54 ~= nil then
                        u54:Stop()
                    end
                    u54 = u30:playSound(u14.OWL_FLY, u31, {
                        ["looped"] = true,
                        ["position"] = u32:GetPivot().Position
                    })
                end)
            end
            v56:GiveTask(v57)
            local v58 = u33
            local v59
            if p55 == nil then
                v59 = p55
            else
                v59 = p55:GetMarkerReachedSignal("fly_end"):Connect(function() --[[ Line: 150 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u54
                    --]]
                    if not u37 then
                        return nil
                    end
                    if u54 ~= nil then
                        u54:Stop()
                    end
                end)
            end
            v58:GiveTask(v59)
            local v60 = u33
            if p55 ~= nil then
                p55 = p55:GetMarkerReachedSignal("owl_sound"):Connect(function() --[[ Line: 163 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u30
                        [3] = u4
                        [4] = u17
                        [5] = u31
                        [6] = u32
                    --]]
                    if not u37 then
                        return nil
                    end
                    local v61 = u17
                    u30:playSound(u4.fromList(unpack(v61)), u31, {
                        ["position"] = u32:GetPivot().Position
                    })
                end)
            end
            v60:GiveTask(p55)
        end)))
    end
    function u26.onDisable(_, _, _, _) --[[ Line: 176 ]] end
    v23:registerHandler(v24, u26)
end
u5.CreateController(u18.new())
return nil