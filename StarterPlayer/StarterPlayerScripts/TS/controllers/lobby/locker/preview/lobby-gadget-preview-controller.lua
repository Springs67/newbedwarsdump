local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.RunService
local u8 = v6.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balloon", "balloon-util").BalloonUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-meta").PetMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-meta").VehicleMeta
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "LobbyGadgetPreviewController"
    end,
    ["__index"] = u9
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p24)
    p24.Name = "LobbyGadgetPreviewController"
end
function u21.KnitStart(p25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p25)
end
function u21.previewLobbyGadget(p26, p27, u28, p29) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
        [3] = u3
        [4] = u13
        [5] = u11
        [6] = u17
        [7] = u10
    --]]
    local u30 = u4.new()
    local v31 = u16[p27]
    local v32 = u3.Controllers.LockerPreviewController
    local v33 = v31.preview
    if v33 ~= nil then
        v33 = v33.customAngle
    end
    if v33 == nil then
        v33 = CFrame.Angles(0, 4.101523742186674, 0)
    end
    v32:setPreviewAngle(v33)
    if p29 ~= nil then
        p29:unequipArmorSlot(u13.HELMET)
    end
    if p29 ~= nil then
        p29:unequipArmorSlot(u13.CHESTPLATE)
    end
    if p29 ~= nil then
        p29:unequipArmorSlot(u13.BOOTS)
    end
    if p29 ~= nil then
        p29:unequipItemInHand()
    end
    if p29 ~= nil then
        p29:unequipBackpackSlot()
    end
    local u34 = u28:FindFirstChild("HumanoidRootPart")
    if u28 ~= nil then
        u28:PivotTo(CFrame.new(u3.Controllers.LockerPreviewController:getPreviewDummyPosition()))
    end
    u30:GiveTask(function() --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u3
        --]]
        local v35 = u28
        if v35 ~= nil then
            v35 = v35:PivotTo(u3.Controllers.LockerPreviewController:getBackstageWorldPosition())
        end
        return v35
    end)
    local v36 = u11:getAnimationFromCharacter(u28, "idle")
    if v36 then
        u28.Humanoid.Animator:LoadAnimation(v36):Play()
    end
    if v31.items and not v31.vehicle then
        u30:GiveTask(p26:previewLobbyGadgetItem(u28, p29, v31))
    end
    if v31.pet then
        u30:GiveTask(p26:previewLobbyGadgetPet(v31.pet, u28))
    end
    if v31.mount then
        u30:GiveTask(p26:previewLobbyGadgetMount(v31.mount, u28))
    end
    if v31.vehicle then
        u30:GiveTask(p26:previewLobbyGadgetVehicle(v31.vehicle, u28, u34))
    end
    if p27 == u17.ANGEL_WINGS then
        u34.Anchored = false
        local v37 = u3.Controllers.AngelWingsBackpackController:getAngelWingType()
        u3.Controllers.AngelWingsBackpackController:equipCharacter(u28, v37, true):andThen(function(p38) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u34
            --]]
            u30:GiveTask(p38)
            u30:GiveTask(function() --[[ Line: 118 ]]
                --[[
                Upvalues:
                    [1] = u34
                --]]
                u34.Anchored = true
                return u34.Anchored
            end)
        end)
        return u30
    elseif p27 == u17.CLOAK then
        u30:GiveTask(u3.Controllers.CloakLobbyGadgetController:equipCharacter(u28))
        return u30
    else
        if p27 == u17.POGO_STICK then
            local u39 = u11:playAnimation(u28, u10.POGO_STICK_MOUNT, {
                ["looped"] = true
            })
            if u39 then
                u39.Priority = Enum.AnimationPriority.Action4
            end
            if u39 ~= nil then
                u39:GetMarkerReachedSignal("Pause"):Once(function() --[[ Line: 134 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                    --]]
                    return u39:AdjustSpeed(0)
                end)
            end
            u30:GiveTask(function() --[[ Line: 138 ]]
                --[[
                Upvalues:
                    [1] = u39
                --]]
                local v40 = u39
                if v40 ~= nil then
                    v40:Stop()
                end
                local v41 = u39
                if v41 ~= nil then
                    v41:Destroy()
                end
            end)
            local u42 = u28.Humanoid
            if u42 then
                u30:GiveTask(function() --[[ Line: 151 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                    --]]
                    local v43 = u42
                    v43.HipHeight = v43.HipHeight - 1.3
                end)
                u42.HipHeight = u42.HipHeight + 1.3
                return u30
            end
        elseif p27 == u17.VIP_HOVER_BOARD then
            u30:GiveTask(u3.Controllers.VipHoverboardController:mountHoverboard(u28))
        end
        return u30
    end
