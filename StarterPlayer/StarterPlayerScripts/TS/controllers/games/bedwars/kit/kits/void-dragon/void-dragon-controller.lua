local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.GameQueryUtil
local u7 = v3.RandomUtil
local u8 = v3.SoundManager
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.ContextActionService
local u15 = v12.Players
local u16 = v12.ReplicatedStorage
local u17 = v12.RunService
local u18 = v12.UserInputService
local u19 = v12.Workspace
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp
local u22 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-dragon-balance").VoidDragonBalance
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "void-dragon", "void-dragon-const").VoidDragonActions
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u33 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u34 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u35 = u1.import(script, script.Parent, "ui", "void-dragon-ui").VoidDragonUi
local u36 = { u32.XUROT_FLAP_WING_1, u32.XUROT_FLAP_WING_2 }
local u37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
        return "VoidDragonController"
    end,
    ["__index"] = u34
})
u37.__index = u37
function u37.new(...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v38 = u37
    local v39 = setmetatable({}, v38)
    return v39:constructor(...) or v39
end
function u37.constructor(p40) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u27
        [3] = u24
        [4] = u32
        [5] = u10
        [6] = u5
    --]]
    u34.constructor(p40, u27.VOID_DRAGON, {
        ["animations"] = {
            u24.VOID_DRAGON_WINGS_FLAP,
            u24.VOID_DRAGON_GLIDE,
            u24.VOID_DRAGON_WING_TRANSFORM,
            u24.VOID_DRAGON_BREATH,
            u24.VOID_DRAGON_IDLE,
            u24.VOID_DRAGON_RUNNING,
            u24.VOID_DRAGON_FLYING,
            u24.VOID_DRAGON_TRANSFORM
        },
        ["sounds"] = {
            u32.XUROT_BREATH,
            u32.XUROT_FLAP_WING_1,
            u32.XUROT_FLAP_WING_2,
            u32.XUROT_TRANSFORM
        }
    })
    p40.Name = "VoidDragonController"
    p40.jumpMaid = u10.new()
    p40.inDragonForm = false
    p40.abilityMaid = u10.new()
    p40.SpeedMaid = u10.new()
    p40.YTargetOffset = u5.isMobileControls() and 0.25 or 0.05
    p40.jumpReadyTime = -1
    p40.startHoldingTime = 0
    p40.targetingMaid = u10.new()
    p40.isHolding = false
    p40.breathReadyTime = -1
