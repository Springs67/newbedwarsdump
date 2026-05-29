local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.SoundManager
local u6 = v3.WatchCharacter
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.RunService
local u14 = v11.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "queen-bee", "queen-bee-util").QueenBeeUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u26 = v1.import(script, script.Parent, "bee-particle").BeeParticle
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "QueenBeeGlideController"
    end,
    ["__index"] = u25
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u21
    --]]
    u25.constructor(p30, u21.QUEEN_BEE)
    p30.Name = "QueenBeeGlideController"
    p30.gliding = false
    p30.glideEffects = {}
    p30.wingOriginalState = {}
end
function u27.onKitLocalActivated(u31, p32) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u13
        [3] = u2
        [4] = u16
        [5] = u12
        [6] = u20
        [7] = u19
        [8] = u4
    --]]
    p32:GiveTask((u23.Client:Get("EndGlide"):Connect(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        local v33 = u31.glideMaid
        if v33 ~= nil then
            v33:DoCleaning()
        end
    end)))
    p32:GiveTask(u13.Heartbeat:Connect(function() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
            [3] = u12
            [4] = u20
            [5] = u19
            [6] = u4
            [7] = u31
        --]]
        local v34 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u16.QUEEN_BEE_GLIDE)
        if not v34 then
            return nil
        end
        local v35 = u12.LocalPlayer.Character
        if v35 ~= nil then
            v35 = v35.PrimaryPart
        end
        local v36 = u20:getEntity(u12.LocalPlayer)
        if v36 ~= nil then
            v36 = v36:getInstance()
        end
        if not (v35 and v36) then
            return nil
        end
        if not u19:isAboveVoid(v36, 15) then
            if v34.abilityState == u4.READY then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v34, u4.DISABLED)
            end
            return nil
        end
        if v35.AssemblyLinearVelocity.Y > -8 then
            return nil
        end
        if not u31.gliding then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v34, u4.READY)
        end
    end))
end
function u27.onKitLocalDeactivated(_) --[[ Line: 89 ]] end
function u27.onKitReplicationActivated(u37, p38) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u22
    --]]
    p38:GiveTask(u6(function(_, u39, p40) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u37
        --]]
        p40:GiveTask(u39:GetAttributeChangedSignal(u22.GLIDE_ATTRIBUTE):Connect(function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u22
                [3] = u37
            --]]
            local v41 = u39:GetAttribute(u22.GLIDE_ATTRIBUTE)
            if v41 == nil then
                v41 = false
            end
            u37:setGlideEffectEnabled(u39, v41)
        end))
        p40:GiveTask(function() --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u39
            --]]
            return u37:setGlideEffectEnabled(u39, false)
        end)
        local v42 = u39:GetAttribute(u22.GLIDE_ATTRIBUTE)
        if v42 == nil then
            v42 = false
        end
        u37:setGlideEffectEnabled(u39, v42)
    end))
end
function u27.onKitReplicationDeactivated(_) --[[ Line: 110 ]] end
function u27.onInnateAbilityEnabled(_, _, _) --[[ Line: 112 ]] end
function u27.onAbilityUsed(p43, _, p44) --[[ Line: 114 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
    --]]
    if p44.userCharacter ~= u12.LocalPlayer.Character then
        return nil
    end
    if p44.ability ~= u16.QUEEN_BEE_GLIDE then
        return nil
    end
    p43:enableGlide()
