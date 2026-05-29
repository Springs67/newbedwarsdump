local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.GameQueryUtil
local u7 = v3.SoundManager
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v16 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.CollectionService
local u18 = v16.Players
local u19 = v16.ReplicatedStorage
local u20 = v16.RunService
local u21 = v16.Workspace
local v22 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u23 = v22.InteractionCategory
local u24 = v22.InteractionPriority
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u33 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u34 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u35 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u36 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u37 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u38 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u39 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u40 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u41 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u42 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u43 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u44 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 49 ]]
        return "SpiritAssassinController"
    end,
    ["__index"] = u43
})
u44.__index = u44
function u44.new(...) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u44
    --]]
    local v45 = u44
    local v46 = setmetatable({}, v45)
    return v46:constructor(...) or v46
end
function u44.constructor(p47) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u43
        [2] = u33
        [3] = u26
        [4] = u13
    --]]
    u43.constructor(p47, u33.SPIRIT_ASSASSIN, {
        ["animations"] = { u26.DAGGER_CHARGE }
    })
    p47.Name = "SpiritAssassinController"
    p47.speedMaid = u13.new()
    p47.spiritMap = {}
end
function u44.onKitLocalActivated(u48, p49) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u2
        [3] = u25
        [4] = u9
        [5] = u30
        [6] = u5
        [7] = u24
        [8] = u23
        [9] = u29
    --]]
    u18.LocalPlayer:SetAttribute("UseKitAbility", true)
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u25.SPIRIT_ASSASSIN_TELEPORT, nil)
    local v50 = u9.Controllers.MatchController:getQueueType() == u30.SURVIVAL and "Penguins have soul?" or "Player\'s Soul"
    p49:GiveTask(u9.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionObjectText"] = "Teleport",
        ["interactionTag"] = "EvelynnSoul",
        ["instantActivation"] = true,
        ["maxActivationDistance"] = 120,
        ["interactionLabel"] = v50,
        ["clickablePrompt"] = u5.isMobileControls(),
        ["priority"] = u24.ABILITY,
        ["category"] = u23.ABILITY,
        ["onInteracted"] = function(p51, p52, p53) --[[ Name: onInteracted, Line 84 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u29
                [3] = u48
            --]]
            if p51 == u18.LocalPlayer then
                local v54 = u29:getEntity(p51)
                if v54 ~= nil then
                    v54 = v54:isAlive()
                end
                if not v54 then
                    return nil
                end
                local v55
                if p52 == nil then
                    v55 = p52
                else
                    v55 = p52:IsA("Model")
                end
                if v55 and u48:useSpirit(p51, p52) then
                    p53:Destroy()
                end
            end
        end
    }))
end
function u44.onKitLocalDeactivated(_) --[[ Line: 108 ]] end
function u44.onKitReplicationActivated(u56, _) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u31
        [3] = u9
        [4] = u32
        [5] = u18
        [6] = u26
    --]]
    u37.Client:OnEvent("SpawnSpiritOrb", function(p57) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u9
            [3] = u32
            [4] = u18
            [5] = u56
        --]]
        local v58 = u31.DEFAULT
        local v59 = p57.assassin.Character
        if v59 then
            v58 = u9.Controllers.KitController:getKitSkin(v59)
        end
        local v60 = u32[v58]
        if p57.assassin == u18.LocalPlayer and p57.soulOfPlayer then
            u56:cooldownIndicator(p57.soulOfPlayer, v60)
        end
        u56:spawnSpirit(p57.position, p57.secret, p57.assassin, v60)
    end)
    u37.Client:Get("SpiritAssassinSpeedUpdate"):Connect(function(p61) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u18
        --]]
        if p61.multiplier == 1 then
            u56.speedMaid:DoCleaning()
            local v62 = u18.LocalPlayer.Character
            if v62 ~= nil then
                v62:SetAttribute("SpiritSpeedBuffApplied", false)
            end
        end
    end)
    u37.Client:Get("SpiritAssassinUseSpirit"):Connect(function(p63) --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u26
            [3] = u18
            [4] = u9
        --]]
        local v64 = p63.player.UserId
        local v65 = math.abs(v64)
        u56:playChargeAnimation(u26.DAGGER_CHARGE, p63.player)
        if p63.player == u18.LocalPlayer then
            u9.Controllers.ViewmodelController:playAnimation(u26.FP_DAGGER_CHARGE)
        end
        local v66 = u56.spiritMap[v65]
        u56.spiritMap[v65] = nil
        if v66 ~= nil then
            v66:Destroy()
        end
    end)
    u37.Client:Get("SpiritAssassinLanded"):Connect(function(p67) --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u18
            [3] = u9
            [4] = u26
        --]]
        local v68 = p67.player.Character
        if v68 ~= nil then
            v68 = v68:GetPrimaryPartCFrame().Position
        end
        if v68 then
            u56:createTrail(p67.originalPosition, v68)
        end
        u56:playSlashAnimation(p67.player)
        if p67.player == u18.LocalPlayer then
            u9.Controllers.ViewmodelController:playAnimation(u26.FP_DAGGER_SLASH)
        end
    end)
