local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.ReplicatedStorage
local u11 = v8.RunService
local u12 = v8.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local v19 = {}
local u20 = setmetatable({}, {
    ["__index"] = v19
})
u20.GROUND = 0
v19[0] = "GROUND"
u20.FLYING = 1
v19[1] = "FLYING"
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "GoldenGooseBehavior"
    end
})
u21.__index = u21
function u21.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24, p25) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u12
        [4] = u5
        [5] = u17
        [6] = u9
        [7] = u18
        [8] = u15
        [9] = u14
        [10] = u20
    --]]
    p24.maid = u7.new()
    p24.gooseModel = u10.Assets.Misc.GoldenGoose:Clone()
    p24.gooseModel:PivotTo(p25)
    p24.gooseModel.Parent = u12
    p24.maid:GiveTask(p24.gooseModel)
    u5:playSound(u17.GOLDEN_GOOSE_AMBIENT, {
        ["fadeInTime"] = 3,
        ["looped"] = true,
        ["parent"] = p24.gooseModel.PrimaryPart
    })
    u9:AddTag(p24.gooseModel, "ActiveGoose")
    local v26 = u10.Assets.Effects.GooseTeleport:Clone()
    v26.Position = p25.Position
    u18:playEffects({ v26 }, nil, {
        ["destroyAfterSec"] = 5
    })
    local v27, v28 = p24.gooseModel:GetBoundingBox()
    local v29 = v27.Position - v28 / 2
    p24.groundOffset = (p24.gooseModel.PrimaryPart.Position - v29).Y
    u15:playAnimation(p24.gooseModel, u14.GOLDEN_GOOSE_IDLE, {
        ["looped"] = true
    })
    local v30 = u15:playAnimation(p24.gooseModel, u14.GOLDEN_GOOSE_FLY, {
        ["looped"] = true
    })
    p24.currentGooseState = {
        ["state"] = u20.FLYING,
        ["track"] = v30,
        ["startedAt"] = os.clock() - 4
    }
    if v30 then
        p24:hookFlightParticles(v30)
    end
    p24:initializeBubbleMovement()
end
function u21.initializeBubbleMovement(u31) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u16
        [3] = u3
    --]]
    local u32 = nil
    u31.maid:GiveTask(u11.Heartbeat:Connect(function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u32
            [3] = u16
            [4] = u3
        --]]
        if not u31.owner then
            return nil
        end
        local v33 = u31.owner.Character
        if v33 ~= nil then
            v33 = v33:GetPivot()
        end
        if not v33 then
            return nil
        end
        local v34 = u31.gooseModel:GetPivot()
        if not u32 then
            u32 = u31:snapPositionToBubble(v34.Position, v33.Position, 1 * u16)
        end
        u32 = u31:snapPositionToBubble(u32, v33.Position, 3 * u16)
        if not u31.currentObjective then
            local v35 = u31.gooseModel:GetPivot().Position
            if u31:snapPositionToBubble(v35, u32, 3 * u16) == v35 then
                return nil
            end
            local v36 = u32
            RaycastParams.new().CollisionGroup = "Players"
            local v37 = u3
            local v38 = u32
            local v39 = -3 * u16
            local v40 = v37:raycast(v38, (Vector3.new(0, v39, 0)))
            local v41
            if v40 then
                v41 = v40.Position
            else
                local v42 = u31.owner.Character
                if v42 ~= nil then
                    v42 = v42:FindFirstChildWhichIsA("Humanoid")
                    if v42 ~= nil then
                        v42 = v42.HipHeight
                    end
                end
                local v43 = v42 == nil and 2 or v42
                local v44 = u31.owner.Character
                if v44 ~= nil then
                    v44 = v44.PrimaryPart
                    if v44 ~= nil then
                        v44 = v44.Size.Y
                    end
                end
                local v45 = v43 + (v44 == nil and 2 or v44) / 2
                v41 = v36 - Vector3.new(0, v45, 0)
            end
            u31:updateObjective(CFrame.new(v41))
        end
    end))
