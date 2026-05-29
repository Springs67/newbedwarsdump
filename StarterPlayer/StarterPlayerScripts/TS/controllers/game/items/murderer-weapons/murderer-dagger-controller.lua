local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.DeviceUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v7.Signal
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v16 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u17 = v16.InteractionCategory
local u18 = v16.InteractionPriority
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u30 = v1.import(script, script.Parent.Parent.Parent, "game-knit-controller").GameKnitController
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "MurdererDaggerController"
    end,
    ["__index"] = u30
})
u31.__index = u31
function u31.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u23
        [3] = u11
    --]]
    u30.constructor(p34, { u23.MURDERER_GAME })
    p34.maid = u11.new()
    p34.Name = "MurdererDaggerController"
    p34.registered = false
    p34.promptCount = 0
end
function u31.KnitStart(p35) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    u30.KnitStart(p35)
end
function u31.onGameInit(u36) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u20
        [3] = u23
        [4] = u28
        [5] = u14
        [6] = u2
        [7] = u21
        [8] = u15
        [9] = u6
        [10] = u27
        [11] = u19
        [12] = u24
        [13] = u4
        [14] = u9
        [15] = u22
        [16] = u26
        [17] = u25
        [18] = u29
    --]]
    u8.Controllers.PreloadController:runPreload({
        ["animations"] = { u20.TWIRLBLADE_ATTACK_1 },
        ["loadOnGameTypes"] = { u23.MURDERER_GAME }
    })
    u28.Client:Get("MurdererKillsTarget"):Connect(function(p37) --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u2
            [3] = u21
            [4] = u36
        --]]
        if p37.killer == u14.LocalPlayer then
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u21.MURDERER_KILL, p37.cooldown)
            u36:disableDaggerPrompt()
        end
    end)
    u15.CooldownExpired:connect(function(p38) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u36
        --]]
        if p38.cooldownId == u21.MURDERER_KILL then
            u36:enableDaggerPrompt()
        end
    end)
    local v39 = u36.maid
    local v40 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
    local v41 = u21.MURDERER_KILL
    local v42 = {
        ["title"] = {
            ["text"] = "KILL COOLDOWN",
            ["color"] = u6.WHITE
        }
    }
    v39:GiveTask(v40:createCooldownBar(v41, v42))
    u15.MatchStateChange:connect(function(p43) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u27
            [3] = u36
            [4] = u2
            [5] = u19
            [6] = u24
            [7] = u4
        --]]
        local v44 = u14.LocalPlayer:GetAttribute("IsMurderer")
        if v44 == 0 or (v44 ~= v44 or (v44 == "" or not v44)) then
            return nil
        end
        if p43.matchState == u27.RUNNING then
            task.wait(1)
            u36:initDaggerPrompt()
            local v45 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v46 = u19.MURDERER_DAGGER_KILL
            local v47 = {
                ["abilityType"] = "ItemPrimary",
                ["abilityButton"] = {
                    ["icon"] = u24.KILL_ABILITY_ICON
                }
            }
            v45:enableAbility(v46, v47):expect()
            u36.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u19.MURDERER_DAGGER_KILL)
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u36.enabledAbility, u4.DISABLED)
        end
    end)
    u28.Client:Get("EntityDeathEvent"):Connect(function(p48) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u9
        --]]
        local v49 = u14:GetPlayerFromCharacter(p48.entityInstance)
        local v50
        if v49 == nil then
            v50 = v49
        else
            v50 = v49.Character
        end
        if v50 then
            u9.Controllers.InteractionRegistryController:removePrompt(v49.Character, "Civilian")
        end
    end)
    u28.Client:Get("TweenTeleport"):Connect(function(p51) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u22
            [3] = u26
            [4] = u25
            [5] = u29
        --]]
        if p51.animation == u20.TWIRLBLADE_ATTACK_1 then
            local v52 = p51.player.Character
            if not v52 then
                return nil
            end
            local v53 = u22:getEntity(p51.player)
            local v54
            if v53 == nil then
                v54 = v53
            else
                v54 = v53:getHandItemInstanceFromCharacter()
                if v54 ~= nil then
                    v54 = v54:WaitForChild("Handle", 3)
                end
            end
            if v54 then
                v54.Transparency = 1
            end
            local v55 = u26.createItemInstance(u25.SPIRIT_DAGGER, 1)
            if v53 ~= nil then
                local v56 = v53:getHumanoid()
                if v56 ~= nil then
                    v56:AddAccessory(v55)
                end
            end
            u29:weldCharacterAccessories(v52)
            task.wait(0.5)
            v55:Destroy()
            if v54 then
                v54.Transparency = 0
            end
        end
    end)
    u8.Controllers.InteractionRegistryController.onPromptCreated:Connect(function(p57, p58) --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u21
            [3] = u36
            [4] = u4
        --]]
        if p58 ~= "Civilian" then
            return nil
        end
        local u59 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(u21.MURDERER_KILL)
        p57.PromptShown:Connect(function() --[[ Line: 146 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u59
                [3] = u2
                [4] = u4
            --]]
            local v60 = u36
            v60.promptCount = v60.promptCount + 1
            if u36.promptCount > 0 then
                if u59 > 0.1 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u36.enabledAbility, u4.ON_COOLDOWN)
                    return
                end
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u36.enabledAbility, u4.READY)
            end
        end)
        p57.PromptHidden:Connect(function() --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u2
                [3] = u4
                [4] = u59
            --]]
            local v61 = u36
            v61.promptCount = v61.promptCount - 1
            if u36.promptCount == 0 then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u36.enabledAbility, u4.DISABLED)
                if u59 > 0.1 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u36.enabledAbility, u4.ON_COOLDOWN)
                end
            end
        end)
    end)
end
function u31.initDaggerPrompt(_) --[[ Line: 167 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u5
        [4] = u18
        [5] = u17
        [6] = u14
        [7] = u22
        [8] = u28
    --]]
    local v62 = u10.new()
    u8.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Kill!",
        ["interactionObjectText"] = "Execute",
        ["interactionTag"] = "Civilian",
        ["instantActivation"] = true,
        ["maxActivationDistance"] = 20,
        ["removePromptOnInteract"] = true,
        ["clickablePrompt"] = u5.isMobileControls(),
        ["priority"] = u18.ABILITY,
        ["category"] = u17.ABILITY,
        ["KeyCode"] = Enum.KeyCode.R,
        ["onInteracted"] = function(_, p63, _) --[[ Name: onInteracted, Line 180 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u22
                [3] = u28
            --]]
            if not p63:IsA("Model") then
                return nil
            end
            local v64 = u14:GetPlayerFromCharacter(p63)
            if not v64 then
                return nil
            end
            local v65 = u22:getEntity(v64)
            if v65 ~= nil then
                v65 = v65:isDead()
            end
            if v65 then
                return nil
            end
            u28.Client:Get("MurderDaggerKill"):CallServer({
                ["target"] = v64
            })
        end,
        ["onVisibilityStateChanged"] = v62
    })
end
function u31.enableDaggerPrompt(_) --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
    --]]
    for _, v66 in u14:GetPlayers() do
        local v67 = v66:GetAttribute("IsMurderer")
        if v67 == 0 or (v67 ~= v67 or (v67 == "" or not v67)) then
            u13:AddTag(v66.Character, "Civilian")
        end
    end
end
function u31.disableDaggerPrompt(_) --[[ Line: 211 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
    --]]
    for _, v68 in u14:GetPlayers() do
        u9.Controllers.InteractionRegistryController:removePrompt(v68.Character, "Civilian")
    end
end
u8.CreateController(u31.new())
return nil