end
function u37.onKitLocalActivated(u41, u42) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u15
        [3] = u2
        [4] = u21
        [5] = u35
        [6] = u14
        [7] = u1
        [8] = u18
        [9] = u17
        [10] = u22
        [11] = u20
    --]]
    local v43 = {
        ["VoidDragonActive"] = function() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u41
                [3] = u15
            --]]
            if u31.Client:Get("VoidDragonActive"):CallServer() then
                u41:voidDragonActive(u15.LocalPlayer)
            end
        end
    }
    local v44 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u21(u35, v43))
    u14:BindAction("Dragon Transform", function(_, _, _) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u41
            [3] = u15
        --]]
        if u31.Client:Get("VoidDragonActive"):CallServer() then
            u41:voidDragonActive(u15.LocalPlayer)
        end
    end, false, Enum.KeyCode.V)
    u42:GiveTask(v44)
    local u45 = -1
    u42:GiveTask((task.spawn(function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u41
        --]]
        while true do
            local v46 = task.wait(0.5)
            if v46 == 0 or (v46 ~= v46 or not v46) then
                break
            end
            u1.Promise.defer(function() --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                u41:antiGravityDecay()
            end)
        end
    end)))
    u42:GiveTask(u18.InputBegan:Connect(function(p47, _) --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u17
        --]]
        if u41:validInput(p47) and u41.inDragonForm then
            u41.startHoldingTime = time()
            u41.isHolding = true
            local u48 = nil
            u48 = u17.Heartbeat:Connect(function(_) --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u48
                --]]
                if not u41.isHolding then
                    u41.targetingMaid:DoCleaning()
                    u48:Disconnect()
                end
                if time() - u41.startHoldingTime >= 0.15 then
                    u41:enablePredictor()
                    u48:Disconnect()
                end
            end)
        end
    end))
    u42:GiveTask(u18.InputEnded:Connect(function(p49, _) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u31
            [3] = u15
        --]]
        if u41:validInput(p49) and (u41.inDragonForm and u41.isHolding) then
            u41.isHolding = false
            u41.targetingMaid:DoCleaning()
            local v50
            if time() - u41.startHoldingTime > 0.15 then
                v50 = u41:fireAtMouse()
            else
                v50 = nil
            end
            u31.Client:Get("DragonBreath"):SendToServer({
                ["player"] = u15.LocalPlayer,
                ["targetPoint"] = v50
            })
        end
    end))
    u42:GiveTask(u18.TouchTapInWorld:Connect(function(_, p51) --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u31
            [3] = u15
        --]]
        if not p51 and u41.inDragonForm then
            local v52 = u41:fireAtMouse()
            u31.Client:Get("DragonBreath"):SendToServer({
                ["player"] = u15.LocalPlayer,
                ["targetPoint"] = v52
            })
        end
    end))
    u31.Client:OnEvent("VoidDragonEnergyIncrease", function(p53) --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:dispatch({
            ["type"] = "KitVoidDragonIncrementProgress",
            ["progress"] = p53.incrementProgress / 100
        })
    end):andThen(function(p54) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42:GiveTask(p54)
    end)
    u42:GiveTask((u31.Client:Get("VoidDragonDeactive"):Connect(function() --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41:deactivateDragonForm()
    end)))
    u42:GiveTask(u18.JumpRequest:Connect(function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u15
            [3] = u41
        --]]
        if u45 < time() then
            u45 = time() + 0.15
            local v55 = u15.LocalPlayer.Character
            if (v55.Humanoid:GetState() == Enum.HumanoidStateType.Jumping or v55.Humanoid:GetState() == Enum.HumanoidStateType.Freefall) and u41.inDragonForm then
                u45 = time() + 1
                u41:flapWings()
            end
        end
    end))
    u42:GiveTask(u20.NewHandItem:connect(function(p56) --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        if u41.inDragonForm then
            p56:setCancelled(true)
        end
    end))
    u42:GiveTask((u31.Client:Get("VoidDragonLanded"):Connect(function() --[[ Line: 168 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        u41.jumpReadyTime = time() + 0.1
        u41:clearAllForce()
    end)))
end
function u37.onKitLocalDeactivated(_) --[[ Line: 174 ]] end
function u37.onKitReplicationActivated(u57, p58) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    p58:GiveTask((u31.Client:Get("VoidDragonAction"):Connect(function(p59) --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        u57:animationHandler(p59.player, p59.action, p59.breathTargetPoint)
    end)))
end
function u37.onKitReplicationDeactivated(_) --[[ Line: 182 ]] end
function u37.onInnateAbilityEnabled(_, _, _) --[[ Line: 184 ]] end
function u37.onAbilityUsed(_, p60, p61) --[[ Line: 186 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u23
        [3] = u31
    --]]
    if p60 == u15.LocalPlayer.Character and p61.ability == u23.END_DRAGON then
        u31.Client:Get("VoidDragonExit"):CallServer()
    end
end
function u37.clearAllForce(p62) --[[ Line: 191 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v63 = u15.LocalPlayer.Character
    if v63 then
        local v64 = v63.PrimaryPart
        if v64 ~= nil then
            v64 = v64:FindFirstChild("FlapWingForce")
        end
        if v64 ~= nil then
            v64:Destroy()
        end
        p62.SpeedMaid:DoCleaning()
    end
end
function u37.voidDragonActive(u65, _) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u2
        [3] = u23
        [4] = u28
        [5] = u27
        [6] = u22
        [7] = u30
        [8] = u15
    --]]
    u14:UnbindAction("Dragon Transform")
    u65.inDragonForm = true
    local u66 = nil
    task.delay(3, function() --[[ Line: 211 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u2
            [3] = u23
            [4] = u28
            [5] = u27
            [6] = u66
        --]]
        if u65.inDragonForm then
            local v67 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
            local v68 = u23.END_DRAGON
            local v69 = {}
            local v70 = {}
            local v71 = u28(u27.VOID_DRAGON).renderImage
            v70.icon = v71 == nil and "" or v71
            v69.abilityButton = v70
            v69.abilityType = "KitPrimary"
            u66 = v67:enableAbility(v68, v69):expect()
        end
    end)
    u65.abilityMaid:GiveTask(function() --[[ Line: 229 ]]
        --[[
        Upvalues:
            [1] = u66
        --]]
        local v72 = u66
        if v72 ~= nil then
            v72.Destroy()
        end
    end)
    u22:dispatch({
        ["type"] = "UnequipItemInHand",
        ["equip"] = false
    })
    local v73 = u30.getInventory(u15.LocalPlayer).hand
    if v73 ~= nil then
        v73 = v73.itemType
    end
    if v73 then
        local v74 = u15.LocalPlayer.Character
        if v74 ~= nil then
            local v75 = v74:WaitForChild(v73, 3)
            if v75 ~= nil then
                v75:Destroy()
            end
        end
    end
end
function u37.removeHandItem(_, p76) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v77 = u30.getInventory(p76).hand
    if v77 ~= nil then
        v77 = v77.itemType
    end
    if v77 then
        local v78 = p76.Character
        if v78 ~= nil then
            local v79 = v78:WaitForChild(v77, 3)
            if v79 ~= nil then
                v79:Destroy()
            end
        end
    end
end
function u37.deactivateDragonForm(u80) --[[ Line: 270 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u14
        [3] = u31
        [4] = u15
    --]]
    u80.inDragonForm = false
    u80:clearAllForce()
    u80.jumpMaid:DoCleaning()
    u80.targetingMaid:DoCleaning()
    u80.SpeedMaid:DoCleaning()
    u80.abilityMaid:DoCleaning()
    u22:dispatch({
        ["type"] = "UnequipItemInHand",
        ["equip"] = true
    })
    u14:BindAction("Dragon Transform", function(_, _, _) --[[ Line: 281 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u80
            [3] = u15
        --]]
        if u31.Client:Get("VoidDragonActive"):CallServer() then
            u80:voidDragonActive(u15.LocalPlayer)
        end
    end, false, Enum.KeyCode.V)
end
function u37.flapWings(u81) --[[ Line: 288 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u15
        [3] = u11
        [4] = u19
        [5] = u9
    --]]
    if u81.jumpReadyTime >= time() or not u81.inDragonForm then
        return nil
    end
    if u31.Client:Get("DragonFlap"):CallServer({
        ["player"] = u15.LocalPlayer
    }) == false then
        return nil
    end
    local u82 = u15.LocalPlayer.Character
    if u82 ~= nil then
        u82 = u82.PrimaryPart
    end
    local v83 = u15.LocalPlayer.Character
    if v83 ~= nil then
        v83 = v83:FindFirstChild("Humanoid")
    end
    local v84 = u82.AssemblyMass
    local v85
    if u82 == nil then
        v85 = u82
    else
        v85 = u82:FindFirstChild("FlapWingForce")
    end
    if v85 then
        local v86 = u19.Gravity * v84 * 0.85
        v85.Force = Vector3.new(0, v86, 0)
    else
        local v87 = u11
        local v88 = {
            ["Name"] = "FlapWingForce"
        }
        local v89 = u19.Gravity * v84 * 0.75
        v88.Force = Vector3.new(0, v89, 0)
        v88.Parent = u82
        v85 = v87("BodyForce", v88)
    end
    local v90 = u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["blockSprint"] = true,
        ["constantSpeedMultiplier"] = 1.7
    })
    u81.SpeedMaid:GiveTask(v90)
    u9.Controllers.MobileShiftLockController:enable(false)
    local u91 = time()
    v85:SetAttribute("forceAddedTime", u91)
    local v92 = u82.AssemblyLinearVelocity.Y * v84
    if v83 ~= nil then
        v83 = v83:GetState()
    end
    local v93 = v83 == Enum.HumanoidStateType.Landed and 0 or v92
    if u82 ~= nil then
        local v94 = v84 * 40 - v93
        u82:ApplyImpulse((Vector3.new(0, v94, 0)))
    end
    task.delay(3, function() --[[ Line: 345 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u91
            [3] = u81
            [4] = u31
        --]]
        local v95 = u82
        if v95 ~= nil then
            v95 = v95:FindFirstChild("FlapWingForce")
        end
        local v96
        if v95 == nil then
            v96 = v95
        else
            v96 = v95:GetAttribute("forceAddedTime")
        end
        if v96 == u91 then
            u81.SpeedMaid:DoCleaning()
            u31.Client:Get("VoidDragonEndFlying"):SendToServer()
            if v95 ~= nil then
                v95:Destroy()
            end
        end
    end)
