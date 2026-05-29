local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.RunService
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "protector-wand", "protector-wand-constants").ProtectorWandConstants
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u23 = v1.import(script, script.Parent, "helper-player-text").HelperPlayerText
local u24 = v1.import(script, script.Parent, "protector-wand-target").ProtectorWandTarget
local v25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "ProtectorWandController"
    end,
    ["__index"] = u14
})
v25.__index = v25
function v25.constructor(p26) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
        [3] = u5
        [4] = u21
    --]]
    u14.constructor(p26)
    p26.Name = "ProtectorWandController"
    p26.animationMaid = u8.new()
    p26.randomCastingSound = u5.fromList(u21.WAND_CAST_1, u21.WAND_CAST_2, u21.WAND_CAST_3)
end
function v25.KnitStart(u27) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u20
        [3] = u6
        [4] = u11
        [5] = u9
        [6] = u23
    --]]
    u14.KnitStart(u27)
    u20.Client:OnEvent("WandPlayEffects", function(p28) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        u6:playSound(p28.playSound, {
            ["volumeMultiplier"] = 0.75,
            ["position"] = p28.targetPosition
        })
    end)
    u20.Client:OnEvent("HelperTextNotif", function(p29) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u9
            [3] = u23
            [4] = u27
        --]]
        if p29.player == u11.LocalPlayer then
            local v30 = nil
            if v30 then
                u9.unmount(v30)
            end
            u27:helperPlayerTreeCheck(u9.mount(u9.createElement(u23, {
                ["HelperText"] = p29.helperText
            }), u11.LocalPlayer:WaitForChild("PlayerGui")), 3)
            return nil
        end
    end)