end
function u21.updateObjective(u46, u47) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u3
        [3] = u20
        [4] = u15
        [5] = u14
        [6] = u13
        [7] = u6
    --]]
    local u48 = u46.gooseModel:GetPivot()
    local v49 = (u47.Position - u48.Position).Magnitude
    if u16 * 15 < v49 then
        u46.gooseModel:PivotTo(u47)
        return nil
    end
    local v50 = false
    local v51 = 5
    local v52 = false
    local v53 = false
    while true do
        if v50 then
            v51 = v51 - 1
        else
            v50 = true
        end
        if v51 < 0 then
            local v54 = u46.currentGooseState.state == u20.FLYING
            if os.clock() - u46.currentGooseState.startedAt > 5 + math.random() * 5 then
                v54 = not v54
            end
            local u55 = v52 and true or v54
            local v56 = u55 == (u46.currentGooseState.state == u20.GROUND)
            local v57 = u55 or u46.currentGooseState.state == u20.FLYING
            local u58 = nil
            local v59 = u46.currentGooseState.track
            if v59 ~= nil then
                v59 = v59.IsPlaying
            end
            if not v59 or v56 then
                local v60 = u15
                local v61 = u46.gooseModel
                local v62
                if v57 then
                    v62 = u14.GOLDEN_GOOSE_FLY
                else
                    v62 = u14.GOLDEN_GOOSE_WALKING
                end
                u58 = v60:playAnimation(v61, v62, {
                    ["looped"] = true
                })
                if u58 then
                    if v57 then
                        u46:hookFlightParticles(u58)
                    else
                        u46:hookFootstepSounds(u58)
                    end
                end
            end
            if v56 then
                local v63 = u46.currentGooseState.track
                if v63 ~= nil then
                    v63:Stop()
                end
                local v64 = u46.currentGooseState.track
                if v64 ~= nil then
                    v64:Destroy()
                end
                local v65 = {}
                local v66
                if u55 then
                    v66 = u20.FLYING
                else
                    v66 = u20.GROUND
                end
                v65.state = v66
                v65.track = u58
                v65.startedAt = os.clock()
                u46.currentGooseState = v65
            end
            if not u55 then
                if u58 ~= nil then
                    u58:AdjustSpeed(3)
                end
            end
            if u55 then
                u55 = not v53 or v52 == false
            end
            if u55 then
                u47 = u47 + Vector3.new(0, 4, 0)
            end
            u46.currentObjective = u47
            local v67 = v49 / (6 * u16)
            local v68 = u47.Position - u48.Position
            local u69 = CFrame.lookAt(Vector3.new(0, 0, 0), v68 * Vector3.new(1, 0, 1))
            local u79 = u13(v67, u6, function(p70) --[[ Line: 260 ]]
                --[[
                Upvalues:
                    [1] = u48
                    [2] = u47
                    [3] = u69
                    [4] = u46
                --]]
                local v71 = u48:Lerp(u47 * u69, p70)
                local v72 = (u47.Position - u48.Position).Y
                if math.abs(v72) > 2 then
                    local v73 = -math.sign(v72)
                    local v74 = math.pow(2, v73)
                    local v75 = math.pow(p70, v74)
                    local v76 = u48.Position:Lerp(u47.Position, v75).Y
                    local v77 = v71.Position
                    local v78 = Vector3.new(0, v76, 0)
                    v71 = CFrame.new(v77 * Vector3.new(1, 0, 1) + v78) * (v71 - v71.Position)
                end
                u46.gooseModel:PivotTo(v71)
            end)
            task.spawn(function() --[[ Line: 281 ]]
                --[[
                Upvalues:
                    [1] = u79
                    [2] = u55
                    [3] = u58
                    [4] = u46
                    [5] = u15
                    [6] = u14
                --]]
                u79:Wait()
                if not u55 then
                    local v80 = u58
                    if v80 ~= nil then
                        v80:Stop()
                    end
                    local v81 = u58
                    if v81 ~= nil then
                        v81:Destroy()
                    end
                    local v82 = u46.gooseModel:FindFirstChildWhichIsA("AnimationController")
                    if v82 ~= nil then
                        v82 = v82:FindFirstChildWhichIsA("Animator")
                    end
                    if v82 then
                        local v83 = false
                        local v84 = v83
                        for v85, v86 in v82:GetPlayingAnimationTracks() do
                            local _ = v85 - 1
                            local v87 = v86.Animation
                            if v87 ~= nil then
                                v87 = v87.AnimationId
                            end
                            if v87 == u15:getAssetId(u14.GOLDEN_GOOSE_IDLE) then
                                if v86.IsPlaying and v86.WeightTarget ~= 0 then
                                    v83 = true
                                    v84 = v83
                                else
                                    v86:Stop()
                                    v86:Destroy()
                                end
                            end
                        end
                        if not v84 then
                            u15:playAnimation(u46.gooseModel, u14.GOLDEN_GOOSE_IDLE, {
                                ["looped"] = true
                            })
                        end
                    end
                end
                u46.currentObjective = nil
            end)
            return
        end
        local v88 = u48.Position:Lerp(u47.Position, v51 / 5)
        RaycastParams.new().CollisionGroup = "Players"
        local v89 = u3
        local v90 = -3 * u16
        local v91 = v89:raycast(v88, (Vector3.new(0, v90, 0)))
        if v91 then
            if v51 == 5 and v91 then
                v53 = true
            end
        else
            v52 = true
        end
    end
