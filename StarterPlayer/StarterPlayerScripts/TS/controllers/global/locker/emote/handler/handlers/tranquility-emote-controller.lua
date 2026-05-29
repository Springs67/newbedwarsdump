local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src").SingleMotor
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.RunService
local u10 = v7.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "TranquilityEmoteController"
    end,
    ["__index"] = u11
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p18)
    p18.Name = "TranquilityEmoteController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u2
        [3] = u12
        [4] = u14
        [5] = u5
        [6] = u8
        [7] = u10
        [8] = u3
        [9] = u13
        [10] = u6
        [11] = u4
        [12] = u9
    --]]
    u11.KnitStart(p19)
    local v20 = u2.Controllers.EmoteHandlerController
    local v21 = u12.ZEN_HOVER
    local u22 = u14
    local u23 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
            return "Anonymous"
        end,
        ["__index"] = u22
    })
    u23.__index = u23
    function u23.new(...) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v24 = u23
        local v25 = setmetatable({}, v24)
        return v25:constructor(...) or v25
    end
    function u23.constructor(p26, ...) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u5
        --]]
        u22.constructor(p26, ...)
        p26.maid = u5.new()
    end
    function u23.onEnable(p27, p28, u29, _, p30) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u10
            [3] = u3
            [4] = u13
            [5] = u6
            [6] = u4
            [7] = u9
        --]]
        local v31 = u8.Assets.Effects.ButterflyConsumeEffect.ParticleAttachment:Clone()
        v31.Parent = u10.Terrain
        p27.maid:GiveTask(v31)
        local v32 = {}
        for _, v33 in v31:GetDescendants() do
            if v33:IsA("ParticleEmitter") then
                v32[v33] = u3.copy(v33.Size.Keypoints)
            end
        end
        p27:playSound(u13.SPIRIT_EFFECT, p28, {
            ["rollOffMaxDistance"] = 100,
            ["position"] = u29:GetPivot().Position
        })
        local v34 = Random.new()
        local v35 = false
        local v36 = 0
        local u37 = {}
        while true do
            if v35 then
                v36 = v36 + 1
            else
                v35 = true
            end
            if v36 >= 10 then
                p30:GiveTask(u9.Heartbeat:Connect(function(p38) --[[ Line: 135 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u29
                    --]]
                    for _, v39 in u37 do
                        v39.elapsedTime = v39.elapsedTime + p38
                        local v40 = v39.instance:GetPivot()
                        local v41 = math.noise(v39.elapsedTime / 3, v39.seed, 0) * 0.5
                        local v42 = math.noise(v39.elapsedTime / 3, 1, -v39.seed) * 0.5
                        local v43 = math.noise(v39.elapsedTime / 3, 0, v39.seed * 2) * 0.5
                        local v44 = Vector3.new(v41, v42, v43)
                        local v45 = u29:GetPivot().Position
                        local v46 = v39.elapsedTime * 0.5
                        local v47 = math.sin(v46) * 6
                        local v48 = v39.elapsedTime + v39.seed
                        local v49 = math.sin(v48) * 3
                        local v50 = v39.elapsedTime * 0.5
                        local v51 = math.cos(v50) * 6
                        local v52 = (v45 + Vector3.new(v47, v49, v51) - v40.Position).Unit * -0.3
                        local v53 = u29:GetPivot().Position
                        local v54 = v40.Position
                        local v55 = v44 + ((v53 - Vector3.new(0, 1, 0) - v54).Y > 0 and Vector3.new(0, -0.6, 0) or Vector3.new()) + v52
                        local v56 = (v40 * CFrame.new(0, 0, 3)).Position + v55 - v40.Position
                        local v57 = CFrame
                        local v58 = v40.Position
                        local v59 = v40.Position
                        v39.goalAttachment.WorldCFrame = v57.lookAt(v58, v59 + v55)
                        v39.linearVelocity.VectorVelocity = v56.Unit * 4
                    end
                end))
                p30:GiveTask(function() --[[ Line: 165 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                    --]]
                    for _, v60 in u37 do
                        v60.instance:Destroy()
                        v60.goalAttachment:Destroy()
                        v60.motor:destroy()
                    end
                end)
                return
            end
            local v61 = u29:GetPivot()
            local v62 = CFrame.new
            local v63 = v34:NextNumber(0, 1) * 100
            local v64 = math.sin(v63) * 5
            local v65 = v34:NextNumber(0, 1) * 100
            local v66 = v61 * v62(v64, 0, math.cos(v65) * 5)
            local u67 = u8.Assets.Effects.KillEffectButterfly:Clone()
            u67:PivotTo(CFrame.lookAt(v66.Position, u29:GetPivot().Position))
            u67.Parent = u10
            local v68 = u6("Attachment", {
                ["Parent"] = u67.PrimaryPart
            })
            local v69 = u6("Attachment", {
                ["Parent"] = u10.Terrain
            })
            local v70 = u6("LinearVelocity", {
                ["Parent"] = u67.PrimaryPart,
                ["MaxForce"] = u67.PrimaryPart.AssemblyMass * 10,
                ["Attachment0"] = v68
            })
            u6("AlignOrientation", {
                ["MaxTorque"] = 50000000,
                ["Responsiveness"] = 3,
                ["Parent"] = u67.PrimaryPart,
                ["Attachment0"] = v68,
                ["Attachment1"] = v69
            })
            local v71 = u8.Assets.Effects.ButterflyBeam:Clone()
            v71.Parent = v68
            v71.Attachment0 = v68
            u67.PrimaryPart.Anchored = false
            local v72 = u4.new(1)
            v72:onStep(function(p73) --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u67
                --]]
                if u67.PrimaryPart then
                    u67.PrimaryPart.Size = Vector3.new(p73, p73, p73)
                end
            end)
            local v74 = {
                ["partCount"] = 1,
                ["consuming"] = false,
                ["instance"] = u67,
                ["origin"] = v66,
                ["seed"] = v34:NextNumber(-50000, 50000),
                ["linearVelocity"] = v70,
                ["goalAttachment"] = v69,
                ["elapsedTime"] = v36 * 0.6283185307179586 * 2,
                ["motor"] = v72,
                ["beam"] = v71
            }
            table.insert(u37, v74)
        end
    end
    function u23.onDisable(_, _, _, _) --[[ Line: 173 ]] end
    v20:registerHandler(v21, u23)
end
u2.CreateController(u15.new())
return nil