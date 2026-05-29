local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.AnimationUtil
local u6 = v4.GameQueryUtil
local u7 = v4.SoundManager
local u8 = v4.WatchCollectionTag
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.TweenService
local u18 = v13.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "block-kicker", "block-kicker-kit-attributes").BlockKickerKitAttributes
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "block-kicker", "block-kicker-kit-balance").BlockKickerKitBalance
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u36 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u37 = {
    u21.KICK_1,
    u21.KICK_2,
    u21.KICK_3,
    u21.KICK_4,
    u21.KICK_5
}
local u38 = {
    u31.BLOCK_KICKER_KIT_BLOCK_IMPACT_1,
    u31.BLOCK_KICKER_KIT_BLOCK_IMPACT_2,
    u31.BLOCK_KICKER_KIT_BLOCK_IMPACT_3,
    u31.BLOCK_KICKER_KIT_BLOCK_IMPACT_4
}
local u39 = {
    u31.BLOCK_KICKER_KIT_BLOCK_KICK_1,
    u31.BLOCK_KICKER_KIT_BLOCK_KICK_2,
    u31.BLOCK_KICKER_KIT_BLOCK_KICK_3,
    u31.BLOCK_KICKER_KIT_BLOCK_KICK_4,
    u31.BLOCK_KICKER_KIT_BLOCK_KICK_5
}
local u40 = {
    u31.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_1,
    u31.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_2,
    u31.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_3,
    u31.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_4,
    u31.BLOCK_KICKER_KIT_MITIGATE_DAMAGE_5
}
local u41 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 46 ]]
        return "BlockKickerKitController"
    end,
    ["__index"] = u36
})
u41.__index = u41
function u41.new(...) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u41
    --]]
    local v42 = u41
    local v43 = setmetatable({}, v42)
    return v43:constructor(...) or v43
end
function u41.constructor(p44) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u37
        [3] = u21
        [4] = u38
        [5] = u39
        [6] = u40
        [7] = u31
        [8] = u36
        [9] = u18
        [10] = u12
    --]]
    local v45 = u27.BLOCK_KICKER
    local v46 = {}
    local v47 = {}
    local v48 = #v47
    local v49 = #u37
    table.move(u37, 1, v49, v48 + 1, v47)
    v47[v48 + v49 + 1] = u21.KICKER_STOMP
    v46.animations = v47
    local v50 = {}
    local v51 = #v50
    local v52 = #u38
    table.move(u38, 1, v52, v51 + 1, v50)
    local v53 = v51 + v52
    local v54 = #u39
    table.move(u39, 1, v54, v53 + 1, v50)
    local v55 = v53 + v54
    local v56 = #u40
    table.move(u40, 1, v56, v55 + 1, v50)
    local v57 = v55 + v56
    v50[v57 + 1] = u31.BLOCK_KICKER_KIT_STOMP
    v50[v57 + 2] = u31.BLOCK_KICKER_KIT_BLOCKS_ORBITING
    v46.sounds = v50
    u36.constructor(p44, v45, v46)
    p44.Name = "BlockKickerKitController"
    p44.blocks = {}
    p44.blockProjectiles = {}
    p44.camera = u18.CurrentCamera
    p44.blockModelFolder = u12("Folder", {
        ["Name"] = "BlockKickerBlocks",
        ["Parent"] = u18
    })
    p44.projectileModelSet = {}