end
function v25.beginAutoTargeting(u31, p32, u33, u34, u35, u36) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u11
        [4] = u7
        [5] = u22
        [6] = u18
        [7] = u19
        [8] = u9
        [9] = u24
    --]]
    p32:GiveTask(u12.Heartbeat:Connect(function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u31
            [3] = u11
            [4] = u7
            [5] = u22
            [6] = u18
            [7] = u33
            [8] = u19
            [9] = u9
            [10] = u24
            [11] = u34
            [12] = u35
            [13] = u36
        --]]
        local v37 = u13.CurrentCamera
        if v37 ~= nil then
            v37 = v37.CFrame
        end
        if not v37 then
            u31:removeTarget(u31.wandTargetIconTree, u31.wandTargetEntity)
            return nil
        end
        local v38 = u11.LocalPlayer:GetAttribute("Team")
        if v38 == 0 or (v38 ~= v38 or not v38) then
            return nil
        end
        if not u7.Controllers.TeamController:getTeamById((tostring(v38))) then
            return nil
        end
        local v39 = v37 * Vector3.new(0, 0, 0)
        local v40 = 0
        local v41 = {}
        for v42, v43 in u22.getEntitiesWithinRadius(v39, u18.WAND_TARGETTING_RANGE) do
            local _ = v42 - 1
            local v44 = u11:GetPlayerFromCharacter(v43:getInstance())
            local v45 = v44 and not v44:HasTag("PlayerHidden")
            if v45 then
                v45 = v44:GetAttribute("Team") == v38
            end
            if v45 == true then
                v40 = v40 + 1
                v41[v40] = v43
            end
        end
        local u46 = Ray.new(v37.Position, v37.LookVector).Unit
        local v47 = nil
        if u33.itemType == u19.VILLAIN_PROTECTOR_WAND then
            for _, v48 in v41 do
                local v49 = u11:GetPlayerFromCharacter(v48:getInstance())
                if v49 == u11.LocalPlayer then
                    v47 = v48:getInstance()
                    if v49:GetAttribute("WandHealing") == true and v49:GetAttribute("WandBubbleProtect") == true then
                        v47 = nil
                    end
                    break
                end
            end
            if u31.wandTargetEntity ~= v47 then
                u31:removeTarget(u31.wandTargetIconTree, u31.wandTargetEntity)
                if v47 then
                    local v50 = {
                        ["icon"] = u34,
                        ["iconColor"] = u35,
                        ["iconSize"] = u36,
                        ["hideIconFirstPerson"] = u31:getPerspectiveCam() == 0 and true or false
                    }
                    u31.wandTargetIconTree = u9.mount(u9.createElement(u24, v50), v47.PrimaryPart)
                end
            end
            u31.wandTargetEntity = v47
        end
        if u33.itemType == u19.HERO_PROTECTOR_WAND then
            table.sort(v41, function(p51, p52) --[[ Line: 134 ]]
                --[[
                Upvalues:
                    [1] = u46
                --]]
                local v53 = p51:getInstance():GetPivot().Position
                local v54 = u46:ClosestPoint(v53)
                local v55 = (v53 - v54).Magnitude
                local v56 = (u46.Origin - v54).Magnitude
                local v57 = p52:getInstance():GetPivot().Position
                local v58 = u46:ClosestPoint(v57)
                local v59 = (v57 - v58).Magnitude
                local v60 = (u46.Origin - v58).Magnitude
                return v55 + v56 / 3 < v59 + v60 / 3
            end)
            for _, v61 in v41 do
                if v61:getPlayer() ~= u11.LocalPlayer then
                    local v62 = v61:getInstance():GetPivot().Position
                    if (v62 - v37.Position):Dot(v37.LookVector) >= 0 then
                        local v63 = u11.LocalPlayer.Character
                        if v63 ~= nil then
                            v63 = v63.PrimaryPart
                            if v63 ~= nil then
                                v63 = v63.Position
                            end
                        end
                        if (v62 - u46:ClosestPoint(v62)).Magnitude <= u18.WAND_TARGETTING_RANGE and v63 then
                            v47 = v61:getInstance()
                            local v64 = u11:GetPlayerFromCharacter(v47)
                            if not v64 then
                                return nil
                            end
                            if v64:GetAttribute("WandHealing") == true and v64:GetAttribute("WandBubbleProtect") == true then
                                v47 = nil
                            end
                            break
                        end
                    end
                end
            end
            if u31.wandTargetEntity ~= v47 then
                u31:removeTarget(u31.wandTargetIconTree, u31.wandTargetEntity)
                if v47 then
                    local v65 = {
                        ["hideIconFirstPerson"] = false,
                        ["icon"] = u34,
                        ["iconColor"] = u35,
                        ["iconSize"] = u36
                    }
                    u31.wandTargetIconTree = u9.mount(u9.createElement(u24, v65), v47.PrimaryPart)
                end
            end
            u31.wandTargetEntity = v47
        end
    end))
end
function v25.getPerspectiveCam(_) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7.Controllers.CameraPerspectiveController:getCameraPerspective()
end
function v25.endAutoTargeting(p66, p67) --[[ Line: 210 ]]
    if p67 then
        p66:removeTarget(p66.wandTargetIconTree, p66.wandTargetEntity)
        p67:DoCleaning()
    end
