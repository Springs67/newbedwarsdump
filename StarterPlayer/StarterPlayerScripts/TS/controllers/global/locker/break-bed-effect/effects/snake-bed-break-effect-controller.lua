local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.ColorUtil
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.ReplicatedStorage
local u15 = v13.RunService
local u16 = v13.TweenService
local u17 = v13.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u27 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "SnakeBedBreakEffectController"
    end,
    ["__index"] = u27
})
u28.__index = u28
function u28.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u22
        [3] = u23
    --]]
    u27.constructor(p31, u22.SNAKE)
    p31.Name = "SnakeBedBreakEffectController"
    p31.snakePool = {}
    p31.logger = u23.getLogger("SnakeBedBreakEffectController")
    p31.teamEffectState = {}
end
function u28.KnitStart(p32) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    u27.KnitStart(p32)
end
function u28.onBedBreak(u33, _, u34, u35, _) --[[ Line: 60 ]]
    task.defer(function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u34
            [3] = u35
        --]]
        return u33:playEffect(u34, u35)
    end)
end
function u28.playEffect(u36, u37, u38) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
        [3] = u24
        [4] = u17
        [5] = u6
        [6] = u16
        [7] = u14
        [8] = u4
        [9] = u20
        [10] = u19
        [11] = u15
        [12] = u2
        [13] = u25
    --]]
    local u39 = u11.new()
    u36.maid:GiveTask(u39)
    u36.maid:GiveTask(function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u38
        --]]
        for v40, v41 in u36.snakePool do
            local _ = v40 - 1
            v41.model:Destroy()
            v41.pickupPart:Destroy()
        end
        table.clear(u36.snakePool)
        u36.teamEffectState[u38] = "Smoke"
    end)
    u39:GiveTask(u7:playSound(u24.SNAKE_BED_BREAK, {
        ["volumeMultiplier"] = 0.3,
        ["position"] = u37.Position
    }))
    local v42 = u36:getBedClone(u38)
    if not v42 then
        return nil
    end
    v42.Name = "BedBreakEffectBedClone"
    v42.Parent = u17
    v42:PivotTo(u37)
    for v43, v44 in v42:GetDescendants() do
        local _ = v43 - 1
        if v44:IsA("BasePart") or v44:IsA("MeshPart") then
            v44.CanCollide = false
            v44.CanQuery = false
            v44.CanTouch = false
        end
    end
    u39:GiveTask(v42)
    local v45 = 0
    local v46 = {}
    for v47, v49 in v42.Pivot.Align:GetChildren() do
        local _ = v47 - 1
        if not v49:IsA("MeshPart") then
            local v49 = nil
        end
        if v49 ~= nil then
            v45 = v45 + 1
            v46[v45] = v49
        end
    end
    local u50 = v46 == nil and {} or v46
    local v51 = 0
    local u52 = {}
    for v53, v54 in u6.shuffleArray(u50) do
        if v53 - 1 < 20 == true then
            v51 = v51 + 1
            u52[v51] = v54
        end
    end
    u39:GiveTask(task.delay(0, function() --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u50
            [3] = u16
        --]]
        local v55 = 0
        local v56 = {}
        for v57, v58 in u50 do
            local _ = v57 - 1
            if table.find(u52, v58) == nil == true then
                v55 = v55 + 1
                v56[v55] = v58
            end
        end
        for v59, v60 in v56 do
            local _ = v59 - 1
            u16:Create(v60, TweenInfo.new(0.5), {
                ["Transparency"] = 1
            }):Play()
        end
    end))
    local function v76(p61, p62) --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u39
            [3] = u37
            [4] = u36
            [5] = u17
            [6] = u4
            [7] = u20
            [8] = u19
        --]]
        local v63 = u14.Assets.Pets.GoldenSnake:Clone()
        v63.Name = "bedbreak-snake-" .. tostring(p62)
        v63:ScaleTo(0.3)
        u39:GiveTask(p61)
        local v64 = u37.Position + u36:getRandomizedEqualMagnitudeVector3(2)
        v63.Parent = u17
        for v65, v66 in v63:GetDescendants() do
            local _ = v65 - 1
            if v66:IsA("BasePart") or v66:IsA("MeshPart") then
                v66.CanCollide = false
                v66.CanQuery = false
                v66.CanTouch = false
            end
        end
        local v67 = v63.PrimaryPart
        if v67 then
            v67.Anchored = true
        end
        local v68 = nil
        for v69, v70 in v63:GetChildren() do
            local _ = v69 - 1
            if v70:IsA("MeshPart") == true then
                v68 = v70
                break
            end
        end
        if v68 then
            v68.Transparency = 1
        end
        local v71 = v63:FindFirstChildWhichIsA("Animator", true)
        if v71 then
            local u72 = u4:playAnimation(v71, u20:getAssetId(u19.GOLDEN_SNAKE_WALK), {
                ["looped"] = true
            })
            if u72 ~= nil then
                u72:Stop()
            end
            u36.maid:GiveTask(task.delay(0.5 + math.random(), function() --[[ Line: 219 ]]
                --[[
                Upvalues:
                    [1] = u72
                --]]
                local v73 = u72
                if v73 ~= nil then
                    v73 = v73:Play()
                end
                return v73
            end))
        end
        local v74 = u36:getRandomizedEqualMagnitudeVector3(20)
        v63:PivotTo(CFrame.new(v64) * CFrame.lookAlong(Vector3.new(0, 0, 0), v74.Unit))
        u39:GiveTask(v63)
        local v75 = u36.snakePool
        table.insert(v75, {
            ["model"] = v63,
            ["pickupPart"] = p61,
            ["runawayLocationDelta"] = v74
        })
    end
    for v77, v78 in u52 do
        v76(v78, v77 - 1, u52)
    end
    local u79 = 0
    local v80 = u36:getSmokeParticleOnBed(u37.Position)
    v80:Emit(100)
    u39:GiveTask(v80)
    u39:GiveTask(u15.Heartbeat:Connect(function(p81) --[[ Line: 250 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u2
            [3] = u36
            [4] = u38
            [5] = u16
        --]]
        u79 = u79 + p81
        local v82 = u2.getOrCreate(u36.teamEffectState, u38, "Smoke")
        if v82 == "Smoke" then
            if u79 >= 0.5 then
                u36.teamEffectState[u38] = "RunAway"
                local v83 = u36.snakePool
                local function v88(p84) --[[ Line: 262 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                    --]]
                    local v85 = nil
                    for v86, v87 in p84.model:GetChildren() do
                        local _ = v86 - 1
                        if v87:IsA("MeshPart") == true then
                            v85 = v87
                            break
                        end
                    end
                    if v85 then
                        u16:Create(v85, TweenInfo.new(2, Enum.EasingStyle.Exponential), {
                            ["Transparency"] = 0
                        }):Play()
                    end
                    p84.model:PivotTo(CFrame.new(p84.pickupPart.Position) * CFrame.lookAlong(Vector3.new(0, 0, 0), p84.runawayLocationDelta.Unit))
                end
                for v89, v90 in v83 do
                    v88(v90, v89 - 1, v83)
                end
                return
            end
        elseif v82 == "RunAway" then
            for v91, v92 in u36.snakePool do
                local _ = v91 - 1
                local v93 = v92.runawayLocationDelta * (p81 / 3.5)
                v92.model:PivotTo(v92.model:GetPivot() + v93)
                v92.pickupPart:PivotTo(v92.model:GetPivot() + Vector3.new(0, 0.5, 0))
            end
        end
    end))
    u36.maid:GiveTask(task.delay(3.5, function() --[[ Line: 312 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u25
            [3] = u16
        --]]
        local v94 = u36.snakePool
        local function v96(p95) --[[ Line: 314 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u16
            --]]
            u25.tweenModelTransparency(p95.model, 1, 0.5)
            u16:Create(p95.pickupPart, TweenInfo.new(0.5), {
                ["Transparency"] = 1
            }):Play()
        end
        for v97, v98 in v94 do
            v96(v98, v97 - 1, v94)
        end
    end))
    u36.maid:GiveTask(task.delay(4, function() --[[ Line: 325 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        u39:DoCleaning()
    end))
end
function u28.getRandomizedEqualMagnitudeVector3(_, p99) --[[ Line: 329 ]]
    local v100 = math.random(-p99, p99)
    local v101 = p99 * p99 - v100 * v100
    local v102 = math.sqrt(v101) * (math.random() > 0.5 and 1 or -1)
    return Vector3.new(v100, 0, v102)
end
function u28.getBedClone(_, p103) --[[ Line: 336 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u26
        [3] = u10
        [4] = u5
        [5] = u21
        [6] = u18
    --]]
    local v104 = u14.Assets.Misc.SlicedBed:Clone()
    local u105
    if u26.isLobbyServer() then
        u105 = u5.hexColor(u21.red)
    else
        u105 = u10.Controllers.TeamController:getTeamById(p103)
        if u105 ~= nil then
            u105 = u105.color
        end
    end
    if not u105 then
        return v104
    end
    local v106 = v104.Pivot.Align:GetChildren()
    local function v108(p107) --[[ Line: 353 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u5
            [3] = u105
        --]]
        if not p107:IsA("MeshPart") then
            return nil
        end
        if u18.includes(string.lower(p107.Name), "blanket") then
            p107.Color = u5.brighten(u105, 0.2)
            return nil
        end
        if u18.includes(string.lower(p107.Name), "mattress") then
            p107.Color = u105
        end
    end
    for v109, v110 in v106 do
        v108(v110, v109 - 1, v106)
    end
    return v104
end
function u28.getSmokeParticleOnBed(_, p111) --[[ Line: 369 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u17
    --]]
    local v112 = u12("Part", {
        ["Size"] = Vector3.new(4, 4, 4),
        ["Transparency"] = 1,
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Shape"] = Enum.PartType.Ball,
        ["Position"] = p111,
        ["Parent"] = u17
    })
    return u12("ParticleEmitter", {
        ["LightEmission"] = 0.2,
        ["Texture"] = "rbxasset://textures/particles/sparkles_main.dds",
        ["Enabled"] = false,
        ["ShapePartial"] = 0,
        ["Acceleration"] = Vector3.new(-5, -1, -15),
        ["Drag"] = 3,
        ["Color"] = ColorSequence.new(Color3.new(0.76, 0.07, 0.07)),
        ["Transparency"] = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.5),
            NumberSequenceKeypoint.new(0.3, 0.8),
            NumberSequenceKeypoint.new(0.5, 0.9),
            NumberSequenceKeypoint.new(1, 1)
        }),
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 3), NumberSequenceKeypoint.new(1, 0.3) }),
        ["Squash"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, -1.7, 0.4) }),
        ["Lifetime"] = NumberRange.new(2, 4),
        ["SpreadAngle"] = Vector2.new(180, 180),
        ["Shape"] = Enum.ParticleEmitterShape.Sphere,
        ["Speed"] = NumberRange.new(15, 20),
        ["Parent"] = v112
    })
end
v9.CreateController(u28.new())
return nil