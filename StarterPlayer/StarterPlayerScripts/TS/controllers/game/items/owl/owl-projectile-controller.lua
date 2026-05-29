local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.GameQueryUtil
local u7 = v3.MobileButton
local u8 = v3.MobileTouchType
local u9 = v3.PressMode
local u10 = v3.RandomUtil
local u11 = v3.SoundManager
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u13 = v12.KnitClient
local u14 = v12.KnitClient
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u19 = v18.CollectionService
local u20 = v18.Players
local u21 = v18.RunService
local u22 = v18.TweenService
local u23 = v18.Workspace
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-controller").ProjectileController
local u26 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "owl-balance-file").OwlBalance
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "owl", "owl-status").OwlStatus
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u37 = v1.import(script, script.Parent, "owl-util").OwlUtil
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "OwlProjectileController"
    end,
    ["__index"] = u27
})
u38.__index = u38
function u38.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u15
        [3] = u5
    --]]
    u27.constructor(p41)
    p41.Name = "OwlProjectileController"
    p41.activate = false
    p41.maid = u15.new()
    p41.startHoldingTime = 0
    p41.targetingMaid = u15.new()
    p41.isHolding = false
    p41.YTargetOffset = u5.isMobileControls() and 0.25 or 0.05
    p41.bulletType = "owl_projectile"
    p41.projectileReadyTime = -1
    p41.uiMaid = u15.new()
end
function u38.KnitStart(u42) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u24
        [3] = u37
        [4] = u20
        [5] = u35
        [6] = u4
        [7] = u29
        [8] = u28
        [9] = u33
        [10] = u22
        [11] = u10
        [12] = u11
    --]]
    u27.KnitStart(u42)
    u24.OwlNewTarget:connect(function(p43) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u37
            [3] = u20
        --]]
        if p43.target then
            u42.target = p43.target
            u42.activate = true
            local v44 = u37:getOwlClientModelByUser(u20.LocalPlayer)
            if v44 ~= nil then
                v44 = v44.PrimaryPart
            end
            u42.owl = v44
            u42:onActive()
        else
            u42.target = nil
            u42.activate = false
            u42.isHolding = false
            u42:onDeactive()
        end
    end)
    u35.Client:Get("FireOwlProjectile"):Connect(function(p45, p46, p47, p48) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u4
            [3] = u29
            [4] = u28
            [5] = u33
            [6] = u22
            [7] = u10
            [8] = u11
            [9] = u20
            [10] = u42
            [11] = u24
        --]]
        local u49 = u37:getOwlClientModelByUser(p45)
        local v50
        if u49 == nil then
            v50 = u49
        else
            v50 = u49.PrimaryPart
            if v50 ~= nil then
                v50 = v50:FindFirstChild("bulletOrigin")
            end
        end
        local v51 = v50.WorldPosition
        local v52
        if u49 == nil then
            v52 = u49
        else
            v52 = u49.PrimaryPart
        end
        if not (v52 and v51) then
            return nil
        end
        local v53 = u4:playAnimation(u49, u29:getAssetId(u28.OWL_SHOOT))
        u49:SetAttribute("Status", u33.SHOOTING)
        if v53 ~= nil then
            v53.Stopped:Connect(function() --[[ Line: 110 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u49
                    [3] = u29
                    [4] = u28
                    [5] = u33
                --]]
                u4:playAnimation(u49, u29:getAssetId(u28.OWL_FLY))
                u49:SetAttribute("Status", u33.DEFAULT)
            end)
        end
        local v54 = TweenInfo.new(0.3)
        local v55 = u49.PrimaryPart.Position
        local v56 = u49.PrimaryPart.Position
        local v57 = p47.Unit
        local v58 = { CFrame.new(v55, v56 + v57):ToOrientation() }
        local v59 = u22
        local v60 = u49.PrimaryPart
        local v61 = {}
        local v62 = v58[1]
        local v63 = math.deg(v62)
        local v64 = v58[2]
        local v65 = math.deg(v64)
        local v66 = v58[3]
        local v67 = math.deg(v66)
        v61.Orientation = Vector3.new(v63, v65, v67)
        v59:Create(v60, v54, v61):Play()
        local v68 = u37
        u11:playSound(u10.fromList(unpack(v68:getOwlShootSound(p45))), {
            ["rollOffMaxDistance"] = 220,
            ["position"] = u49.PrimaryPart.Position
        })
        if p45 == u20.LocalPlayer then
            return nil
        end
        local v69 = u42:getKitSkinData(p45.Character)
        local v70
        if v69 == nil then
            v70 = v69
        else
            v70 = v69.projectileModel
        end
        if v70 then
            v70 = p48
        end
        if v70 then
            p48.projectileModel = v69.projectileModel
        end
        u24.FireClientProjectile:fire(nil, nil, "owl_projectile", v51, p46, p47, {}, p48)
    end)
