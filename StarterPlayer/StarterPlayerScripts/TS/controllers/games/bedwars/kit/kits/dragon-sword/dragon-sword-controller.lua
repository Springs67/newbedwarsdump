local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.RunService
local u15 = v11.TweenService
local u16 = v11.Workspace
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "target-selector", "target-selector-util")
local u20 = v19.TargetSelector
local u21 = v19.TargetType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").DragonSwordBalance
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u31 = v1.import(script, script.Parent, "ui", "dragon-sword-ui").DragonSwordUIDisplay
local u32 = { u29.DRAGON_SWORD_SHOOT_1, u29.DRAGON_SWORD_SHOOT_2, u29.DRAGON_SWORD_SHOOT_3 }
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "DragonSwordController"
    end,
    ["__index"] = u30
})
u33.__index = u33
function u33.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u23
        [3] = u32
        [4] = u29
        [5] = u30
        [6] = u9
        [7] = u16
    --]]
    local v37 = u27.DRAGON_SWORD
    local v38 = {
        ["animations"] = { u23.DRAGON_SWORD_FIRE, u23.DRAGON_SWORD_ULT }
    }
    local v39 = {}
    local v40 = #v39
    local v41 = #u32
    table.move(u32, 1, v41, v40 + 1, v39)
    local v42 = v40 + v41
    v39[v42 + 1] = u29.DRAGON_SWORD_ULT_CAST
    v39[v42 + 2] = u29.DRAGON_SWORD_ULT_FALL
    v39[v42 + 3] = u29.DRAGON_SWORD_ULT_LAND
    v38.sounds = v39
    u30.constructor(p36, v37, v38)
    p36.Name = "DragonSwordController"
    p36.swordCount = 0
    p36.userMap = {}
    p36.swordModelFolder = u9("Folder", {
        ["Name"] = "DragonSwords",
        ["Parent"] = u16
    })
end
function u33.onKitLocalActivated(u43, p44) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u28
        [3] = u18
        [4] = u20
        [5] = u2
        [6] = u4
    --]]
    u43:mountStacksUI(p44)
    p44:GiveTask(u12.LocalPlayer:GetAttributeChangedSignal("SwordCount"):Connect(function() --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:updateSwordCount()
    end))
    p44:GiveTask(u12.LocalPlayer:GetAttributeChangedSignal("NextSwordArrival"):Connect(function() --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:updateStacksUI()
    end))
    p44:GiveTask((u28.Client:Get("DragonSwordCountUpdate"):Connect(function(p45) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u43
        --]]
        if p45.player ~= u12.LocalPlayer then
            return nil
        end
        u43.swordCount = p45.after
        u43:updateSwordCount()
    end)))
    p44:GiveTask(u18.NewSelectorTarget:connect(function(_) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u20
            [3] = u2
            [4] = u4
        --]]
        if not u43.enabledAbility then
            return nil
        end
        local v46 = u20:getTargetEntity()
        if u43.target and v46 == nil then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u43.enabledAbility, u4.DISABLED)
        end
        if not u43.target and (v46 and u43.swordCount >= 1) then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u43.enabledAbility, u4.READY)
        end
        u43.target = v46
    end))
end
function u33.onKitLocalDeactivated(_) --[[ Line: 103 ]] end
function u33.onKitReplicationActivated(u47, p48) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u12
    --]]
    p48:GiveTask(u28.Client:Get("DragonSwordCountUpdate"):Connect(function(p49) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        local v50 = p49.after - p49.before
        u47:createSwords(p49.player, v50)
    end))
    p48:GiveTask(u28.Client:Get("DragonSwordEffect"):Connect(function(p51) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:swordFire(p51.player, p51.target)
    end))
    p48:GiveTask(u28.Client:Get("DragonSwordUltEffect"):Connect(function(p52) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        u47:swordUltEffect(p52.player, p52.positions)
    end))
    p48:GiveTask(u28.Client:Get("EntityDeathEvent"):Connect(function(p53) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u47
        --]]
        local v54 = u12:GetPlayerFromCharacter(p53.entityInstance)
        local v55 = v54 and u47.userMap[v54]
        if v55 then
            u47.userMap[v54] = nil
            if v55 ~= nil then
                for v56, v57 in v55 do
                    local _ = v56 - 1
                    v57:Destroy()
                    v57.Parent = nil
                end
            end
        end
    end))
    p48:GiveTask(u12.PlayerRemoving:Connect(function(p58) --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        if u47.userMap[p58] ~= nil then
            local v59 = u47.userMap[p58]
            if v59 ~= nil then
                for v60, v61 in v59 do
                    local _ = v60 - 1
                    v61:Destroy()
                    v61.Parent = nil
                end
            end
            u47.userMap[p58] = nil
        end
    end))
