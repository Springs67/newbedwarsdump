local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCharacter
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.RunService
local u15 = v12.StarterPlayer
local u16 = v12.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "dasher", "dasher-progress-bar").DasherProgressBar
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "dasher", "dasher-kit").DasherKit
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes")
local u29 = v28.GetAttribute
local u30 = v28.GetAttributeChangedSignal
local u31 = v28.SetAttribute
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "DaoGadgetController"
    end,
    ["__index"] = u19
})
u32.__index = u32
function u32.new(...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u10
    --]]
    u19.constructor(p35)
    p35.Name = "DaoGadgetController"
    p35.maid = u10.new()
end
function u32.KnitStart(p36) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u17
        [3] = u20
        [4] = u27
        [5] = u4
        [6] = u13
    --]]
    u19.KnitStart(p36)
    u17.AbilityUsed:connect(function(p37) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u27
            [3] = u4
            [4] = u13
        --]]
        if p37.ability ~= u20.DASH then
            return nil
        end
        if p37:isCancelled() then
            return nil
        end
        if not p37.userCharacter.PrimaryPart then
            return nil
        end
        local v38 = u27.DAO_DASH
        local v39 = u4
        local v40 = {
            ["volumeMultiplier"] = 1
        }
        local v41
        if p37.userCharacter == u13.LocalPlayer.Character then
            v41 = nil
        else
            v41 = p37.userCharacter.PrimaryPart
        end
        v40.parent = v41
        v39:playSound(v38, v40)
    end)
end
function u32.onEnable(u42, u43) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
        [3] = u17
        [4] = u5
        [5] = u13
        [6] = u30
        [7] = u25
        [8] = u16
        [9] = u10
        [10] = u23
        [11] = u14
        [12] = u24
        [13] = u9
        [14] = u29
        [15] = u31
    --]]
    local u44 = false
    u42:setupDestroyableYield(function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u20
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u20.DASH, nil):expect()
    end)
    u42.maid:GiveTask(u17.SwordSwingDown:connect(function() --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44 = true
    end))
    u42.maid:GiveTask(u17.SwordSwingUp:connect(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44 = false
    end))
    u5(function(p45, p46, p47) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u30
            [3] = u25
            [4] = u16
            [5] = u42
            [6] = u10
            [7] = u2
            [8] = u23
        --]]
        if p45 ~= u13.LocalPlayer then
            return nil
        end
        p47:GiveTask(u30(p46, u25.canDashAttribute, function(p48) --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u42
                [3] = u10
                [4] = u2
                [5] = u23
            --]]
            if p48 == nil then
                return nil
            end
            local v49 = p48 - u16:GetServerTimeNow()
            if u42.cooldownMaid then
                u42.cooldownMaid:DoCleaning()
            end
            u42.cooldownMaid = u10.new()
            u42.cooldownMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u23.DASHER_ABILITY))
            local v50 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
            local v51 = u23.DASHER_ABILITY
            local v52 = {
                ["cooldownBar"] = {
                    ["color"] = Color3.fromRGB(166, 38, 38)
                }
            }
            v50:setOnCooldown(v51, v49, v52)
            u42.cooldownMaid:GiveTask(function() --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u23
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(u23.DASHER_ABILITY)
            end)
            task.delay(v49, function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                if u42.cooldownMaid then
                    u42.cooldownMaid:DoCleaning()
                    u42.cooldownMaid = nil
                end
            end)
        end))
        p47:GiveTask(function() --[[ Line: 111 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            local v53 = u42.cooldownMaid
            if v53 ~= nil then
                v53:DoCleaning()
            end
        end)
    end)
    u42.maid:GiveTask(u14.Heartbeat:Connect(function() --[[ Line: 118 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u24
            [3] = u42
            [4] = u9
            [5] = u29
            [6] = u25
            [7] = u44
            [8] = u16
            [9] = u2
            [10] = u20
            [11] = u43
            [12] = u31
        --]]
        local v54 = u13.LocalPlayer.Character
        if v54 == nil or not v54.PrimaryPart then
            return nil
        end
        local v55 = u24:getEntity(v54)
        if v55 == nil or v55:isAlive() == false then
            u42.beginChargeTime = nil
            local v56 = u42.chargingMaid
            if v56 ~= nil then
                v56:DoCleaning()
            end
            u42.chargingMaid = nil
            u9.Debug("Removed")
            return nil
        end
        local v57 = u29(v54, u25.canDashAttribute)
        local v58 = v57 == nil and 0 or v57
        local v59 = u44
        if v59 then
            local v60 = u42.beginChargeTime
            if v60 == 0 then
                v60 = false
            elseif v60 ~= v60 then
                v60 = false
            end
            v59 = not v60
            if v59 then
                if v58 == nil then
                    v59 = false
                else
                    v59 = v58 < u16:GetServerTimeNow()
                end
            end
        end
        if v59 and u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u20.DASH, {
            ["disableBlockedAbilityAlert"] = true
        }) then
            u42.beginChargeTime = time()
        end
        local v61 = u42.beginChargeTime
        if v61 ~= 0 and (v61 == v61 and v61) then
            if time() - u42.beginChargeTime > u25.CHARGE_TIME_BEFORE_CHARGING_STATE then
                v61 = not u42.chargingMaid
            else
                v61 = false
            end
        end
        if v61 ~= 0 and (v61 == v61 and v61) then
            u42.beginChargeTime = nil
            u42:enterChargingState()
            return nil
        end
        if not u44 then
            local v62 = u42.chargingMaid
            if v62 ~= nil then
                v62:DoCleaning()
            end
            u42.chargingMaid = nil
            local v63 = u42.beginChargeTime
            if v63 ~= 0 and (v63 == v63 and v63) then
                v63 = time() - u42.beginChargeTime >= u25.CHARGE_TIME
            end
            if v63 ~= 0 and (v63 == v63 and v63) then
                local v64 = u16.CurrentCamera.CFrame.LookVector
                if u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(u20.DASH) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u20.DASH, nil, {
                        ["direction"] = v64,
                        ["origin"] = v54.PrimaryPart.Position,
                        ["weapon"] = u43.itemType
                    })
                    u42:dashForward(v64)
                    u31(v54, u25.canDashAttribute, u16:GetServerTimeNow() + 500)
                end
            end
            u42.beginChargeTime = nil
            return nil
        end
    end))
    u42.maid:GiveTask(function() --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        local v65 = u42.chargingMaid
        if v65 ~= nil then
            v65:DoCleaning()
        end
        u42.chargingMaid = nil
        local v66 = u42.cooldownMaid
        if v66 ~= nil then
            v66:DoCleaning()
        end
        u42.cooldownMaid = nil
        u42.beginChargeTime = nil
    end)