end
function u38.onActive(u71) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u2
        [3] = u21
        [4] = u23
        [5] = u8
    --]]
    local u72 = nil
    local v73 = u15.new()
    u71.maid:GiveTask(v73)
    local v74 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v80 = {
        ["action"] = "Attack",
        ["actionId"] = "owl-projectile-click",
        ["boundFunction"] = function(_, p75, u76) --[[ Name: boundFunction, Line 154 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u71
                [3] = u21
                [4] = u23
            --]]
            if p75 == Enum.UserInputState.Begin then
                if u76.UserInputType == Enum.UserInputType.Touch then
                    u72 = u76
                end
                local function v79() --[[ Line: 159 ]]
                    --[[
                    Upvalues:
                        [1] = u71
                        [2] = u76
                        [3] = u21
                        [4] = u72
                    --]]
                    if not u71.activate then
                        return nil
                    end
                    if u76.UserInputState == Enum.UserInputState.End or u76.UserInputState == Enum.UserInputState.Cancel then
                        return nil
                    end
                    if u71.isHolding then
                        return nil
                    end
                    if u76.UserInputType == Enum.UserInputType.Touch then
                        local u77 = 0
                        u21:BindToRenderStep("owl-projectile-mobile-confirm", 250, function(p78) --[[ Line: 172 ]]
                            --[[
                            Upvalues:
                                [1] = u77
                                [2] = u21
                                [3] = u71
                                [4] = u72
                            --]]
                            u77 = u77 + p78
                            if u77 >= 0.3 then
                                u21:UnbindFromRenderStep("owl-projectile-mobile-confirm")
                                u71:startHolding(u72)
                            end
                        end)
                        return nil
                    end
                    u71:startHolding()
                end
                if u71.projectileReadyTime > u23:GetServerTimeNow() then
                    return nil
                end
                v79()
            elseif p75 == Enum.UserInputState.End then
                if u72 and u76 ~= u72 then
                    return nil
                end
                u72 = nil
                pcall(function() --[[ Line: 192 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                    --]]
                    return u21:UnbindFromRenderStep("owl-projectile-mobile-confirm")
                end)
                if u71.isHolding then
                    u71:stopHolding()
                    u71.targetingMaid:DoCleaning()
                    local _ = time() - u71.startHoldingTime
                end
            end
        end,
        ["mobile"] = {
            ["touchType"] = u8.TouchBeginEnd
        },
        ["priority"] = Enum.ContextActionPriority.High.Value
    }
    local v81 = v74:bindAction(v80)
    u71.maid:GiveTask(v81)
    u71:displayMobileButton()
end
function u38.onDeactive(p82) --[[ Line: 210 ]]
    p82.maid:DoCleaning()
    p82.targetingMaid:DoCleaning()
    p82.uiMaid:DoCleaning()
