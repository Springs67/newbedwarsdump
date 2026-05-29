local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCharacter
local u6 = v3.WatchCharacterAnimation
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.HttpService
local u10 = v8.Players
local u11 = v8.ReplicatedStorage
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "PyroController"
    end,
    ["__index"] = u13
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p25)
    p25.Name = "PyroController"
end
function u22.KnitStart(_) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u16
        [3] = u5
        [4] = u10
        [5] = u11
        [6] = u1
        [7] = u6
        [8] = u17
        [9] = u19
        [10] = u12
        [11] = u18
        [12] = u4
        [13] = u20
        [14] = u9
        [15] = u21
        [16] = u14
    --]]
    u7.Controllers.PreloadController:runPreload({
        ["animations"] = { u16.FLAMETHROWER_USE, u16.FLAMETHROWER_UPGRADE, u16.FLAMETHROWER_IDLE }
    })
    u5(function(u26, u27, u28) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u1
        --]]
        if u26 == u10.LocalPlayer then
            return nil
        end
        local u29 = nil
        local u30 = nil
        local function u38(p31) --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u27
                [3] = u11
                [4] = u29
                [5] = u1
                [6] = u28
            --]]
            if p31 == 0 or (p31 ~= p31 or (not p31 or p31 < os.time())) then
                local v32 = u30
                if v32 ~= nil then
                    v32 = v32.Parent
                end
                if v32 then
                    u30:Destroy()
                end
                return nil
            end
            local v33 = u27:FindFirstChild("Head")
            if not v33 then
                return nil
            end
            local v34 = u30
            if v34 ~= nil then
                v34 = v34.Parent
            end
            if not v34 then
                u30 = u11:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BrittleParticle"):FindFirstChildWhichIsA("Attachment"):Clone()
                u30.Parent = v33
            end
            if u29 then
                u29:cancel()
            end
            u29 = u1.Promise.delay(p31 - os.time()):andThen(function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                local v35 = u30
                if v35 ~= nil then
                    v35:Destroy()
                end
            end)
            u28:GiveTask(function() --[[ Line: 86 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u30
                --]]
                local v36 = u29
                if v36 ~= nil then
                    v36:cancel()
                end
                local v37 = u30
                if v37 ~= nil then
                    v37:Destroy()
                end
            end)
        end
        u38(u26:GetAttribute("BrittleUntil"))
        u28:GiveTask(u26:GetAttributeChangedSignal("BrittleUntil"):Connect(function() --[[ Line: 98 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u26
            --]]
            u38(u26:GetAttribute("BrittleUntil"))
        end))
    end)
    local u39 = {}
    local u40 = {}
    u6({ u17:getAssetId(u16.FLAMETHROWER_UPGRADE), u17:getAssetId(u16.FLAMETHROWER_USE) }, function(p41, u42) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u12
            [3] = u17
            [4] = u16
            [5] = u39
            [6] = u18
            [7] = u4
            [8] = u20
            [9] = u10
            [10] = u9
            [11] = u40
            [12] = u11
            [13] = u21
        --]]
        local u43 = p41.Character
        if not u43 then
            return nil
        end
        local v44 = u42.Animation
        if v44 ~= nil then
            v44 = v44.AnimationId
        end
        local v45 = u19.FLAMETHROWER_COOLDOWN_SEC
        local v46 = u12.ItemCooldownModifierCheck:fire(v45).cooldown
        if v44 == u17:getAssetId(u16.FLAMETHROWER_USE) then
            local v47 = tick()
            local v48 = u39[p41]
            if v47 - (v48 == nil and 0 or v48) < v46 * 0.95 then
                return nil
            end
            u39[p41] = tick()
            local u49 = u18:getEntity(p41)
            if u49 ~= nil then
                u49 = u49:getHandItemInstanceFromCharacter()
            end
            if u49 then
                local v50 = u4
                local v51 = u20.FLAMETHROWER_USE
                local v52 = {}
                local v53
                if p41 == u10.LocalPlayer then
                    v53 = nil
                else
                    v53 = u43:GetPivot().Position
                end
                v52.position = v53
                local u54 = v50:playSound(v51, v52)
                local u55 = u9:GenerateGUID()
                u19.setEnabled(u49, true, u55)
                u42.Destroying:Connect(function() --[[ Line: 144 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u49
                        [3] = u55
                        [4] = u54
                    --]]
                    u19.setEnabled(u49, false, u55)
                    local v56 = u54
                    if v56 ~= nil then
                        v56:Stop()
                    end
                    local v57 = u54
                    if v57 ~= nil then
                        v57:Destroy()
                    end
                end)
            end
        end
        if v44 == u17:getAssetId(u16.FLAMETHROWER_UPGRADE) then
            local v58 = tick()
            local v59 = u40[p41]
            if v58 - (v59 == nil and 0 or v59) < 1 then
                return nil
            end
            u40[p41] = tick()
            local v60 = u4
            local v61 = u20.FLAMETHROWER_UPGRADE
            local v62 = {}
            local v63
            if p41 == u10.LocalPlayer then
                v63 = nil
            else
                v63 = u43:GetPivot().Position
            end
            v62.position = v63
            local u64 = v60:playSound(v61, v62)
            task.spawn(function() --[[ Line: 176 ]]
                --[[
                Upvalues:
                    [1] = u42
                    [2] = u11
                    [3] = u43
                    [4] = u21
                    [5] = u64
                --]]
                u42:GetMarkerReachedSignal("spawn_blowtorch"):Wait()
                local v65 = u11:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BlowTorch"):Clone()
                v65.Parent = u43
                u21:weldCharacterAccessories(u43)
                u42:GetMarkerReachedSignal("activate_blowtorch"):Wait()
                for v66, v67 in v65:GetDescendants() do
                    local _ = v66 - 1
                    if v67:IsA("ParticleEmitter") then
                        v67.Enabled = true
                    end
                    if v67:IsA("Light") then
                        v67.Enabled = true
                    end
                end
                u42:GetMarkerReachedSignal("despawn_blowtorch"):Wait()
                v65:Destroy()
                local v68 = u64
                if v68 ~= nil then
                    v68:Stop()
                end
                local v69 = u64
                if v69 ~= nil then
                    v69:Destroy()
                end
            end)
        end
    end)
    u14.On(function(p70, _, _, _, _, _, _, p71, _, _, _, _, _, _) --[[ Line: 208 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u20
            [3] = u10
        --]]
        if p71 ~= nil then
            p71 = p71.pyroBrittleAttack
        end
        if p71 then
            local v72 = u4
            local v73 = u20.BRITTLE_HIT
            local v74 = {}
            local v75
            if p70 == u10.LocalPlayer.Character then
                v75 = nil
            else
                v75 = p70.PrimaryPart
                if v75 ~= nil then
                    v75 = v75.Position
                end
            end
            v74.position = v75
            v72:playSound(v73, v74)
        end
    end)
end
function u22.openUpgradeMenu(_) --[[ Line: 233 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u15.FLAMETHROWER_UPGRADES, {})
end
u7.CreateController(u22.new())
return nil