end
function u37.dragonBreathEffect(_, p97, p98) --[[ Line: 365 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
        [3] = u17
    --]]
    local v99 = p97.Character
    if not (v99 and v99.PrimaryPart) then
        return nil
    end
    local u100 = v99:FindFirstChild("Head")
    if not u100 then
        return nil
    end
    local u101 = u16.Assets.Effects.DragonBreath:Clone()
    p98 = p98
    local v102
    if p98 == nil then
        v102 = p98
    else
        v102 = p98 - u100.Position
    end
    local u103
    if p98 then
        u103 = p98 + v102.Unit * 10
    else
        u103 = u100.Position + v99.PrimaryPart.CFrame.LookVector.Unit * 10
    end
    u101:PivotTo(CFrame.lookAt(u100.Position, u103))
    u101.Parent = u19
    local u104 = u17.Heartbeat:Connect(function() --[[ Line: 392 ]]
        --[[
        Upvalues:
            [1] = u101
            [2] = u100
            [3] = u103
        --]]
        u101:PivotTo(CFrame.lookAt(u100.Position, u103))
    end)
    task.delay(0.3, function() --[[ Line: 395 ]]
        --[[
        Upvalues:
            [1] = u101
            [2] = u104
        --]]
        u101:Destroy()
        u104:Disconnect()
    end)