end
function u44.onKitReplicationDeactivated(_) --[[ Line: 160 ]] end
function u44.onInnateAbilityEnabled(_, _, _) --[[ Line: 162 ]] end
function u44.onAbilityUsed(_, _, _) --[[ Line: 164 ]] end
function u44.playChargeAnimation(_, p69, u70) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u31
        [3] = u9
        [4] = u32
        [5] = u7
        [6] = u38
        [7] = u4
        [8] = u27
        [9] = u34
        [10] = u36
        [11] = u35
        [12] = u18
        [13] = u10
        [14] = u42
    --]]
    local u71 = u29:getEntity(u70)
    local v72
    if u71 == nil then
        v72 = u71
    else
        v72 = u71:getInstance()
    end
    local v73 = u31.DEFAULT
    if v72 then
        v73 = u9.Controllers.KitController:getKitSkin(v72)
    end
    local v74 = u32[v73].spiritAssassin
    local v75 = u7
    local v76
    if v74 == nil then
        v76 = v74
    else
        v76 = v74.daggerChargeSound
    end
    if v76 == nil then
        v76 = u38.SPIRIT_DAGGER_CHARGE
    end
    local v77 = {}
    local v78 = u70.Character
    if v78 ~= nil then
        v78 = v78:GetPrimaryPartCFrame().Position
    end
    v77.position = v78
    v77.rollOffMaxDistance = 45
    v77.volumeMultiplier = 0.5
    v75:playSound(v76, v77)
    local v79 = u4:playAnimation(u70, u27:getAssetId(p69))
    if v79 ~= nil then
        v79:AdjustSpeed(0.8)
    end
    local v80
    if u71 == nil then
        v80 = u71
    else
        v80 = u71:getInstance():GetAttribute("Dagger")
    end
    if v80 ~= 0 and (v80 == v80 and (v80 ~= "" and v80)) then
        return nil
    end
    if u71 ~= nil then
        u71:getInstance():SetAttribute("Dagger", true)
    end
    local u81 = u34.getInventory(u70).hand
    if u81 ~= nil then
        u81 = u81.itemType
    end
    local v82 = u36
    local v83 = u35.SPIRIT_DAGGER
    local v84
    if v74 == nil then
        v84 = v74
    else
        v84 = v74.dagger
    end
    local u85 = v82.createItemInstance(v83, 1, v84)
    local v86 = u36
    local v87 = u35.SPIRIT_DAGGER_LEFT
    local v88
    if v74 == nil then
        v88 = v74
    else
        v88 = v74.daggerLeft
    end
    local u89 = v86.createItemInstance(v87, 1, v88)
    local v90 = u36
    local v91 = u35.SPIRIT_DAGGER
    if v74 ~= nil then
        v74 = v74.dagger
    end
    local v92 = v90.createItemInstance(v91, 1, v74)
    if u71 ~= nil then
        local v93 = u71:getHandItemInstanceFromCharacter()
        if v93 ~= nil then
            v93:Destroy()
        end
    end
    if u70 == u18.LocalPlayer then
        u10.Controllers.ViewmodelController:setHeldItem(v92)
    end
    if u71 ~= nil then
        local v94 = u71:getHumanoid()
        if v94 ~= nil then
            v94:AddAccessory(u89)
        end
    end
    if u71 ~= nil then
        local v95 = u71:getHumanoid()
        if v95 ~= nil then
            v95:AddAccessory(u85)
        end
    end
    u85.Destroying:Connect(function() --[[ Line: 264 ]]
        --[[
        Upvalues:
            [1] = u89
        --]]
        u89:Destroy()
    end)
    u89.Destroying:Connect(function() --[[ Line: 267 ]]
        --[[
        Upvalues:
            [1] = u85
        --]]
        u85:Destroy()
    end)
    u42:weldCharacterAccessories(u70.Character)
    task.delay(1.5, function() --[[ Line: 272 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u81
            [3] = u85
            [4] = u89
            [5] = u36
            [6] = u70
            [7] = u18
            [8] = u10
            [9] = u42
        --]]
        local v96 = u71
        if v96 ~= nil then
            v96 = v96:getHandItemInstanceFromCharacter()
            if v96 ~= nil then
                v96 = v96.Name
            end
        end
        local v97 = v96 == nil
        if v97 then
            v97 = u81
        end
        if v97 then
            local v98 = u71
            if v98 ~= nil then
                v98:getInstance():SetAttribute("Dagger", false)
            end
            u85:Destroy()
            u89:Destroy()
            local v99 = u36.createItemInstance(u81)
            local v100 = u36.createItemInstance(u81)
            if u70 == u18.LocalPlayer then
                u10.Controllers.ViewmodelController:setHeldItem(v100)
            end
            local v101 = u71
            if v101 ~= nil then
                local v102 = v101:getHumanoid()
                if v102 ~= nil then
                    v102:AddAccessory(v99)
                end
            end
            u42:weldCharacterAccessories(u70.Character)
        end
    end)
