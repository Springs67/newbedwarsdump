local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "KnightShieldController"
    end,
    ["__index"] = u10
})
u17.__index = u17
function u17.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p20)
    p20.Name = "KnightShieldController"
    p20.shieldRaisedMaidMap = {}
    p20.charactersInShield = {}
    p20.shieldLastThresholdMap = {}
end
function u17.isRelevantItem(_, p21) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return p21.itemType == u15.KNIGHT_SHIELD
end
function u17.onEnable(_, _, _) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u12
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u11.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE, u12[u11.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE].triggerConfig)
end
function u17.onDisable(_) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u11.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE)
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u11.EXIT_KNIGHT_SHIELD_DEFENSIVE_STANCE)
end
function u17.KnitStart(u22) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u15
        [4] = u8
        [5] = u5
        [6] = u13
        [7] = u11
        [8] = u3
        [9] = u16
    --]]
    u10.KnitStart(u22)
    u9.EntityChangeHeldItem:connect(function(p23) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u22
        --]]
        local v24 = p23.item
        if v24 ~= nil then
            v24 = v24.Name
        end
        local v25 = v24 ~= u15.KNIGHT_SHIELD
        if v25 then
            v25 = u22.shieldRaisedMaidMap[p23.entity:getInstance()] ~= nil
        end
        if v25 then
            u22:lowerShield(p23.entity:getInstance())
        end
    end)
    u9.SwordSwing:connect(function(p26) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u8
            [3] = u22
            [4] = u5
            [5] = u13
        --]]
        if p26:isCancelled() then
            return nil
        end
        if p26.swordType ~= u15.KNIGHT_SHIELD then
            return nil
        end
        local v27 = u8.LocalPlayer.Character
        if not v27 then
            return nil
        end
        if u22.charactersInShield[v27] == nil then
            p26:setCancelled(true)
            return nil
        end
        local u28 = u5.Controllers.ViewmodelController:playAnimation(u13.KNIGHT_SHIELD_FP_BASH, {
            ["looped"] = false
        })
        if u28 ~= nil then
            u28.Stopped:Connect(function() --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:Destroy()
            end)
        end
    end)
    u9.AbilityUsed:connect(function(p29) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u22
        --]]
        if p29:isCancelled() then
            return nil
        elseif p29.ability == u11.ENTER_KNIGHT_SHIELD_DEFENSIVE_STANCE then
            u22:raiseShield(p29.userCharacter)
        elseif p29.ability == u11.EXIT_KNIGHT_SHIELD_DEFENSIVE_STANCE then
            u22:lowerShield(p29.userCharacter)
        end
    end)
    u9.ItemDurabilityBroken:connect(function(p30) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u16
        --]]
        u3:playSound(u16.KNIGHT_SHIELD_BROKEN, {
            ["volumeMultiplier"] = 0.6,
            ["position"] = p30.lastPosition
        })
    end)
    u9.ItemDurabilityChanged:connect(function(p31) --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u22
            [3] = u3
            [4] = u16
        --]]
        if p31.itemHolder == u8.LocalPlayer then
            local v32 = p31.itemInstance:FindFirstChild("Handle")
            if v32 ~= nil then
                v32 = v32.Position
            end
            if v32 then
                if u22.shieldLastThresholdMap[p31.itemInstance] == nil then
                    u22.shieldLastThresholdMap[p31.itemInstance] = 0
                end
                local v33 = p31.newDurability < 70
                if v33 then
                    v33 = u22.shieldLastThresholdMap[p31.itemInstance] == 0
                end
                if v33 then
                    u22.shieldLastThresholdMap[p31.itemInstance] = 1
                    u3:playSound(u16.KNIGHT_SHIELD_DAMAGED_1, {
                        ["volumeMultiplier"] = 0.6,
                        ["position"] = v32
                    })
                    u22:changeShieldLevel(p31.itemInstance, 1)
                else
                    local v34 = p31.newDurability < 30
                    if v34 then
                        v34 = u22.shieldLastThresholdMap[p31.itemInstance] == 1
                    end
                    if v34 then
                        u22.shieldLastThresholdMap[p31.itemInstance] = 2
                        u3:playSound(u16.KNIGHT_SHIELD_DAMAGED_2, {
                            ["volumeMultiplier"] = 0.6,
                            ["position"] = v32
                        })
                        u22:changeShieldLevel(p31.itemInstance, 2)
                    end
                end
            else
                return nil
            end
        else
            return nil
        end
    end)
