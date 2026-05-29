local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.ColorUtil
local u6 = v3.SoundManager
local u7 = v3.WatchCharacter
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "gun-blade-balance").GunBladeUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "GunBladeController"
    end,
    ["__index"] = u17
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
        [1] = u17
        [2] = u9
    --]]
    u17.constructor(p37)
    p37.Name = "GunBladeController"
    p37.modelMap = {}
    p37.maidMap = {}
    p37.animationMaid = u9.new()
    p37.shootRaycastParams = nil
end
function u34.KnitStart(u38) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u29
        [3] = u13
        [4] = u22
        [5] = u16
        [6] = u18
        [7] = u28
        [8] = u30
        [9] = u6
        [10] = u14
        [11] = u15
        [12] = u7
        [13] = u8
    --]]
    u17.KnitStart(u38)
    u29.HandItemRendered:connect(function(p39) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u22
            [3] = u38
        --]]
        local v40 = u13:GetPlayerFromCharacter(p39.entity)
        if v40 and v40 ~= u13.LocalPlayer then
            if u22:isGunBlade(p39.itemType) then
                u38:equip(v40, p39.itemType)
            else
                u38:unequip(v40)
            end
        else
            return nil
        end
    end)
    u16.AbilityUsed:connect(function(p41) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u13
            [3] = u38
        --]]
        if p41.ability == u18.HAND_GUN and p41.userCharacter == u13.LocalPlayer.Character then
            u38:fire()
        end
    end)
    u28.Client:Get("HandGunFireEffect"):Connect(function(p42) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u13
            [3] = u30
            [4] = u6
            [5] = u14
            [6] = u15
        --]]
        local v43 = u38:getSkinMeta(p42.user)
        if p42.user ~= u13.LocalPlayer then
            local v44
            if v43 == nil then
                v44 = v43
            else
                v44 = v43.gunblade
                if v44 ~= nil then
                    v44 = v44.gunFireSound
                end
            end
            if v44 == "" or not v44 then
                v44 = u30.GUN_BLADE_SHOT
            end
            u6:playSound(v44, {
                ["position"] = p42.position
            })
        end
        local v45 = u14.Assets.Effects.GunFireEffect
        if v43 ~= nil then
            v43 = v43.gunblade
            if v43 ~= nil then
                v43 = v43.gunFireEffect
            end
        end
        local u46 = (v43 or v45):Clone()
        local v47 = p42.position
        local v48 = p42.position
        local v49 = p42.direction.Unit * 10
        u46:PivotTo(CFrame.new(v47, v48 + v49))
        u46.Parent = u15
        for v50, v51 in u46:GetDescendants() do
            local _ = v50 - 1
            if v51:IsA("ParticleEmitter") then
                v51:Emit(20)
            end
        end
        task.delay(0.5, function() --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u46
            --]]
            u46:Destroy()
        end)
    end)
    u7(function(u52, u53) --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u38
            [3] = u8
        --]]
        local v54 = u13.LocalPlayer.UserId
        local v55 = math.abs(v54)
        u53:GetAttributeChangedSignal(tostring(v55) .. "HandGunMarked"):Connect(function() --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u13
                [3] = u38
                [4] = u52
            --]]
            local v56 = u53
            local v57 = u13.LocalPlayer.UserId
            local v58 = math.abs(v57)
            local v59 = v56:GetAttribute(tostring(v58) .. "HandGunMarked")
            if v59 == 0 or (v59 ~= v59 or (v59 == "" or not v59)) then
                u38:clearMark(u52)
            else
                u38:createMark(u52)
            end
        end)
        u53:GetAttributeChangedSignal("HandGunSpeed"):Connect(function() --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u13
                [3] = u52
                [4] = u38
                [5] = u8
            --]]
            if u53:GetAttribute("HandGunSpeed") == nil then
                if u13.LocalPlayer == u52 and u38.speedMaid then
                    u38.speedMaid:Destroy()
                    u38.speedMaid = nil
                end
            elseif u13.LocalPlayer == u52 then
                local v60 = u38.speedMaid
                if v60 ~= nil then
                    v60:Destroy()
                end
                u38.speedMaid = nil
                u38.speedMaid = u8.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["blockSprint"] = false,
                    ["moveSpeedMultiplier"] = 1.2
                })
                return
            end
        end)
    end)
end
function u34.isRelevantItem(_, p61) --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    return u22:isGunBlade(p61.itemType)
end
function u34.onEnable(p62, p63, _) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u2
        [3] = u18
        [4] = u19
    --]]
    p62:equip(u13.LocalPlayer, p63.itemType)
    p62:setUpAnimation()
    p62:setupDestroyableYield(function() --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u18
            [3] = u19
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u18.HAND_GUN, u19[u18.HAND_GUN].triggerConfig):expect()
    end)
