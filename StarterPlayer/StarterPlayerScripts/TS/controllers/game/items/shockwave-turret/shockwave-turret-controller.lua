local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "ShockwaveTurretController"
    end,
    ["__index"] = u3
})
u6.__index = u6
function u6.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p9)
    p9.Name = "ShockwaveTurretController"
end
function u6.KnitStart(u10) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    u3.KnitStart(u10)
    u5.Client:Get("shockWaveRelease"):Connect(function(p11) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        u10:playEffect(p11.turret)
        u10:clear(p11.turret)
        u10:chargeUp(p11.turret)
    end)
end
function u6.playEffect(_, p12) --[[ Line: 33 ]]
    local v13 = p12:WaitForChild("ShockWave", 3)
    if v13 then
        for v14, v15 in v13:GetDescendants() do
            local _ = v14 - 1
            if v15:IsA("ParticleEmitter") then
                v15:Emit(1)
            end
        end
    end
end
u6.chargeUp = v1.async(function(_, p16) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p16.Name == u4.SHOCK_WAVE_TURRET then
        local v17 = p16:WaitForChild("Circle", 3)
        if v17 == nil then
            return nil
        end
        local v18 = false
        local v19 = 0
        while true do
            if true then
                if v18 then
                    v19 = v19 + 1
                else
                    v18 = true
                end
            end
            if v19 >= 5 then
                break
            end
            task.wait(0.9)
            local v20 = v17:WaitForChild("Circle" .. tostring(v19), 3)
            if v20 then
                v20.Color = Color3.fromRGB(0, 255, 0)
            end
        end
    end
end)
function u6.clear(_, p21) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p21.Name == u4.SHOCK_WAVE_TURRET then
        local v22 = p21:WaitForChild("Circle", 3)
        if v22 ~= nil then
            v22 = v22:GetChildren()
        end
        if v22 == nil then
            return nil
        end
        for _, v23 in v22 do
            v23.Color = Color3.fromRGB(77, 77, 77)
        end
    end
end
v2.CreateController(u6.new())
return nil