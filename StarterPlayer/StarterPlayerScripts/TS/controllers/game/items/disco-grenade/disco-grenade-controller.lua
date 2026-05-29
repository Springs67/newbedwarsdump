local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.RunService
local u8 = v5.TweenService
local u9 = v5.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").DiscoGrenadeBalance
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "conqueror-balance").ConquerorBalance
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "DiscoGrenadeController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p19)
    p19.Name = "DiscoGrenadeController"
end
function u16.KnitStart(u20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u14
        [3] = u2
        [4] = u15
    --]]
    u10.KnitStart(u20)
    u14.Client:Get("DiscoExplode"):Connect(function(p21) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u15
            [3] = u20
        --]]
        local u22 = u2:playSound(u15.DISCO_BEAT, {
            ["looped"] = true,
            ["position"] = p21.position
        })
        task.delay(5, function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22:Stop()
            u22:Destroy()
        end)
        u20:createDiscoBallEffect(p21.position, p21.radius)
    end)
    u14.Client:Get("DiscoDancing"):Connect(function(_) --[[ Line: 49 ]] end)
end
function u16.createDiscoBallEffect(p23, p24, p25) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u7
        [4] = u11
    --]]
    local u26 = u6.Assets.Effects.DiscoBall:Clone()
    u26:PivotTo(CFrame.new(p24 + Vector3.new(0, 9, 0)))
    u26.Parent = u9
    local u27 = p23:createBuffRadius(p24, p25)
    local u28 = 0
    local u29 = nil
    u29 = u7.Heartbeat:Connect(function(p30) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u29
            [3] = u28
        --]]
        if not u26.PrimaryPart then
            u29:Disconnect()
            return nil
        end
        local v31 = u26.PrimaryPart.CFrame
        local v32 = CFrame.Angles
        local v33 = u28 * 3.141592653589793
        local v34 = v32(0, math.rad(v33), 0)
        u26.PrimaryPart.CFrame = v31 * v34
        u28 = u28 + p30
    end)
    task.delay(u11.DURATION, function() --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u29
            [3] = u27
        --]]
        u26:Destroy()
        u29:Disconnect()
        u27:Destroy()
    end)
end
function u16.createBuffRadius(_, p35, _) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u4
        [4] = u8
        [5] = u12
    --]]
    local v36 = Color3.fromRGB(107, 255, 255)
    local v37 = {
        ["Size"] = Vector3.new(0.2, 0, 0),
        ["Parent"] = u9
    }
    local v38 = CFrame.new(p35)
    local v39 = u13 / 2
    v37.CFrame = v38 - Vector3.new(0, v39, 0)
    v37.Orientation = Vector3.new(0, 0, 90)
    v37.Shape = Enum.PartType.Cylinder
    v37.Color = v36
    v37.Transparency = 0.5
    v37.CastShadow = false
    v37.Material = Enum.Material.ForceField
    v37.Reflectance = 0
    v37.Anchored = true
    v37.CanCollide = false
    v37.CanTouch = false
    v37.CanQuery = false
    local u40 = u4("Part", v37)
    local v41 = u8
    local v42 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
    local v43 = {}
    local v44 = u12.CONQUEROR_FLAG_RADIUS
    local v45 = u12.CONQUEROR_FLAG_RADIUS
    v43.Size = Vector3.new(0.2, v44, v45)
    local v46 = v41:Create(u40, v42, v43)
    v46:Play()
    local u47 = nil
    u47 = v46.Completed:Connect(function() --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u40
            [3] = u12
            [4] = u47
        --]]
        local v48 = u8
        local v49 = u40
        local v50 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
        local v51 = {}
        local v52 = u12.CONQUEROR_FLAG_RADIUS
        local v53 = u12.CONQUEROR_FLAG_RADIUS
        v51.Size = Vector3.new(0.5, v52, v53)
        local v54 = u40.Position.X
        local v55 = u40.Position.Y + 0.25 + 0.1
        local v56 = u40.Position.Z
        v51.Position = Vector3.new(v54, v55, v56)
        v48:Create(v49, v50, v51):Play()
        u47:Disconnect()
    end)
    return u40
end
v3.CreateController(u16.new())
return nil