end
function u34.onDisable(p64) --[[ Line: 168 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    p64:unequip(u13.LocalPlayer)
    p64:cleanUpAnimation()
end
function u34.equip(p65, p66, p67) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u27
        [3] = u33
        [4] = u9
    --]]
    p65:unequip(p66)
    local v68 = u14.Assets.Effects.WoodHandGun
    local v69 = p65:getSkinMeta(p66)
    local v70
    if v69 == nil then
        v70 = v69
    else
        v70 = v69.gunblade
        if v70 ~= nil then
            v70 = v70.handGunModel
        end
    end
    if v70 then
        if p67 == u27.IRON_GUN_BLADE then
            v68 = v69.gunblade.handGunModel.iron
        elseif p67 == u27.STONE_GUN_BLADE then
            v68 = v69.gunblade.handGunModel.stone
        elseif p67 == u27.DIAMOND_GUN_BLADE then
            v68 = v69.gunblade.handGunModel.diamond
        elseif p67 == u27.EMERALD_GUN_BLADE then
            v68 = v69.gunblade.handGunModel.emerald
        else
            v68 = v69.gunblade.handGunModel.wood
        end
    elseif p67 == u27.IRON_GUN_BLADE then
        v68 = u14.Assets.Effects.IronHandGun
    elseif p67 == u27.STONE_GUN_BLADE then
        v68 = u14.Assets.Effects.StoneHandGun
    elseif p67 == u27.DIAMOND_GUN_BLADE then
        v68 = u14.Assets.Effects.DiamondHandGun
    elseif p67 == u27.EMERALD_GUN_BLADE then
        v68 = u14.Assets.Effects.EmeraldHandGun
    end
    local v71 = v68:Clone()
    if v71 and p66.Character then
        for v72, v73 in v71:GetDescendants() do
            local _ = v72 - 1
            v73:SetAttribute("VisibleInViewmodel", true)
        end
        v71.Parent = p66.Character
        u33:weldAccessory(p66.Character, v71)
        local v74 = u9.new()
        v74:GiveTask(v71)
        p65.modelMap[p66] = v74
    end
end
function u34.unequip(p75, p76) --[[ Line: 229 ]]
    local v77 = p75.modelMap[p76]
    if v77 ~= nil then
        v77:DoCleaning()
    end
end
function u34.fire(p78) --[[ Line: 237 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
        [3] = u8
        [4] = u20
        [5] = u28
        [6] = u4
        [7] = u21
        [8] = u30
        [9] = u6
        [10] = u24
        [11] = u32
        [12] = u31
        [13] = u23
    --]]
    local v79 = u15.CurrentCamera
    local v80
    if v79 == nil then
        v80 = v79
    else
        v80 = v79.CFrame.LookVector.Unit
    end
    if not v80 then
        return nil
    end
    local v81 = u13.LocalPlayer.Character
    if v81 ~= nil then
        v81 = v81.PrimaryPart
    end
    if not v81 then
        return nil
    end
    u8.Controllers.ViewmodelController:playAnimation(u20.GAUNTLETS_JAB_1ST)
    local v82 = v81.AssemblyMass
    if not u28.Client:Get("HandGunFireRequest"):CallServer({
        ["lookVector"] = v80
    }) then
        return nil
    end
    u4:playAnimation(u13.LocalPlayer, u21:getAssetId(u20.GUN_BLADE_FIRE), {
        ["fadeSamePriorityTracks"] = false,
        ["looped"] = false
    })
    local v83 = p78:getSkinMeta(u13.LocalPlayer)
    if v83 ~= nil then
        v83 = v83.gunblade
        if v83 ~= nil then
            v83 = v83.gunFireSound
        end
    end
    if v83 == "" or not v83 then
        v83 = u30.GUN_BLADE_SHOT
    end
    u6:playSound(v83)
    local v84 = v81.Position
    local v85 = v81.Position
    local v86 = v79.CFrame.LookVector
    v81.CFrame = CFrame.new(v84, v85 + v86 * Vector3.new(1, 0, 1))
    local v87 = u24:getLocalPlayerEntity()
    local v88 = false
    if v87 and not u32:getActive(v87:getInstance(), u31.GROUNDED) then
        if not p78.shootRaycastParams then
            p78.shootRaycastParams = RaycastParams.new()
            p78.shootRaycastParams.FilterDescendantsInstances = { u15:FindFirstChild("Map"), u15:FindFirstChild("Lobby"), u15.Terrain }
            p78.shootRaycastParams.FilterType = Enum.RaycastFilterType.Include
        end
        local v89 = v87:getInstance()
        local v90 = v87:getInstance():GetPivot().Position
        local v91 = (v89:GetExtentsSize() / 2).Y
        local v92 = not u15:Raycast(v90 - Vector3.new(0, v91, 0), Vector3.new(0, -3, 0), p78.shootRaycastParams) and true or v88
        u23.applyKnockbackPlatformStand(v81)
        v81:ApplyImpulse(v80 * (v82 * (v92 and 80 or 20) * -1))
    end