end
function u21.snapPositionToBubble(_, p92, p93, p94) --[[ Line: 329 ]]
    local v95 = p92 - p93
    if v95.Magnitude <= p94 then
        return p92
    else
        return p93 + v95.Unit * p94
    end
end
function u21.updateOwner(p96, p97) --[[ Line: 341 ]]
    p96.owner = p97
end
function u21.Destroy(p98) --[[ Line: 344 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u18
    --]]
    local v99 = p98.gooseModel:GetPivot().Position
    local v100 = u10.Assets.Effects.GooseTeleport:Clone()
    v100.Position = v99
    u18:playEffects({ v100 }, nil, {
        ["destroyAfterSec"] = 5
    })
    p98.maid:DoCleaning()
end
function u21.hookFootstepSounds(u101, p102) --[[ Line: 353 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u17
    --]]
    p102:GetMarkerReachedSignal("footstep"):Connect(function() --[[ Line: 354 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u17
            [4] = u101
        --]]
        u5:playSound(u4.fromList(u17.GOLDEN_GOOSE_FOOTSTEP_1, u17.GOLDEN_GOOSE_FOOTSTEP_2, u17.GOLDEN_GOOSE_FOOTSTEP_3, u17.GOLDEN_GOOSE_FOOTSTEP_4), {
            ["position"] = u101.gooseModel:GetPivot().Position
        })
    end)
end
function u21.hookFlightParticles(u103, p104) --[[ Line: 360 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u17
    --]]
    local u105 = 0
    p104:GetMarkerReachedSignal("flap"):Connect(function() --[[ Line: 362 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u17
            [3] = u105
            [4] = u103
        --]]
        u5:playSound(({ u17.GOLDEN_GOOSE_FLAP_1, u17.GOLDEN_GOOSE_FLAP_2 })[u105 + 1], {
            ["position"] = u103.gooseModel:GetPivot().Position
        })
        u105 = (u105 + 1) % 2
        local v106 = u103.gooseModel.PrimaryPart
        if v106 ~= nil then
            v106 = v106:GetChildren()
        end
        for _, v107 in v106 == nil and {} or v106 do
            local v108 = v107:FindFirstChild("GoldAttachment")
            if v108 ~= nil then
                v108 = v108:FindFirstChild("Gold")
            end
            if v108 then
                v108:Emit(10)
            end
        end
    end)
end
return {
    ["GoldenGooseBehavior"] = u21
}