end
function u33.onKitReplicationDeactivated(_) --[[ Line: 159 ]] end
function u33.onInnateAbilityEnabled(p62, _, _) --[[ Line: 161 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u22
    --]]
    p62.enabledAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u22.DRAGON_SWORD)
    p62:enableTargetSelector()
    p62.enabledUltAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u22.DRAGON_SWORD_ULT)
end
function u33.onAbilityUsed(p63, p64, p65) --[[ Line: 166 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u22
        [3] = u20
        [4] = u2
        [5] = u4
        [6] = u28
        [7] = u24
        [8] = u23
        [9] = u7
    --]]
    if p64 ~= u12.LocalPlayer.Character then
        return nil
    end
    local v66 = p65.ability
    if v66 == u22.DRAGON_SWORD then
        local v67 = u20:getTargetEntity()
        if not v67 then
            p65:setCancelled(true)
            if p63.enabledAbility then
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p63.enabledAbility, u4.READY)
            end
            return nil
        end
        u28.Client:Get("DragonSwordFire"):SendToServer({
            ["target"] = v67:getInstance()
        })
        local v68 = u24:playAnimation(u12.LocalPlayer, u23.DRAGON_SWORD_FIRE)
        local v69 = u7.Controllers.ViewmodelController:playAnimation(u23.DRAGON_SWORD_FIRE_FP)
        if v69 ~= nil then
            v69:AdjustSpeed(2)
        end
        if v68 ~= nil then
            v68:AdjustSpeed(2)
            return
        end
    elseif v66 == u22.DRAGON_SWORD_ULT then
        u28.Client:Get("DragonSwordUlt"):SendToServer()
        return
    end
end
function u33.enableTargetSelector(_) --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u21
    --]]
    u20:enableTargetSelector(u21.ENTITY, {
        ["requireSight"] = true,
        ["distance"] = 30
    })
end
function u33.disableTargetSelector(p70) --[[ Line: 208 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20:disableTargetSelector()
    p70.target = nil
end
function u33.updateSwordCount(p71) --[[ Line: 212 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    p71:updateStacksUI()
    if p71.swordCount == 0 and p71.enabledUltAbility then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p71.enabledUltAbility, u4.DISABLED)
    elseif p71.enabledUltAbility then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p71.enabledUltAbility, u4.READY)
    end
    if p71.swordCount == 0 and p71.enabledAbility then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p71.enabledAbility, u4.DISABLED)
        p71:disableTargetSelector()
    elseif p71.enabledAbility then
        p71:enableTargetSelector()
        if p71.target then
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p71.enabledAbility, u4.READY)
        end
    end
end
function u33.updateStacksUI(p72) --[[ Line: 229 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u31
    --]]
    if p72.uiTree then
        local v73 = "rbxassetid://16215603369"
        local v74 = p72:getKitSkinData(u12.LocalPlayer.Character)
        local v75
        if v74 == nil then
            v75 = v74
        else
            v75 = v74.swordIcon
        end
        if v75 ~= "" and v75 then
            v73 = v74.swordIcon
        end
        local v76 = u12.LocalPlayer:GetAttribute("NextSwordArrival")
        local v77 = (v76 == 0 or (v76 ~= v76 or not v76)) and -1 or v76
        local v78 = u10
        local v79 = p72.uiTree
        local v80 = {}
        local v81 = p72.swordCount
        v80.count = v81 == nil and 0 or v81
        v80.icon = v73
        v80.timer = v77
        v78.update(v79, u10.createElement(u31, v80))
    end