end
function u32.enterChargingState(p67) --[[ Line: 208 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u22
        [3] = u13
        [4] = u21
        [5] = u11
        [6] = u18
        [7] = u25
        [8] = u8
    --]]
    p67.chargingMaid = u10.new()
    local u68 = u22:playAnimation(u13.LocalPlayer, u21.DAO_CHARGE, {
        ["looped"] = true
    })
    local v69 = p67.chargingMaid
    if v69 ~= nil then
        v69:GiveTask(function() --[[ Line: 215 ]]
            --[[
            Upvalues:
                [1] = u68
            --]]
            local v70 = u68
            if v70 ~= nil then
                v70:Stop()
            end
        end)
    end
    local u71 = u11.mount(u11.createElement("ScreenGui", {}, { u11.createElement(u18, {
            ["chargeTime"] = u25.CHARGE_TIME
        }) }), u13.LocalPlayer:WaitForChild("PlayerGui"), "DasherCharge")
    local v72 = p67.chargingMaid
    if v72 ~= nil then
        v72:GiveTask(function() --[[ Line: 229 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u71
            --]]
            u11.unmount(u71)
        end)
    end
    u8.Controllers.EmoteController:setCanEmote(false)
    p67.chargingMaid:GiveTask(function() --[[ Line: 234 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8.Controllers.EmoteController:setCanEmote(true)
    end)
end
function u32.dashForward(_, p73) --[[ Line: 238 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u8
        [3] = u15
        [4] = u4
        [5] = u27
        [6] = u22
        [7] = u21
    --]]
    local v74 = u13.LocalPlayer.Character
    if v74 then
        local v75 = CFrame
        local v76 = v74.HumanoidRootPart.Position
        local v77 = v74.HumanoidRootPart.Position
        v74.HumanoidRootPart.CFrame = v75.lookAt(v76, v77 + p73 * Vector3.new(1, 0, 1))
        v74.Humanoid.JumpHeight = 0.5
        v74.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        local v78 = v74.HumanoidRootPart
        local v79 = p73.Unit
        local v80 = v74.PrimaryPart
        if v80 ~= nil then
            v80 = v80.AssemblyMass
        end
        local v81 = v80 == nil and 1 or v80
        v78:ApplyImpulse(v79 * Vector3.new(1, 0, 1) * v81 * 70)
        u8.Controllers.JumpHeightController:setJumpHeight(u15.CharacterJumpHeight)
        u4:playSound(u27.DAO_SLASH)
        local v82 = u22:playAnimation(u13.LocalPlayer, u21.DAO_DASH)
        if v82 ~= nil then
            v82:AdjustSpeed(2.5)
        end
    end
end
function u32.onDisable(p83) --[[ Line: 271 ]]
    p83.maid:DoCleaning()
end
function u32.isRelevantItem(_, p84) --[[ Line: 274 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v85 = u26(p84.itemType).sword
    if v85 ~= nil then
        v85 = v85.daoDash
    end
    return v85 == true
end
v7.CreateController(u32.new())
return nil