end
function u38.stopHolding(p83, p84) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u23
        [3] = u26
        [4] = u25
        [5] = u31
        [6] = u24
        [7] = u30
        [8] = u20
    --]]
    if not p83.owl then
        return nil
    end
    u35.Client:Get("OwlAiming"):SendToServer({
        ["starting"] = false,
        ["owl"] = p83.owl
    })
    if not p83.isHolding then
        return nil
    end
    p83.isHolding = false
    local v85
    if p84 then
        v85 = u23.CurrentCamera
        if v85 ~= nil then
            v85 = v85.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2)
        end
    else
        v85 = nil
    end
    local v86 = p83.owl:FindFirstChild("bulletOrigin").WorldPosition
    local v87 = u25:calculateImportantLaunchValues(u26.new(1, 1, p83.bulletType, nil, nil, nil, nil, v85), true, nil, v86)
    if not v87 then
        return nil
    end
    local v88 = u31.generateRefId()
    local v89 = u35.Client:Get("OwlFireProjectile")
    local v90 = {
        ["fromPosition"] = v86
    }
    local v91
    if v87 == nil then
        v91 = v87
    else
        v91 = v87.initialVelocity
    end
    v90.direction = v91
    v90.offset = nil
    v90.ProjectileRefId = v88
    local v92
    if v87 == nil then
        v92 = v87
    else
        v92 = v87.initialVelocity
    end
    v90.initialVelocity = v92
    v89:SendToServer(v90)
    if p83.projectileReadyTime > u23:GetServerTimeNow() then
        return nil
    end
    local v93 = u24.ProjectileCooldownModifierCheck:fire(u30.OWL_SHOOTING_COOLDOWN).cooldown
    p83.projectileReadyTime = u23:GetServerTimeNow() + v93
    local v94 = p83:getKitSkinData(u20.LocalPlayer.Character)
    local v95 = nil
    local v96
    if v94 == nil then
        v96 = v94
    else
        v96 = v94.projectileModel
    end
    if v96 then
        v95 = v94.projectileModel
    end
    local v97 = u24.FireClientProjectile
    if v87 ~= nil then
        v87 = v87.initialVelocity
    end
    v97:fire(nil, nil, "owl_projectile", v86, v88, v87, {}, {
        ["projectileModel"] = v95,
        ["relativeOverride"] = {
            ["relX"] = 0.01,
            ["relY"] = 0.01,
            ["relZ"] = 0.01
        }
    })
end
function u38.startHolding(u98, u99, u100) --[[ Line: 296 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u37
        [3] = u20
        [4] = u33
        [5] = u21
        [6] = u35
    --]]
    if not u98.owl then
        return nil
    end
    if u98.projectileReadyTime > u23:GetServerTimeNow() then
        return nil
    end
    local v101 = u37:getOwlClientModelByUser(u20.LocalPlayer)
    if not v101 or v101:GetAttribute("Status") == u33.LIFTING then
        return nil
    end
    local v102 = u98.target
    if v102 ~= nil then
        v102 = v102.Character
        if v102 ~= nil then
            v102 = v102.PrimaryPart
            if v102 ~= nil then
                v102 = v102.Position
            end
        end
    end
    local v103 = u98.owl.Position
    if not v102 or (not v103 or (v103 - v102).Magnitude > 15) then
        return nil
    end
    u98.startHoldingTime = u23:GetServerTimeNow()
    u98.isHolding = true
    local u104 = nil
    u104 = u21.Heartbeat:Connect(function(_) --[[ Line: 325 ]]
        --[[
        Upvalues:
            [1] = u98
            [2] = u104
            [3] = u23
            [4] = u99
            [5] = u100
        --]]
        if not u98.isHolding then
            u98.targetingMaid:DoCleaning()
            u104:Disconnect()
        end
        if u23:GetServerTimeNow() - u98.startHoldingTime >= 0.15 then
            u98:enablePredictor(u99, u100)
            u104:Disconnect()
        end
    end)
    u35.Client:Get("OwlAiming"):SendToServer({
        ["starting"] = true,
        ["owl"] = u98.owl
    })