end
function u44.playSlashAnimation(_, p103) --[[ Line: 307 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u27
        [3] = u26
        [4] = u29
        [5] = u31
        [6] = u9
        [7] = u32
        [8] = u7
        [9] = u38
        [10] = u19
        [11] = u15
        [12] = u21
        [13] = u6
        [14] = u41
        [15] = u11
    --]]
    local v104 = u4:playAnimation(p103, u27:getAssetId(u26.DAGGER_SLASH))
    if v104 ~= nil then
        v104:AdjustSpeed(0.8)
    end
    local v105 = u29:getEntity(p103)
    if not v105 then
        return nil
    end
    local v106
    if v105 == nil then
        v106 = v105
    else
        v106 = v105:getInstance()
    end
    local v107 = u31.DEFAULT
    if v106 then
        v107 = u9.Controllers.KitController:getKitSkin(v106)
    end
    local v108 = u32[v107].spiritAssassin
    local v109 = u7
    local v110
    if v108 == nil then
        v110 = v108
    else
        v110 = v108.daggerSlashSound
    end
    if v110 == nil then
        v110 = u38.SPIRIT_DAGGER_SLASH
    end
    local v111 = {}
    local v112 = p103.Character
    if v112 ~= nil then
        v112 = v112:GetPrimaryPartCFrame().Position
    end
    v111.position = v112
    v111.rollOffMaxDistance = 45
    v111.volumeMultiplier = 0.5
    v109:playSound(v110, v111)
    local v113 = u19.Assets.Effects
    if v108 ~= nil then
        v108 = v108.spinEffect
    end
    local u114 = v113[v108 == nil and "DaggerSpin" or v108]:Clone()
    if not u114:IsA("Model") then
        return nil
    end
    u114:PivotTo(v105:getInstance():GetPrimaryPartCFrame())
    u15(u114, 0.04)
    u114.Parent = u21
    for _, v115 in u114:GetChildren() do
        if v115:IsA("BasePart") then
            u6:setQueryIgnored(v115, true)
        end
    end
    u41.tweenModelSize(u114, 0, u11, 10)
    task.delay(0.3, function() --[[ Line: 368 ]]
        --[[
        Upvalues:
            [1] = u114
        --]]
        u114:Destroy()
    end)
end
function u44.spawnSpirit(p116, p117, p118, p119, p120) --[[ Line: 372 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u19
        [3] = u21
        [4] = u1
        [5] = u17
    --]]
    if p119 ~= u18.LocalPlayer then
        return nil
    end
    local v121 = u19:WaitForChild("Assets"):WaitForChild("Misc")
    local v122 = p120.spiritAssassin
    if v122 ~= nil then
        v122 = v122.orbModelName
    end
    local u123 = v121:WaitForChild(v122 == nil and "SpiritOrb" or v122):Clone()
    u123:PivotTo(CFrame.new(p117))
    u123.Parent = u21
    if p118 == "" then
        local v124 = p119.UserId
        local v125 = math.abs(v124)
        p116.spiritMap[v125] = u123
        u1.Promise.delay(10):andThen(function() --[[ Line: 392 ]]
            --[[
            Upvalues:
                [1] = u123
            --]]
            if u123.Parent then
                u123:Destroy()
            end
        end)
        return nil
    end
    u123:SetAttribute("SpiritSecret", p118)
    u17:AddTag(u123, "EvelynnSoul")
    u1.Promise.delay(10):andThen(function() --[[ Line: 403 ]]
        --[[
        Upvalues:
            [1] = u123
        --]]
        if u123.Parent then
            u123:Destroy()
        end
    end)