end
function u27.setGlideEffectEnabled(u45, u46, p47) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u24
        [4] = u26
        [5] = u13
        [6] = u15
        [7] = u8
    --]]
    local v48 = u45.glideEffects[u46]
    if v48 ~= nil then
        v48:DoCleaning()
    end
    if p47 then
        local u49 = true
        local u50 = u9.new()
        u50:GiveTask(function() --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u49
            --]]
            u49 = false
        end)
        u45.glideEffects[u46] = u50
        local u51 = u5:playSound(u24.QUEEN_BEE_GLIDE, {
            ["looped"] = true,
            ["volumeMultiplier"] = 3.4,
            ["parent"] = u46.PrimaryPart
        })
        u50:GiveTask(function() --[[ Line: 144 ]]
            --[[
            Upvalues:
                [1] = u51
            --]]
            local v52 = u51
            if v52 ~= nil then
                v52:Stop()
            end
        end)
        local u53 = u49
        local v54 = false
        local v55 = 0
        while true do
            if true then
                if v54 then
                    v55 = v55 + 1
                else
                    v54 = true
                end
            end
            if v55 >= 4 then
                break
            end
            u50:GiveTask(u26.new(u46))
        end
        task.spawn(function() --[[ Line: 167 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u53
                [3] = u13
                [4] = u45
                [5] = u50
                [6] = u15
                [7] = u8
            --]]
            local v56 = u46:FindFirstChild("3DClothing")
            if v56 ~= nil then
                v56 = v56:FindFirstChild("UpperTorso")
            end
            if v56 then
                local v57 = false
                local v58 = 0
                while true do
                    if true then
                        if v57 then
                            v58 = v58 + 1
                        else
                            v57 = true
                        end
                    end
                    if v58 >= 3 or not u53 then
                        break
                    end
                    local v59 = "transparent"
                    local v60
                    if v58 == 0 then
                        v60 = ""
                    else
                        local v61 = v58 + 1
                        v60 = tostring(v61)
                    end
                    local u62 = v56:FindFirstChild(v59 .. v60)
                    if u62 then
                        local u63 = 0
                        local u68 = u13.Heartbeat:Connect(function(p64) --[[ Line: 192 ]]
                            --[[
                            Upvalues:
                                [1] = u63
                                [2] = u45
                                [3] = u62
                            --]]
                            u63 = u63 + p64
                            local v65 = u45
                            local v66 = u62
                            local v67 = u63 * 2.5
                            v65:lerpWingNeon(v66, (math.sin(v67)))
                        end)
                        u50:GiveTask(function() --[[ Line: 196 ]]
                            --[[
                            Upvalues:
                                [1] = u68
                                [2] = u63
                                [3] = u15
                                [4] = u8
                                [5] = u45
                                [6] = u62
                            --]]
                            u68:Disconnect()
                            local v69 = u63 * 2.5
                            local u70 = math.sin(v69)
                            u15(0.4, u8, function(p71) --[[ Line: 199 ]]
                                --[[
                                Upvalues:
                                    [1] = u45
                                    [2] = u62
                                    [3] = u70
                                --]]
                                u45:lerpWingNeon(u62, (1 - p71) * u70)
                            end)
                        end)
                        task.wait(0.12)
                    end
                end
            end
        end)
    end
