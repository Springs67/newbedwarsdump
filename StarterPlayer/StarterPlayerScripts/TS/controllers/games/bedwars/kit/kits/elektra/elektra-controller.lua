local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AbilityState
local u4 = v2.SoundManager
local u5 = v2.WatchCharacter
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local v15 = v11.RunService
local u16 = v11.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u29 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u30 = v15:IsStudio() and false
local u31 = u10("Folder", {
    ["Name"] = "ElektraEffectFolder",
    ["Parent"] = u16
})
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "ElektraController"
    end,
    ["__index"] = u29
})
u32.__index = u32
function u32.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u29
        [2] = u23
        [3] = u24
        [4] = u26
        [5] = u19
    --]]
    u29.constructor(p35, u23.ELEKTRA, {
        ["imageIds"] = { u24.ELECTRIC_DASH_ICON },
        ["sounds"] = {
            u26.ELECTRIC_DASH,
            u26.ELECTRIC_DASH_DAMAGE,
            u26.ELECTRIC_DASH_READY,
            u26.ELECTRIC_DASH_FOOTSTEP_1,
            u26.ELECTRIC_DASH_FOOTSTEP_2,
            u26.ELECTRIC_DASH_FOOTSTEP_3,
            u26.ELECTRIC_DASH_FOOTSTEP_4
        },
        ["animations"] = { u19.ELEKTRA_DASH }
    })
    p35.Name = "ElektraController"
    p35.crownMap = {}
    p35.hairMap = {}
    p35.lastDash = -1
    p35.dashReadyTime = -1
end
function u32.onKitLocalActivated(u36, p37) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u26
        [3] = u17
        [4] = u18
        [5] = u22
        [6] = u13
        [7] = u16
        [8] = u9
        [9] = u20
        [10] = u4
        [11] = u25
    --]]
    local v38 = u8.Controllers.FootstepsController.footstepModifier
    local v39 = {
        ["soundConfig"] = {
            ["overlay"] = {
                u26.ELECTRIC_DASH_FOOTSTEP_1,
                u26.ELECTRIC_DASH_FOOTSTEP_2,
                u26.ELECTRIC_DASH_FOOTSTEP_3,
                u26.ELECTRIC_DASH_FOOTSTEP_4
            }
        }
    }
    v38:addModifier(v39)
    p37:GiveTask(u17.CanUseLocalAbility:connect(function(p40) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u22
        --]]
        if p40.ability ~= u18.ELECTRIC_DASH then
            return nil
        end
        local v41 = u22:getEntity(p40.userCharacter)
        if v41 ~= nil then
            v41 = v41:isAlive()
        end
        if not v41 then
            p40:setCancelled(true)
        end
    end))
    p37:GiveTask(u17.CanUseLocalAbility:connect(function(p42) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u13
            [3] = u16
            [4] = u36
        --]]
        if p42.ability ~= u18.ELECTRIC_DASH then
            return nil
        end
        if not u13:GetPlayerFromCharacter(p42.userCharacter) then
            return nil
        end
        if u16:GetServerTimeNow() < u36.dashReadyTime then
            p42:setCancelled(true)
            return nil
        end
    end))
    p37:GiveTask(u17.AbilityUsed:setPriority(u9.LOWEST):connect(function(u43) --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u13
            [3] = u22
            [4] = u16
            [5] = u17
            [6] = u20
            [7] = u36
            [8] = u4
            [9] = u26
            [10] = u25
        --]]
        if u43:isCancelled() then
            return nil
        end
        if u43.ability ~= u18.ELECTRIC_DASH then
            return nil
        end
        local u44 = u13:GetPlayerFromCharacter(u43.userCharacter)
        if not u44 then
            return nil
        end
        if u44 ~= u13.LocalPlayer then
            return nil
        end
        local u45 = u22:getEntity(u43.userCharacter)
        if not u45 then
            return nil
        end
        local u46 = u45:getInstance():GetPivot()
        if not u43.userCharacter.PrimaryPart then
            return nil
        end
        local u47 = u16.CurrentCamera
        if not u47 then
            return nil
        end
        local v48 = u17.AbilityCooldownModifierCheck:fire(u20.ELEKTRA.ELECTRIC_DASH_COOLDOWN).cooldown
        if u16:GetServerTimeNow() - u36.lastDash < 1 then
            u36.dashReadyTime = u16:GetServerTimeNow() + 1
        else
            u36.dashReadyTime = u16:GetServerTimeNow() + u20.ELEKTRA.ELECTRIC_DASH_DURATION + v48
        end
        u36.lastDash = u16:GetServerTimeNow()
        local v49 = u47.CFrame.LookVector
        local v50 = v49.X
        local v51 = v49.Z
        local v52 = Vector3.new(v50, 0, v51).Unit
        local v53 = CFrame.lookAt(Vector3.new(0, 0, 0), v52)
        local v54 = u36:getDashInfo(u45:getInstance(), v53)
        local u55 = CFrame.new(u46.Position + v54) * (v53 * CFrame.Angles(0, 6.283185307179586, 0))
        task.spawn(function() --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u44
                [3] = u46
                [4] = u55
                [5] = u43
                [6] = u20
                [7] = u4
                [8] = u26
                [9] = u25
                [10] = u45
                [11] = u47
            --]]
            u36:createDashEndpointVFX(u44, u46, u55)
            local u56 = u36:addVFXToCharacter(u43.userCharacter)
            task.delay(u20.ELEKTRA.ELECTRIC_DASH_DURATION, function() --[[ Line: 144 ]]
                --[[
                Upvalues:
                    [1] = u56
                --]]
                for v57, v58 in u56 do
                    local _ = v57 - 1
                    v58:Destroy()
                end
            end)
            u4:playSound(u26.ELECTRIC_DASH, {
                ["playbackSpeedMultiplier"] = 1.27
            })
            u25.Client:Get("ElectricDash"):CallServer({
                ["electricDasher"] = u45:getInstance(),
                ["cameraCFrame"] = u47.CFrame,
                ["startCFrame"] = u46,
                ["destCFrame"] = u55
            })
        end)
    end))
