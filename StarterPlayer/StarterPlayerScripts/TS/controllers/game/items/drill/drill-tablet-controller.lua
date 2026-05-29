local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.MobileTouchType
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "device-util").DeviceUtil
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = v11.RunService
local u15 = v11.UserInputService
local u16 = v11.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, script.Parent, "ui", "drill-camera-view").DrillCameraViewWrapper
local u27 = v1.import(script, script.Parent, "ui", "drill-count-ui").DrillCountDisplay
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "DrillTabletController"
    end,
    ["__index"] = u18
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u16
        [3] = u6
    --]]
    u18.constructor(p31)
    p31.Name = "DrillTabletController"
    p31.drillList = {}
    p31.camera = u16.CurrentCamera
    p31.index = -1
    p31.isFirstPerson = false
    p31.lastAttackTime = -1
    p31.YTargetOffset = u6.isMobileControls() and 0.25 or 0.05
    p31.playerAnimationMap = {}
end
function u28.isRelevantItem(_, p32) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return p32.itemType == u23.DRILL_CONTROLLER
end
function u28.onEnable(u33, _, _) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u27
        [4] = u2
        [5] = u4
        [6] = u19
        [7] = u26
    --]]
    u33:setupYield(function() --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u33
            [3] = u10
            [4] = u27
        --]]
        local v34 = u8.Controllers.StatusInfoListController
        local v35 = 0
        local v36 = {}
        for _ in u33.drillList do
            v35 = v35 + 1
        end
        v36.count = v35
        u33.drillCountTree = v34:waitForSetupAddElement(u10.createElement(u27, v36))
        return function() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u10
            --]]
            if u33.drillCountTree then
                u10.unmount(u33.drillCountTree)
            end
        end
    end)
    local v37 = 0
    for _ in u33.drillList do
        v37 = v37 + 1
    end
    if v37 == 0 then
        return nil
    end
    u33.index = 0
    local v38 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v39 = {
        ["action"] = "Attack",
        ["actionId"] = "Drill Attack",
        ["boundFunction"] = function(_, _, _) --[[ Name: boundFunction, Line 89 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:attack()
        end,
        ["mobile"] = {
            ["touchType"] = u4.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 94 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33:attack()
            end
        }
    }
    local u40 = v38:bindAction(v39)
    u33:setupYield(function() --[[ Line: 99 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u19
            [3] = u26
            [4] = u40
        --]]
        u33:nextDrill()
        u33.tree = u19("EngineerCameraView", u26)
        return function() --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u40
            --]]
            u33:exitDrill()
            u40:DoCleaning()
        end
    end)
end
function u28.onDisable(p41) --[[ Line: 108 ]]
    p41:exitDrill()