end
function u38.enablePredictor(u105, u106, u107) --[[ Line: 340 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u16
        [3] = u6
        [4] = u19
        [5] = u21
        [6] = u26
        [7] = u25
        [8] = u20
    --]]
    if not u105.owl then
        return nil
    end
    local v108 = {
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Parent"] = u23
    }
    local u109 = u16("Part", v108)
    local u110 = u16("Part", v108)
    u6:setQueryIgnored(u109, true)
    u6:setQueryIgnored(u110, true)
    u105.targetingMaid:GiveTask(u109)
    u105.targetingMaid:GiveTask(u110)
    local u111 = u16("Beam", {
        ["FaceCamera"] = true,
        ["Segments"] = 300,
        ["Width0"] = 0.08,
        ["Attachment0"] = u16("Attachment", {
            ["Parent"] = u109
        }),
        ["Attachment1"] = u16("Attachment", {
            ["Parent"] = u110
        }),
        ["Color"] = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
        ["Transparency"] = NumberSequence.new(0.2),
        ["Width1"] = 0.08 + 2.22 * ((u109.Position - u110.Position).Magnitude / 100),
        ["Parent"] = u23
    })
    u19:AddTag(u111, "dragon-breath-preview-beam")
    u105.targetingMaid:GiveTask(u111)
    u105.targetingMaid:GiveTask(u21.Heartbeat:Connect(function() --[[ Line: 379 ]]
        --[[
        Upvalues:
            [1] = u105
            [2] = u109
            [3] = u106
            [4] = u107
            [5] = u23
            [6] = u26
            [7] = u25
            [8] = u110
            [9] = u111
            [10] = u20
        --]]
        local v112 = u105.owl:FindFirstChild("bulletOrigin").WorldPosition
        u109.Position = v112
        local v113
        if u106 then
            v113 = {
                ["inputObject"] = u106
            }
            local v114 = u106
            if v114 ~= nil then
                v114 = v114.Position.X
            end
            local v115 = u106
            if v115 ~= nil then
                v115 = v115.Position.Y
            end
            v113.initialPosition = Vector2.new(v114, v115)
        else
            v113 = nil
        end
        local v116
        if u107 then
            v116 = u23.CurrentCamera
            if v116 ~= nil then
                v116 = v116.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2)
            end
        else
            v116 = nil
        end
        local v117 = u25:calculateImportantLaunchValues(u26.new(1, 1, u105.bulletType, v113, nil, nil, nil, v116), true, nil, v112)
        if not v117 then
            return nil
        end
        local v118 = v117.initialVelocity
        local v119 = v117.deltaT
        local v120 = v117.gravitationalAcceleration
        local v121 = v119 / 2
        local v122 = v118.X * v121 + v112.X
        local v123 = v119 / 2
        local v124 = -0.5 * v120 * v123 ^ 2 + v118.Y * v123 + v112.Y
        local v125 = v119 / 2
        local v126 = v118.Z * v125 + v112.Z
        local v127 = Vector3.new(v122, v124, v126)
        local v128 = v118.X * v119 + v112.X
        local v129 = -0.5 * v120 * v119 ^ 2 + v118.Y * v119 + v112.Y
        local v130 = v118.Z * v119 + v112.Z
        local v131 = Vector3.new(v128, v129, v130)
        local v132 = (v127 - v112 * 0.25 - v131 * 0.25) * 2
        local v133 = v132 * 0.6666666666666666 + v112 * 0.3333333333333333
        local v134 = v132 * 0.6666666666666666 + v131 * 0.3333333333333333
        u109.CFrame = CFrame.new(v112, v133) * CFrame.Angles(0, 1.5707963267948966, 0)
        u110.CFrame = CFrame.new(v131, v134) * CFrame.Angles(0, -1.5707963267948966, 0)
        u111.CurveSize0 = (v133 - u109.Position).Magnitude
        u111.CurveSize1 = (v134 - u110.Position).Magnitude
        local _ = u23.CurrentCamera.CFrame
        local v135 = u20.LocalPlayer:GetMouse()
        local v136 = Vector2.new(v135.X, v135.Y)
        local v137 = u23.CurrentCamera:ScreenPointToRay(v136.X, v136.Y).Unit.Direction
        local v138 = u105.YTargetOffset
        local _ = (v137 + Vector3.new(0, v138, 0)).Unit
        u111.Width1 = 0.08 + 0.08 * ((u109.Position - u110.Position).Magnitude / 100)
        if not u105.isHolding then
            u110:Destroy()
            u109:Destroy()
            u111:Destroy()
            return nil
        end
    end))