end
function u27.enableGlide(u72) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
        [3] = u10
        [4] = u14
        [5] = u13
        [6] = u20
        [7] = u19
        [8] = u22
        [9] = u18
        [10] = u17
    --]]
    local v73 = u72.glideMaid
    if v73 ~= nil then
        v73:DoCleaning()
    end
    local u74 = u12.LocalPlayer.Character
    if u74 ~= nil then
        u74 = u74.PrimaryPart
    end
    if not u74 then
        return nil
    end
    u72.glideMaid = u9.new()
    u72.gliding = true
    u72.glideMaid:GiveTask(function() --[[ Line: 225 ]]
        --[[
        Upvalues:
            [1] = u72
        --]]
        u72.gliding = false
    end)
    local v75 = u10
    local v76 = {
        ["Parent"] = u74
    }
    local v77 = u74.AssemblyMass * u14.Gravity / 2
    v76.Force = Vector3.new(0, v77, 0)
    local u78 = v75("BodyForce", v76)
    u72.glideMaid:GiveTask(function() --[[ Line: 232 ]]
        --[[
        Upvalues:
            [1] = u78
        --]]
        u78:Destroy()
    end)
    u72.glideMaid:GiveTask(function() --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u20
            [3] = u12
            [4] = u74
            [5] = u72
            [6] = u19
        --]]
        u13.Heartbeat:Connect(function() --[[ Line: 236 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u12
                [3] = u74
                [4] = u72
                [5] = u19
            --]]
            local v79 = u20:getEntity(u12.LocalPlayer)
            if v79 ~= nil then
                v79 = v79:getInstance()
            end
            if not (u74 and v79) then
                local v80 = u72.glideMaid
                if v80 ~= nil then
                    v80:DoCleaning()
                end
                return nil
            end
            if not u19:isAboveVoid(v79, 8) then
                local v81 = u72.glideMaid
                if v81 ~= nil then
                    v81:DoCleaning()
                end
                return nil
            end
        end)
    end)
    u72.glideMaid:GiveTask(u22:runGlidePhysics(function(p82) --[[ Line: 258 ]]
        --[[
        Upvalues:
            [1] = u74
            [2] = u72
        --]]
        if not u74.Parent then
            local v83 = u72.glideMaid
            if v83 ~= nil then
                v83:DoCleaning()
            end
            return nil
        end
        if u74.AssemblyLinearVelocity.Y < p82 then
            local v84 = u74.AssemblyLinearVelocity
            local v85 = Vector3.new(0, p82, 0)
            u74.AssemblyLinearVelocity = v84 * Vector3.new(1, 0, 1) + v85
        end
    end))
    local u86 = u18:playAnimation(u12.LocalPlayer, u17.QUEEN_BEE_FLOAT, {
        ["looped"] = true
    })
    if u86 then
        u72.glideMaid:GiveTask(function() --[[ Line: 278 ]]
            --[[
            Upvalues:
                [1] = u86
            --]]
            return u86:Stop()
        end)
    end
    local u87 = true
    u72.glideMaid:GiveTask(function() --[[ Line: 284 ]]
        --[[
        Upvalues:
            [1] = u87
        --]]
        u87 = false
    end)
    task.delay(u22.GLIDE_DURATION_SEC, function() --[[ Line: 287 ]]
        --[[
        Upvalues:
            [1] = u87
            [2] = u72
        --]]
        if not u87 then
            return nil
        end
        local v88 = u72.glideMaid
        if v88 ~= nil then
            v88:DoCleaning()
        end
    end)
end
function u27.lerpWingNeon(p89, p90, p91) --[[ Line: 297 ]]
    for _, v92 in p90:GetChildren() do
        if v92:IsA("BasePart") or v92:IsA("Decal") then
            p89:lerpWingNeon(v92, p91)
        end
    end
    local v93 = math.clamp(p91, 0, 1)
    local v94 = p89.wingOriginalState[p90]
    if not v94 then
        if p90:IsA("BasePart") then
            v94 = {
                ["transparency"] = p90.Transparency,
                ["color"] = p90.Color
            }
            p89.wingOriginalState[p90] = v94
        end
        if p90:IsA("Decal") then
            v94 = {
                ["transparency"] = p90.Transparency
            }
            p89.wingOriginalState[p90] = v94
        end
    end
    local v95 = p90:IsA("BasePart")
    if v95 then
        if v94 == nil then
            v95 = v94
        else
            v95 = v94.color
        end
    end
    if v95 then
        local v96 = v94.color
        if v96 ~= nil then
            v96 = v96:Lerp(Color3.fromRGB(250, 166, 83), v93)
        end
        p90.Color = v96
    end
    local v97 = p90:IsA("BasePart")
    if v97 then
        if v94 == nil then
            v97 = v94
        else
            v97 = v94.transparency
        end
    end
    if v97 ~= 0 and (v97 == v97 and v97) then
        p90.Transparency = (1 - v93) * v94.transparency + v93 * 0
    end
    local v98 = p90:IsA("Decal")
    if v98 then
        if v94 == nil then
            v98 = v94
        else
            v98 = v94.transparency
        end
    end
    if v98 ~= 0 and (v98 == v98 and v98) then
        p90.Transparency = (1 - v93) * v94.transparency + v93 * 1
    end
end
v7.CreateController(u27.new())
return nil