end
function u37.antiGravityDecay(_) --[[ Line: 400 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v105 = u15.LocalPlayer.Character
    if v105 ~= nil then
        v105 = v105.PrimaryPart
        if v105 ~= nil then
            v105 = v105:FindFirstChild("FlapWingForce")
        end
    end
    if v105 then
        v105.Force = v105.Force * Vector3.new(0, 0.93, 0)
    end
end
function u37.animationHandler(p106, p107, p108, p109) --[[ Line: 415 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    if p108 == u29.DRAGON_BREATH then
        p106:breathAnimation(p107, p109)
        return
    elseif p108 == u29.DRAGON_FLAP_WINGS then
        p106:flapAnimation(p107)
        return
    elseif p108 == u29.TRANSFORM then
        p106:transformAnimation(p107)
        return
    elseif p108 == u29.Dragon_DEACTIVE then
        p106:dragonDeactiveAnimation(p107)
    end
end
function u37.flapAnimation(_, p110) --[[ Line: 435 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u24
        [3] = u8
        [4] = u7
        [5] = u36
    --]]
    local v111 = p110.Character
    if v111 ~= nil then
        v111 = v111:FindFirstChild("wings")
    end
    local v112 = v111:WaitForChild("AnimationController", 3)
    if v112 ~= nil then
        v112 = v112:WaitForChild("Animator", 3)
    end
    u25:playAnimation(v112, u24.VOID_DRAGON_WINGS_FLAP)
    local v113 = p110.Character
    if v113 ~= nil then
        v113 = v113.PrimaryPart
        if v113 ~= nil then
            v113 = v113.Position
        end
    end
    local v114 = u36
    u8:playSound(u7.fromList(unpack(v114)), {
        ["rollOffMaxDistance"] = 45,
        ["volumeMultiplier"] = 0.5,
        ["position"] = v113
    })
end
function u37.transformAnimation(p115, p116) --[[ Line: 461 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u32
        [3] = u16
        [4] = u33
        [5] = u4
        [6] = u25
        [7] = u24
    --]]
    p115:removeHandItem(p116)
    local v117 = p116.Character
    if v117 ~= nil then
        v117 = v117:FindFirstChild("wings")
    end
    local v118 = p116.Character
    local v119
    if v118 == nil then
        v119 = v118
    else
        v119 = v118.PrimaryPart
        if v119 ~= nil then
            v119 = v119.Position
        end
    end
    if not (v119 and v118) then
        return nil
    end
    if v117 then
        local v120 = v117:FindFirstChild("Plane.001")
        local v121 = v117:FindFirstChild("Plane.013")
        v120.Transparency = 0
        v121.Transparency = 0
    end
    u8:playSound(u32.XUROT_TRANSFORM, {
        ["rollOffMaxDistance"] = 45,
        ["volumeMultiplier"] = 0.5,
        ["position"] = v119
    })
    local u122 = u16.Assets.Effects.VoidDragonTransform:Clone()
    u122.Position = v119
    u122.Parent = p116.Character
    local u123 = u33:weldParts(v118.PrimaryPart, u122)
    task.delay(1, function() --[[ Line: 495 ]]
        --[[
        Upvalues:
            [1] = u123
            [2] = u122
        --]]
        u123:Destroy()
        u122:Destroy()
    end)
    for v124, v125 in u122:GetDescendants() do
        local _ = v124 - 1
        if v125:IsA("ParticleEmitter") then
            v125:Emit(30)
        end
    end
    u4:playAnimation(p116, u25:getAssetId(u24.VOID_DRAGON_TRANSFORM))
    u4:playAnimation(v117, u25:getAssetId(u24.VOID_DRAGON_WING_TRANSFORM), {
        ["looped"] = false
    })
    p115:changeWingSize(p116.Character, true)
end
function u37.dragonDeactiveAnimation(p126, p127) --[[ Line: 514 ]]
    p126:changeWingSize(p127.Character, false)
end
function u37.breathAnimation(u128, u129, u130) --[[ Line: 517 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u25
        [3] = u24
        [4] = u8
        [5] = u32
    --]]
    u4:playAnimation(u129, u25:getAssetId(u24.VOID_DRAGON_BREATH_FIRE))
    task.delay(0.1, function() --[[ Line: 519 ]]
        --[[
        Upvalues:
            [1] = u128
            [2] = u129
            [3] = u130
        --]]
        u128:dragonBreathEffect(u129, u130)
    end)
    local v131 = u129.Character
    if v131 ~= nil then
        v131 = v131.PrimaryPart
        if v131 ~= nil then
            v131 = v131.Position
        end
    end
    if not v131 then
        return nil
    end
    u8:playSound(u32.XUROT_BREATH, {
        ["rollOffMaxDistance"] = 45,
        ["volumeMultiplier"] = 0.5,
        ["position"] = v131
    })
end
function u37.enablePredictor(u132) --[[ Line: 539 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u11
        [3] = u6
        [4] = u13
        [5] = u17
        [6] = u15
    --]]
    local v133 = {
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Parent"] = u19
    }
    local u134 = u11("Part", v133)
    local u135 = u11("Part", v133)
    u6:setQueryIgnored(u134, true)
    u6:setQueryIgnored(u135, true)
    u132.targetingMaid:GiveTask(u134)
    u132.targetingMaid:GiveTask(u135)
    local u136 = u11("Beam", {
        ["FaceCamera"] = true,
        ["Segments"] = 300,
        ["Width0"] = 0.08,
        ["Attachment0"] = u11("Attachment", {
            ["Parent"] = u134
        }),
        ["Attachment1"] = u11("Attachment", {
            ["Parent"] = u135
        }),
        ["Color"] = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
        ["Transparency"] = NumberSequence.new(0.2),
        ["Width1"] = 0.08 + 2.22 * ((u134.Position - u135.Position).Magnitude / 100),
        ["Parent"] = u19
    })
    u13:AddTag(u136, "dragon-breath-preview-beam")
    u132.targetingMaid:GiveTask(u136)
    u132.targetingMaid:GiveTask(u17.Heartbeat:Connect(function() --[[ Line: 575 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u135
            [3] = u134
            [4] = u136
            [5] = u19
            [6] = u132
        --]]
        local v137 = u15.LocalPlayer.Character
        if v137 ~= nil then
            v137 = v137.PrimaryPart
            if v137 ~= nil then
                v137 = v137.Position
            end
        end
        if not v137 then
            u135:Destroy()
            u134:Destroy()
            u136:Destroy()
            return nil
        end
        u134.Position = v137
        local v138 = u19.CurrentCamera.CFrame
        local v139 = u15.LocalPlayer:GetMouse()
        local v140 = Vector2.new(v139.X, v139.Y)
        local v141 = u19.CurrentCamera:ScreenPointToRay(v140.X, v140.Y).Unit.Direction
        local v142 = u132.YTargetOffset
        local v143 = (v141 + Vector3.new(0, v142, 0)).Unit
        u135.Position = v137 + (v138.Position + v143 * ((v138.Position - v137).Magnitude * 10) - v137).Unit * 10
        u136.Width1 = 0.08 + 0.08 * ((u134.Position - u135.Position).Magnitude / 100)
        if not u132.isHolding then
            u135:Destroy()
            u134:Destroy()
            u136:Destroy()
            return nil
        end
    end))
end
function u37.validInput(_, p144) --[[ Line: 621 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v145 = false
    local v146 = u9.Controllers.KeybindLoadController:getKeybinds()
    local v147
    if v146 == nil then
        v147 = v146
    else
        v147 = v146.keyboard
        if v147 ~= nil then
            v147 = v147.controlActions.Attack
        end
    end
    local v148 = v147 or Enum.UserInputType.MouseButton1
    if v146 ~= nil then
        v146 = v146.gamepad
        if v146 ~= nil then
            v146 = v146.controlActions.Attack
        end
    end
    local v149 = v146 or Enum.KeyCode.ButtonR2
    return v145 or (p144.UserInputType == v148 and true or p144.KeyCode == v148) or p144.UserInputType == Enum.UserInputType.Touch or p144.KeyCode == v149
end
function u37.fireAtMouse(p150, p151) --[[ Line: 665 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u15
        [3] = u19
    --]]
    if p150.breathReadyTime > time() then
        return nil
    end
    p150.breathReadyTime = time() + u26.BREATH_COOLDOWN
    local v152 = u15.LocalPlayer.Character
    if v152 ~= nil then
        v152 = v152.PrimaryPart
        if v152 ~= nil then
            v152 = v152.Position
        end
    end
    if not v152 then
        return nil
    end
    local v153 = u15.LocalPlayer:GetMouse()
    local v154 = p151 or Vector2.new(v153.X, v153.Y)
    local v155 = u19.CurrentCamera.CFrame
    local v156 = u19.CurrentCamera:ScreenPointToRay(v154.X, v154.Y).Unit.Direction
    local v157 = p150.YTargetOffset
    local v158 = (v156 + Vector3.new(0, v157, 0)).Unit
    local v159 = v155.Position + v158 * ((v155.Position - v152).Magnitude * 10)
    local v160 = u15.LocalPlayer.Character
    if v160 ~= nil then
        v160:PivotTo(CFrame.lookAt(v152, v159))
    end
    return v159
end
function u37.changeWingSize(_, p161, p162) --[[ Line: 705 ]]
    local v163 = p161:WaitForChild("wings")
    local v164 = p161:WaitForChild("small_wings")
    local v165 = p162 and 0 or 1
    if not (v164:WaitForChild("SmallWingsRootPart", 3) and v163:WaitForChild("RootPart", 3)) then
        return nil
    end
    v163:WaitForChild("Plane.001", 3).Transparency = v165
    v163:WaitForChild("Plane.013", 3).Transparency = v165
    v164:WaitForChild("SmallPlane.001", 3).Transparency = 1 - v165
    v164:WaitForChild("SmallPlane.013", 3).Transparency = 1 - v165
end
u9.CreateController(u37.new())
return nil