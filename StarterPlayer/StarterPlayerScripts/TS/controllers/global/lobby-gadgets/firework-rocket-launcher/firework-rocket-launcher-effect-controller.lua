local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.WatchCharacterAnimation
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "FireworkRocketLauncherEffectController"
    end,
    ["__index"] = u9
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p21)
    p21.Name = "FireworkRocketLauncherEffectController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u16
        [4] = u6
        [5] = u14
        [6] = u5
        [7] = u3
        [8] = u13
        [9] = u4
        [10] = u11
        [11] = u10
        [12] = u12
        [13] = u15
        [14] = u7
        [15] = u17
    --]]
    u9.KnitStart(p22)
    u8.LocalProjectileImpact:connect(function(p23) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u6
            [3] = u14
            [4] = u5
            [5] = u3
        --]]
        if not u16.isLobbyServer() then
            return nil
        end
        if p23.projectile.Name ~= "firework_rocket_missile" then
            return nil
        end
        local v24 = u6.values(u14)
        u5.Controllers.FireworkController:playFireworkEffect(p23.hitPosition, u3.fromList(unpack(v24)), {
            ["sizeMultiplier"] = 1,
            ["volumeMultiplier"] = 0.8
        })
    end)
    u8.ExplosionEffect:connect(function(p25) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u16
            [3] = u6
            [4] = u14
            [5] = u5
            [6] = u3
        --]]
        if p25.explosionType == u13.FIREWORK_ROCKET and u16.isGameServer() then
            local v26 = u6.values(u14)
            u5.Controllers.FireworkController:playFireworkEffect(p25.position, u3.fromList(unpack(v26)), {
                ["sizeMultiplier"] = 1.2,
                ["volumeMultiplier"] = 0.8
            })
        end
    end)
    u4({ u11:getAssetId(u10.ROCKET_LAUNCHER_SHOT), u11:getAssetId(u10.ROCKET_LAUNCHER_RELOAD) }, function(p27, u28) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u12
            [4] = u15
            [5] = u7
            [6] = u17
        --]]
        local u29 = p27.Character
        if not u29 then
            return nil
        end
        local v30 = u28.Animation
        if v30 ~= nil then
            v30 = v30.AnimationId
        end
        if v30 == u11:getAssetId(u10.ROCKET_LAUNCHER_SHOT) then
            local v31 = u12:getEntity(p27)
            if v31 ~= nil then
                v31 = v31:getHandItemInstanceFromCharacter()
            end
            if v31 and v31.Name == u15.FIREWORK_ROCKET_LAUNCHER then
                v31.Handle.Missile.Transparency = 1
                for v32, v33 in v31:GetDescendants() do
                    local _ = v32 - 1
                    if v33:IsA("ParticleEmitter") then
                        v33:Emit(5)
                    end
                end
            end
        end
        if v30 == u11:getAssetId(u10.ROCKET_LAUNCHER_RELOAD) then
            local u34 = u12:getEntity(p27)
            if u34 ~= nil then
                u34 = u34:getHandItemInstanceFromCharacter()
            end
            if u34 and u34.Name == u15.FIREWORK_ROCKET_LAUNCHER then
                u28:GetMarkerReachedSignal("grab_missile"):Connect(function() --[[ Line: 102 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u15
                        [3] = u28
                        [4] = u34
                        [5] = u29
                        [6] = u17
                    --]]
                    local u35 = u7:WaitForChild("Items"):WaitForChild(u15.FIREWORK_ROCKET_MISSILE):Clone()
                    u28:GetMarkerReachedSignal("insert_missile"):Connect(function() --[[ Line: 104 ]]
                        --[[
                        Upvalues:
                            [1] = u35
                            [2] = u34
                        --]]
                        u35:Destroy()
                        if u34.Parent and u34:FindFirstChild("Handle") then
                            u34.Handle.Missile.Transparency = 0
                        end
                    end)
                    local v36 = u29:FindFirstChildWhichIsA("Humanoid")
                    if v36 ~= nil then
                        v36:AddAccessory(u35)
                    end
                    u17:weldCharacterAccessories(u29)
                end)
            end
        end
    end)
end
u5.CreateController(u18.new())
return nil