end
function u32.onInnateAbilityEnabled(_, _, _) --[[ Line: 164 ]] end
function u32.onKitLocalDeactivated(_) --[[ Line: 166 ]] end
function u32.onKitReplicationActivated(u59, u60) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u23
        [4] = u12
        [5] = u17
        [6] = u18
        [7] = u3
        [8] = u4
        [9] = u26
        [10] = u13
        [11] = u25
        [12] = u20
    --]]
    u60:GiveTask(u5(function(u61, u62) --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u23
            [3] = u12
            [4] = u59
        --]]
        if u7.Controllers.KitController:isUsingKit(u61, u23.ELEKTRA) then
            task.spawn(function() --[[ Line: 171 ]]
                --[[
                Upvalues:
                    [1] = u62
                    [2] = u12
                    [3] = u59
                    [4] = u61
                --]]
                for v63, v64 in { u62:WaitForChild("3DClothing"):WaitForChild("LeftShoe"):WaitForChild("ElectricDashEffect"), u62:WaitForChild("3DClothing"):WaitForChild("RightShoe"):WaitForChild("ElectricDashEffect") } do
                    local _ = v63 - 1
                    u12:AddTag(v64, "FirstPersonHidden")
                end
                local v65 = { u62:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("crown1"), u62:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("crown") }
                local v66 = u62:WaitForChild("3DClothing"):WaitForChild("Head"):WaitForChild("hair")
                u59.crownMap[u61.UserId] = v65
                u59.hairMap[u61.UserId] = v66
            end)
        end
    end))
    u60:GiveTask(u17.AbilityEnabled:connect(function(p67) --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u3
            [3] = u4
            [4] = u26
            [5] = u59
            [6] = u13
        --]]
        if p67.ability.abilityId ~= u18.ELECTRIC_DASH then
            return nil
        end
        p67.ability.stateChangeSignal:Connect(function(p68) --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u4
                [3] = u26
                [4] = u59
                [5] = u13
            --]]
            if p68 == u3.PARTIALLY_CHARGED or p68 == u3.READY then
                u4:playSound(u26.ELECTRIC_DASH_READY, nil)
                local v69 = u59.crownMap[u13.LocalPlayer.UserId]
                if v69 then
                    for v70, v71 in v69 do
                        local _ = v70 - 1
                        v71.Color = Color3.fromRGB(106, 132, 172)
                    end
                end
                local v72 = u59.hairMap[u13.LocalPlayer.UserId]
                if v72 then
                    v72.Material = Enum.Material.Neon
                    return
                end
            else
                local v73 = u59.crownMap[u13.LocalPlayer.UserId]
                if v73 then
                    for v74, v75 in v73 do
                        local _ = v74 - 1
                        v75.Color = Color3.fromRGB(25, 33, 38)
                    end
                end
                local v76 = u59.hairMap[u13.LocalPlayer.UserId]
                if v76 then
                    v76.Material = Enum.Material.SmoothPlastic
                end
            end
        end)
    end))
    u25.Client:OnEvent("ValidatedElectricDash", function(p77) --[[ Line: 236 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u20
            [3] = u4
            [4] = u26
        --]]
        u59:createDashEndpointVFX(p77.player, p77.startCFrame, p77.destCFrame)
        if p77.player.Character then
            local u78 = u59:addVFXToCharacter(p77.player.Character)
            task.delay(u20.ELEKTRA.ELECTRIC_DASH_DURATION, function() --[[ Line: 240 ]]
                --[[
                Upvalues:
                    [1] = u78
                --]]
                for v79, v80 in u78 do
                    local _ = v79 - 1
                    v80:Destroy()
                end
            end)
        end
        u4:playSound(u26.ELECTRIC_DASH, {
            ["rollOffMaxDistance"] = 45,
            ["rollOffMinDistance"] = 20,
            ["playbackSpeedMultiplier"] = 1.27,
            ["position"] = p77.destCFrame.Position
        })
    end):andThen(function(p81) --[[ Line: 255 ]]
        --[[
        Upvalues:
            [1] = u60
        --]]
        u60:GiveTask(p81)
    end)
