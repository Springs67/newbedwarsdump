local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCharacter
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.RunService
local u16 = v13.StarterPlayer
local u17 = v13.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "dasher", "dasher-kit").DasherKit
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes")
local u30 = v29.GetAttribute
local u31 = v29.GetAttributeChangedSignal
local u32 = v29.SetAttribute
local u33 = v1.import(script, script.Parent, "dasher-progress-bar").DasherProgressBar
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "DaoController"
    end,
    ["__index"] = u19
})
u34.__index = u34
function u34.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v35 = u34
    local v36 = setmetatable({}, v35)
    return v36:constructor(...) or v36
end
function u34.constructor(p37) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u11
    --]]
    u19.constructor(p37)
    p37.Name = "DaoController"
    p37.maid = u11.new()
end
function u34.KnitStart(p38) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u8
        [3] = u21
        [4] = u18
        [5] = u20
        [6] = u28
        [7] = u25
        [8] = u4
        [9] = u5
        [10] = u14
    --]]
    u19.KnitStart(p38)
    u8.Controllers.PreloadController:runPreload({
        ["animations"] = { u21.DAO_CHARGE, u21.DAO_DASH }
    })
    u18.AbilityUsed:connect(function(p39) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u28
            [3] = u8
            [4] = u25
            [5] = u4
            [6] = u5
            [7] = u14
        --]]
        if p39.ability ~= u20.DASH then
            return nil
        end
        if p39:isCancelled() then
            return nil
        end
        if not p39.userCharacter.PrimaryPart then
            return nil
        end
        local v40 = u28.DAO_DASH
        local v41 = u8.Controllers.KitController:getKitSkin(p39.userCharacter)
        local v42 = 1
        local v43
        if v41 then
            local v44 = u25[v41].yuzi
            if v44 ~= nil then
                v44 = v44.dashSound
            end
            if v44 and #v44 > 0 then
                v40 = u4.fromList(unpack(v44))
            end
            v43 = u25[v41].yuzi
            if v43 ~= nil then
                v43 = v43.soundVolume
            end
            if v43 == 0 or v43 ~= v43 then
                v43 = v42
            elseif not v43 then
                v43 = v42
            end
        else
            v43 = v42
        end
        local v45 = u5
        local v46 = {}
        local v47
        if p39.userCharacter == u14.LocalPlayer.Character then
            v47 = nil
        else
            v47 = p39.userCharacter.PrimaryPart
        end
        v46.parent = v47
        v46.volumeMultiplier = v43
        v45:playSound(v40, v46)
    end)
