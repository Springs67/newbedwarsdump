local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ConstantManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = v2.registerConstants(script, {
    ["kbUpwardStrength"] = 10000,
    ["kbDirectionStrength"] = 11750,
    ["kbStandardMass"] = 300,
    ["nonGroundedHorizontalResistence"] = 0.6,
    ["nonGroundedVerticalResistence"] = 0.75
})
local u5 = {}
local v6 = {}
local u7 = nil
local u8 = nil
function v6.applyKnockback(p9, p10, p11, p12) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
    --]]
    return u8(p9, p10, u7(p9.Position, p11), p12)
end
u7 = function(p13, p14) --[[ Name: getDirection, Line 22 ]]
    if not p14 then
        return Vector3.new(0, 0, 0)
    end
    local v15
    if p14 == nil then
        v15 = p14
    else
        v15 = p14.X
    end
    local v16 = v15 == nil and 0 or v15
    if p14 ~= nil then
        p14 = p14.Z
    end
    local v17 = p14 == nil and 0 or p14
    local v18 = Vector3.new(v16, 0, v17)
    local v19 = p13.X
    local v20 = p13.Z
    local v21 = Vector3.new(v19, 0, v20) - v18
    return v21.Magnitude == 0 and Vector3.new(0, 0, 0) or v21.Unit
end
v6.getDirection = u7
local u22 = nil
function v6.calculateKnockbackVelocityRelative(p23, p24, p25, p26) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u22
    --]]
    return u22(u7(p23.Position, p25), p24, p26)
end
u22 = function(p27, p28, p29) --[[ Name: calculateKnockbackVelocity, Line 71 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    if p27.Magnitude == 0 then
        return Vector3.new(0, 0, 0)
    end
    local v30
    if p29 == nil then
        v30 = p29
    else
        v30 = p29.vertical
    end
    local v31 = v30 == nil and 1 or v30
    if p29 ~= nil then
        p29 = p29.horizontal
    end
    local v32 = p29 == nil and 1 or p29
    local v33 = u4.kbUpwardStrength * v31
    local v34 = (Vector3.new(0, v33, 0) + p27.Unit * (u4.kbDirectionStrength * v32)) * (p28 / u4.kbStandardMass)
    local v35 = u3:GetAttribute("kbmultiplier")
    return v34 * (v35 == nil and 1 or v35) * 0.9
end
v6.calculateKnockbackVelocity = u22
local function u38(p36) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v37 = p36:FindFirstChildWhichIsA("Humanoid")
    if v37 then
        return v37
    elseif p36.Parent then
        return u38(p36.Parent)
    else
        return nil
    end
end
local u39 = nil
u8 = function(p40, p41, p42, p43) --[[ Name: applyKnockbackDirection, Line 121 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u39
    --]]
    local v44 = u22(p42, p41, p43)
    u39(p40)
    p40:ApplyImpulse(v44)
    return v44
end
v6.applyKnockbackDirection = u8
u39 = function(p45) --[[ Name: applyKnockbackPlatformStand, Line 134 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u5
    --]]
    local u46 = p45:FindFirstChildWhichIsA("Humanoid")
    if not u46 then
        if p45.Parent then
            u46 = u38(p45.Parent)
        else
            u46 = nil
        end
    end
    if u46 then
        u46.PlatformStand = true
        local u47 = math.random()
        u5[u46] = u47
        task.spawn(function() --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u46
                [3] = u47
            --]]
            task.wait(0.065)
            if u5[u46] ~= u47 then
                return nil
            end
            u5[u46] = nil
            if u46.Parent then
                u46.PlatformStand = false
            end
        end)
    end
end
v6.applyKnockbackPlatformStand = u39
function v6.predictKnockBackVelocity(p48, p49, p50, p51) --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u39
        [3] = u8
    --]]
    local v52 = u7(p48.Position, p50)
    u39(p48)
    return u8(p48, p49, v52, p51)
end
return {
    ["KnockbackConstants"] = u4,
    ["KnockbackUtil"] = v6
}