end
function u32.onKitReplicationDeactivated(_) --[[ Line: 259 ]] end
function u32.onAbilityUsed(_, _, _) --[[ Line: 261 ]] end
function u32.getDashInfo(p82, p83, p84) --[[ Line: 263 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u21
    --]]
    -- block 17
    local v85 = p83.PrimaryPart
    local v86 = v85.Size + Vector3.new(1, 2.5, 1)
    local v87 = v85.CFrame + Vector3.new(0, -0.75, 0)
    local v88 = u20.ELEKTRA.ELECTRIC_DASH_DEPTH_GOAL
    local v89 = u20.ELEKTRA.ELECTRIC_DASH_HEIGHT_LIMIT
    local v90 = p82:performHorizontalRaycast(v87, p84, v88, v86)
    local v91 = 0
    local v92 = 0
    ::l16::
    if math.ceil(v90) >= v88 or (math.ceil(v91) >= v89 or v92 >= 6) then
        local v93 = -v90 + 1
        local v94 = math.min(v93, 0)
        local v95 = Vector3.new(0, v91, v94)
        local v96 = v87.Position
        return p84 * v95 + v96 - v87.Position
    end
    v92 = v92 + 1
    local v97 = false
    local v98 = 0
    local v99 = 0
    local v100 = 0
    while true do
        if true then
            if v97 then
                v98 = v98 + 1
            else
                v97 = true
            end
        end
        if v98 >= 3 then
            break
        end
        local v101
        if p82:performVerticalRaycast(v87, v86, v98) then
            local v102 = v98 * u21
            v101 = p82:performHorizontalRaycast(v87 + Vector3.new(0, v102, 0), p84, v88, v86)
            if v100 < math.ceil(v101) then
                v99 = v98 * u21
            else
                v101 = v100
            end
        else
            v101 = v100
        end
        v100 = v101
    end
    ::l9::
    if v90 < v100 then
        v91 = v91 + v99
    else
        v100 = v90
    end
    v90 = v100
    goto l16
