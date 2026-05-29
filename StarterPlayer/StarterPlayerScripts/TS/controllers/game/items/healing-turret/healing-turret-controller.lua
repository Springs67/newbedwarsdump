local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local v6 = v4.ReplicatedStorage
local u7 = v4.TweenService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "conqueror-balance").ConquerorBalance
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u11 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
local u12 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut)
local _ = v6.Assets.Effects.BannerPoint
local _ = v6.Assets.Effects.BannerConnection
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "HealingTurretController"
    end,
    ["__index"] = u8
})
u13.__index = u13
function u13.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p16)
    p16.Name = "HealingTurretController"
end
function u13.KnitStart(u17) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
    --]]
    u8.KnitStart(u17)
    u5:GetInstanceAddedSignal("HealingTurret"):Connect(function(p18) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:createRadius(p18)
    end)
end
function u13.createRadius(_, p19) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u3
        [3] = u7
        [4] = u11
        [5] = u9
        [6] = u12
    --]]
    local v20 = Color3.fromRGB(112, 189, 92)
    local v21 = {
        ["Size"] = Vector3.new(0.2, 0, 0),
        ["Parent"] = p19
    }
    local v22 = CFrame.new(p19.Position)
    local v23 = u10 / 2
    v21.CFrame = v22 - Vector3.new(0, v23, 0)
    v21.Orientation = Vector3.new(0, 0, 90)
    v21.Shape = Enum.PartType.Cylinder
    v21.Color = v20
    v21.Transparency = 0
    v21.CastShadow = false
    v21.Material = Enum.Material.ForceField
    v21.Reflectance = 0
    v21.Anchored = true
    v21.CanCollide = false
    v21.CanTouch = false
    v21.CanQuery = false
    local u24 = u3("Part", v21)
    local v25 = u7
    local v26 = u11
    local v27 = {}
    local v28 = u9.CONQUEROR_FLAG_RADIUS
    local v29 = u9.CONQUEROR_FLAG_RADIUS
    v27.Size = Vector3.new(0.2, v28, v29)
    local v30 = v25:Create(u24, v26, v27)
    v30:Play()
    local u31 = nil
    u31 = v30.Completed:Connect(function() --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u24
            [3] = u12
            [4] = u9
            [5] = u31
        --]]
        local v32 = u7
        local v33 = u24
        local v34 = u12
        local v35 = {}
        local v36 = u9.CONQUEROR_FLAG_RADIUS
        local v37 = u9.CONQUEROR_FLAG_RADIUS
        v35.Size = Vector3.new(0.5, v36, v37)
        local v38 = u24.Position.X
        local v39 = u24.Position.Y + 0.25 + 0.1
        local v40 = u24.Position.Z
        v35.Position = Vector3.new(v38, v39, v40)
        v32:Create(v33, v34, v35):Play()
        u31:Disconnect()
    end)
    return u24
end
v2.CreateController(u13.new())
return nil