end
function u33.mountStacksUI(u82, p83) --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u10
        [4] = u31
    --]]
    local v84 = "rbxassetid://15186577197"
    local v85 = u82:getKitSkinData(u12.LocalPlayer.Character)
    local v86
    if v85 == nil then
        v86 = v85
    else
        v86 = v85.swordIcon
    end
    if v86 ~= "" and v86 then
        v84 = v85.swordIcon
    end
    local v87 = u12.LocalPlayer:GetAttribute("WarlockEnergy")
    local v88 = u7.Controllers.StatusInfoListController
    local v89 = {
        ["count"] = v87 == nil and 0 or v87,
        ["icon"] = v84
    }
    u82.uiTree = v88:waitForSetupAddElement(u10.createElement(u31, v89))
    p83:GiveTask(function() --[[ Line: 277 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u10
        --]]
        if u82.uiTree then
            u10.unmount(u82.uiTree)
        end
    end)
end
function u33.getKitSkinData(_, p90) --[[ Line: 283 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u26
    --]]
    if not p90 then
        return nil
    end
    local v91 = u26[u7.Controllers.KitSkinController:getKitSkin(p90)]
    if v91.dragon_sword then
        return v91.dragon_sword
    end
end
function u33.createSwords(p92, p93, p94) --[[ Line: 293 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v95 = p92.userMap[p93]
    local v96 = v95 ~= nil and #v95 or v95
    local v97 = v96 == nil and 0 or v96
    local v98 = v95 == nil and {} or v95
    local v99 = u25.MAX_SWORD - #v98
    local v100 = math.min(p94, v99)
    local v101 = false
    local v102 = 0
    while true do
        if v101 then
            v102 = v102 + 1
        else
            v101 = true
        end
        if v102 >= v100 then
            p92.userMap[p93] = v98
            return
        end
        local v103 = p92:createSword(p93, v97 + v102 - 1)
        if v103 then
            table.insert(v98, v103)
        end
    end
end
function u33.createSword(u104, u105, u106) --[[ Line: 333 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
    --]]
    local v107 = u105.Character
    if v107 ~= nil then
        v107 = v107:GetPivot().Position
    end
    if not v107 then
        return nil
    end
    local v108 = u105.Character
    if v108 ~= nil then
        v108 = v108.PrimaryPart
    end
    if not v108 then
        return nil
    end
    local u109 = 0.7853981633974483 * u106 + u105.Character.PrimaryPart.Rotation.Y
    local v110 = math.sin(u109) * 5
    local v111 = math.cos(u109) * 5
    local u112 = Vector3.new(v110, 0, v111)
    local v113 = v107 + u112 + Vector3.new(0, 2, 0)
    local v114 = u104:getKitSkinData(u105.Character)
    local v115 = u13.Assets.Effects.DragonSword
    local v116
    if v114 == nil then
        v116 = v114
    else
        v116 = v114.swordModel
    end
    if v116 then
        v115 = v114.swordModel
    end
    local u117 = v115:Clone()
    u117.Parent = u104.swordModelFolder
    u117:PivotTo(CFrame.new(v113))
    if not (v107 and u117) then
        return u117
    end
    local u118 = 0
    local u119 = nil
    u119 = u14.Heartbeat:Connect(function(p120) --[[ Line: 376 ]]
        --[[
        Upvalues:
            [1] = u117
            [2] = u104
            [3] = u119
            [4] = u105
            [5] = u118
            [6] = u109
            [7] = u106
            [8] = u112
        --]]
        if not u117 or u117.Parent ~= u104.swordModelFolder then
            u119:Disconnect()
            return nil
        end
        local v121 = u105.Character
        if v121 ~= nil then
            v121 = v121:GetPivot().Position
        end
        if not v121 then
            u119:Disconnect()
            return nil
        end
        local v122 = u104.userMap[u105]
        local v123 = v122 ~= nil and #v122 or v122
        local v124 = v123 == nil and 0 or v123
        if v124 == 0 or (v124 ~= v124 or not v124) then
            u119:Disconnect()
            return nil
        end
        u118 = u118 + p120
        local v125 = 0.6283185307179586 * u106
        local v126 = u105.Character.PrimaryPart.Orientation.Y
        u109 = v125 + math.rad(v126)
        local v127 = u109
        local v128 = math.sin(v127) * 5
        local v129 = u109
        local v130 = math.cos(v129) * 5
        u112 = Vector3.new(v128, 0, v130)
        local v131 = u118 * 2
        local _ = math.sin(v131) * 1
        local v132 = u117
        local v133 = v121 + u112
        local v134 = u118 + u106
        local v135 = math.sin(v134) / 4 + 2
        local v136 = Vector3.new(0, v135, 0)
        v132:PivotTo(CFrame.new(v133 + v136))
    end)
    return u117
end
function u33.swordFire(p137, p138, p139) --[[ Line: 419 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u32
        [3] = u5
        [4] = u6
        [5] = u17
        [6] = u8
    --]]
    local v140 = p137.userMap[p138]
    if not v140 or #v140 == 0 then
        return nil
    end
    local u141 = p139.PrimaryPart
    if u141 ~= nil then
        u141 = u141.Position
    end
    if not u141 then
        return nil
    end
    local v142 = #v140
    local u143 = v140[v142]
    v140[v142] = nil
    p137.userMap[p138] = v140
    if not u143 then
        return nil
    end
    u143.Parent = u16
    local v144 = u143:WaitForChild("Handle", 3)
    if v144 ~= nil then
        v144 = v144:WaitForChild("Trail3")
    end
    if v144 then
        v144.Enabled = true
    end
    local v145 = p138.Character
    if v145 ~= nil then
        v145 = v145.PrimaryPart
        if v145 ~= nil then
            v145 = v145.Position
        end
    end
    if not v145 then
        return nil
    end
    local u146 = (u141 - v145).Unit
    local v147 = u143.PrimaryPart.Position + Vector3.new(0, 6, 0)
    local v148 = u32
    local v149 = p137:getKitSkinData(p138.Character)
    local v150
    if v149 == nil then
        v150 = v149
    else
        v150 = v149.swordShootSounds
    end
    if v150 then
        v148 = v149.swordShootSounds
    end
    u6:playSound(u5.fromList(unpack(v148)), {
        ["position"] = v147
    })
    u17(0.2, u8, function(p151) --[[ Line: 483 ]]
        --[[
        Upvalues:
            [1] = u143
        --]]
        u143:PivotTo(p151)
    end, u143.PrimaryPart.CFrame, CFrame.new(v147, u141) * CFrame.Angles(1.5707963267948966, 0, 0))
    task.delay(0.2, function() --[[ Line: 490 ]]
        --[[
        Upvalues:
            [1] = u143
            [2] = u141
            [3] = u146
            [4] = u17
            [5] = u8
        --]]
        u17(0.1, u8, function(p152) --[[ Line: 491 ]]
            --[[
            Upvalues:
                [1] = u143
            --]]
            u143:PivotTo(p152)
        end, u143.PrimaryPart.CFrame, CFrame.new(u141, u141 + u146) * CFrame.Angles(1.5707963267948966, 0, 0))
    end)
    task.delay(0.3, function() --[[ Line: 499 ]]
        --[[
        Upvalues:
            [1] = u143
        --]]
        u143:Destroy()
    end)
end
function u33.swordUltEffect(p153, p154, u155) --[[ Line: 503 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u23
        [3] = u12
        [4] = u7
        [5] = u29
        [6] = u6
        [7] = u16
        [8] = u15
        [9] = u17
        [10] = u8
        [11] = u13
    --]]
    local v156 = p153.userMap[p154]
    local v157 = p154.Character
    if v157 ~= nil then
        v157 = v157.PrimaryPart
        if v157 ~= nil then
            v157 = v157.Position
        end
    end
    if not (v156 and v157) then
        return nil
    end
    if #u155 < 1 then
        return nil
    end
    p153.userMap[p154] = nil
    local u158 = 0
    local v159 = u24:playAnimation(p154, u23.DRAGON_SWORD_ULT)
    if p154 == u12.LocalPlayer then
        u7.Controllers.ViewmodelController:playAnimation(u23.DRAGON_SWORD_ULT_FP)
    end
    if v159 ~= nil then
        v159:AdjustSpeed(1.5)
    end
    local v160 = u29.DRAGON_SWORD_ULT_CAST
    local u161 = p153:getKitSkinData(p154.Character)
    local v162
    if u161 == nil then
        v162 = u161
    else
        v162 = u161.swordUltCastSound
    end
    if v162 ~= "" and v162 then
        v160 = u161.swordUltCastSound
    end
    u6:playSound(v160, {
        ["position"] = v157
    })
    local v163
    if u161 == nil then
        v163 = u161
    else
        v163 = u161.swordDragonTransparentModel
    end
    if v163 then
        local u164 = u161.swordDragonTransparentModel:Clone()
        if not u164 then
            return nil
        end
        u6:playSound(u29.DRAGON_ROAR, {
            ["fadeOutTime"] = 1,
            ["position"] = v157
        })
        u164:PivotTo(CFrame.new(v157 + Vector3.new(0, 3, 0)))
        u164.Parent = u16
        local v165 = u24:playAnimation(u164, u23.DRAGON_SMASH_1)
        if v165 ~= nil then
            v165:AdjustSpeed(0.75)
        end
        task.delay(1.2, function() --[[ Line: 569 ]]
            --[[
            Upvalues:
                [1] = u164
            --]]
            u164:Destroy()
        end)
    end
    local function v185(u166) --[[ Line: 573 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u155
            [3] = u158
            [4] = u15
            [5] = u17
            [6] = u8
            [7] = u13
            [8] = u161
            [9] = u29
            [10] = u6
        --]]
        u166.Parent = u16
        local v167 = u155[u158 + 1]
        for v168, v169 in u166:GetDescendants() do
            local _ = v168 - 1
            if v169:IsA("ParticleEmitter") then
                v169.Enabled = true
            end
        end
        u158 = u158 + 1
        local u170 = v167 + Vector3.new(0, 10, 0)
        local u171 = v167 + Vector3.new(0, -1, 0)
        u15:Create(u166, TweenInfo.new(1.5), {
            ["WorldPivot"] = CFrame.new(u170)
        }):Play()
        u17(0.9, u8, function(p172) --[[ Line: 594 ]]
            --[[
            Upvalues:
                [1] = u166
            --]]
            u166:PivotTo(p172)
        end, u166.PrimaryPart.CFrame, CFrame.new(u170))
        local v173 = u13.Assets.Effects.DragSwordCrack
        local v174 = u161
        if v174 ~= nil then
            v174 = v174.swordCrackModel
        end
        if v174 then
            v173 = u161.swordCrackModel:Clone()
        end
        local u175 = v173:Clone()
        task.delay(0.9, function() --[[ Line: 606 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u161
                [3] = u6
                [4] = u170
                [5] = u171
                [6] = u17
                [7] = u8
                [8] = u166
                [9] = u175
                [10] = u16
            --]]
            local v176 = u29.DRAGON_SWORD_ULT_FALL
            local v177 = u161
            if v177 ~= nil then
                v177 = v177.swordUltFallSound
            end
            if v177 ~= "" and v177 then
                v176 = u161.swordUltFallSound
            end
            u6:playSound(v176, {
                ["position"] = u170
            })
            task.delay(0.1, function() --[[ Line: 618 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u161
                    [3] = u6
                    [4] = u171
                --]]
                local v178 = u29.DRAGON_SWORD_ULT_LAND
                local v179 = u161
                if v179 ~= nil then
                    v179 = v179.swordUltLandSound
                end
                if v179 ~= "" and v179 then
                    v178 = u161.swordUltLandSound
                end
                u6:playSound(v178, {
                    ["position"] = u171
                })
            end)
            u17(0.2, u8, function(p180) --[[ Line: 631 ]]
                --[[
                Upvalues:
                    [1] = u166
                --]]
                u166:PivotTo(p180)
            end, u166.PrimaryPart.CFrame, CFrame.new(u171))
            for v181, v182 in u166:GetDescendants() do
                local _ = v181 - 1
                if v182:IsA("ParticleEmitter") then
                    v182.Rate = v182.Rate * 3
                end
            end
            u175:PivotTo(CFrame.new(u171 + Vector3.new(0, -1, 0)))
            u175.Parent = u16
            for v183, v184 in u175:GetDescendants() do
                local _ = v183 - 1
                if v184:IsA("ParticleEmitter") then
                    v184:Emit(5)
                end
            end
        end)
        task.delay(2, function() --[[ Line: 657 ]]
            --[[
            Upvalues:
                [1] = u166
                [2] = u175
            --]]
            u166:Destroy()
            u166.Parent = nil
            u175:Destroy()
        end)
    end
    for v186, v187 in v156 do
        v185(v187, v186 - 1, v156)
    end
end
u7.CreateController(u33.new())
return nil