end
function u17.raiseShield(u35, u36) --[[ Line: 163 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u6
        [4] = u14
        [5] = u13
        [6] = u5
    --]]
    if u35.shieldRaisedMaidMap[u36] == nil then
        local v37 = u7.new()
        u35.shieldRaisedMaidMap[u36] = v37
    end
    u35.charactersInShield[u36] = true
    if u8.LocalPlayer.Character == u36 then
        local v38 = u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["moveSpeedMultiplier"] = 0.6
        })
        local v39 = u35.shieldRaisedMaidMap[u36]
        if v39 ~= nil then
            v39:GiveTask(v38)
        end
    end
    local v40 = u35.shieldRaisedMaidMap[u36]
    if v40 ~= nil then
        v40:GiveTask(function() --[[ Line: 190 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u35
            --]]
            if u36 then
                u35.shieldRaisedMaidMap[u36] = nil
                u35.charactersInShield[u36] = nil
            end
        end)
    end
    local v41
    if u36 == nil then
        v41 = u36
    else
        v41 = u36:FindFirstChild("Humanoid")
    end
    local v42
    if v41 == nil then
        v42 = v41
    else
        v42 = v41:FindFirstChild("Animator")
    end
    if v41 and v42 then
        local u43 = v42:LoadAnimation(u14:getAnimation(u13.KNIGHT_SHIELD_RAISE_SHIELD))
        u43.Looped = true
        u43:Play()
        local v44 = u35.shieldRaisedMaidMap[u36]
        if v44 ~= nil then
            v44:GiveTask(function() --[[ Line: 219 ]]
                --[[
                Upvalues:
                    [1] = u43
                --]]
                local v45 = u43
                if v45 ~= nil then
                    v45:Stop()
                end
                local v46 = u43
                if v46 ~= nil then
                    v46:Destroy()
                end
            end)
        end
        if u36 == u8.LocalPlayer.Character then
            local u47 = u5.Controllers.ViewmodelController:playAnimation(u13.KNIGHT_SHIELD_FP_DEFEND, {
                ["looped"] = true
            })
            local v48 = u35.shieldRaisedMaidMap[u36]
            if v48 ~= nil then
                v48:GiveTask(function() --[[ Line: 238 ]]
                    --[[
                    Upvalues:
                        [1] = u47
                    --]]
                    local v49 = u47
                    if v49 ~= nil then
                        v49:Stop()
                    end
                end)
            end
        end
    end
end
function u17.lowerShield(p50, p51) --[[ Line: 248 ]]
    local v52 = p50.shieldRaisedMaidMap[p51]
    if v52 ~= nil then
        v52:DoCleaning()
    end
end
function u17.changeShieldLevel(_, p53, p54) --[[ Line: 256 ]]
    local v55 = p53:FindFirstChild("Handle")
    if not v55 then
        return nil
    end
    local v56 = v55:FindFirstChild("Level0Body")
    local v57 = v55:FindFirstChild("Level1Body")
    local v58 = v55:FindFirstChild("Level2Body")
    if not (v56 and (v57 and v58)) then
        return nil
    end
    v56.Transparency = 1
    v57.Transparency = 1
    v58.Transparency = 1
    if p54 == 1 then
        if v57 then
            v57.Transparency = 0
            local v59 = v57:FindFirstChild("Border")
            if v59 then
                v59.Transparency = 0
                return
            end
        end
    elseif p54 == 2 then
        if v58 then
            v58.Transparency = 0
            local v60 = v58:FindFirstChild("Border")
            if v60 then
                v60.Transparency = 0
                return
            end
        end
    elseif v56 then
        v56.Transparency = 0
        local v61 = v56:FindFirstChild("Border")
        if v61 then
            v61.Transparency = 0
            return
        end
    end
end
u5.CreateController(u17.new())
return nil