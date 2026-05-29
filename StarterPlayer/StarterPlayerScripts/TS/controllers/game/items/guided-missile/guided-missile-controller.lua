local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Players
local u6 = v4.ReplicatedStorage
local u7 = v4.Workspace
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "projectile-type-encoding").getGuidedProjectileTypeByEncoding
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "GuidedMissileController"
    end,
    ["__index"] = u9
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p16)
    p16.Name = "GuidedMissileController"
    p16.jumping = Instance.new("BoolValue")
end
function u13.KnitStart(p17) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u6
        [4] = u7
        [5] = u2
        [6] = u12
        [7] = u10
        [8] = u5
        [9] = u11
    --]]
    u9.KnitStart(p17)
    u8.GuidedProjectileDetonated:connect(function(p18) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u7
            [3] = u2
            [4] = u12
        --]]
        if p18.guidedProjectileType == "guided_missile" then
            local u19 = u6.Assets.Effects.GuidedMissileExplosion:Clone()
            u19.Position = p18.position
            u19.Parent = u7
            u19.Debris1:Emit(5)
            u19.Debris2:Emit(5)
            u19.ExplosionFlames:Emit(50)
            u2:playSound(u12.GUIDED_MISSILE_EXPLOSION, {
                ["rollOffMaxDistance"] = 160,
                ["position"] = p18.position
            })
            task.delay(5, function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19:Destroy()
            end)
        end
    end)
    u10.On(function(p20, _, _, _, p21, _, _, p22, _, _, _, _, _, _) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
            [3] = u2
            [4] = u12
        --]]
        if p20.PrimaryPart and p21 then
            local v23 = u5:GetPlayerFromCharacter(p21) == u5.LocalPlayer
            if v23 then
                if p22 == nil then
                    v23 = p22
                else
                    v23 = p22.guidedProjectile
                end
            end
            if v23 ~= 0 and (v23 == v23 and (v23 and u11(p22.guidedProjectile) == "guided_missile")) then
                u2:playSound(u12.ARROW_HIT, {
                    ["volumeMultiplier"] = 0.3,
                    ["rollOffMaxDistance"] = 150,
                    ["position"] = p20.PrimaryPart.Position
                })
            end
        end
    end)
end
v3.CreateController(u13.new())
return nil