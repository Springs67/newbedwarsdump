local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src").SingleMotor
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.RunService
local u11 = v8.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util")
local u17 = v16.findSurfacePosition
local u18 = v16.getClosestBlockReferenceBelowWorldPosition
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "VoidMeditationEmoteController"
    end,
    ["__index"] = u13
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p25)
    p25.Name = "VoidMeditationEmoteController"
end
function u22.KnitStart(p26) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u3
        [3] = u19
        [4] = u21
        [5] = u11
        [6] = u7
        [7] = u12
        [8] = u5
        [9] = u18
        [10] = u2
        [11] = u17
        [12] = u9
        [13] = u15
        [14] = u14
        [15] = u20
        [16] = u4
        [17] = u6
        [18] = u10
    --]]
    u13.KnitStart(p26)
    local v27 = u3.Controllers.EmoteHandlerController
    local v28 = u19.VOID_MEDITATION
    local u29 = u21
    local u30 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 49 ]]
            return "Anonymous"
        end,
        ["__index"] = u29
    })
    u30.__index = u30
    function u30.new(...) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        local v31 = u30
        local v32 = setmetatable({}, v31)
        return v32:constructor(...) or v32
    end
    function u30.constructor(p33, ...) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29.constructor(p33, ...)
    end
    function u30.onEnable(p34, p35, u36, _, u37) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u12
            [4] = u5
            [5] = u18
            [6] = u2
            [7] = u17
            [8] = u9
            [9] = u15
            [10] = u14
            [11] = u20
            [12] = u4
            [13] = u6
            [14] = u10
        --]]
        local u38 = u7("Part", {
            ["Name"] = "EmotePart",
            ["Transparency"] = 1,
            ["Size"] = Vector3.new(1, 1, 1),
            ["Parent"] = u11,
            ["Position"] = u36.Head.Position + Vector3.new(0, 6, 0),
            ["Anchored"] = true,
            ["CanCollide"] = false
        })
        local u39 = u7("PointLight", {
            ["Name"] = "EmotePointLight",
            ["Brightness"] = 0,
            ["Range"] = 10,
            ["Enabled"] = true,
            ["Parent"] = u38,
            ["Color"] = Color3.fromRGB(133, 46, 158)
        })
        local u41 = u12(1, u5, function(p40) --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            u39.Brightness = p40
        end, 0, 2)
        local v42 = u18(u36:GetPivot().Position, 3)
        if v42 ~= nil then
            v42 = v42.blockPosition
        end
        if v42 == nil then
            v42 = u2:getBlockPosition(u36:GetPivot().Position)
        end
        local v43 = u17(v42)
        local u44 = u9.Assets.Effects.VoidMeditationPortal:Clone()
        if v43 == nil then
            v43 = u36:GetPivot().Position - Vector3.new(0, 2, 0)
        end
        u44:PivotTo(CFrame.new(v43))
        u44.Parent = u11
        u37:GiveTask(function() --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            u44:Destroy()
        end)
        local v45 = u36:WaitForChild("Humanoid"):WaitForChild("Animator")
        local u46 = v45:LoadAnimation(u15:getAnimation(u14.VOID_MEDITATION_KNEEL))
        local u47 = v45:LoadAnimation(u15:getAnimation(u14.VOID_MEDITATION_IDLE))
        u46:Play()
        u41:Play()
        local u48 = p34:playSound(u20.VOID_PORTAL_LOOP, p35, {
            ["looped"] = true,
            ["volumeMultiplier"] = 0.4,
            ["position"] = u36:GetPivot().Position
        })
        u37:GiveTask(function() --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u39
                [3] = u41
                [4] = u46
                [5] = u48
            --]]
            u38:Destroy()
            u39:Destroy()
            u41:Cancel()
            u46:Stop()
            u46:Destroy()
            u48:Destroy()
        end)
        u46:GetMarkerReachedSignal("freeze"):Connect(function() --[[ Line: 130 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u47
                [3] = u37
            --]]
            u46:AdjustSpeed(0)
            u47:Play()
            u46:Stop(1)
            u37:GiveTask(function() --[[ Line: 134 ]]
                --[[
                Upvalues:
                    [1] = u47
                --]]
                u47:Stop()
                u47:Destroy()
            end)
        end)
        local v49 = u9.Assets.Effects.ButterflyConsumeEffect.ParticleAttachment:Clone()
        v49.Parent = u11.Terrain
        u37:GiveTask(v49)
        local v50 = {}
        for _, v51 in v49:GetDescendants() do
            if v51:IsA("ParticleEmitter") then
                v50[v51] = u4.copy(v51.Size.Keypoints)
            end
        end
        local v52 = Random.new()
        local v53 = false
        local v54 = 0
        local u55 = {}
        while true do
            if v53 then
                v54 = v54 + 1
            else
                v53 = true
            end
            if v54 >= 10 then
                u37:GiveTask(u10.Heartbeat:Connect(function(p56) --[[ Line: 209 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                        [2] = u36
                    --]]
                    for _, v57 in u55 do
                        v57.elapsedTime = v57.elapsedTime + p56
                        local v58 = v57.instance:GetPivot()
                        local v59 = math.noise(v57.elapsedTime / 3, v57.seed, 0) * 0.5
                        local v60 = math.noise(v57.elapsedTime / 3, 1, -v57.seed) * 0.5
                        local v61 = math.noise(v57.elapsedTime / 3, 0, v57.seed * 2) * 0.5
                        local v62 = Vector3.new(v59, v60, v61)
                        local v63 = u36:GetPivot().Position
                        local v64 = v57.elapsedTime * 0.5
                        local v65 = math.sin(v64) * 6
                        local v66 = v57.elapsedTime + v57.seed
                        local v67 = math.sin(v66) * 3
                        local v68 = v57.elapsedTime * 0.5
                        local v69 = math.cos(v68) * 6
                        local v70 = (v63 + Vector3.new(v65, v67, v69) - v58.Position).Unit * -0.3
                        local v71 = u36:GetPivot().Position
                        local v72 = v58.Position
                        local v73 = v62 + ((v71 - Vector3.new(0, 1, 0) - v72).Y > 0 and Vector3.new(0, -0.6, 0) or Vector3.new()) + v70
                        local v74 = (v58 * CFrame.new(0, 0, 3)).Position + v73 - v58.Position
                        local v75 = CFrame
                        local v76 = v58.Position
                        local v77 = v58.Position
                        v57.goalAttachment.WorldCFrame = v75.lookAt(v76, v77 + v73)
                        v57.linearVelocity.VectorVelocity = v74.Unit * 4
                    end
                end))
                u37:GiveTask(function() --[[ Line: 239 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                    --]]
                    for _, v78 in u55 do
                        v78.instance:Destroy()
                        v78.goalAttachment:Destroy()
                        v78.motor:destroy()
                    end
                end)
                return
            end
            local v79 = u36:GetPivot()
            local v80 = CFrame.new
            local v81 = v52:NextNumber(0, 1) * 100
            local v82 = math.sin(v81) * 5
            local v83 = v52:NextNumber(0, 1) * 100
            local v84 = v79 * v80(v82, 0, math.cos(v83) * 5)
            local u85 = u9.Assets.Effects.KillEffectVoidShadow:Clone()
            u85:PivotTo(CFrame.lookAt(v84.Position, u36:GetPivot().Position))
            u85.Parent = u11
            local v86 = u7("Attachment", {
                ["Parent"] = u85.PrimaryPart
            })
            local v87 = u7("Attachment", {
                ["Parent"] = u11.Terrain
            })
            local v88 = u7("LinearVelocity", {
                ["Parent"] = u85.PrimaryPart,
                ["MaxForce"] = u85.PrimaryPart.AssemblyMass * 10,
                ["Attachment0"] = v86
            })
            u7("AlignOrientation", {
                ["MaxTorque"] = 50000000,
                ["Responsiveness"] = 3,
                ["Parent"] = u85.PrimaryPart,
                ["Attachment0"] = v86,
                ["Attachment1"] = v87
            })
            u85.PrimaryPart.Anchored = false
            local v89 = u6.new(1)
            v89:onStep(function(p90) --[[ Line: 191 ]]
                --[[
                Upvalues:
                    [1] = u85
                --]]
                if u85.PrimaryPart then
                    u85.PrimaryPart.Size = Vector3.new(p90, p90, p90)
                end
            end)
            local v91 = {
                ["partCount"] = 1,
                ["instance"] = u85,
                ["origin"] = v84,
                ["seed"] = v52:NextNumber(-50000, 50000),
                ["linearVelocity"] = v88,
                ["goalAttachment"] = v87,
                ["elapsedTime"] = v54 * 0.6283185307179586 * 2,
                ["motor"] = v89
            }
            table.insert(u55, v91)
        end
    end
    function u30.onDisable(_, _, _, _) --[[ Line: 247 ]] end
    v27:registerHandler(v28, u30)
end
u3.CreateController(u22.new())
return nil