end
function u32.performHorizontalRaycast(_, p103, p104, p105, p106) --[[ Line: 321 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u30
        [3] = u16
    --]]
    local v107 = p106.Z
    local v108 = p106.Y
    local v109 = false
    local v110 = 0
    local v111 = 0
    while true do
        if v109 then
            v110 = v110 + 1
        else
            v109 = true
        end
        if v110 >= 10 then
            return v111
        end
        local v112 = (v111 + p105) / 2
        local v113 = v107 * 0.9
        local v114 = v108 * 0.9
        local v115 = Vector3.new(v113, v114, v112)
        local v116 = -v112 / 2
        local v117 = Vector3.new(0, 0, v116)
        local v118 = p103.Position
        local v119 = u10("Part", {
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["Name"] = "HorizontalDashDirection",
            ["Size"] = v115,
            ["CFrame"] = CFrame.new(p104 * v117 + v118) * p104,
            ["Transparency"] = u30 and 0.5 or 1,
            ["Parent"] = u16
        })
        local v120 = OverlapParams.new()
        v120.CollisionGroup = "Players"
        v120.MaxParts = 0
        local v121 = 0
        local v122 = {}
        for v123, v124 in u16:GetPartsInPart(v119, v120) do
            local _ = v123 - 1
            local v125 = v124:IsA("BasePart")
            if v125 then
                v125 = v124.CanCollide
            end
            if v125 == true then
                v121 = v121 + 1
                v122[v121] = v124
            end
        end
        v119:Destroy()
        if #v122 == 0 then
            v111 = v112
            v112 = p105
        end
        p105 = v112
    end
end
function u32.performVerticalRaycast(_, p126, p127, p128) --[[ Line: 384 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u10
        [3] = u30
        [4] = u27
        [5] = u16
    --]]
    local v129 = p128 * u21
    local v130 = p126 + Vector3.new(0, v129, 0)
    local v131 = p127.Z * 0.9
    local v132 = p127.Y * 0.9
    local v133 = p127.Z * 0.9
    local v134 = Vector3.new(v131, v132, v133)
    local v135 = u10
    local v136 = "Part"
    local v137 = {
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["Name"] = "VerticalDashDirection",
        ["Size"] = v134,
        ["CFrame"] = v130,
        ["Transparency"] = u30 and 0.5 or 1
    }
    local v138
    if u30 then
        v138 = u27.mcRed
    else
        v138 = nil
    end
    v137.Color = v138
    v137.Parent = u16
    local v139 = v135(v136, v137)
    local v140 = OverlapParams.new()
    v140.CollisionGroup = "Players"
    local v141 = 0
    local v142 = {}
    for v143, v144 in u16:GetPartsInPart(v139, v140) do
        local _ = v143 - 1
        local v145 = v144:IsA("BasePart")
        if v145 then
            v145 = v144.CanCollide
        end
        if v145 == true then
            v141 = v141 + 1
            v142[v141] = v144
        end
    end
    v139:Destroy()
    return #v142 == 0