end
function u28.KnitStart(u42) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u12
        [3] = u13
        [4] = u10
        [5] = u27
        [6] = u24
        [7] = u21
        [8] = u20
        [9] = u8
        [10] = u14
        [11] = u9
        [12] = u15
        [13] = u17
    --]]
    u18.KnitStart(u42)
    u12:GetInstanceAddedSignal("Drill"):Connect(function(p43) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u42
            [3] = u10
            [4] = u27
        --]]
        if p43:GetAttribute("PlacedByUserId") == u13.LocalPlayer.UserId then
            u42.drillList[p43] = true
            if u42.drillCountTree then
                local v44 = u10
                local v45 = u42.drillCountTree
                local v46 = 0
                local v47 = {}
                for _ in u42.drillList do
                    v46 = v46 + 1
                end
                v47.count = v46
                v44.update(v45, u10.createElement(u27, v47))
            end
        end
    end)
    u12:GetInstanceRemovedSignal("Drill"):Connect(function(p48) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u42
            [3] = u10
            [4] = u27
        --]]
        if p48:GetAttribute("PlacedByUserId") ~= u13.LocalPlayer.UserId then
            return nil
        end
        u42.drillList[p48] = nil
        if u42.targetDrill == p48 then
            u42:exitDrill()
        end
        if u42.drillCountTree then
            local v49 = u10
            local v50 = u42.drillCountTree
            local v51 = 0
            local v52 = {}
            for _ in u42.drillList do
                v51 = v51 + 1
            end
            v52.count = v51
            v49.update(v50, u10.createElement(u27, v52))
        end
    end)
    u24.Client:Get("UseTablet"):Connect(function(p53, p54) --[[ Line: 157 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u21
            [3] = u20
        --]]
        local v55
        if p54 then
            local v56 = u42.playerAnimationMap[p53] ~= nil
            v55 = not v56
        else
            v55 = p54
        end
        local v57 = v55 and u21:playAnimation(p53, u20.USE_TABLET, {
            ["looped"] = true
        })
        if v57 then
            u42.playerAnimationMap[p53] = v57
        end
        if not p54 then
            local v58 = u42.playerAnimationMap[p53]
            if v58 ~= nil then
                v58:Stop()
            end
            if v58 ~= nil then
                v58:Destroy()
            end
            u42.playerAnimationMap[p53] = nil
        end
    end)
    u24.Client:Get("ReceiveResourceFromDrill"):Connect(function(p59) --[[ Line: 191 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u8
        --]]
        local u60 = u13.LocalPlayer.Character
        if not u60 then
            return nil
        end
        local v61 = u60.PrimaryPart.Position
        if not v61 then
            return nil
        end
        u8.Controllers.ReceiveItemEffectController:playEffectForItems({
            {
                ["itemType"] = p59.item,
                ["amount"] = p59.amount
            }
        }, v61, function() --[[ Line: 203 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            local v62 = u60.PrimaryPart
            if v62 ~= nil then
                v62 = v62.CFrame
            end
            return v62
        end, "PlayLocally")
    end)
    u14.Heartbeat:Connect(function() --[[ Line: 211 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u9
        --]]
        if not u42.targetDrill then
            return nil
        end
        local v63 = u42.camera
        if v63 ~= nil then
            v63 = (v63.Focus.Position - u42.camera.CFrame.Position).Magnitude
        end
        if v63 == 0 or (v63 ~= v63 or not v63) then
            return nil
        end
        if v63 < 0.6 and not u42.isFirstPerson then
            u42.isFirstPerson = true
            local v64 = u42.targetDrill
            if v64 ~= nil then
                local v65 = 0
                v64 = {}
                for v66, v67 in v64:GetDescendants() do
                    local _ = v66 - 1
                    if (v67:IsA("MeshPart") or (v67:IsA("Decal") or v67:IsA("ParticleEmitter"))) == true then
                        v65 = v65 + 1
                        v64[v65] = v67
                    end
                end
            end
            for v68, v69 in v64 do
                local _ = v68 - 1
                if v69:IsA("MeshPart") or v69:IsA("Decal") then
                    v69.Transparency = 1
                end
            end
            u9.Controllers.ViewmodelController:setHeldItem(nil)
        elseif v63 > 0.6 and u42.isFirstPerson then
            u42.isFirstPerson = false
            local v70 = u42.targetDrill
            if v70 ~= nil then
                local v71 = 0
                v70 = {}
                for v72, v73 in v70:GetDescendants() do
                    local _ = v72 - 1
                    if (v73:IsA("MeshPart") or (v73:IsA("Decal") or v73:IsA("ParticleEmitter"))) == true then
                        v71 = v71 + 1
                        v70[v71] = v73
                    end
                end
            end
            for v74, v75 in v70 do
                local _ = v74 - 1
                if v75:IsA("MeshPart") or v75:IsA("Decal") then
                    v75.Transparency = 0
                end
            end
        end
        if u42.isFirstPerson then
            u42.targetDrill:PivotTo(CFrame.new(u42.targetDrill.PrimaryPart.Position) * u42.camera.CFrame.Rotation)
        end
    end)
    u15.TouchTapInWorld:Connect(function(p76, p77) --[[ Line: 293 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        if not p77 and u42.targetDrill then
            u42:attack(p76)
        end
    end)
    u17.SwitchDrill:connect(function(p78) --[[ Line: 298 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        local v79 = u42
        v79.index = v79.index + p78.index
        if u42.index < 0 then
            local v80 = 0
            for _ in u42.drillList do
                v80 = v80 + 1
            end
            u42.index = v80 - 1
        else
            local v81 = u42.index
            local v82 = 0
            for _ in u42.drillList do
                v82 = v82 + 1
            end
            if v82 <= v81 then
                u42.index = 0
            end
        end
        u42:nextDrill()
    end)
end
function u28.nextDrill(p83) --[[ Line: 323 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u5
        [3] = u25
    --]]
    local v84 = 0
    for _ in p83.drillList do
        v84 = v84 + 1
    end
    if v84 == 0 then
        p83:exitDrill()
        return nil
    end
    if not p83.camera then
        return nil
    end
    local v85 = {}
    local v86 = #v85
    for v87 in p83.drillList do
        v86 = v86 + 1
        v85[v86] = v87
    end
    local v88 = v85[p83.index + 1]
    local v89 = u24.Client:Get("PlayerUseDrillController"):CallServer({
        ["drill"] = v88
    })
    u5:playSound(u25.TV_STATIC)
    if not v89 then
        return nil
    end
    if not v88.Parent then
        p83:nextDrill()
        return nil
    end
    p83.camera.CameraSubject = v88.PrimaryPart
    p83.targetDrill = v88
end
function u28.exitDrill(p90) --[[ Line: 360 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u13
        [3] = u10
    --]]
    p90.targetDrill = nil
    p90.index = -1
    task.spawn(function() --[[ Line: 363 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24.Client:Get("PlayerUseDrillController"):CallServer({
            ["drill"] = nil
        })
    end)
    local v91 = u13.LocalPlayer.Character
    if v91 then
        p90.camera.CameraSubject = v91.Humanoid
    end
    if p90.tree then
        u10.unmount(p90.tree)
        p90.tree = nil
    end
end
function u28.attack(p92, p93) --[[ Line: 377 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    if p92:isClickingTooFast() then
        return nil
    end
    local v94 = {
        ["targetPosition"] = p92:getTargetPoint(p93)
    }
    u24.Client:Get("DrillAttack"):SendToServer(v94)
end
function u28.isClickingTooFast(p95) --[[ Line: 386 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u22
        [3] = u16
    --]]
    if u17.ItemCooldownModifierCheck:fire(u22.DrillKit.DRILL_ATTACK_COOLDOWN).cooldown > u16:GetServerTimeNow() - p95.lastAttackTime then
        return true
    end
    p95.lastAttackTime = u16:GetServerTimeNow()
    return false
end
function u28.getTargetPoint(p96, p97) --[[ Line: 394 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
    --]]
    local v98 = u13.LocalPlayer.Character:GetPrimaryPartCFrame().Position
    local v99 = u13.LocalPlayer:GetMouse()
    local v100 = p97 or Vector2.new(v99.X, v99.Y)
    local v101 = u16.CurrentCamera.CFrame
    local v102 = u16.CurrentCamera:ScreenPointToRay(v100.X, v100.Y).Unit.Direction
    local v103 = p96.YTargetOffset
    local v104 = (v102 + Vector3.new(0, v103, 0)).Unit
    return v101.Position + v104 * ((v101.Position - v98).Magnitude * 10)
end
u8.CreateController(u28.new())
return nil