end
function u21.setIdleAnimation(_, p44, p45, p46) --[[ Line: 161 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local u47 = u11:playAnimation(p45, p44, {
        ["looped"] = true
    })
    p46:GiveTask(function() --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        local v48 = u47
        if v48 ~= nil then
            v48 = v48:Stop()
        end
        return v48
    end)
end
function u21.previewLobbyGadgetItem(u49, u50, u51, u52) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u14
        [3] = u15
        [4] = u12
        [5] = u3
    --]]
    local u53 = u4.new()
    local function v69(p54) --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u15
            [3] = u51
            [4] = u52
            [5] = u49
            [6] = u50
            [7] = u53
            [8] = u12
            [9] = u3
        --]]
        local v55 = u14(p54)
        local v56 = u15.createItemInstance(p54)
        if v55.armor then
            local v57 = u51
            if v57 ~= nil then
                v57:equipArmorItem(v56, v55.armor.slot)
            end
        else
            local v58 = u52.preview
            if v58 ~= nil then
                v58 = v58.hideItemInHand
            end
            if not v58 then
                local v59 = u51
                if v59 ~= nil then
                    v59:equipItem(v56)
                end
            end
        end
        local v60 = u52.preview
        if v60 ~= nil then
            v60 = v60.disableIdleAnimation
        end
        if not v60 then
            local v61 = u52.preview
            if v61 ~= nil then
                v61 = v61.idleAnimation
            end
            if v61 == 0 or (v61 ~= v61 or not v61) then
                local v62 = v55.sword
                if v62 ~= nil then
                    v62 = v62.idleAnimation
                end
                if v62 ~= 0 and (v62 == v62 and v62) then
                    u49:setIdleAnimation(v55.sword.idleAnimation, u50, u53)
                end
                local v63 = v55.thirdPerson
                if v63 ~= nil then
                    v63 = v63.holdAnimation
                end
                if v63 ~= 0 and (v63 == v63 and v63) then
                    u49:setIdleAnimation(v55.thirdPerson.holdAnimation, u50, u53)
                end
                local v64 = v55.projectileSource
                if v64 ~= nil then
                    v64 = v64.thirdPerson
                    if v64 ~= nil then
                        v64 = v64.aimAnimation
                    end
                end
                if v64 ~= 0 and (v64 == v64 and v64) then
                    local v65 = u49
                    local v66 = v55.projectileSource
                    if v66 ~= nil then
                        v66 = v66.thirdPerson
                        if v66 ~= nil then
                            v66 = v66.aimAnimation
                        end
                    end
                    v65:setIdleAnimation(v66, u50, u53)
                end
            else
                u49:setIdleAnimation(u52.preview.idleAnimation, u50, u53)
            end
        end
        if v55.balloon then
            local v67 = false
            local v68 = 0
            while true do
                if true then
                    if v67 then
                        v68 = v68 + 1
                    else
                        v67 = true
                    end
                end
                if v68 >= u12.MAX_INFLATED_BALLOONS then
                    break
                end
                u53:GiveTask((u3.Controllers.BalloonController:inflateBalloonFromCharacter(u50)))
            end
        end
    end
    local v70 = u52.preview
    if v70 ~= nil then
        v70 = v70.featuredItem
    end
    if v70 then
        v69(u52.preview.featuredItem)
        return u53
    else
        if u52.items then
            for _, v71 in u52.items do
                v69(v71.itemType)
            end
        end
        return u53
    end
end
function u21.previewLobbyGadgetPet(_, p72, p73) --[[ Line: 273 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u19
        [3] = u8
        [4] = u3
        [5] = u2
        [6] = u11
    --]]
    local v74 = u4.new()
    p73:PivotTo(p73:GetPivot() + Vector3.new(1.5, 0, -1.5))
    local v75 = u19[p72]
    local v76 = v75.model:Clone()
    v76.Parent = u8
    v76:PivotTo(CFrame.new(u3.Controllers.LockerPreviewController:getPreviewDummyPosition()))
    local v77 = v75.scaleMultiplier
    if v77 ~= 0 and (v77 == v77 and v77) then
        v76:ScaleTo(v75.scaleMultiplier * v76:GetScale())
    end
    if v76.PrimaryPart then
        v76.PrimaryPart.Anchored = true
    end
    v74:GiveTask(v76)
    local v78 = -p73.Humanoid.HipHeight - v76:GetExtentsSize().Y / 2
    local v79 = v75.heightOffset
    local v80 = v78 + (v79 == nil and 0 or v79)
    local v81 = v75.spawnHeightOffset
    local v82 = v81 == nil and 0 or v81
    local v83 = CFrame.new(-3, v80 + v82, 3)
    v76:PivotTo(p73:GetPivot() * v83)
    local v84 = v76:FindFirstChildWhichIsA("Animator", true)
    if v84 then
        u2:playAnimation(v84, u11:getAssetId(v75.animations.idle), {
            ["looped"] = true
        })
        v74:GiveTask(u3.Controllers.PetController:setupPetPassiveAnims(v75, v84))
    end
    return v74