end
function u32.createDashEndpointVFX(_, p146, u147, u148) --[[ Line: 424 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u14
        [3] = u16
        [4] = u28
        [5] = u20
    --]]
    local u149 = u22:getEntity(p146)
    if not u149 then
        return nil
    end
    task.spawn(function() --[[ Line: 430 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u16
            [3] = u147
            [4] = u28
            [5] = u149
        --]]
        local v150 = u14.Assets.Effects.ElectricDashStart:Clone()
        v150.Parent = u16
        v150.CFrame = u147
        local v151 = u28
        local v152 = {}
        local v153 = #v152
        local v154 = v150:GetDescendants()
        table.move(v154, 1, #v154, v153 + 1, v152)
        v151:playEffects(v152, u149:getInstance(), {
            ["destroyAfterSec"] = 2
        })
        task.wait(2)
        v150:Destroy()
    end)
    task.delay(u20.ELEKTRA.ELECTRIC_DASH_DURATION * 0.75, function() --[[ Line: 446 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u16
            [3] = u148
            [4] = u28
            [5] = u149
        --]]
        local v155 = u14.Assets.Effects.ElectricDashBurst:Clone()
        v155.Parent = u16
        v155.CFrame = u148
        local v156 = u28
        local v157 = {}
        local v158 = #v157
        local v159 = v155:GetDescendants()
        table.move(v159, 1, #v159, v158 + 1, v157)
        v156:playEffects(v157, u149:getInstance(), {
            ["destroyAfterSec"] = 2
        })
        task.wait(2)
        v155:Destroy()
    end)
end
function u32.addVFXToCharacter(_, u160) --[[ Line: 462 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u31
    --]]
    local u161 = {}
    task.spawn(function() --[[ Line: 464 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u160
            [3] = u31
            [4] = u161
        --]]
        local v162 = u14.Assets.Effects.ElectricDashTrail
        local v163 = u14.Assets.Effects.ElectricFillerTrail
        if u160:WaitForChild("LeftLowerArm") then
            local v164 = v162:Clone()
            local v165 = v163:Clone()
            v164.Parent = u31
            v164.Attachment0 = u160.LeftLowerArm.LeftElbowRigAttachment
            v164.Attachment1 = u160.LeftLowerArm.LeftWristRigAttachment
            v165.Parent = u31
            v165.Attachment0 = u160.LeftLowerArm.LeftElbowRigAttachment
            v165.Attachment1 = u160.LeftLowerArm.LeftWristRigAttachment
            local v166 = u161
            table.insert(v166, v164)
            local v167 = u161
            table.insert(v167, v165)
        end
        if u160:WaitForChild("RightLowerArm") then
            local v168 = v162:Clone()
            local v169 = v163:Clone()
            v168.Parent = u31
            v168.Attachment0 = u160.RightLowerArm.RightElbowRigAttachment
            v168.Attachment1 = u160.RightLowerArm.RightWristRigAttachment
            v169.Parent = u31
            v169.Attachment0 = u160.RightLowerArm.RightElbowRigAttachment
            v169.Attachment1 = u160.RightLowerArm.RightWristRigAttachment
            local v170 = u161
            table.insert(v170, v168)
            local v171 = u161
            table.insert(v171, v169)
        end
        if u160:WaitForChild("LeftLowerLeg") then
            local v172 = v162:Clone()
            local v173 = v163:Clone()
            v172.Parent = u31
            v172.Attachment0 = u160.LeftLowerLeg.LeftKneeRigAttachment
            v172.Attachment1 = u160.LeftLowerLeg.LeftAnkleRigAttachment
            v173.Parent = u31
            v173.Attachment0 = u160.LeftLowerLeg.LeftKneeRigAttachment
            v173.Attachment1 = u160.LeftLowerLeg.LeftAnkleRigAttachment
            local v174 = u161
            table.insert(v174, v172)
            local v175 = u161
            table.insert(v175, v173)
        end
        if u160:WaitForChild("RightLowerLeg") then
            local v176 = v162:Clone()
            local v177 = v163:Clone()
            v176.Parent = u31
            v176.Attachment0 = u160.RightLowerLeg.RightKneeRigAttachment
            v176.Attachment1 = u160.RightLowerLeg.RightAnkleRigAttachment
            v177.Parent = u31
            v177.Attachment0 = u160.RightLowerLeg.RightKneeRigAttachment
            v177.Attachment1 = u160.RightLowerLeg.RightAnkleRigAttachment
            local v178 = u161
            table.insert(v178, v176)
            local v179 = u161
            table.insert(v179, v177)
        end
    end)
    return u161
end
u7.CreateController(u32.new())
return nil