end
function u34.onEnable(u48, u49) --[[ Line: 96 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
        [3] = u18
        [4] = u6
        [5] = u14
        [6] = u31
        [7] = u26
        [8] = u17
        [9] = u11
        [10] = u23
        [11] = u15
        [12] = u24
        [13] = u10
        [14] = u30
        [15] = u32
    --]]
    local u50 = false
    u48:setupDestroyableYield(function() --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u20
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u20.DASH, nil):expect()
    end)
    u48.maid:GiveTask(u18.SwordSwingDown:connect(function() --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        u50 = true
    end))
    u48.maid:GiveTask(u18.SwordSwingUp:connect(function() --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        u50 = false
    end))
    u48.maid:GiveTask(u6(function(p51, p52, p53) --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u31
            [3] = u26
            [4] = u17
            [5] = u48
            [6] = u11
            [7] = u2
            [8] = u23
        --]]
        if p51 ~= u14.LocalPlayer then
            return nil
        end
        p53:GiveTask(u31(p52, u26.canDashAttribute, function(p54) --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u48
                [3] = u11
                [4] = u2
                [5] = u23
            --]]
            if p54 == nil then
                return nil
            end
            local v55 = p54 - u17:GetServerTimeNow()
            if u48.cooldownMaid then
                u48.cooldownMaid:DoCleaning()
            end
            u48.cooldownMaid = u11.new()
            u48.cooldownMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u23.DASHER_ABILITY))
            local v56 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
            local v57 = u23.DASHER_ABILITY
            local v58 = {
                ["cooldownBar"] = {
                    ["color"] = Color3.fromRGB(166, 38, 38)
                }
            }
            v56:setOnCooldown(v57, v55, v58)
            u48.cooldownMaid:GiveTask(function() --[[ Line: 126 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u23
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(u23.DASHER_ABILITY)
            end)
            task.delay(v55, function() --[[ Line: 129 ]]
                --[[
                Upvalues:
                    [1] = u48
                --]]
                if u48.cooldownMaid then
                    u48.cooldownMaid:DoCleaning()
                    u48.cooldownMaid = nil
                end
            end)
        end))
        p53:GiveTask(function() --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u48
            --]]
            local v59 = u48.cooldownMaid
            if v59 ~= nil then
                v59:DoCleaning()
            end
        end)
    end))
    u48.maid:GiveTask(u15.Heartbeat:Connect(function() --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u24
            [3] = u48
            [4] = u10
            [5] = u30
            [6] = u26
            [7] = u50
            [8] = u17
            [9] = u2
            [10] = u20
            [11] = u49
            [12] = u32
        --]]
        local v60 = u14.LocalPlayer.Character
        if v60 == nil or not v60.PrimaryPart then
            return nil
        end
        local v61 = u24:getEntity(v60)
        if v61 == nil or v61:isAlive() == false then
            u48.beginChargeTime = nil
            local v62 = u48.chargingMaid
            if v62 ~= nil then
                v62:DoCleaning()
            end
            u48.chargingMaid = nil
            u10.Debug("Removed")
            return nil
        end
        local v63 = u30(v60, u26.canDashAttribute)
        local v64 = v63 == nil and 0 or v63
        local v65 = u50
        if v65 then
            local v66 = u48.beginChargeTime
            if v66 == 0 then
                v66 = false
            elseif v66 ~= v66 then
                v66 = false
            end
            v65 = not v66
            if v65 then
                if v64 == nil then
                    v65 = false
                else
                    v65 = v64 < u17:GetServerTimeNow()
                end
            end
        end
        if v65 and u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u20.DASH, {
            ["disableBlockedAbilityAlert"] = true
        }) then
            u48.beginChargeTime = time()
        end
        local v67 = u48.beginChargeTime
        if v67 ~= 0 and (v67 == v67 and v67) then
            if time() - u48.beginChargeTime > u26.CHARGE_TIME_BEFORE_CHARGING_STATE then
                v67 = not u48.chargingMaid
            else
                v67 = false
            end
        end
        if v67 ~= 0 and (v67 == v67 and v67) then
            u48.beginChargeTime = nil
            u48:enterChargingState()
            return nil
        end
        if not u50 then
            local v68 = u48.chargingMaid
            if v68 ~= nil then
                v68:DoCleaning()
            end
            u48.chargingMaid = nil
            local v69 = u48.beginChargeTime
            if v69 ~= 0 and (v69 == v69 and v69) then
                v69 = time() - u48.beginChargeTime >= u26.CHARGE_TIME
            end
            if v69 ~= 0 and (v69 == v69 and v69) then
                local v70 = u17.CurrentCamera.CFrame.LookVector
                if u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u20.DASH) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u20.DASH, nil, {
                        ["direction"] = v70,
                        ["origin"] = v60.PrimaryPart.Position,
                        ["weapon"] = u49.itemType
                    })
                    u48:dashForward(v70)
                    u32(v60, u26.canDashAttribute, u17:GetServerTimeNow() + 500)
                end
            end
            u48.beginChargeTime = nil
            return nil
        end
    end))
    u48.maid:GiveTask(function() --[[ Line: 219 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        local v71 = u48.chargingMaid
        if v71 ~= nil then
            v71:DoCleaning()
        end
        u48.chargingMaid = nil
        local v72 = u48.cooldownMaid
        if v72 ~= nil then
            v72:DoCleaning()
        end
        u48.cooldownMaid = nil
        u48.beginChargeTime = nil
    end)
end
function u34.enterChargingState(p73) --[[ Line: 233 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u22
        [3] = u14
        [4] = u21
        [5] = u8
        [6] = u12
        [7] = u33
        [8] = u26
        [9] = u9
    --]]
    p73.chargingMaid = u11.new()
    local u74 = u22:playAnimation(u14.LocalPlayer, u21.DAO_CHARGE, {
        ["looped"] = true
    })
    u8.Controllers.SwordController:disableHoldAutoSwing()
    u14.LocalPlayer:SetAttribute("IsCasting", true)
    local v75 = p73.chargingMaid
    if v75 ~= nil then
        v75:GiveTask(function() --[[ Line: 242 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u8
            --]]
            u14.LocalPlayer:SetAttribute("IsCasting", false)
            u8.Controllers.SwordController:enableHoldAutoSwing()
        end)
    end
    local v76 = p73.chargingMaid
    if v76 ~= nil then
        v76:GiveTask(function() --[[ Line: 249 ]]
            --[[
            Upvalues:
                [1] = u74
            --]]
            local v77 = u74
            if v77 ~= nil then
                v77:Stop()
            end
        end)
    end
    local u78 = u12.mount(u12.createElement("ScreenGui", {}, { u12.createElement(u33, {
            ["chargeTime"] = u26.CHARGE_TIME
        }) }), u14.LocalPlayer:WaitForChild("PlayerGui"), "DasherCharge")
    local v79 = p73.chargingMaid
    if v79 ~= nil then
        v79:GiveTask(function() --[[ Line: 263 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u78
            --]]
            u12.unmount(u78)
        end)
    end
    u9.Controllers.EmoteController:setCanEmote(false)
    p73.chargingMaid:GiveTask(function() --[[ Line: 268 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9.Controllers.EmoteController:setCanEmote(true)
    end)
    u8.Controllers.YuziSkinController:windUpMotor(u14.LocalPlayer.Character)
end
function u34.dashForward(_, p80) --[[ Line: 273 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
        [3] = u16
        [4] = u5
        [5] = u28
        [6] = u22
        [7] = u21
    --]]
    local v81 = u14.LocalPlayer.Character
    if v81 then
        local v82 = CFrame
        local v83 = v81.HumanoidRootPart.Position
        local v84 = v81.HumanoidRootPart.Position
        v81.HumanoidRootPart.CFrame = v82.lookAt(v83, v84 + p80 * Vector3.new(1, 0, 1))
        v81.Humanoid.JumpHeight = 0.5
        v81.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        local v85 = v81.HumanoidRootPart
        local v86 = p80.Unit
        local v87 = v81.PrimaryPart
        if v87 ~= nil then
            v87 = v87.AssemblyMass
        end
        local v88 = v87 == nil and 1 or v87
        v85:ApplyImpulse(v86 * Vector3.new(1, 0, 1) * v88 * 70)
        u9.Controllers.JumpHeightController:setJumpHeight(u16.CharacterJumpHeight)
        u5:playSound(u28.DAO_SLASH)
        local v89 = u22:playAnimation(u14.LocalPlayer, u21.DAO_DASH)
        if v89 ~= nil then
            v89:AdjustSpeed(2.5)
        end
    end
end
function u34.onDisable(p90) --[[ Line: 306 ]]
    p90.maid:DoCleaning()
end
function u34.isRelevantItem(_, p91) --[[ Line: 309 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v92 = u27(p91.itemType).sword
    if v92 ~= nil then
        v92 = v92.daoDash
    end
    return v92 == true
end
u8.CreateController(u34.new())
return nil