local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.UILayers
local u6 = v3.WatchPlayerCharacter
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-assassin-util").ContractChangeReason
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade").BloodUpgrade
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u26 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u27 = v1.import(script, script.Parent, "ui", "contract-select-app").ContractSelectApp
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "BloodAssassinController"
    end,
    ["__index"] = u26
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u19
        [3] = u8
    --]]
    u26.constructor(p31, u19.BLOOD_ASSASSIN)
    p31.Name = "BloodAssassinController"
    p31.activeContractMaid = u8.new()
    p31.bleedingInstances = {}
    p31.thrillOfHuntActive = false
end
function u28.onKitLocalActivated(u32, p33) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u24
        [3] = u11
        [4] = u16
        [5] = u21
        [6] = u22
        [7] = u8
        [8] = u7
        [9] = u4
        [10] = u23
        [11] = u2
        [12] = u20
    --]]
    p33:GiveTask(u14.StatusEffectAdded:connect(function(p34) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u11
            [3] = u16
            [4] = u21
            [5] = u32
        --]]
        if p34.statusEffect ~= u24.BLEED then
            return nil
        end
        if p34.entityInstance:GetAttribute("BleedSource") ~= u11.LocalPlayer.UserId then
            return nil
        end
        local v35 = u16:getState().Kit.bloodUpgrades[u21.THRILL_OF_THE_HUNT]
        if v35 == 0 or (v35 ~= v35 or not v35) then
            return nil
        end
        u32.bleedingInstances[p34.entityInstance] = true
    end))
    p33:GiveTask(u14.StatusEffectRemoved:connect(function(p36) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u32
        --]]
        if p36.statusEffect == u24.BLEED then
            u32.bleedingInstances[p36.entityInstance] = nil
        end
    end))
    p33:GiveTask((u22.Client:Get("BloodAssassinUpdateUpgrades"):Connect(function(p37) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u21
            [3] = u32
            [4] = u11
            [5] = u8
            [6] = u7
        --]]
        u16:dispatch({
            ["type"] = "SetBloodUpgrades",
            ["upgrades"] = p37.upgrades
        })
        local v38 = p37.upgrades[u21.THRILL_OF_THE_HUNT]
        if v38 ~= 0 and (v38 == v38 and v38) then
            v38 = not u32.thrillOfHuntActive
        end
        if v38 ~= 0 and (v38 == v38 and v38) then
            u32.thrillOfHuntActive = true
            local v39 = nil
            while true do
                local v40 = task.wait(0.05)
                if v40 == 0 or (v40 ~= v40 or not v40) then
                    break
                end
                local v41 = false
                local v42 = u11.LocalPlayer.Character
                if v42 ~= nil then
                    v42 = v42.PrimaryPart
                    if v42 ~= nil then
                        v42 = v42.CFrame
                    end
                end
                if v42 then
                    for v43 in u32.bleedingInstances do
                        local v44 = v43.PrimaryPart
                        if v44 ~= nil then
                            v44 = v44.Position
                        end
                        if v44 then
                            v41 = v41 or v42.LookVector:Dot((v44 - v42.Position).Unit) > 0.7071067811865476
                            if v41 then
                                break
                            end
                        end
                    end
                    if v41 and not v39 then
                        v39 = u8.new()
                        v39:GiveTask(u7.Controllers.SprintController:getMovementStatusModifier():addModifier({
                            ["moveSpeedMultiplier"] = 1.15
                        }))
                    elseif v39 == nil then
                        v39 = nil
                    else
                        v39:DoCleaning()
                        v39 = nil
                    end
                elseif v39 == nil then
                    v39 = nil
                else
                    v39:DoCleaning()
                    v39 = nil
                end
            end
        end
    end)))
    p33:GiveTask((u22.Client:Get("BloodAssassinUpdateAvailableContracts"):Connect(function(p45) --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u23
            [3] = u2
            [4] = u16
        --]]
        if #p45.contracts > 0 then
            u4:playSound(u23.SHIELD_BLOCKED)
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                ["message"] = "New contracts are available"
            })
        end
        u16:dispatch({
            ["type"] = "SetAvailableContracts",
            ["contracts"] = p45.contracts
        })
    end)))
    p33:GiveTask((u22.Client:Get("BloodAssassinSetActiveContract"):Connect(function(p46) --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u23
            [3] = u20
            [4] = u32
        --]]
        if p46.activeContract then
            u4:playSound(u23.CAITLYN_CONTRACT_ACCEPT)
        end
        if p46.changeReason == u20.CONTRACT_SUCCESS then
            u4:playSound(u23.CAITLYN_CONTRACT_FINISH, {
                ["volumeMultiplier"] = 0.4
            })
        end
        u32:updateActiveContract(p46.activeContract, false)
    end)))
end
function u28.onKitLocalDeactivated(_) --[[ Line: 173 ]] end
function u28.onKitReplicationActivated(_, p47) --[[ Line: 175 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u18
        [3] = u12
        [4] = u25
    --]]
    local u51 = u15.On(function(p48, _, p49, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u12
            [3] = u25
        --]]
        if p49 == u18.BLEED then
            local v50 = u12.Assets.Effects.BloodAssassinDecay:Clone()
            v50.Parent = p48.PrimaryPart
            u25:playEffects({ v50 }, p48, {
                ["destroyAfterSec"] = 2
            })
        end
    end)
    p47:GiveTask(function() --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        u51()
    end)
end
function u28.onKitReplicationDeactivated(_) --[[ Line: 189 ]] end
function u28.onInnateAbilityEnabled(_, _, _) --[[ Line: 191 ]] end
function u28.onAbilityUsed(_, p52, p53) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u17
        [3] = u2
        [4] = u27
        [5] = u5
    --]]
    if p52 ~= u11.LocalPlayer.Character then
        return nil
    end
    if p53.ability ~= u17.BLOOD_ASSASSIN_MENU then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = "ContractSelect",
        ["app"] = u27,
        ["layer"] = u5.MAIN
    }, {
        ["AppId"] = "ContractSelect"
    })
end
function u28.updateActiveContract(u54, p55, p56) --[[ Line: 208 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u13
        [3] = u16
        [4] = u6
        [5] = u9
    --]]
    u54.activeContractMaid:DoCleaning()
    if p56 then
        local v57 = u22.Client:Get("BloodAssassinSelectContract")
        local v58 = {}
        local v59
        if p55 == nil then
            v59 = p55
        else
            v59 = p55.id
        end
        v58.contractId = v59
        v57:SendToServer(v58)
    end
    local v60
    if p55 then
        local v61 = p55.activationTime
        if v61 == 0 then
            v61 = false
        elseif v61 ~= v61 then
            v61 = false
        end
        v60 = not v61
    else
        v60 = p55
    end
    if v60 then
        p55.activationTime = u13:GetServerTimeNow()
    end
    u16:dispatch({
        ["type"] = "SetActiveContract",
        ["activeContract"] = p55
    })
    if p55 then
        u54.activeContractMaid:GiveTask(u6(p55.target, function(p62) --[[ Line: 234 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u54
            --]]
            local v63 = u9("Highlight", {
                ["FillTransparency"] = 0.7,
                ["OutlineTransparency"] = 0.2,
                ["FillColor"] = Color3.fromRGB(255, 29, 0),
                ["OutlineColor"] = Color3.fromRGB(243, 128, 108),
                ["Parent"] = p62
            })
            u54.activeContractMaid:GiveTask(v63)
        end))
    end
end
u7.CreateController(u28.new())
return nil