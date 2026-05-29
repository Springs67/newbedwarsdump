local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").ProjectileImpactZap
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "SplashPotionController"
    end,
    ["__index"] = u7
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
        [1] = u7
    --]]
    u7.constructor(p14)
    p14.Name = "SplashPotionController"
end
function u11.KnitStart(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u5
        [4] = u6
        [5] = u10
        [6] = u2
        [7] = u9
    --]]
    u7.KnitStart(p15)
    u8.On(function(p16, _, p17, _, _, _, _, _) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u10
            [4] = u2
            [5] = u9
        --]]
        local v18 = p17.Name
        if v18 == "sleep_splash_potion" then
            local v19 = u5.Assets.Effects.Potion.SleepSplashPotion:Clone()
            v19.CFrame = CFrame.new(p16)
            v19.Parent = u6
            u10:playEffects({ v19 }, nil, {
                ["destroyAfterSec"] = 3
            })
            u2:playSound(u9.SMOKE_GRENADE_POP, {
                ["position"] = p16
            })
            return
        elseif v18 == "poison_splash_potion" then
            local v20 = u5.Assets.Effects.Potion.PoisonSplashPotion:Clone()
            v20.CFrame = CFrame.new(p16)
            v20.Parent = u6
            u10:playEffects({ v20 }, nil, {
                ["destroyAfterSec"] = 3
            })
            u2:playSound(u9.SMOKE_GRENADE_POP, {
                ["position"] = p16
            })
        elseif v18 == "heal_splash_potion" then
            local v21 = u5.Assets.Effects.Potion.HealSplashPotion:Clone()
            v21.CFrame = CFrame.new(p16)
            v21.Parent = u6
            u10:playEffects({ v21 }, nil, {
                ["destroyAfterSec"] = 3
            })
            u2:playSound(u9.SMOKE_GRENADE_POP, {
                ["position"] = p16
            })
        end
    end)
end
v3.CreateController(u11.new())
return nil