end
function u34.createMark(p93, p94) --[[ Line: 311 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u26
        [3] = u5
        [4] = u24
        [5] = u13
        [6] = u12
        [7] = u9
    --]]
    p93:clearMark(p94)
    local v95 = p94.Character
    if not v95 then
        return nil
    end
    local v96 = u10
    local v97 = {
        ["ResetOnSpawn"] = false,
        ["AlwaysOnTop"] = true,
        ["Parent"] = v95.PrimaryPart,
        ["Size"] = UDim2.fromScale(3, 3),
        ["Children"] = { u10("ImageLabel", {
                ["ImageTransparency"] = 0.25,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.new(1.5, 0, 1.5, 0),
                ["Image"] = u26.GUN_BLADE_MARK,
                ["ImageColor3"] = u5.WHITE
            }) }
    }
    local v98 = v96("BillboardGui", v97)
    local v99 = u24:getPlayerFromEntityInstance(v95)
    if v99 and v99 == u13.LocalPlayer then
        u12:AddTag(v98, "FirstPersonHidden")
    end
    local v100 = u9.new()
    v100:GiveTask(v98)
    p93.maidMap[p94] = v100
end
function u34.clearMark(p101, p102) --[[ Line: 342 ]]
    local v103 = p101.maidMap[p102]
    if v103 ~= nil then
        v103:DoCleaning()
    end
end
function u34.getSkin(_, p104) --[[ Line: 350 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v105
    if p104.Character then
        v105 = u8.Controllers.KitSkinController:getKitSkin(p104.Character)
    else
        v105 = nil
    end
    return v105
end
function u34.getSkinMeta(p106, p107) --[[ Line: 357 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v108 = p106:getSkin(p107)
    if v108 then
        return u25[v108]
    else
        return nil
    end
end
function u34.setUpAnimation(p109) --[[ Line: 364 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
        [3] = u21
        [4] = u20
    --]]
    local u110 = u13.LocalPlayer
    local v111 = u110.Character
    if not v111 then
        return nil
    end
    local u112 = v111.Humanoid
    local u113 = false
    local u114 = nil
    p109.animationMaid:GiveTask(function() --[[ Line: 373 ]]
        --[[
        Upvalues:
            [1] = u114
        --]]
        local v115 = u114
        if v115 ~= nil then
            v115:Stop()
        end
        local v116 = u114
        if v116 ~= nil then
            v116:Destroy()
        end
    end)
    p109.animationMaid:GiveTask(u112:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 383 ]]
        --[[
        Upvalues:
            [1] = u112
            [2] = u113
            [3] = u114
            [4] = u4
            [5] = u110
            [6] = u21
            [7] = u20
        --]]
        if u112.MoveDirection.Magnitude > 0 and (u112:GetState() == Enum.HumanoidStateType.Running and not u113) then
            local v117 = u114
            if v117 ~= nil then
                v117:Stop()
            end
            local v118 = u114
            if v118 ~= nil then
                v118:Destroy()
            end
            u114 = u4:playAnimation(u110, u21:getAssetId(u20.GUN_BLADE_RUN), {
                ["fadeSamePriorityTracks"] = false
            })
            u113 = true
        end
        if u112.MoveDirection.Magnitude == 0 and u112:GetState() == Enum.HumanoidStateType.Running then
            u113 = false
            local v119 = u114
            if v119 ~= nil then
                v119:Stop()
            end
            local v120 = u114
            if v120 ~= nil then
                v120:Destroy()
            end
            u113 = false
            u114 = u4:playAnimation(u110, u21:getAssetId(u20.GUN_BLADE_IDLE), {
                ["fadeSamePriorityTracks"] = false
            })
        end
    end))
end
function u34.cleanUpAnimation(p121) --[[ Line: 415 ]]
    p121.animationMaid:DoCleaning()
end
u8.CreateController(u34.new())
return nil