end
function u44.useSpirit(u126, u127, u128) --[[ Line: 410 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u40
        [3] = u39
        [4] = u37
        [5] = u18
        [6] = u9
        [7] = u28
    --]]
    local v129 = u29:getEntity(u127)
    if v129 ~= nil then
        v129 = v129:getInstance()
    end
    if v129 and u40:isActive(v129, u39.GROUNDED) then
        return false
    end
    if v129 and u40:isActive(v129, u39.FROSTED) then
        return false
    end
    local v130 = {
        ["secret"] = u128:GetAttribute("SpiritSecret")
    }
    local v131 = u37.Client:Get("UseSpirit"):CallServer(v130)
    if v131 then
        local u132 = nil
        task.delay(0.7, function() --[[ Line: 428 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u126
                [3] = u9
                [4] = u28
                [5] = u128
                [6] = u132
                [7] = u127
            --]]
            local v133 = u18.LocalPlayer.Character
            if v133 ~= nil then
                v133 = v133:GetAttribute("SpiritSpeedBuffApplied")
            end
            if v133 == 0 or (v133 ~= v133 or (v133 == "" or not v133)) then
                u126.speedMaid:DoCleaning()
                u126.speedMaid:GiveTask(u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = u28.SpiritAssassinKit.SPIRIT_ASSASSIN_SPEED_MODIFIER
                }))
                local v134 = u18.LocalPlayer.Character
                if v134 ~= nil then
                    v134:SetAttribute("SpiritSpeedBuffApplied", true)
                end
            end
            u128:Destroy()
            u132 = u127:GetAttribute("SpiritAssassinSpeedStart")
        end)
        task.delay(u28.SpiritAssassinKit.SPIRIT_ASSASSIN_SPEED_DURATION + 0.7, function() --[[ Line: 447 ]]
            --[[
            Upvalues:
                [1] = u127
                [2] = u132
                [3] = u126
                [4] = u18
            --]]
            if u127:GetAttribute("SpiritAssassinSpeedStart") == u132 then
                u126.speedMaid:DoCleaning()
                local v135 = u18.LocalPlayer.Character
                if v135 ~= nil then
                    v135:SetAttribute("SpiritSpeedBuffApplied", false)
                end
            end
        end)
    end
    return v131
end
function u44.cooldownIndicator(_, u136, p137) --[[ Line: 459 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u21
        [3] = u6
        [4] = u20
    --]]
    u136:SetAttribute("SpiritCooldown", true)
    local v138 = u19.Assets.Effects
    local v139 = p137.spiritAssassin
    if v139 ~= nil then
        v139 = v139.spiritDaggerIndicator
    end
    local u140 = v138[v139 == nil and "SpiritDagger" or v139]:Clone()
    u140.Parent = u21
    u6:setQueryIgnored(u140, true)
    task.delay(30, function() --[[ Line: 473 ]]
        --[[
        Upvalues:
            [1] = u140
            [2] = u136
        --]]
        u140:Destroy()
        u136:SetAttribute("SpiritCooldown", false)
    end)
    local u141 = 0
    local u142 = nil
    u142 = u20.Heartbeat:Connect(function(p143) --[[ Line: 479 ]]
        --[[
        Upvalues:
            [1] = u141
            [2] = u140
            [3] = u136
            [4] = u142
        --]]
        u141 = u141 + p143
        local v144 = u140.PrimaryPart
        if v144 then
            v144 = u136
            if v144 ~= nil then
                v144 = v144.Character
            end
        end
        if v144 then
            debug.profilebegin("spin-spirit-indicator")
            local v145 = u136.Character.PrimaryPart
            if v145 ~= nil then
                v145 = v145.CFrame.Position
            end
            if not v145 then
                return nil
            end
            local v146 = v145 + Vector3.new(0, 7, 0)
            u140:PivotTo(CFrame.new(v146) * CFrame.Angles(3.141592653589793, u141 * 3.141592653589793 / 2, 0))
            debug.profileend()
        else
            u140:Destroy()
            u142:Disconnect()
        end
    end)
    u136:GetAttributeChangedSignal("SpiritCooldown"):Connect(function() --[[ Line: 512 ]]
        --[[
        Upvalues:
            [1] = u136
            [2] = u140
        --]]
        local v147 = u136:GetAttribute("SpiritCooldown")
        if v147 == 0 or (v147 ~= v147 or (v147 == "" or not v147)) then
            u140:Destroy()
        end
    end)
end
function u44.createTrail(_, p148, p149) --[[ Line: 519 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u21
        [3] = u12
        [4] = u13
    --]]
    local u150 = u14("Attachment", {
        ["Parent"] = u14("Part", {
            ["Transparency"] = 1,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = false,
            ["Anchored"] = true,
            ["Position"] = p148,
            ["Parent"] = u21
        })
    })
    local u151 = u14("Attachment", {
        ["Parent"] = u14("Part", {
            ["Transparency"] = 1,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = false,
            ["Anchored"] = true,
            ["Position"] = p149,
            ["Parent"] = u21
        })
    })
    local u152 = u12.link(u151, u150, Color3.fromRGB(180, 128, 255))
    local u153 = u13.new()
    u153:GiveTask(u152)
    task.delay(0.3, function() --[[ Line: 547 ]]
        --[[
        Upvalues:
            [1] = u152
            [2] = u150
            [3] = u151
            [4] = u153
        --]]
        u152:Destroy()
        u150:Destroy()
        u151:Destroy()
        u153:DoCleaning()
    end)
end
u9.CreateController(u44.new())
return nil