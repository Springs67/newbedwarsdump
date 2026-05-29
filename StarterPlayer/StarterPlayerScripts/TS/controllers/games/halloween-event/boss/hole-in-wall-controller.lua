local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Players
local u10 = v8.ReplicatedStorage
local u11 = v8.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "HoleInWallController"
    end,
    ["__index"] = u13
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u7
    --]]
    u13.constructor(p19)
    p19.Name = "HoleInWallController"
    p19.holeInWallMaid = u7.new()
end
function u16.KnitStart(u20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
    --]]
    u13.KnitStart(u20)
    u14.Client:Get("SpawnGhostWall"):Connect(function(p21, p22, p23, p24, p25) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:spawnWall(p21, p22, p23, p24, p25)
    end)
    u14.Client:Get("EntityDeathEvent"):Connect(function(p26) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if p26.entityInstance.Name ~= "HalloweenBoss" then
            return nil
        end
        u20.holeInWallMaid:DoCleaning()
    end)
end
function u16.spawnWall(p27, p28, p29, p30, p31, p32) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u4
        [4] = u15
        [5] = u11
        [6] = u3
        [7] = u12
        [8] = u6
        [9] = u9
        [10] = u14
    --]]
    local u33 = u7.new()
    local u34 = u10.Assets.Misc.HwBossWall:Clone()
    u4:playSound(u15.HALLOWEEN_BOSS_FOG_LOOP, {
        ["rollOffMaxDistance"] = 400,
        ["volumeMultiplier"] = 0.8,
        ["parent"] = u34
    })
    local v35 = p30.X
    local v36 = math.abs(v35)
    local v37 = p30.Y
    local v38 = math.abs(v37)
    local v39 = p30.Z
    local v40 = math.abs(v39)
    local v41 = Vector3.new(v36, v38, v40)
    local v42 = p28 - p29
    local v43 = v42.X
    local v44 = math.abs(v43)
    local v45 = v42.Z
    local v46 = math.abs(v45)
    local v47 = Vector3.new(v44, 0, v46)
    u34.Size = v41 * 3.2 + v47 + Vector3.new(0, 18, 0)
    local v48 = p28:Lerp(p29, 0.5)
    local v49 = u34.Size.Y / 2
    local u50 = v48 + Vector3.new(0, v49, 0)
    u34.Position = u50
    for _, v51 in u34:GetDescendants() do
        if v51:IsA("ParticleEmitter") then
            v51.Rate = v51.Rate * v47.Magnitude / 400
        end
    end
    u34.Parent = u11
    u3:setQueryIgnored(u34, true)
    local v52 = p31 / p32
    local u53 = u50 + p30 * p31
    local u55 = u12(v52, u6, function(p54) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u50
            [3] = u53
        --]]
        u34.Position = u50:Lerp(u53, p54)
    end)
    p27.holeInWallMaid:GiveTask(function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        return u55:Cancel()
    end)
    local u56 = false
    u33:GiveTask(u34.Touched:Connect(function(p57) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u56
            [3] = u33
            [4] = u14
        --]]
        local v58 = u9.LocalPlayer.Character
        if not v58 then
            return nil
        end
        if not p57:IsDescendantOf(v58) then
            return nil
        end
        if u56 then
            return nil
        end
        u56 = true
        u33:DoCleaning()
        u14.Client:Get("HitGhostWall"):SendToServer()
    end))
    task.spawn(function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u34
            [3] = u33
        --]]
        u55:Wait()
        u34:Destroy()
        u33:DoCleaning()
    end)
end
v5.CreateController(u16.new())
return nil