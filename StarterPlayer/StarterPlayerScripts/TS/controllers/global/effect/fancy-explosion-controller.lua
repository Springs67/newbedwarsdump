local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MathExtras
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u5 = v4.InExpo
local u6 = v4.Linear
local u7 = v4.OutExpo
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.RunService
local u11 = v8.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "FancyExplosionController"
    end,
    ["__index"] = u13
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, ...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p17, ...)
    p17.Name = "FancyExplosionController"
    p17.random = Random.new()
end
function u14.KnitStart(p18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p18)
end
u14.createExplosion = v1.async(function(p19, u20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
        [3] = u10
        [4] = u12
        [5] = u7
        [6] = u2
        [7] = u6
        [8] = u5
    --]]
    local v21 = u20.inDuration
    local v22 = v21 == nil and 0.2 or v21
    local v23 = u20.outDuration
    local v24 = v23 == nil and 0.5 or v23
    local v25 = u20.randomSizeOffset
    local v26 = v25 == nil and 10 or v25
    local v27 = u20.randomPositionOffset
    local v28 = v27 == nil and 2 or v27
    local v29 = u20.rotationSpeed
    local u30 = v29 == nil and 15 or v29
    local u31 = u20.radius + p19.random:NextNumber(-v26, v26)
    local u32 = (u20.model or u9.Assets.Misc.SpiritExplosion):Clone()
    local v33 = CFrame.new(u20.position)
    local v34 = CFrame.new(p19.random:NextNumber(-v28, v28), p19.random:NextNumber(-v28, v28), p19.random:NextNumber(-v28, v28))
    local v35 = CFrame.Angles
    local v36 = math.random(-360, 360)
    local v37 = v35(0, math.rad(v36), 0)
    u32:PivotTo(v33 * v34 * v37)
    u32.Parent = u11
    if u20.simpleScaleParent then
        u32:ScaleTo(u20.simpleScaleParent.startScale)
    end
    local v39 = u10.Heartbeat:Connect(function(p38) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u30
        --]]
        u32:PivotTo(u32:GetPrimaryPartCFrame() * CFrame.Angles(0, p38 * u30, 0))
    end)
    local u40 = u32:GetExtentsSize().Magnitude
    local u41 = {}
    for _, v42 in u32:GetChildren() do
        if v42:IsA("BasePart") then
            u41[v42] = {
                ["size"] = v42.Size,
                ["position"] = v42.Position,
                ["transparency"] = v42.Transparency
            }
        end
    end
    local v47 = u12(v22, u7, function(p43) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u2
            [3] = u32
            [4] = u41
            [5] = u6
            [6] = u31
            [7] = u40
        --]]
        if u20.simpleScaleParent then
            u32:ScaleTo((u2:lerp(u20.simpleScaleParent.startScale, u20.simpleScaleParent.endScale, p43)))
        else
            for _, v44 in u32:GetChildren() do
                if v44:IsA("BasePart") then
                    local v45 = u41[v44]
                    if v45 ~= nil then
                        local v46 = u6(p43, 1, u31 / u40, 1)
                        v44.Position = u20.position:Lerp(v45.position, v46)
                        v44.Size = v45.size * v46
                    end
                end
            end
        end
    end, 0, 1)
    local v51 = u12(v24, u5, function(p48) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u41
            [3] = u6
        --]]
        for _, v49 in u32:GetChildren() do
            if v49:IsA("BasePart") then
                local v50 = u41[v49]
                if v50 ~= nil then
                    v49.Transparency = u6(p48, v50.transparency, 1, 1)
                end
            end
        end
    end, 0, 1)
    v47:Wait()
    v51:Wait()
    v39:Disconnect()
    u32:Destroy()
end)
v3.CreateController(u14.new())
return nil