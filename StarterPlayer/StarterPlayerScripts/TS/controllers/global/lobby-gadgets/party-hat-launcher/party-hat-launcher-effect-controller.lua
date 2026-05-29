local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.PlayerUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCharacterAnimation
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "PartyHatLauncherEffectController"
    end,
    ["__index"] = u9
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p22)
    p22.Name = "PartyHatLauncherEffectController"
    p22.playerHatMap = {}
end
function u19.KnitStart(u23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u17
        [4] = u6
        [5] = u13
        [6] = u4
        [7] = u16
        [8] = u15
        [9] = u5
        [10] = u11
        [11] = u10
        [12] = u12
        [13] = u14
        [14] = u7
        [15] = u18
    --]]
    u9.KnitStart(u23)
    u8.LocalProjectileImpact:connect(function(p24) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u6
            [3] = u13
            [4] = u4
            [5] = u16
        --]]
        if not u17.isLobbyServer() then
            return nil
        end
        if p24.projectile.Name ~= "party_hat_missile" then
            return nil
        end
        u6.Controllers.FireworkController:playFireworkEffect(p24.hitPosition, u13.CONFETTI, {
            ["sizeMultiplier"] = 1,
            ["noSound"] = true
        })
        u4:playSound(u16.CONFETTI, {
            ["volumeMultiplier"] = 0.8,
            ["rollOffMaxDistance"] = 1000,
            ["rollOffMinDistance"] = 200,
            ["position"] = p24.hitPosition
        })
        u4:playSound(u16.CONFETTI_POPPER, {
            ["volumeMultiplier"] = 0.4,
            ["rollOffMaxDistance"] = 1000,
            ["rollOffMinDistance"] = 200,
            ["position"] = p24.hitPosition
        })
    end)
    u15.Client:Get("PartyHatMissileHit"):Connect(function(p25) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:giveHat(p25.playerInRange, p25.hatAccessory)
    end)
    u15.Client:Get("PartyHatSyncHats"):Connect(function(p26) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        for v27, v28 in p26.playerHatMap do
            u23:giveHat(v27, v28)
        end
    end)
    u5({ u11:getAssetId(u10.ROCKET_LAUNCHER_SHOT), u11:getAssetId(u10.ROCKET_LAUNCHER_RELOAD) }, function(p29, u30) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u12
            [4] = u14
            [5] = u7
            [6] = u18
        --]]
        local u31 = p29.Character
        if not u31 then
            return nil
        end
        local v32 = u30.Animation
        if v32 ~= nil then
            v32 = v32.AnimationId
        end
        if v32 == u11:getAssetId(u10.ROCKET_LAUNCHER_SHOT) then
            local v33 = u12:getEntity(p29)
            if v33 ~= nil then
                v33 = v33:getHandItemInstanceFromCharacter()
            end
            if v33 and v33.Name == u14.PARTY_HAT_LAUNCHER then
                v33.Handle.Missile.Transparency = 1
                for v34, v35 in v33:GetDescendants() do
                    local _ = v34 - 1
                    if v35:IsA("ParticleEmitter") then
                        v35:Emit(5)
                    end
                end
            end
        end
        if v32 == u11:getAssetId(u10.ROCKET_LAUNCHER_RELOAD) then
            local u36 = u12:getEntity(p29)
            if u36 ~= nil then
                u36 = u36:getHandItemInstanceFromCharacter()
            end
            if u36 and u36.Name == u14.PARTY_HAT_LAUNCHER then
                u30:GetMarkerReachedSignal("grab_missile"):Connect(function() --[[ Line: 116 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u14
                        [3] = u30
                        [4] = u36
                        [5] = u31
                        [6] = u18
                    --]]
                    local u37 = u7:WaitForChild("Items"):WaitForChild(u14.PARTY_HAT_MISSILE):Clone()
                    u30:GetMarkerReachedSignal("insert_missile"):Connect(function() --[[ Line: 118 ]]
                        --[[
                        Upvalues:
                            [1] = u37
                            [2] = u36
                        --]]
                        u37:Destroy()
                        if u36.Parent and u36:FindFirstChild("Handle") then
                            u36.Handle.Missile.Transparency = 0
                        end
                    end)
                    local v38 = u31:FindFirstChildWhichIsA("Humanoid")
                    if v38 ~= nil then
                        v38:AddAccessory(u37)
                    end
                    u18:weldCharacterAccessories(u31)
                end)
            end
        end
    end)
end
function u19.giveHat(p39, p40, p41) --[[ Line: 135 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u18
    --]]
    local v42 = p39.playerHatMap[p40] ~= nil and p39.playerHatMap[p40]
    if v42 then
        v42:Destroy()
    end
    local v43 = u3.waitForCharacter(p40)
    if not v43 then
        return nil
    end
    local v44 = p41:Clone()
    v44.Parent = v43
    u18:weldAccessory(v43, v44)
    p39.playerHatMap[p40] = v44
end
u6.CreateController(u19.new())
return nil