local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local u5 = v3.TweenService
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "KillEffect"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, p10) --[[ Line: 19 ]]
    p9.killerPlayer = p10
    p9.playDefaultKillEffect = true
end
function u6.onKill(_, _, _, _) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2.new()
end
function u6.isLocalKiller(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.LocalPlayer == p11.killerPlayer
end
function u6.setPlayDefaultKillEffect(p12, p13) --[[ Line: 29 ]]
    p12.playDefaultKillEffect = p13
end
function u6.isPlayDefaultKillEffect(p14) --[[ Line: 32 ]]
    return p14.playDefaultKillEffect
end
function u6.hideCharacter(_, p15) --[[ Line: 35 ]]
    local v16 = p15:GetDescendants()
    local function v18(p17) --[[ Line: 37 ]]
        if p17:IsA("BasePart") then
            p17.Transparency = 1
            return
        elseif p17:IsA("Decal") then
            p17.Transparency = 1
            return
        elseif p17:IsA("BillboardGui") then
            p17:Destroy()
        elseif p17:IsA("ParticleEmitter") then
            p17.Transparency = NumberSequence.new(1)
        end
    end
    for v19, v20 in v16 do
        v18(v20, v19 - 1, v16)
    end
end
function u6.anchorCharacter(_, p21) --[[ Line: 52 ]]
    for v22, v23 in p21:GetDescendants() do
        local _ = v22 - 1
        if v23:IsA("BasePart") then
            v23.Anchored = true
        end
    end
end
function u6.scaleModel(_, p24, p25, p26) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v27 = p24.PrimaryPart
    local v28 = nil
    for _, v29 in p24:GetDescendants() do
        if v29:IsA("BasePart") then
            v28 = u5:Create(v29, p26, {
                ["CFrame"] = v27.CFrame:Lerp(v29.CFrame, p25),
                ["Size"] = v29.Size * p25
            })
            v28:Play()
        end
    end
    return v28
end
return {
    ["KillEffect"] = u6
}