local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.DeviceUtil
local u6 = v4.GameQueryUtil
local u7 = v4.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-util").LassoWarsUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util").GrapplingHookConst
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, script.Parent, "ui", "lasso-wars-deathmatch-hud").LassoWarsDeathmatchHud
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "LassoWarsController"
    end,
    ["__index"] = u18
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u21
        [3] = u11
    --]]
    u18.constructor(p30, { u21.LASSO_WARS })
    p30.Name = "LassoWarsController"
    p30.playerLassoModifierMap = {}
    p30.transitMaid = u11.new()
    p30.FORCE_SCALAR = 400
    p30.RUNTIME_MULT = 0.12
end
function u27.KnitStart(u31) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u24
        [3] = u3
        [4] = u7
        [5] = u25
        [6] = u10
        [7] = u5
        [8] = u2
        [9] = u19
        [10] = u14
        [11] = u26
    --]]
    u18.KnitStart(u31)
    u24.Client:Get("LassoWars_UpgradeComplete"):Connect(function(u32) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u31
        --]]
        local v33 = u3.getOrCreate(u31.playerLassoModifierMap, u32.player, function() --[[ Line: 68 ]]
            return {}
        end)
        u3.getOrCreate(v33, u32.upgradeType, function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            return {
                ["level"] = 0,
                ["upgradeType"] = u32.upgradeType
            }
        end).level = u32.level
    end)
    u24.Client:Get("LassoWars_LassoArmorBroken"):Connect(function(p34) --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u25
        --]]
        local v35 = p34.player.Character
        if v35 ~= nil then
            v35 = v35.PrimaryPart
        end
        if not v35 then
            return nil
        end
        u7:playSound(u25.EMERALD_SHIELD_BREAK, {
            ["position"] = v35.Position
        })
    end)
    u24.Client:Get("LassoWars_AddCurrency"):Connect(function(p36) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u25
            [3] = u31
        --]]
        local u37 = p36.player.Character
        if u37 ~= nil then
            u37 = u37.PrimaryPart
        end
        if not u37 then
            return nil
        end
        task.spawn(function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u25
                [3] = u37
            --]]
            local v38 = u7
            local v39 = u25.COIN_FOUNTAIN_2
            local v40 = {}
            local v41 = u37
            if v41 ~= nil then
                v41 = v41.Position
            end
            v40.position = v41
            v40.volumeMultiplier = 2
            v38:playSound(v39, v40)
            task.wait(0.1)
            local v42 = u7
            local v43 = u25.COIN_FOUNTAIN_1
            local v44 = {}
            local v45 = u37
            if v45 ~= nil then
                v45 = v45.Position
            end
            v44.position = v45
            v44.volumeMultiplier = 2
            v42:playSound(v43, v44)
        end)
        u31:createCoin(Vector3.new(0, 4, 0), u37, true)
    end)
    u24.Client:Get("LassoWars_SetupShops"):Connect(function(p46) --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u5
            [3] = u2
            [4] = u19
            [5] = u31
        --]]
        local v47 = p46.shopParts
        local function v49(p48) --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u5
                [3] = u2
                [4] = u19
                [5] = u31
            --]]
            u10.Controllers.ProximityPromptController:createProximityPrompt({
                ["ObjectText"] = "Upgrades",
                ["ActionText"] = "Shop",
                ["AutoLocalize"] = false,
                ["RequiresLineOfSight"] = false,
                ["MaxActivationDistance"] = 10,
                ["ClickablePrompt"] = u5.isMobileControls(),
                ["KeyboardKeyCode"] = Enum.KeyCode.F,
                ["Parent"] = p48
            }).Triggered:Connect(function() --[[ Line: 148 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u19
                    [3] = u31
                --]]
                if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u19.LASSO_WARS_UPGRADE_SHOP_APP) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.LASSO_WARS_UPGRADE_SHOP_APP)
                else
                    u31:openUpgradeShop()
                end
            end)
        end
        for v50, v51 in v47 do
            v49(v51, v50 - 1, v47)
        end
    end)
    u24.Client:Get("LassoGrapplingHookStartTransit"):Connect(function(p52) --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u14
        --]]
        u31:transit(u14.LocalPlayer, p52.endGoal, p52.hitBasePart)
    end)
    u24.Client:Get("LassoGrapplingHookCutLine"):Connect(function(_) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31.transitMaid:DoCleaning()
    end)
    u24.Client:Get("LassoWars_OpenHUD"):Connect(function(_) --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u26
        --]]
        if not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LassoWarsDeathmatchHud") then
            local v53 = {
                ["appId"] = "LassoWarsDeathmatchHud",
                ["app"] = u26
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v53, {})
        end
    end)