end
function v25.removeTarget(p68, p69, p70) --[[ Line: 216 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    p68.wandTargetIconTree = p69
    p68.wandTargetEntity = p70
    if p68.wandTargetEntity then
        p68.wandTargetEntity = nil
    end
    if p68.wandTargetIconTree then
        u9.unmount(p68.wandTargetIconTree)
    end
end
function v25.helperPlayerTreeCheck(_, u71, p72) --[[ Line: 226 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v73 = u71 and p72
    if v73 ~= 0 and (v73 == v73 and v73) then
        task.delay(p72, function() --[[ Line: 229 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u71
            --]]
            u9.unmount(u71)
        end)
    end
end
function v25.castToTarget(p74, p75, p76, p77, u78, p79, p80, p81) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u23
        [4] = u15
        [5] = u20
        [6] = u8
        [7] = u2
        [8] = u6
    --]]
    local v82 = u11:GetPlayerFromCharacter(p74.wandTargetEntity)
    if not v82 then
        if p81 then
            u9.unmount(p81)
        end
        p74:helperPlayerTreeCheck(u9.mount(u9.createElement(u23, {
            ["HelperText"] = "No Teammate Nearby!"
        }), u11.LocalPlayer:WaitForChild("PlayerGui")), 3)
        return nil
    end
    local v83 = v82.UserId
    local v84
    if p76 == u15.VILLAIN_WAND_HEAL or p76 == u15.HERO_WAND_HEAL then
        v84 = u20.Client:Get("WandHealPlayer"):CallServer({
            ["targetPlayerUserId"] = v83,
            ["handItem"] = p75
        })
        local v85
        if u78 then
            if p79 == 0 or p79 ~= p79 then
                v85 = p79
            elseif p79 then
                v85 = p80
            else
                v85 = p79
            end
        else
            v85 = u78
        end
        if v85 ~= 0 and (v85 == v85 and v85) then
            local v86 = nil
            if v86 then
                v86:DoCleaning()
            end
            local u87 = u8.new()
            u87:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u78))
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u78, p79, {
                ["cooldownBar"] = {
                    ["color"] = p80
                }
            })
            u87:GiveTask(function() --[[ Line: 272 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u78
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(u78)
            end)
            task.delay(p79, function() --[[ Line: 275 ]]
                --[[
                Upvalues:
                    [1] = u87
                --]]
                if u87 then
                    u87:DoCleaning()
                    u87 = nil
                end
            end)
        end
    else
        v84 = false
    end
    if p76 == u15.VILLAIN_WAND_BUBBLE or p76 == u15.HERO_WAND_BUBBLE then
        v84 = u20.Client:Get("WandBubbleProtection"):CallServer({
            ["targetPlayerUserId"] = v83,
            ["handItem"] = p75
        })
    end
    if v84 then
        u6:playSound(p77, {
            ["position"] = nil,
            ["volumeMultiplier"] = 0.75
        })
    end
    p74:playCastAnimation()
end
function v25.playCastAnimation(_) --[[ Line: 298 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u17
        [4] = u16
    --]]
    u4:playAnimation(u11.LocalPlayer, u17:getAssetId(u16.WAND_CAST))
end
function v25.setUpAnimations(p88) --[[ Line: 303 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u17
        [4] = u16
    --]]
    local u89 = u11.LocalPlayer
    local v90 = u89.Character
    if not v90 then
        return nil
    end
    local u91 = v90.Humanoid
    local u92 = false
    local u93 = u4:playAnimation(u89, u17:getAssetId(u16.WAND_IDLE))
    p88.animationMaid:GiveTask(function() --[[ Line: 313 ]]
        --[[
        Upvalues:
            [1] = u93
        --]]
        local v94 = u93
        if v94 ~= nil then
            v94:Stop()
        end
        local v95 = u93
        if v95 ~= nil then
            v95:Destroy()
        end
    end)
    p88.animationMaid:GiveTask(u91:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 323 ]]
        --[[
        Upvalues:
            [1] = u91
            [2] = u92
            [3] = u93
            [4] = u4
            [5] = u89
            [6] = u17
            [7] = u16
        --]]
        if u91.MoveDirection.Magnitude > 0 and (u91:GetState() == Enum.HumanoidStateType.Running and not u92) then
            local v96 = u93
            if v96 ~= nil then
                v96:Stop()
            end
            local v97 = u93
            if v97 ~= nil then
                v97:Destroy()
            end
            u92 = true
        end
        if u91.MoveDirection.Magnitude == 0 and u91:GetState() == Enum.HumanoidStateType.Running then
            u92 = false
            local v98 = u93
            if v98 ~= nil then
                v98:Stop()
            end
            local v99 = u93
            if v99 ~= nil then
                v99:Destroy()
            end
            u92 = false
            u93 = u4:playAnimation(u89, u17:getAssetId(u16.WAND_IDLE))
        end
    end))
end
function v25.cleanUpAnimations(p100) --[[ Line: 350 ]]
    p100.animationMaid:DoCleaning()
end
function v25.onEnable(_, _, _) --[[ Line: 353 ]] end
function v25.onDisable(_) --[[ Line: 355 ]] end
return {
    ["ProtectorWandController"] = v25
}