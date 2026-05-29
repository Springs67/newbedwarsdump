local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MathExtras
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.RunService
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "particles", "particle-util").ParticleUtil
local u9 = NumberRange.new(8, 48)
local u10 = NumberRange.new(18, 55)
local v11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "BaseWeatherParticleController"
    end,
    ["__index"] = u7
})
v11.__index = v11
function v11.constructor(p12, p13) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u9
        [4] = u10
    --]]
    u7.constructor(p12)
    p12.config = p13
    p12.Name = "BaseWeatherParticleController"
    p12.maid = u3.new()
    p12.enabled = false
    p12.particleEmitters = {}
    if p12.config.rateMin == nil then
        p12.config.rateMin = 20
    end
    if p12.config.rateMax == nil then
        p12.config.rateMax = 400
    end
    if p12.config.speedMinRange == nil then
        p12.config.speedMinRange = u9
    end
    if p12.config.speedMaxRange == nil then
        p12.config.speedMaxRange = u10
    end
    if p12.config.followOffset == nil then
        p12.config.followOffset = Vector3.new(0, 100, 0)
    end
    if p12.config.particleDistance == nil then
        p12.config.particleDistance = 150
    end
end
function v11.KnitStart(p14) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.KnitStart(p14)
end
function v11.enable(p15, p16) --[[ Line: 65 ]]
    if p15.enabled then
        return nil
    end
    p15.enabled = true
    p15:instantiateParticleParent()
    p15:setIntensity(p16)
    p15:onEnable()
end
function v11.disable(p17) --[[ Line: 76 ]]
    p17.enabled = false
    p17.maid:DoCleaning()
end
function v11.instantiateParticleParent(u18) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    if u18.config.weatherAsset == nil then
        return nil
    end
    u18.particleParent = u18.config.weatherAsset:Clone()
    local v19 = 0
    local v20 = {}
    for v21, v22 in u18.particleParent:GetDescendants() do
        local _ = v21 - 1
        if v22:IsA("ParticleEmitter") == true then
            v19 = v19 + 1
            v20[v19] = v22
        end
    end
    u18.particleEmitters = v20
    u18.maid:GiveTask(function() --[[ Line: 100 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v23 = u18.particleParent
        if v23 ~= nil then
            v23:Destroy()
        end
        u18.particleParent = nil
        for v24, v25 in u18.particleEmitters do
            local _ = v24 - 1
            if v25 ~= nil then
                v25:Destroy()
            end
        end
        u18.particleEmitters = {}
    end)
    u18.particleParent.Parent = u6
    local u26 = nil
    u26 = u5.Heartbeat:Connect(function() --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u18
            [3] = u26
        --]]
        local v27 = not (u6.CurrentCamera and u18.particleParent)
        if not v27 then
            local v28 = u18.particleParent
            if v28 ~= nil then
                v28 = v28.Parent
            end
            v27 = not v28
        end
        if v27 then
            u26:Disconnect()
            return nil
        end
        local v29 = u6.CurrentCamera.CFrame.Position
        local v30 = u18.particleParent
        local v31 = u18.config.followOffset
        v30:PivotTo(CFrame.new(v29 + v31))
    end)
    u18.maid:GiveTask(function() --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26:Disconnect()
    end)
end
function v11.setIntensity(p32, p33) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
    --]]
    if not p32.particleEmitters or #p32.particleEmitters == 0 then
        return nil
    end
    local v34 = math.clamp(p33, 0, 1)
    local v35 = u2:lerp(p32.config.rateMin, p32.config.rateMax, v34)
    local v36 = u2:lerp(p32.config.speedMinRange.Min, p32.config.speedMinRange.Max, v34)
    local v37 = u2:lerp(p32.config.speedMaxRange.Min, p32.config.speedMaxRange.Max, v34)
    for v38, v39 in p32.particleEmitters do
        local _ = v38 - 1
        u8.setSpeedAndDistance(v39, v36, v37, p32.config.particleDistance)
        v39.Rate = v35
    end
end
return {
    ["BaseWeatherParticleController"] = v11
}