end
function u27.onGameInit(_) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u25
    --]]
    u9.Controllers.PreloadController:runPreload({
        ["sounds"] = { u25.COIN_FOUNTAIN_2, u25.COIN_FOUNTAIN_1, u25.EMERALD_SHIELD_BREAK }
    })
end
function u27.createCoin(_, u54, u55, u56) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u17
        [3] = u16
        [4] = u20
    --]]
    local u57 = u15.Assets.Misc.LassoCoin:Clone()
    if u55 then
        u57.Parent = u55
        local v58 = u55.Position
        u57:PivotTo(CFrame.new(v58 + u54))
    else
        u57.Parent = u17
        u57:PivotTo(CFrame.new(u54))
    end
    local u59 = u57.Pivot.SpinPivot
    local u60 = 0
    local u61 = nil
    u61 = u16.Heartbeat:Connect(function(p62) --[[ Line: 209 ]]
        --[[
        Upvalues:
            [1] = u60
            [2] = u20
            [3] = u59
            [4] = u55
            [5] = u54
            [6] = u57
            [7] = u56
            [8] = u61
        --]]
        u60 = u60 + p62
        local v63 = u20
        local v64 = 100 * p62
        v63.rotateLocalDegrees(u59, Vector3.new(0, 1, 0) * v64)
        if u55 then
            local v65 = u20
            local v66 = u55.Position
            local v67 = u54
            v65.setPosition(u57, v66 + v67)
        end
        if u56 and u60 > 1 then
            local v68 = u60 - 1
            if v68 >= 1 then
                u57:Destroy()
                if u61 then
                    u61:Disconnect()
                    return
                end
            else
                u57.Pivot.SpinPivot.GoldCoin.Transparency = v68
            end
        end
    end)
    u57.Destroying:Connect(function() --[[ Line: 239 ]]
        --[[
        Upvalues:
            [1] = u61
        --]]
        if u61 then
            u61:Disconnect()
        end
    end)
    return u57
end
function u27.requestLassoUpgrade(_, p69) --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u22
        [3] = u14
        [4] = u7
        [5] = u25
    --]]
    local v70 = u24.Client:Get("LassoWars_RequestUpgrade"):CallServer({
        ["upgradeType"] = p69
    })
    if v70 == 0 or (v70 ~= v70 or not v70) then
        u7:playSound(u25.ERROR_NOTIFICATION)
        return v70
    end
    u22.setUpgradeLevelForPlayer(u14.LocalPlayer, p69, v70)
    u7:playSound(u25.BEDWARS_PURCHASE_ITEM)
    return v70
