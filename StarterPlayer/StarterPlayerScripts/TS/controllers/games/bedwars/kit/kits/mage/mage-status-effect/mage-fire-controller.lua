local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.ReplicatedStorage
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "MageFireController"
    end,
    ["__index"] = u10
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
    --]]
    u10.constructor(p20)
    p20.Name = "MageFireController"
    p20.maid = u4.new()
end
function u17.KnitStart(u21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u12
        [4] = u15
        [5] = u14
    --]]
    u10.KnitStart(u21)
    u9.ProjectileHit:connect(function(p22) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u15
            [3] = u14
            [4] = u21
        --]]
        if p22:isCancelled() then
            return nil
        end
        if p22.projectileType ~= "mage_spell_fire" then
            return nil
        end
        if p22.shooter == nil then
            return nil
        end
        local v23 = p22.shooter:getInstance()
        if not v23 then
            return nil
        end
        local v24 = u12:getPlayerFromEntityInstance(v23)
        if not v24 then
            return nil
        end
        local v25 = p22.hitEntity
        if v25 ~= nil then
            v25 = v25:getInstance()
        end
        if not v25 then
            return nil
        end
        if u15:isActive(v23, u14.MAGE_FIRE_ELEMENT) then
            u21:playFireElementExplosion(v24, p22.hitData.hitCFrame.Position)
            u21:applyBurnParticles(v25)
        end
    end)
end
function u17.playFireElementExplosion(_, _, p26) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u16
        [3] = u2
        [4] = u13
    --]]
    local u27 = u8.Assets.Effects.Explosion:Clone()
    u27.Transparency = 1
    u27:PivotTo(CFrame.new(p26))
    u16:playEffects({ u27 }, nil, {
        ["sizeMultiplier"] = 0.5,
        ["particleMultiplier"] = 0.5
    })
    u2:playSound(u13.BURN_HIT, {
        ["position"] = p26
    })
    task.delay(1.5, function() --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:Destroy()
    end)
end
function u17.applyBurnParticles(u28, p29) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u6
        [4] = u2
        [5] = u13
        [6] = u11
    --]]
    if p29.PrimaryPart == nil then
        return nil
    end
    local v30 = p29 == u7.LocalPlayer.Character
    local v31 = p29:FindFirstChild("UpperTorso")
    if not v31 then
        return nil
    end
    local u32 = {}
    for _, v33 in u8.Assets.Effects.Burn:GetChildren() do
        local v34 = v33:Clone()
        v34.Parent = v31
        if v30 and (v34:IsA("ParticleEmitter") or v34:IsA("Beam")) then
            u6:AddTag(v34, "FirstPersonHidden")
        end
        table.insert(u32, v34)
    end
    local v35 = u2
    local v36 = u13.BURN_LOOP
    local v37 = {
        ["looped"] = true
    }
    local v38
    if v30 then
        v38 = nil
    else
        v38 = p29.PrimaryPart.Position
    end
    v37.position = v38
    local v39
    if v30 then
        v39 = nil
    else
        v39 = p29.PrimaryPart
    end
    v37.parent = v39
    local u40 = v35:playSound(v36, v37)
    u28.maid:GiveTask(function() --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u32
        --]]
        local v41 = u40
        if v41 ~= nil then
            v41:Stop()
        end
        local v42 = u32
        local function v44(u43) --[[ Line: 120 ]]
            if u43:IsA("ParticleEmitter") then
                u43.Enabled = false
                task.delay(0.5, function() --[[ Line: 123 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                    --]]
                    u43:Destroy()
                end)
            else
                u43:Destroy()
            end
        end
        for v45, v46 in v42 do
            v44(v46, v45 - 1, v42)
        end
    end)
    task.delay(u11.MAGE_BURN_DURATION, function() --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28.maid:DoCleaning()
    end)
end
v3.CreateController(u17.new())
return nil