end
function u38.getKitSkinData(_, p139) --[[ Line: 469 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u32
    --]]
    if not p139 then
        return nil
    end
    local v140 = u32[u13.Controllers.KitSkinController:getKitSkin(p139)]
    if v140.owl then
        return v140.owl
    end
end
function u38.displayMobileButton(u141) --[[ Line: 479 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u36
        [3] = u5
        [4] = u15
        [5] = u17
        [6] = u7
        [7] = u34
        [8] = u2
        [9] = u9
        [10] = u20
    --]]
    if u14.Controllers.SettingsController:getSetting(u36.MOBILE_PROJECTILE_BUTTON) and u5.isMobileControls() then
        u14.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await()
        local u142 = u15.new()
        local u152 = u17.mount(u17.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u17.createElement(u7, {
                ["Image"] = u34.BOW_MOBILE,
                ["Position"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("FireProjectile"),
                ["Size"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("FireProjectile"),
                ["PressMode"] = u9.FREE_MOVING_HOLD,
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 492 ]]
                    --[[
                    Upvalues:
                        [1] = u141
                        [2] = u142
                    --]]
                    if u141.projectileHandler then
                        return nil
                    end
                    (function() --[[ Line: 496 ]]
                        --[[
                        Upvalues:
                            [1] = u141
                            [2] = u142
                        --]]
                        if u141.projectileHandler then
                            return nil
                        end
                        if not u141:canLaunch() then
                            return nil
                        end
                        u141:startHolding(nil, true)
                        local u143 = u141.owl
                        if u143 ~= nil then
                            u143 = u143.Parent
                        end
                        if u143 ~= nil then
                            u143:SetAttribute("TransparencyOverride", true)
                        end
                        local u144 = {}
                        local v145
                        if u143 == nil then
                            v145 = u143
                        else
                            for v146, v147 in u143:GetDescendants() do
                                local _ = v146 - 1
                                if v147:IsA("MeshPart") or v147:IsA("Decal") then
                                    u144[v147] = v147.Transparency
                                    local v148 = v147.Transparency
                                    v147.Transparency = math.max(0.97, v148)
                                end
                            end
                            v145 = nil
                        end
                        u142:DoCleaning()
                        u142:GiveTask(function() --[[ Line: 534 ]]
                            --[[
                            Upvalues:
                                [1] = u144
                                [2] = u143
                            --]]
                            for v149, v150 in u144 do
                                v149.Transparency = v150
                            end
                            local v151 = u143
                            if v151 ~= nil then
                                v151:SetAttribute("TransparencyOverride", nil)
                            end
                        end)
                    end)()
                end,
                ["OnPressUp"] = function(_) --[[ Name: OnPressUp, Line 549 ]]
                    --[[
                    Upvalues:
                        [1] = u142
                        [2] = u141
                    --]]
                    u142:DoCleaning()
                    u141:stopHolding(true)
                end
            }) }), u20.LocalPlayer:WaitForChild("PlayerGui"))
        u141.uiMaid:GiveTask(function() --[[ Line: 555 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u152
            --]]
            u17.unmount(u152)
        end)
    end
end
function u38.canLaunch(_) --[[ Line: 560 ]]
    return true
end
u13.CreateController(u38.new())
return nil