end
function u27.openUpgradeShop(_) --[[ Line: 263 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u19
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u19.LASSO_WARS_UPGRADE_SHOP_APP) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.LASSO_WARS_UPGRADE_SHOP_APP)
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.LASSO_WARS_UPGRADE_SHOP_APP, {})
end
function u27.transit(u71, u72, p73, _) --[[ Line: 269 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u6
        [3] = u17
        [4] = u12
        [5] = u9
        [6] = u23
        [7] = u16
    --]]
    local u74 = p73 + Vector3.new(0, 1, 0)
    if u72 ~= u14.LocalPlayer then
        return nil
    end
    local u75 = u72.Character
    local u76 = u72.Character
    if u76 ~= nil then
        u76 = u76:FindFirstChild("Humanoid")
    end
    if not (u75 and u76) then
        return nil
    end
    local v77 = u75.PrimaryPart
    if v77 == nil then
        return nil
    end
    local u78 = v77.AssemblyMass
    u75.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 20, 0)
    if not u6:raycast(v77.Position + Vector3.new(0, -5, 0), Vector3.new(0, -100, 0)) and u76:GetState() == Enum.HumanoidStateType.Freefall then
        local v79 = u75.PrimaryPart
        local v80 = u17.Gravity / 3
        v79.AssemblyLinearVelocity = Vector3.new(0, v80, 0)
    end
    local _ = (u74 - u75.PrimaryPart.Position).Magnitude
    local v81 = {
        ["Name"] = "LiftForce",
        ["Force"] = Vector3.new(0, 0, 0),
        ["ApplyAtCenterOfMass"] = true,
        ["Parent"] = u76.RootPart,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World
    }
    local v82 = u76.RootPart
    if v82 ~= nil then
        v82 = v82:WaitForChild("RootRigAttachment")
    end
    v81.Attachment0 = v82
    local u83 = u12("VectorForce", v81)
    local v84 = {
        ["Name"] = "SwivelForce",
        ["Force"] = Vector3.new(0, 0, 0),
        ["ApplyAtCenterOfMass"] = true,
        ["Parent"] = u76.RootPart,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World
    }
    local v85 = u76.RootPart
    if v85 ~= nil then
        v85 = v85:WaitForChild("RootRigAttachment")
    end
    v84.Attachment0 = v85
    local u86 = u12("VectorForce", v84)
    local u87 = u12("BodyForce", {
        ["Name"] = "AntiGravity",
        ["Force"] = Vector3.new(0, 0, 0),
        ["Parent"] = v77
    })
    local u88 = u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["constantSpeedMultiplier"] = u23.SPEED
    })
    u76:ChangeState(Enum.HumanoidStateType.Freefall)
    u76.PlatformStand = true
    task.delay(0.1, function() --[[ Line: 341 ]]
        --[[
        Upvalues:
            [1] = u76
        --]]
        u76.PlatformStand = false
    end)
    local u89 = 0.5
    local u90 = 0
    u16:BindToRenderStep("LassoGrappleHook", Enum.RenderPriority.Last.Value, function(p91) --[[ Line: 346 ]]
        --[[
        Upvalues:
            [1] = u90
            [2] = u89
            [3] = u72
            [4] = u74
            [5] = u78
            [6] = u71
            [7] = u83
            [8] = u76
            [9] = u86
            [10] = u23
            [11] = u87
            [12] = u75
        --]]
        u90 = u90 + p91
        local v92 = u89 - p91 / 0.5
        u89 = math.clamp(v92, 0, 0.5)
        local v93 = u72.Character
        if v93 ~= nil then
            v93 = v93.PrimaryPart
            if v93 ~= nil then
                v93 = v93.Position
            end
        end
        if v93 == nil then
            return nil
        end
        local v94 = (u74 - v93).Unit
        local v95 = u72.Character
        if v95 ~= nil then
            v95 = v95.PrimaryPart
            if v95 ~= nil then
                v95 = v95.AssemblyMass
            end
        end
        if v95 == nil then
            v95 = u78
        end
        u78 = v95
        u83.Force = v94 * u71.FORCE_SCALAR * u78
        local v96 = u76.MoveDirection
        local v97 = u78
        u86.Force = (v96 - v94 * v96:Dot(v94)) * u71.FORCE_SCALAR * u89 * v97 * 1.2
        u87.Force = u23.FORCE_ADDITIVE * u78
        local v98 = u75.PrimaryPart
        local v99 = u75.PrimaryPart.AssemblyLinearVelocity
        local v100 = v94 * 20
        local v101 = u90 * u71.RUNTIME_MULT
        v98.AssemblyLinearVelocity = v99:Lerp(v100, (math.clamp(v101, 0, 1)))
    end)
    u71.transitMaid:GiveTask(function() --[[ Line: 397 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u83
            [3] = u86
            [4] = u87
            [5] = u88
            [6] = u76
        --]]
        u16:UnbindFromRenderStep("LassoGrappleHook")
        u83:Destroy()
        u86:Destroy()
        u87:Destroy()
        u88.Destroy()
        u76:ChangeState(Enum.HumanoidStateType.Landed)
    end)
end
function u27.getLassoModifierMapForPlayer(p102, p103) --[[ Line: 407 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u3
    --]]
    if p103 == nil then
        return nil
    elseif p103 == u14.LocalPlayer then
        local v104 = u3.getOrCreate(p102.playerLassoModifierMap, p103, function() --[[ Line: 414 ]]
            return {}
        end)
        if p103 then
            return v104
        else
            return nil
        end
    else
        return nil
    end
end
u9.CreateController(u27.new())
return nil