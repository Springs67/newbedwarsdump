local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v12.RunService
local u16 = v12.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "slime-tamer", "slime-util")
local u24 = v23.SlimeMeta
local u25 = v23.SlimeState
local u26 = v23.SlimeType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u32 = v1.import(script, script.Parent, "ui", "slime-tamer-sidebar").SlimeTamerSidebar
local u33 = v1.import(script, script.Parent, "ui", "slime-tamer-target").SlimeTamerTarget
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "SlimeTamerFluteController"
    end,
    ["__index"] = u18
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
        [1] = u18
        [2] = u10
    --]]
    u18.constructor(p37)
    p37.Name = "SlimeTamerFluteController"
    p37.maid = u10.new()
    p37.selectedSlimeType = 0
    p37.tamedSlimes = {}
    p37.tamedSlimeData = {}
    p37.validSlimeSelected = false
    p37.awaySlimeSelected = false
end
function u34.KnitStart(p38) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u7
        [3] = u28
        [4] = u20
        [5] = u30
        [6] = u27
        [7] = u17
        [8] = u19
        [9] = u14
        [10] = u21
        [11] = u5
    --]]
    u18.KnitStart(p38)
    u7.Controllers.PreloadController:preloadForItemType(u28.SLIME_TAMER_FLUTE, {
        ["animations"] = { u20.SLIME_TAMER_FLUTE_USE, u20.SLIME_TAMER_FLUTE_USE_FP },
        ["sounds"] = {
            u30.SLIME_RECALL,
            u30.SLIME_DIRECT_3,
            u30.SLIME_DIRECT_2,
            u30.SLIME_DIRECT_1,
            u30.SLIME_DIRECT_4
        },
        ["imageIds"] = { u27.SLIME_CYCLE, u27.SLIME_DIRECT }
    })
    u17.AbilityUsed:connect(function(p39) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u14
            [3] = u21
            [4] = u20
            [5] = u5
            [6] = u30
        --]]
        if p39.ability ~= u19.SLIME_DIRECT then
            return nil
        end
        local v40 = u14:GetPlayerFromCharacter(p39.userCharacter)
        if not v40 then
            return nil
        end
        if v40 == u14.LocalPlayer then
            return nil
        end
        u21:playAnimation(v40, u20.SLIME_TAMER_FLUTE_USE)
        u5:playSound(u30.COIN_COLLECT, {
            ["position"] = p39.userCharacter:GetPivot().Position
        })
    end)