end
function u21.previewLobbyGadgetMount(_, p85, u86) --[[ Line: 313 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u18
        [3] = u3
        [4] = u11
        [5] = u10
        [6] = u7
    --]]
    local v87 = u4.new()
    local u88 = u18[p85]
    local u89 = u3.Controllers.MountController:weldMountToCharacter(p85, u86)
    local u90 = u86.Humanoid.Animator:LoadAnimation(u11:getAnimation(u10.SIT_ON_DODO_BIRD))
    u90.Priority = Enum.AnimationPriority.Movement
    u90:Play()
    v87:GiveTask(function() --[[ Line: 320 ]]
        --[[
        Upvalues:
            [1] = u86
            [2] = u89
            [3] = u88
            [4] = u90
        --]]
        local v91 = u86
        if v91 then
            v91 = u89
            if v91 ~= nil then
                v91 = v91.PrimaryPart
            end
        end
        if v91 then
            local v92 = u88.mountHipYOffset
            if v92 == nil then
                v92 = u89.PrimaryPart.Size.Y / 2 - 0.1
            end
            local v93 = u86.Humanoid
            v93.HipHeight = v93.HipHeight - v92
        end
        local v94 = u89
        if v94 ~= nil then
            v94:Destroy()
        end
        u90:Stop()
    end)
    if u89 then
        v87:GiveTask((u7.Stepped:Connect(function() --[[ Line: 343 ]]
            --[[
            Upvalues:
                [1] = u86
                [2] = u3
                [3] = u89
                [4] = u88
            --]]
            if u86 then
                u3.Controllers.MountSittingController:performStep(u89, u88, u86)
            end
        end)))
        u3.Controllers.MountAnimationController:playAnimationInMount(u89, u88.animations.idle, 1, true)
    end
    return v87
end
function u21.previewLobbyGadgetVehicle(_, p95, p96, u97) --[[ Line: 353 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u20
        [3] = u3
        [4] = u8
        [5] = u11
        [6] = u10
        [7] = u5
    --]]
    local v98 = u4.new()
    local v99 = u20[p95]
    local v100 = u3.Controllers.VehicleController:getVehicleModel(p95)
    u97.Anchored = false
    v98:GiveTask(function() --[[ Line: 358 ]]
        --[[
        Upvalues:
            [1] = u97
        --]]
        u97.Anchored = true
        return u97.Anchored
    end)
    if v100 then
        v100.Parent = u8
        v100:PivotTo(p96:GetPivot())
        if v100.PrimaryPart then
            v100.PrimaryPart.Anchored = true
        end
        v98:GiveTask(v100)
        local v101 = v100:FindFirstChild("Driver")
        p96:PivotTo(v101:GetPivot())
        local v102 = p96.Humanoid.Animator
        local v103 = u11
        local v104 = v99.sitAnimation
        if v104 == nil then
            v104 = u10.SIT_ON_DODO_BIRD
        end
        local u105 = v102:LoadAnimation(v103:getAnimation(v104))
        u105.Priority = Enum.AnimationPriority.Movement
        u105:Play()
        v98:GiveTask(function() --[[ Line: 380 ]]
            --[[
            Upvalues:
                [1] = u105
            --]]
            return u105:Stop()
        end)
        local v106 = {}
        local v107 = CFrame.new
        local v108 = v101.Size.Y / 2
        v106.C0 = v107((Vector3.new(0, v108, 0))) * CFrame.Angles(1.5707963267948966, 0, 0)
        v106.C1 = CFrame.new(Vector3.new(0, -1.5, 0)) * CFrame.Angles(1.5707963267948966, 0, 0)
        v106.Part0 = v101
        v106.Part1 = u97
        v106.Parent = v101
        u5("Weld", v106)
    end
    return v98
end
u3.CreateController(u21.new())
return nil