end
function u41.KnitStart(p58) --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    u36.KnitStart(p58)
end
function u41.onKitLocalActivated(_, _) --[[ Line: 96 ]] end
function u41.onKitLocalDeactivated(p59) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    p59:removeAllBlocksFromPlayer(u14.LocalPlayer)
end
function u41.onKitReplicationActivated(u60, p61) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u14
        [3] = u24
        [4] = u20
        [5] = u35
        [6] = u28
        [7] = u30
        [8] = u8
        [9] = u15
        [10] = u16
        [11] = u18
    --]]
    p61:GiveTask(u19.CanUseLocalAbility:connect(function(p62) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u24
            [3] = u20
            [4] = u35
            [5] = u28
            [6] = u60
        --]]
        if p62.userCharacter ~= u14.LocalPlayer.Character then
            return nil
        end
        local v63 = u24:getEntity(u14.LocalPlayer)
        if not v63 then
            return nil
        end
        if p62.ability == u20.BLOCK_KICK then
            local v64
            if v63 == nil then
                v64 = v63
            else
                v64 = v63:isAlive()
            end
            if not v64 then
                p62:setCancelled(true)
                return nil
            end
            local v65 = u35(v63:getInstance(), u28.BlockKickerKit_BlockCount)
            if (v65 == nil and 0 or v65) <= 0 then
                p62:setCancelled(true)
                return nil
            end
            if u60.blocks[u14.LocalPlayer] == nil then
                p62:setCancelled(true)
                return nil
            end
            if #u60.blocks[u14.LocalPlayer] <= 0 then
                p62:setCancelled(true)
                return nil
            end
            local v66 = u14.LocalPlayer.Character
            if v66 ~= nil then
                v66 = v66:FindFirstChildWhichIsA("Humanoid")
            end
            if not v66 then
                p62:setCancelled(true)
                return nil
            end
            local v67 = v66:GetState()
            if v67 ~= Enum.HumanoidStateType.Landed then
                if v67 ~= Enum.HumanoidStateType.Running then
                    p62:setCancelled(true)
                    return nil
                end
                return
            end
        elseif p62.ability == u20.BLOCK_STOMP then
            if v63 ~= nil then
                v63 = v63:isAlive()
            end
            if not v63 then
                p62:setCancelled(true)
                return nil
            end
            local v68 = u14.LocalPlayer.Character
            if v68 ~= nil then
                v68 = v68:FindFirstChildWhichIsA("Humanoid")
            end
            if not v68 then
                p62:setCancelled(true)
                return nil
            end
            local v69 = v68:GetState()
            if v69 ~= Enum.HumanoidStateType.Landed then
                if v69 ~= Enum.HumanoidStateType.Running then
                    p62:setCancelled(true)
                    return nil
                end
                return
            end
        end
    end))
    p61:GiveTask(u30.Client:Get("BlockStomp"):Connect(function(p70) --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u60
        --]]
        if u14.LocalPlayer ~= p70.player then
            u60:playStompEffect(p70.player)
        end
        u60:createBlocksForPlayer(p70.player, p70.blocks)
    end))
    p61:GiveTask(u30.Client:Get("EntityDeathEvent"):Connect(function(p71) --[[ Line: 193 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u60
        --]]
        local v72 = u14:GetPlayerFromCharacter(p71.entityInstance)
        if v72 and u60.blocks[v72] ~= nil then
            u60:removeAllBlocksFromPlayer(v72)
        end
    end))
    p61:GiveTask(u30.Client:Get("BlockKick"):Connect(function(p73) --[[ Line: 202 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u60
        --]]
        if p73.player ~= u14.LocalPlayer then
            u60:playKickAnimation(p73.player, p73.kickCombo, p73.originPosition, p73.direction)
            u60:launchLocalBlockProjectile(p73.player, p73.originPosition, p73.direction, p73.projectileRefId)
        end
    end))
    p61:GiveTask(u30.Client:Get("BlockKickHit"):Connect(function(p74) --[[ Line: 214 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        u60:blockHit(p74.user, p74.hitPosition, p74.projectileRefId, p74.directHit)
    end))
    p61:GiveTask(u30.Client:Get("ConsumeBlock"):Connect(function(p75) --[[ Line: 218 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        u60:removeBlockFromDamageMitigation(p75.player)
    end))
    p61:GiveTask(u8("VoidTerraBlock", function(u76) --[[ Line: 221 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u15
            [3] = u16
            [4] = u18
        --]]
        if u60.projectileModelSet[u76] ~= nil then
            return nil
        end
        u60.projectileModelSet[u76] = true
        local u77 = u15.Assets.Effects.Terra.VoidBlock:Clone()
        u77.Parent = u76
        local u78 = nil
        u78 = u16.Heartbeat:Connect(function(_) --[[ Line: 233 ]]
            --[[
            Upvalues:
                [1] = u76
                [2] = u18
                [3] = u60
                [4] = u78
                [5] = u77
            --]]
            if not u76:IsDescendantOf(u18) then
                u60.projectileModelSet[u76] = nil
                u78:Disconnect()
                return nil
            end
            u77:PivotTo(u76.CFrame)
        end)
    end))
end
function u41.onKitReplicationDeactivated(_) --[[ Line: 245 ]] end
function u41.onInnateAbilityEnabled(_, _, _) --[[ Line: 247 ]] end
function u41.onAbilityUsed(p79, p80, p81) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u24
        [3] = u20
        [4] = u11
        [5] = u18
        [6] = u10
        [7] = u35
        [8] = u28
        [9] = u23
        [10] = u30
    --]]
    if p80 == u14.LocalPlayer.Character then
        local v82 = u14:GetPlayerFromCharacter(p80)
        if v82 then
            if u24:getEntity(p80) then
                local v83 = u14.LocalPlayer.Character
                if v83 ~= nil then
                    v83 = v83.PrimaryPart
                end
                if v83 then
                    if p81.ability == u20.BLOCK_STOMP then
                        local u84 = u11.Controllers.SprintController:getMovementStatusModifier():addModifier({
                            ["moveSpeedMultiplier"] = 0,
                            ["blockSprint"] = true
                        })
                        task.delay(0.7, function() --[[ Line: 277 ]]
                            --[[
                            Upvalues:
                                [1] = u84
                            --]]
                            u84.Destroy()
                        end)
                        p79:playStompEffect(v82)
                    elseif p81.ability == u20.BLOCK_KICK then
                        local v85 = u18.CurrentCamera.CFrame.LookVector
                        if u10.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
                            local v86 = v85.X
                            local v87 = v85.Y + 0.35
                            local v88 = v85.Z
                            v85 = Vector3.new(v86, v87, v88)
                        end
                        local v89 = p79:getKickBlockProjectileOriginPosition(u14.LocalPlayer.Character.PrimaryPart.Position, v85)
                        local v90 = u35(v82, u28.BlockKickerKit_CurrentKickCombo)
                        p79:playKickAnimation(v82, v90 == nil and 0 or v90, v89, v85)
                        local u91 = u11.Controllers.SprintController:getMovementStatusModifier():addModifier({
                            ["moveSpeedMultiplier"] = 0.5,
                            ["blockSprint"] = true
                        })
                        task.delay(0.25, function() --[[ Line: 304 ]]
                            --[[
                            Upvalues:
                                [1] = u91
                            --]]
                            u91.Destroy()
                        end)
                        local v92 = u23.generateRefId()
                        local v93 = {
                            ["originPosition"] = v89,
                            ["direction"] = v85,
                            ["projectileRefId"] = v92,
                            ["blockType"] = p79:launchLocalBlockProjectile(v82, v89, v85, v92)
                        }
                        u30.Client:Get("TryBlockKick"):SendToServer(v93)
                    end
                else
                    return nil
                end
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u41.playStompEffect(_, p94) --[[ Line: 320 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u22
        [3] = u21
        [4] = u15
        [5] = u18
        [6] = u34
        [7] = u31
        [8] = u10
        [9] = u26
        [10] = u7
        [11] = u14
        [12] = u11
    --]]
    u5:playAnimation(p94, u22:getAssetId(u21.KICKER_STOMP))
    task.wait(0.2)
    local v95 = p94.Character
    if v95 ~= nil then
        v95 = v95.PrimaryPart
        if v95 ~= nil then
            v95 = v95.CFrame
        end
    end
    if not v95 then
        return nil
    end
    local u96 = u15.Assets.Effects.BlockStompShockwave:Clone()
    local v97 = v95.Position
    u96:PivotTo(CFrame.new(v97 + Vector3.new(0, -3, 0)))
    u96.Parent = u18
    u34:playEffects({ u96 }, nil)
    local v98 = u31.BLOCK_KICKER_KIT_STOMP
    local v99 = p94.Character
    if v99 then
        local v100 = u26[u10.Controllers.KitSkinController:getKitSkin(v99)].terra
        local v101
        if v100 == nil then
            v101 = v100
        else
            v101 = v100.stompSound
        end
        if v101 ~= "" and v101 then
            v98 = v100.stompSound
        end
    end
    u7:playSound(v98, {
        ["volumeMultiplier"] = 1,
        ["position"] = v95.Position
    })
    task.delay(0.2, function() --[[ Line: 364 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u96
        --]]
        u34:disableEffects({ u96 })
    end)
    task.delay(1, function() --[[ Line: 367 ]]
        --[[
        Upvalues:
            [1] = u96
        --]]
        u96:Destroy()
    end)
    local v102 = p94 == u14.LocalPlayer
    if v102 then
        v102 = u14.LocalPlayer.Character
        if v102 ~= nil then
            v102 = v102:GetPivot()
            if v102 ~= nil then
                v102 = v102.Position
            end
        end
    end
    if v102 then
        u11.Controllers.ScreenShakeController:shake(u14.LocalPlayer.Character:GetPivot().Position, Vector3.new(0, -1, 0), {
            ["magnitude"] = 0.4,
            ["cycles"] = 5,
            ["duration"] = 0.5
        })
    end
end
function u41.createBlocksForPlayer(p103, p104, p105) --[[ Line: 390 ]]
    p103:removeAllBlocksFromPlayer(p104)
    local v106 = 0
    local v107 = {}
    for _, v108 in p105 do
        local v109 = p103:createBlock(p104, v106, #p105, v108.blockType, v108.blockPosition)
        if v109 then
            table.insert(v107, v109)
            v106 = v106 + 1
        end
    end
    p103.blocks[p104] = v107
end
function u41.removeAllBlocksFromPlayer(p110, p111) --[[ Line: 408 ]]
    local v112 = p110.blocks[p111]
    if not v112 then
        return nil
    end
    for v113, v114 in v112 do
        local _ = v113 - 1
        v114:Destroy()
    end
    p110.blocks[p111] = nil
end
function u41.createBlock(u115, u116, p117, p118, p119, p120) --[[ Line: 425 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u10
        [3] = u26
        [4] = u15
        [5] = u3
        [6] = u12
        [7] = u18
        [8] = u24
        [9] = u33
        [10] = u32
        [11] = u17
        [12] = u16
        [13] = u14
    --]]
    local v121 = u116.Character
    if v121 ~= nil then
        v121 = v121:GetPivot()
    end
    local v122
    if v121 == nil then
        v122 = v121
    else
        v122 = v121.Position
    end
    if not v121 then
        return nil
    end
    local u123 = false
    local u124 = nil
    local v125 = u116.Character
    local u126 = u25.DEFAULT
    if v125 then
        u126 = u10.Controllers.KitSkinController:getKitSkin(v125)
        local v127 = u26[u126]
        if v127.terra then
            u124 = v127.terra.customBlock:Clone()
        end
    end
    if not u124 then
        u124 = u15:WaitForChild("Items"):WaitForChild(p119, 3)
        if u124 ~= nil then
            u124 = u124:WaitForChild("Handle"):Clone()
        end
    end
    local v128
    if p120 then
        v128 = u3:getWorldPosition(p120)
    else
        v128 = u115:getPositionAroundPlayer(v121, p117)
    end
    if u124 then
        u124.Position = v128
        u124.CanCollide = false
        u124.CanQuery = false
        u124.Size = Vector3.new(1.5, 1.5, 1.5)
        u124.Anchored = true
        for v129, v130 in u124:GetDescendants() do
            local _ = v129 - 1
            if v130:IsA("BasePart") then
                v130.Anchored = true
            end
        end
        u124.Name = p119
        u124.Parent = u115.blockModelFolder
        u124:SetAttribute("BlockOwner", u116.UserId)
        local v131 = u24:getEntity(u116)
        if v131 ~= nil then
            v131 = v131:getInstance()
        end
        if v131 and u33:isActive(v131, u32.INVISIBILITY) then
            u124.Transparency = 1
            for v132, v133 in u124:GetDescendants() do
                local _ = v132 - 1
                if v133:IsA("Texture") then
                    v133.Transparency = 1
                end
            end
        end
    else
        u124 = u12("Part", {
            ["Size"] = Vector3.new(1.5, 1.5, 1.5),
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = false,
            ["Anchored"] = true,
            ["Name"] = p119,
            ["Position"] = v128,
            ["Parent"] = u18
        })
    end
    if not (v122 and u124) then
        return u124
    end
    local u134 = 360 / p118 * 0.017453292519943295 * p117
    local v135 = math.sin(u134) * 5
    local v136 = math.cos(u134) * 5
    local v137 = v122 + Vector3.new(v135, 0, v136)
    local v138 = u12
    local v139 = {
        ["Name"] = "PartForce"
    }
    local v140 = u18.Gravity * u124.Mass
    v139.Force = Vector3.new(0, v140, 0)
    v139.Parent = u124
    v138("BodyForce", v139)
    local v141 = u17:Create(u124, TweenInfo.new(0.5), {
        ["Position"] = v137
    })
    v141:Play()
    local u142 = 0
    v141.Completed:Connect(function() --[[ Line: 530 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u124
            [3] = u115
            [4] = u116
            [5] = u142
            [6] = u134
            [7] = u10
            [8] = u26
            [9] = u14
            [10] = u123
            [11] = u126
        --]]
        local u143 = nil
        u143 = u16.Heartbeat:Connect(function(p144) --[[ Line: 532 ]]
            --[[
            Upvalues:
                [1] = u124
                [2] = u115
                [3] = u116
                [4] = u143
                [5] = u142
                [6] = u134
                [7] = u10
                [8] = u26
                [9] = u14
                [10] = u123
                [11] = u126
            --]]
            if not u124 or u124.Parent ~= u115.blockModelFolder then
                return nil
            end
            local v145 = u116.Character
            if v145 ~= nil then
                v145 = v145:GetPivot().Position
            end
            if not v145 then
                u143:Disconnect()
                return nil
            end
            u142 = u142 + p144
            local v146 = u142 * 2
            local v147 = math.sin(v146) * 1
            local v148 = u142 + u134
            local v149 = math.sin(v148) * 5
            local v150 = u142 + u134
            local v151 = math.cos(v150) * 5
            local v152 = Vector3.new(v149, v147, v151)
            local v153 = u142
            local v154 = u142
            local v155 = u142
            local v156 = CFrame.Angles(math.sin(v153) * 3.141592653589793 / 24, math.cos(v154) * 3.141592653589793 / 24, math.sin(v155) * 3.141592653589793 / 24)
            local v157 = u116.Character
            if v157 then
                local v158 = u26[u10.Controllers.KitSkinController:getKitSkin(v157)]
                local v159 = v158.terra
                if v159 ~= nil then
                    v159 = v159.blockRotation
                end
                if v159 then
                    v156 = v158.terra
                    if v156 ~= nil then
                        v156 = v156.blockRotation(u142)
                    end
                end
            end
            u124:PivotTo(CFrame.new(v145 + v152) * v156)
            for v160, v161 in u124:GetDescendants() do
                local _ = v160 - 1
                if v161:IsA("BasePart") then
                    v161:PivotTo(CFrame.new(v145 + v152) * v156)
                end
            end
            if u116 == u14.LocalPlayer then
                local v162 = u115.camera
                if v162 ~= nil then
                    v162 = (v162.Focus.Position - u115.camera.CFrame.Position).Magnitude
                end
                if v162 == 0 or (v162 ~= v162 or not v162) then
                    return nil
                end
                if v162 < 0.6 and not u123 then
                    u123 = true
                    local v163 = u26[u126].terra
                    if v163 ~= nil then
                        v163 = v163.blockTransparency
                    end
                    local v164 = v163 == nil and 0.75 or v163
                    u124.Transparency = v164
                    for v165, v166 in u124:GetChildren() do
                        local _ = v165 - 1
                        if v166:IsA("BasePart") then
                            v166.Transparency = v164
                        elseif v166:IsA("Texture") then
                            v166.Transparency = v164
                        end
                    end
                elseif v162 > 0.6 and u123 then
                    u123 = false
                    u124.Transparency = 0
                    for v167, v168 in u124:GetChildren() do
                        local _ = v167 - 1
                        if v168:IsA("BasePart") then
                            v168.Transparency = 0
                        elseif v168:IsA("Texture") then
                            v168.Transparency = 0
                        end
                    end
                end
            end
        end)
    end)
    return u124
end
function u41.getPositionAroundPlayer(_, p169, p170) --[[ Line: 641 ]]
    local v171 = select(2, p169:ToOrientation())
    local v172 = p170 % 6 / 6 * 6.283185307179586 - v171
    local v173 = math.cos(v172) * 3.5
    local v174 = math.sin(v172) * 3.5
    return (p169 + Vector3.new(v173, 0, v174)).Position
end
function u41.launchLocalBlockProjectile(p175, p176, p177, p178, p179) --[[ Line: 649 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
        [3] = u15
        [4] = u18
        [5] = u17
        [6] = u29
    --]]
    if p176 ~= u14.LocalPlayer then
        local v180 = p175:popBlock(p176)
        if v180 then
            v180:Destroy()
        end
        return nil
    end
    local v181 = p176.Character
    if v181 ~= nil then
        v181 = v181.PrimaryPart
    end
    if not v181 then
        return nil
    end
    local u182 = p175:popBlock(p176)
    local v183
    if u182 then
        v183 = u12("Model", {})
        u182.Parent = v183
        v183.PrimaryPart = u182
    else
        v183 = u15.Assets.Misc.BlockKickerBlock:Clone()
    end
    if not v183 then
        return nil
    end
    v183.Parent = u18
    if v183.PrimaryPart then
        for v184, v185 in v183.PrimaryPart:GetChildren() do
            local _ = v184 - 1
            if v185:IsA("Texture") then
                v185.Transparency = 0
            end
        end
    end
    p175.blockProjectiles[p179] = v183
    local v186 = p175:getKickBlockProjectileOriginPosition(p177, p178)
    local v187 = TweenInfo.new(0.1)
    u17:Create(v183.PrimaryPart, v187, {
        ["Position"] = v186
    }):Play()
    local _ = p178 * u29.KICK_BLOCK_VELOCITY
    task.delay(0.11, function() --[[ Line: 714 ]]
        --[[
        Upvalues:
            [1] = u182
        --]]
        local v188 = u182:WaitForChild("PartForce", 1)
        if v188 ~= nil then
            v188:Destroy()
        end
        u182.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        if u182 then
            u182:Destroy()
        end
    end)
    if u182 ~= nil then
        u182 = u182.Name
    end
    return u182
end
function u41.popBlock(p189, p190) --[[ Line: 740 ]]
    local v191 = p189.blocks[p190]
    if not v191 then
        return nil
    end
    local v192 = #v191
    local v193 = v191[v192]
    v191[v192] = nil
    return v193
end
function u41.getKickBlockProjectileOriginPosition(_, p194, p195) --[[ Line: 754 ]]
    return p194 + p195.Unit * 2
end
function u41.blockHit(p196, p197, p198, p199, _) --[[ Line: 759 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u26
        [3] = u15
        [4] = u18
        [5] = u34
        [6] = u7
        [7] = u38
    --]]
    local v200 = p196.blockProjectiles[p199]
    if v200 then
        v200:Destroy()
    end
    local v201 = nil
    local v202 = p197.Character
    if v202 then
        local v203 = u26[u10.Controllers.KitSkinController:getKitSkin(v202)].terra
        if v203 ~= nil then
            v203 = v203.customBlockImpactEffect:Clone()
        end
        v201 = v203 or v201
    end
    local v204 = v201 or u15.Assets.Effects.BlockKickImpactExplosion:Clone()
    v204.Parent = u18
    u34:playEffects({ v204 }, nil, {
        ["sizeMultiplier"] = 1,
        ["destroyAfterSec"] = 1
    })
    v204.CFrame = CFrame.new(p198)
    u7:playSound(u38[math.random(0, #u38 - 1) + 1], {
        ["position"] = p198
    })
end
function u41.calculateNormalId(_, p205, p206) --[[ Line: 806 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v207 = (p205 - u3:getWorldPosition(p206)).Unit
    local v208 = Enum.NormalId.Right
    local v209 = 1.1
    local v210 = 1.1
    for _, v211 in Enum.NormalId:GetEnumItems() do
        if v211 ~= Enum.NormalId.Top and v211 ~= Enum.NormalId.Bottom then
            local v212 = Vector3.FromNormalId(v211) - v207
            local v213 = v212.X
            if math.abs(v213) < v209 then
                local v214 = v212.Z
                if math.abs(v214) < v210 then
                    local v215 = v212.X
                    v209 = math.abs(v215)
                    local v216 = v212.Z
                    v210 = math.abs(v216)
                    v208 = v211
                end
            end
        end
    end
    return v208
end
function u41.setAbilityState(_, p217, p218) --[[ Line: 827 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v219 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(p217)
    if not v219 then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v219, p218)
end
function u41.removeBlockFromDamageMitigation(p220, p221) --[[ Line: 834 ]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u7
    --]]
    local v222 = p220.blocks[p221]
    if not v222 then
        return nil
    end
    local v223 = #v222
    local u224 = v222[v223]
    v222[v223] = nil
    if u224 then
        p220:createBlockDebris(u224)
    end
    local v225 = p221.Character
    if v225 ~= nil then
        v225 = v225.PrimaryPart
        if v225 ~= nil then
            v225 = v225.Position
        end
    end
    if v225 then
        u7:playSound(u40[math.random(0, #u40 - 1) + 1], {
            ["position"] = v225
        })
    end
    task.delay(0.25, function() --[[ Line: 865 ]]
        --[[
        Upvalues:
            [1] = u224
        --]]
        local v226 = u224
        if v226 ~= nil then
            v226:Destroy()
        end
    end)
end
function u41.createBlockDebris(_, p227) --[[ Line: 872 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
    --]]
    local v228 = p227:WaitForChild("PartForce", 1)
    if v228 ~= nil then
        v228:Destroy()
    end
    local v229 = u3:getBlockPosition(p227.Position)
    u10.Controllers.BlockDebrisController:convertBlockToDebris(p227, p227.Name, v229, Vector3.new(0, 10, 0))
end
function u41.playKickAnimation(_, u230, u231, u232, p233) --[[ Line: 880 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u37
        [3] = u39
        [4] = u10
        [5] = u26
        [6] = u7
        [7] = u15
        [8] = u18
        [9] = u6
        [10] = u34
        [11] = u38
        [12] = u14
        [13] = u11
    --]]
    local v234 = u230.Character
    if v234 ~= nil then
        v234 = v234.PrimaryPart
        if v234 ~= nil then
            v234 = v234.CFrame
        end
    end
    if v234 then
        local v235 = u230.Character
        if v235 ~= nil then
            local v236 = CFrame
            local v237 = u230.Character.PrimaryPart
            if v237 ~= nil then
                v237 = v237.Position
            end
            local v238 = u230.Character.PrimaryPart
            if v238 ~= nil then
                v238 = v238.Position + p233
            end
            v235:PivotTo(v236.lookAt(v237, v238))
        end
    end
    local v239 = u22:playAnimation(u230, u37[u231 + 1])
    if v239 ~= nil then
        v239:AdjustSpeed(v239.Length * 3)
    end
    local v240 = u230.Character
    if v240 ~= nil then
        v240 = v240.PrimaryPart
        if v240 ~= nil then
            v240 = v240.Position
        end
    end
    local v241 = u39[u231 + 1]
    local v242 = u230.Character
    if v242 then
        local v243 = u26[u10.Controllers.KitSkinController:getKitSkin(v242)].terra
        if v243 ~= nil then
            v243 = v243.blockKickSounds
        end
        if v243 then
            v241 = v243[u231 % #v243 + 1]
        end
    end
    u7:playSound(v241, {
        ["position"] = v240
    })
    if v239 ~= nil then
        v239:GetMarkerReachedSignal("hit"):Connect(function() --[[ Line: 941 ]]
            --[[
            Upvalues:
                [1] = u230
                [2] = u232
                [3] = u15
                [4] = u18
                [5] = u6
                [6] = u34
                [7] = u7
                [8] = u38
                [9] = u231
                [10] = u14
                [11] = u11
            --]]
            local v244 = u230.Character
            if v244 ~= nil then
                v244 = v244.PrimaryPart
                if v244 ~= nil then
                    v244 = v244.CFrame
                end
            end
            if not v244 then
                return nil
            end
            local v245 = u232
            local v246 = u15.Assets.Effects.HitEffect:Clone()
            v246.Anchored = true
            v246.Parent = u18
            u6:setQueryIgnored(v246, true)
            v246:PivotTo(CFrame.new(v245))
            u34:playEffects({ v246 }, nil, {
                ["destroyAfterSec"] = 0.5
            })
            u7:playSound(u38[u231 + 1], {
                ["position"] = v245
            })
            local v247 = u230 == u14.LocalPlayer
            if v247 then
                v247 = u14.LocalPlayer.Character
                if v247 ~= nil then
                    v247 = v247:GetPivot()
                    if v247 ~= nil then
                        v247 = v247.Position
                    end
                end
            end
            if v247 then
                u11.Controllers.ScreenShakeController:shake(u14.LocalPlayer.Character:GetPivot().Position, Vector3.new(0, -1, 0), {
                    ["magnitude"] = 0.25,
                    ["cycles"] = 3,
                    ["duration"] = 0.3,
                    ["zMagnitude"] = 0.1
                })
            end
        end)
    end
end
u10.CreateController(u41.new())
return nil