end
function u34.isRelevantItem(_, p41) --[[ Line: 87 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    return p41.itemType == u28.SLIME_TAMER_FLUTE
end
function u34.onEnable(u42, _, _) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u14
        [3] = u11
        [4] = u32
        [5] = u2
        [6] = u19
        [7] = u27
        [8] = u4
        [9] = u13
        [10] = u17
        [11] = u22
        [12] = u21
        [13] = u20
        [14] = u8
        [15] = u15
        [16] = u16
        [17] = u31
        [18] = u33
    --]]
    u42:setupYield(function() --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u7
            [3] = u14
            [4] = u11
            [5] = u32
            [6] = u2
            [7] = u19
            [8] = u27
            [9] = u4
            [10] = u13
            [11] = u17
            [12] = u22
            [13] = u21
            [14] = u20
            [15] = u8
        --]]
        u42.tamedSlimes = u7.Controllers.SlimeTamerController:getTamedSlimeTypes(u14.LocalPlayer.UserId)
        u42.tamedSlimeData = u7.Controllers.SlimeTamerController:getTamedSlimeData(u14.LocalPlayer.UserId)
        u42:updateSlimeSelection()
        local u43 = u11.mount(u11.createElement(u32, {
            ["tamedSlimes"] = u42.tamedSlimes,
            ["selectedSlimeType"] = u42.selectedSlimeType,
            ["tamedSlimeData"] = u42.tamedSlimeData
        }), u14.LocalPlayer:WaitForChild("PlayerGui"))
        local v44 = u42.maid
        local v45 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v46 = u19.SLIME_CYCLE
        local v47 = {
            ["abilityType"] = "ItemPrimary"
        }
        local v48 = {
            ["icon"] = u27.SLIME_CYCLE,
            ["stateColors"] = {
                [u4.READY] = Color3.fromRGB(89, 148, 48)
            }
        }
        v47.abilityButton = v48
        v44:GiveTask(v45:enableAbility(v46, v47):expect())
        local v49 = u42.maid
        local v50 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v51 = u19.SLIME_DIRECT
        local v52 = {
            ["abilityType"] = "ItemSecondary"
        }
        local v53 = {
            ["icon"] = u27.SLIME_DIRECT,
            ["stateColors"] = {
                [u4.READY] = Color3.fromRGB(89, 148, 48)
            }
        }
        v52.abilityButton = v53
        v49:GiveTask(v50:enableAbility(v51, v52):expect())
        u42.maid:GiveTask(u13:GetInstanceAddedSignal("SlimeData"):Connect(function(p54) --[[ Line: 121 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u42
                [3] = u7
                [4] = u11
                [5] = u43
                [6] = u32
            --]]
            if p54:WaitForChild("Tamer").Value ~= u14.LocalPlayer.UserId then
                return nil
            end
            u42.tamedSlimes = u7.Controllers.SlimeTamerController:getTamedSlimeTypes(u14.LocalPlayer.UserId)
            u42.tamedSlimeData = u7.Controllers.SlimeTamerController:getTamedSlimeData(u14.LocalPlayer.UserId)
            u11.update(u43, u11.createElement(u32, {
                ["tamedSlimes"] = u42.tamedSlimes,
                ["selectedSlimeType"] = u42.selectedSlimeType,
                ["tamedSlimeData"] = u42.tamedSlimeData
            }))
            u42:updateSlimeSelection()
        end))
        u42.maid:GiveTask(u17.AbilityUsed:connect(function(p55) --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u14
                [3] = u42
                [4] = u7
                [5] = u11
                [6] = u43
                [7] = u32
            --]]
            if p55.ability ~= u19.SLIME_CYCLE then
                return nil
            end
            if p55.userCharacter ~= u14.LocalPlayer.Character then
                return nil
            end
            u42.tamedSlimes = u7.Controllers.SlimeTamerController:getTamedSlimeTypes(u14.LocalPlayer.UserId)
            u42.tamedSlimeData = u7.Controllers.SlimeTamerController:getTamedSlimeData(u14.LocalPlayer.UserId)
            u42:cycleSlimes()
            u11.update(u43, u11.createElement(u32, {
                ["tamedSlimes"] = u42.tamedSlimes,
                ["selectedSlimeType"] = u42.selectedSlimeType,
                ["tamedSlimeData"] = u42.tamedSlimeData
            }))
            u42:updateSlimeSelection()
        end))
        u42.maid:GiveTask(u17.CanUseLocalAbility:connect(function(p56) --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u14
                [3] = u22
            --]]
            if p56.ability ~= u19.SLIME_DIRECT and p56.ability ~= u19.SLIME_CYCLE then
                return nil
            end
            if p56.userCharacter ~= u14.LocalPlayer.Character then
                return nil
            end
            local v57 = u22:getLocalPlayerEntity()
            if v57 ~= nil then
                v57 = v57:isDead()
            end
            if v57 then
                return nil
            end
        end))
        u42.maid:GiveTask(u17.AbilityUsed:connect(function(p58) --[[ Line: 171 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u14
                [3] = u21
                [4] = u20
                [5] = u8
                [6] = u42
            --]]
            if p58.ability ~= u19.SLIME_DIRECT then
                return nil
            end
            if p58.userCharacter ~= u14.LocalPlayer.Character then
                return nil
            end
            task.spawn(function() --[[ Line: 178 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u14
                    [3] = u20
                    [4] = u8
                    [5] = u42
                --]]
                local u59 = u21:playAnimation(u14.LocalPlayer, u20.SLIME_TAMER_FLUTE_USE)
                local u60 = u8.Controllers.ViewmodelController:playAnimation(u20.SLIME_TAMER_FLUTE_USE_FP)
                u42.maid:GiveTask(function() --[[ Line: 181 ]]
                    --[[
                    Upvalues:
                        [1] = u59
                        [2] = u60
                    --]]
                    local v61 = u59
                    if v61 ~= nil then
                        v61:Stop()
                    end
                    local v62 = u59
                    if v62 ~= nil then
                        v62:Destroy()
                    end
                    local v63 = u60
                    if v63 ~= nil then
                        v63:Stop()
                    end
                    local v64 = u60
                    if v64 ~= nil then
                        v64:Destroy()
                    end
                end)
                u42:moveSlime()
                u42:updateSlimeSelection()
            end)
        end))
        return function() --[[ Line: 203 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u43
            --]]
            u11.unmount(u43)
        end
    end)
    u42.maid:GiveTask(u15.Heartbeat:Connect(function(_) --[[ Line: 208 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u16
            [3] = u22
            [4] = u14
            [5] = u8
            [6] = u31
            [7] = u11
            [8] = u33
        --]]
        if not u42.validSlimeSelected or u42.awaySlimeSelected then
            u42:removeTarget()
            return nil
        end
        local v65 = u16.CurrentCamera
        if v65 ~= nil then
            v65 = v65.CFrame
        end
        if not v65 then
            u42:removeTarget()
            return nil
        end
        if not u22:getLocalPlayerEntity() then
            u42:removeTarget()
            return nil
        end
        local v66 = u14.LocalPlayer:GetAttribute("Team")
        if v66 == 0 or (v66 ~= v66 or not v66) then
            return nil
        end
        if not u8.Controllers.TeamController:getTeamById((tostring(v66))) then
            return nil
        end
        local v67 = u14.LocalPlayer.Character
        if v67 ~= nil then
            v67 = v67.PrimaryPart
            if v67 ~= nil then
                v67 = v67.Position
            end
        end
        if not v67 then
            return nil
        end
        local v68 = 0
        local v69 = {}
        for v70, v71 in u31.getEntitiesWithinRadius(v67, 75) do
            local _ = v70 - 1
            local v72 = u14:GetPlayerFromCharacter(v71:getInstance())
            local v73 = v72 and not v72:HasTag("PlayerHidden")
            if v73 then
                if v72 == u14.LocalPlayer then
                    v73 = false
                else
                    v73 = v72:GetAttribute("Team") == v66
                end
            end
            if v73 == true then
                v68 = v68 + 1
                v69[v68] = v71
            end
        end
        local u74 = Ray.new(v65.Position, v65.LookVector).Unit
        table.sort(v69, function(p75, p76) --[[ Line: 265 ]]
            --[[
            Upvalues:
                [1] = u74
            --]]
            local v77 = p75:getInstance():GetPivot().Position
            local v78 = u74:ClosestPoint(v77)
            local v79 = (v77 - v78).Magnitude
            local v80 = (u74.Origin - v78).Magnitude
            local v81 = p76:getInstance():GetPivot().Position
            local v82 = u74:ClosestPoint(v77)
            local v83 = (v81 - v82).Magnitude
            local v84 = (u74.Origin - v82).Magnitude
            return v79 + v80 / 3 < v83 + v84 / 3
        end)
        local v85 = nil
        for _, v86 in v69 do
            local v87 = v86:getInstance():GetPivot().Position
            if (v87 - v65.Position):Dot(v65.LookVector) >= 0 then
                local v88 = u14.LocalPlayer.Character
                if v88 ~= nil then
                    v88 = v88.PrimaryPart
                    if v88 ~= nil then
                        v88 = v88.Position
                    end
                end
                if v88 and (v87 - u74:ClosestPoint(v87)).Magnitude <= 75 then
                    v85 = v86:getInstance()
                    break
                end
            end
        end
        if u42.targetEntity ~= v85 then
            u42:removeTarget()
            if v85 then
                u42.targetIcon = u11.mount(u11.createElement(u33), v85.PrimaryPart)
            end
        end
        u42.targetEntity = v85
    end))
