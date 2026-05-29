local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "magical-girl-scepter", "magical-girl-scepter-util").MagicalGirlScepterUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SolarFlareStatusEffectController"
    end,
    ["__index"] = u9
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p18)
    p18.Name = "SolarFlareStatusEffectController"
end
function u15.KnitStart(u19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u6
        [4] = u7
        [5] = u13
        [6] = u11
        [7] = u2
        [8] = u12
        [9] = u14
    --]]
    u9.KnitStart(u19)
    u8.ProjectileHit:connect(function(p20) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u7
        --]]
        if p20:isCancelled() then
            return nil
        end
        if p20.projectileType == "hero_magical_girl_scepter_projectile" or p20.projectileType == "hero_magical_girl_scepter_multi_projectile" then
            local u21 = u6.Assets.Effects.SolarFlare:Clone()
            u21.CFrame = p20.hitData.hitCFrame
            u21.Parent = u7
            for _, v22 in u21:GetDescendants() do
                if v22:IsA("ParticleEmitter") then
                    v22:Emit(15)
                end
            end
            task.delay(4, function() --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:Destroy()
            end)
        end
    end)
    u8.StatusEffectAdded:connect(function(p23) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u19
        --]]
        if p23.statusEffect == u13.SOLAR_FLARE then
            u19:setEffects(p23.entityInstance:GetPrimaryPartCFrame().Position, p23.entityInstance)
        end
    end)
    u8.StatusEffectChanged:connect(function(p24) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u19
        --]]
        if p24.statusEffect == u13.SOLAR_FLARE then
            u19:setEffects(p24.entityInstance:GetPrimaryPartCFrame().Position, p24.entityInstance)
        end
    end)
    u8.StatusEffectRemoved:connect(function(p25) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if p25.statusEffect == u13.SOLAR_FLARE then
            for _, v26 in p25.entityInstance:GetChildren() do
                if v26.Name == "SolarFlareExplosion" then
                    v26:Destroy()
                end
            end
        end
    end)
    u11.Client:OnEvent("SolarFlareExplosion", function(p27) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u2
            [3] = u12
            [4] = u7
            [5] = u14
        --]]
        local u28 = u6.Assets.Effects.SolarFlareLargeExplosion:Clone()
        u2:playSound(u12.SOLAR_FLARE_EXPLOSION, {
            ["rollOffMaxDistance"] = 200,
            ["volumeMultiplier"] = 4,
            ["position"] = p27.position
        })
        u28.Parent = u7
        u28.Color = Color3.new(0.93, 0.53, 0.89)
        u14:playEffects({ u28 }, nil, {
            ["sizeMultiplier"] = 3
        })
        u28:PivotTo(CFrame.new(p27.position))
        task.delay(2, function() --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28:Destroy()
        end)
    end)
end
function u15.setEffects(_, p29, p30) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u10
    --]]
    local u31 = u6.Assets.Effects.SolarFlareExplosion:Clone()
    u31.Parent = p30
    u31.Position = p29
    u4("WeldConstraint", {
        ["Part0"] = u31,
        ["Part1"] = p30.PrimaryPart,
        ["Parent"] = p30
    })
    task.delay(u10.SOLAR_FLARE_AFTERSHOCK_DELAY, function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        for _, v32 in u31:GetDescendants() do
            if v32:IsA("ParticleEmitter") then
                v32:Emit(1)
            end
        end
        task.delay(1, function() --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            u31:Destroy()
        end)
    end)
end
v3.CreateController(u15.new())
return nil