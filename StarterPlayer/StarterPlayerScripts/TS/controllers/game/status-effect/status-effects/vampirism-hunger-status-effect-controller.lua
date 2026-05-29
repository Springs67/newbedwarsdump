local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "VampirismHungerStatusEffectController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "VampirismHungerStatusEffectController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u10
        [4] = u9
        [5] = u3
        [6] = u2
        [7] = u8
        [8] = u4
        [9] = u5
    --]]
    u6.KnitStart(p15)
    u7.Client:OnEvent("CursedCoffinHitPlayer", function(p16) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
            [3] = u3
            [4] = u2
            [5] = u8
            [6] = u4
        --]]
        if u10:isActive(p16.healer, u9.VAMPIRISM) then
            local v17 = u3.Controllers.LifeStealController
            local v18 = p16.healer
            local v19 = p16.enemy
            local v20 = {}
            local v21 = p16.config
            if v21 ~= nil then
                v21 = v21.beamColors
            end
            v20.extraBeams = v21
            local v22 = p16.config
            if v22 ~= nil then
                v22 = v22.mainBeamColor
            end
            v20.mainBeamColor = v22
            v17:playRegenEffect(v18, v19, v20)
            local v23 = u2
            local v24 = u8.CURSED_COFFIN_LIFESTEAL_HIT
            local v25 = {}
            local v26
            if p16.healer == u4.LocalPlayer.Character then
                v26 = nil
            else
                v26 = p16.healer.PrimaryPart
                if v26 ~= nil then
                    v26 = v26.Position
                end
            end
            v25.position = v26
            local v27 = p16.config
            if v27 ~= nil then
                v27 = v27.volumeMultiplier
            end
            v25.volumeMultiplier = v27
            v23:playSound(v24, v25)
        end
    end)
    u5.StatusEffectRemoved:connect(function(p28) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        if p28.statusEffect == u9.VAMPIRISM then
            for _, v29 in p28.entityInstance:GetChildren() do
                if v29.Name == "VampireCape" then
                    v29:Destroy()
                end
            end
        end
    end)
    u7.Client:OnEvent("CursedCoffinPlayHungrySound", function(p30) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u8
        --]]
        if p30.entityInstance == u4.LocalPlayer.Character then
            u2:playSound(u8.CURSED_COFFIN_HUNGRY, {})
        end
    end)
end
u3.CreateController(u11.new())
return nil