end
function u34.onDisable(p89) --[[ Line: 321 ]]
    p89.maid:DoCleaning()
    p89:removeTarget()
end
function u34.cycleSlimes(u90) --[[ Line: 325 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u26
        [3] = u7
        [4] = u14
        [5] = u5
        [6] = u24
    --]]
    local v91 = u90.selectedSlimeType
    local u92 = v91 == nil and 0 or v91
    u90.selectedSlimeType = (u92 + 1) % #u9.values(u26)
    task.spawn(function() --[[ Line: 332 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u14
            [3] = u90
            [4] = u5
            [5] = u24
            [6] = u92
        --]]
        local v93 = u7.Controllers.SlimeTamerController:getTamedSlimeTypes(u14.LocalPlayer.UserId)
        local v94 = u90.selectedSlimeType
        if table.find(v93, v94) ~= nil then
            u5:playSound(u24[u92].alertSound, {
                ["position"] = nil,
                ["volumeMultiplier"] = 0.75
            })
        end
    end)
end
function u34.updateSlimeSelection(p95) --[[ Line: 343 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u14
    --]]
    local v96 = u7.Controllers.SlimeTamerController:getTamedSlimeTypes(u14.LocalPlayer.UserId)
    local v97 = p95.selectedSlimeType
    if table.find(v96, v97) == nil then
        p95.validSlimeSelected = false
        p95.awaySlimeSelected = false
        return nil
    else
        p95.validSlimeSelected = true
        local v98 = 0
        local v99 = {}
        for v100, v101 in u7.Controllers.SlimeTamerController:getTamedSlimeData(u14.LocalPlayer.UserId) do
            local _ = v100 - 1
            if v101:GetAttribute("SlimeType") == p95.selectedSlimeType == true then
                v98 = v98 + 1
                v99[v98] = v101
            end
        end
        local v102 = v99[1]
        if v102.Following.Value == v102.Tamer.Value then
            p95.awaySlimeSelected = false
        else
            p95.awaySlimeSelected = true
        end
    end
