local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade")
local u5 = v4.FlamethrowerUpgrade
local u6 = v4.getFlamethrowerUpgradeMeta
local u7 = {
    ["FLAMETHROWER_COOLDOWN_SEC"] = 5
}
local u8 = {}
local function u14(p9) --[[ Line: 15 ]]
    local v10 = 0
    local v11 = {}
    for v12, v13 in p9:GetDescendants() do
        local _ = v12 - 1
        if (v13:IsA("ParticleEmitter") or v13:IsA("Light")) == true then
            v10 = v10 + 1
            v11[v10] = v13
        end
    end
    return v11
end
function u7.getFireParticles(p15) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v16 = 0
    local v17 = {}
    for v18, v19 in u14(p15) do
        local _ = v18 - 1
        local v20 = v19:IsA("ParticleEmitter")
        if v20 then
            v20 = v19.Name == "FireParticle"
        end
        if v20 == true then
            v16 = v16 + 1
            v17[v16] = v19
        end
    end
    return v17
end
function u7.getSmokeParticles(p21) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v22 = 0
    local v23 = {}
    for v24, v25 in u14(p21) do
        local _ = v24 - 1
        local v26 = v25:IsA("ParticleEmitter")
        if v26 then
            v26 = v25.Name == "SmokeParticle"
        end
        if v26 == true then
            v22 = v22 + 1
            v23[v22] = v25
        end
    end
    return v23
end
function u7.getSparkleParticles(p27) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v28 = 0
    local v29 = {}
    for v30, v31 in u14(p27) do
        local _ = v30 - 1
        local v32 = v31:IsA("ParticleEmitter")
        if v32 then
            v32 = v31.Name == "SparkleParticle"
        end
        if v32 == true then
            v28 = v28 + 1
            v29[v28] = v31
        end
    end
    return v29
end
function u7.getLights(p33) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v34 = 0
    local v35 = {}
    for v36, v37 in u14(p33) do
        local _ = v36 - 1
        if v37:IsA("Light") == true then
            v34 = v34 + 1
            v35[v34] = v37
        end
    end
    return v35
end
function u7.getUpgradesFromFlamethrower(p38) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    local v39 = {}
    for _, v40 in u3.values(u5) do
        local v41 = p38:GetAttribute(v40)
        v39[v40] = v41 == nil and -1 or v41
    end
    return v39
end
function u7.setEnabled(p42, p43, p44) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u5
        [4] = u7
    --]]
    print("[MATT] setting flamethrower particles to " .. tostring(p43))
    if not p42.Parent then
        return nil
    end
    if p43 then
        u8[p42] = p44
    else
        local v45 = u8[p42]
        if v45 ~= nil and v45 ~= p44 then
            return nil
        end
        u8[p42] = nil
    end
    local v46 = u6(u5.RANGE)
    local v47 = p42:GetAttribute(u5.RANGE)
    local v48
    if v47 == nil then
        v48 = 1
    else
        local v49 = v46.tiers[v47 + 1].values[1]
        v48 = 1 + (v49 == nil and 0 or v49) / 100
    end
    for v50, v51 in u7.getSparkleParticles(p42) do
        local _ = v50 - 1
        v51.Enabled = p43
        local _ = v51.Enabled
    end
    for v52, v53 in u7.getFireParticles(p42) do
        local _ = v52 - 1
        v53.Enabled = p43
        v53.Speed = NumberRange.new(v48 * 25)
    end
    for v54, v55 in u7.getSmokeParticles(p42) do
        local _ = v54 - 1
        v55.Enabled = p43
        v55.Speed = NumberRange.new(v48 * 15)
    end
    for v56, v57 in u7.getLights(p42) do
        local _ = v56 - 1
        v57.Enabled = p43
        local _ = v57.Enabled
    end
end
function u7.setUpgrades(p58, p59) --[[ Line: 183 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    for _, v60 in u2.keys(p59) do
        p58:SetAttribute(v60, p59[v60])
    end
end
return {
    ["PyroUtil"] = u7
}