end
function u34.moveSlime(p103) --[[ Line: 374 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
        [3] = u25
        [4] = u5
        [5] = u24
        [6] = u29
        [7] = u30
    --]]
    if not u14.LocalPlayer.Character then
        return nil
    end
    local v104 = p103.targetEntity
    local v105 = p103.selectedSlimeType
    local v106 = 0
    local v107 = {}
    for v108, v109 in u7.Controllers.SlimeTamerController:getTamedSlimeData(u14.LocalPlayer.UserId) do
        local _ = v108 - 1
        if v109:GetAttribute("SlimeType") == v105 == true then
            v106 = v106 + 1
            v107[v106] = v109
        end
    end
    if not v107 or #v107 == 0 then
        warn("Tamer does not own any slimes of this type " .. tostring(v105))
        return nil
    end
    local v110 = v107[1]
    if v110:GetAttribute("SlimeState") == u25.CHANGING_PLAYER then
        warn("Slime is already changing players")
        return nil
    end
    if v110.Following.Value ~= v110.Tamer.Value then
        u5:playSound(u30.SLIME_RECALL, {
            ["position"] = nil
        })
        u29.Client:Get("RequestMoveSlime"):CallServer({
            ["slimeId"] = v110:GetAttribute("Id"),
            ["targetPlayerUserId"] = u14.LocalPlayer.UserId
        })
        return
    end
    local v111 = u14:GetPlayerFromCharacter(v104)
    if not v111 then
        return nil
    end
    local v112 = v111.UserId
    local v113 = nil
    for v114, v115 in u7.Controllers.SlimeTamerController:getFollowingSlimeData(v112) do
        local _ = v114 - 1
        if v115:GetAttribute("SlimeType") == v105 == true then
            v113 = v115
            break
        end
    end
    if v113 then
        warn("Player " .. tostring(v111) .. " already has a slime of this type following them")
        return nil
    end
    u5:playSound(u24[v105].directSound, {
        ["position"] = nil,
        ["volumeMultiplier"] = 0.75
    })
    u29.Client:Get("RequestMoveSlime"):CallServer({
        ["slimeId"] = v110:GetAttribute("Id"),
        ["targetPlayerUserId"] = v112
    })
end
function u34.removeTarget(p116) --[[ Line: 448 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    p116.targetEntity = nil
    if p116.targetIcon then
        u11.unmount(p116.targetIcon)
    end
end
u7.CreateController(u34.new())
return nil