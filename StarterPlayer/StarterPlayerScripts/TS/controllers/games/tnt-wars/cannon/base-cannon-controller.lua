local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.SoundManager
local u4 = v2.WatchCollectionTag
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.ContextActionService
local u14 = v11.Players
local u15 = v11.RunService
local u16 = v11.TweenService
local u17 = v11.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "cannon-constants")
local u20 = v19.CANNON_COLLECTION_TAGS
local u21 = v19.TNTLoadResult
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, script.Parent, "ui", "active-cannon-hud").ActiveCannonHud
local u25 = v1.import(script, script.Parent, "ui", "cannon-billboard").CannonBillboard
local u26 = { "Aim", "Aim & Fire" }
local u27 = {
    ["mounted"] = {
        ["cameraMinZoomDistance"] = 6.5,
        ["cameraMaxZoomDistance"] = 6.5
    },
    ["unmounted"] = {
        ["cameraMinZoomDistance"] = 0,
        ["cameraMaxZoomDistance"] = 14
    }
}
local u28 = TweenInfo.new(0.2, Enum.EasingStyle.Linear)
local v29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 52 ]]
        return "BaseCannonController"
    end,
    ["__index"] = u18
})
v29.__index = v29
function v29.constructor(p30, p31) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u8
    --]]
    u18.constructor(p30)
    p30.Name = "BaseCannonController"
    p30.cleanupMaid = u8.new()
    p30.updateAccumulator = 0
    p30.cannonConfig = p31
end
function v29.KnitStart(u32) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u22
    --]]
    u4("cannon-type", function(p33) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        if u32:isRelevantCannon(p33) and not u32:isBlockClientPredicted(p33) then
            u32:setupUI(p33)
            u32:updateCannon(p33)
            u32:offsetCannonCamera(p33)
            u32:startAutoFire(p33)
            if not u32:isFriendlyCannon(p33) then
                u32:highlightCannon(p33)
            end
        end
    end)
    u22.Client:WaitFor("CannonSuccessfullyFired"):expect():Connect(function(p34) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        if u32:isRelevantCannon(p34.cannon) then
            u32:preFire(p34.player, p34.cannon)
        end
    end)
    u22.Client:WaitFor("CannonLoadTNTResult"):expect():Connect(function(p35) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        if u32:isRelevantCannon(p35.cannon) then
            u32:handleLoadResult(p35.result)
        end
    end)
end
function v29.setupUI(p36, p37) --[[ Line: 95 ]]
    p36:createCannonBillboard(p37)
    p36:createOperatePrompt(p37)
    p36:createAmmoLoadPrompt(p37)
end
function v29.updateCannon(u38, u39) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u28
    --]]
    local u48 = u39:GetAttributeChangedSignal("LookVector"):Connect(function() --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u38
            [3] = u16
            [4] = u28
        --]]
        local v40 = u39:GetAttribute("LookVector")
        if not v40 then
            return nil
        end
        if not (u39.Base and u39.Barrel) then
            return nil
        end
        local v41 = u38.cannonConfig
        if v41 ~= nil then
            v41 = v41.axesInverted
        end
        local v42 = v41 and -90 or 180
        local v43 = u39.Base.Position
        local v44 = u39.Base.Position
        local v45 = v40 * Vector3.new(1, 0, 1)
        local v46 = {
            ["CFrame"] = CFrame.new(v43, v44 + v45) * CFrame.Angles(0, math.rad(v42), 0)
        }
        u16:Create(u39.Base, u28, v46):Play()
        local v47 = {
            ["CFrame"] = CFrame.new(u39.Barrel.Position, u39.Barrel.Position + v40) * CFrame.Angles(0, math.rad(v42), 0)
        }
        u16:Create(u39.Barrel, u28, v47):Play()
    end)
    local u49 = nil
    u49 = u39.AncestryChanged:Connect(function(_, p50) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u49
        --]]
        if not p50 then
            u48:Disconnect()
            u49:Disconnect()
        end
    end)
end
function v29.offsetCannonCamera(_, p51) --[[ Line: 145 ]]
    local v52 = p51.Camera.Position
    p51.Camera.Position = v52 + Vector3.new(0, 2, 0)
end
function v29.handleLoadResult(_, p53) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u23
        [3] = u3
    --]]
    local v54
    if p53 == u21.SUCCESS then
        v54 = u23.INFO_NOTIFICATION
    else
        v54 = u23.ERROR_NOTIFICATION
    end
    u3:playSound(v54, {
        ["position"] = nil
    })
end
function v29.startAutoFire(u55, u56) --[[ Line: 156 ]]
    local u57 = u55.cannonConfig.autoFire
    if not u57 then
        return nil
    end
    task.spawn(function() --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u57
            [2] = u56
            [3] = u55
        --]]
        while true do
            local v58 = task.wait(u57.fireInterval)
            if v58 == 0 or (v58 ~= v58 or not (v58 and (u56 and u56.Parent))) then
                break
            end
            u55:requestCannonFire(u56)
        end
    end)
end
function v29.createCannonBillboard(p59, p60) --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u25
    --]]
    u10.mount(u10.createElement(u25, {
        ["config"] = p59.cannonConfig,
        ["cannon"] = p60
    }), p60)
end
function v29.createOperatePrompt(u61, u62) --[[ Line: 180 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u26
        [3] = u12
        [4] = u20
        [5] = u14
    --]]
    local v63 = u61.cannonConfig
    if v63 ~= nil then
        v63 = v63.isAimable
    end
    local v64 = not v63
    if v64 then
        v64 = u61.cannonConfig
        if v64 ~= nil then
            v64 = v64.autoFire
        end
    end
    if v64 then
        return nil
    end
    local v65 = u7.Controllers.ProximityPromptController
    local v66 = {
        ["Name"] = "OperatePrompt",
        ["HoldDuration"] = 0.4,
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 10,
        ["ClickablePrompt"] = false,
        ["UIOffset"] = Vector2.new(0, -40)
    }
    local v67 = u61.cannonConfig
    if v67 ~= nil then
        v67 = v67.autoFire
    end
    local v68
    if v67 then
        v68 = u26[1]
    else
        v68 = u26[2]
    end
    v66.ActionText = v68
    v66.Parent = u62
    local v69 = v65:createProximityPrompt(v66)
    u12:AddTag(v69, u20.proximity)
    v69.Triggered:Connect(function(p70) --[[ Line: 215 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u61
            [3] = u62
        --]]
        if p70 == u14.LocalPlayer then
            u61:operateCannon(u62)
        end
    end)
end
function v29.highlightCannon(_, p71) --[[ Line: 221 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v72 = { p71.Base, p71.Barrel }
    local function v74(p73) --[[ Line: 223 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        u9("Highlight", {
            ["OutlineTransparency"] = 0.1,
            ["FillTransparency"] = 0.6,
            ["Adornee"] = p73,
            ["OutlineColor"] = Color3.fromRGB(255, 0, 0),
            ["FillColor"] = Color3.fromRGB(255, 0, 0),
            ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop,
            ["Parent"] = p73
        })
    end
    for v75, v76 in v72 do
        v74(v76, v75 - 1, v72)
    end
end
function v29.operateCannon(p77, p78) --[[ Line: 238 ]]
    p77:setPromptVisibility(false)
    p77:setBillboardVisibility(false)
    p77:toggleMovement(false)
    p77:setCharacterVisible(false)
    p77:setCannonTransparency(p78, 0.8)
    p77:setCameraTargetCannon(p78)
    p77:mountActiveHud(p78)
    p77:handleAiming(p78)
end
function v29.stopOperatingCannon(p79, p80) --[[ Line: 248 ]]
    p79:setPromptVisibility(true)
    p79:setBillboardVisibility(true)
    p79:toggleMovement(true)
    p79:setCharacterVisible(true)
    p79:setCannonTransparency(p80, 0)
    p79:setCameraTargetHumanoid()
    p79:unmountActiveHud()
end
function v29.requestCannonFire(_, p81) --[[ Line: 257 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    u22.Client:Get("CannonFireRequest"):SendToServer({
        ["cannon"] = p81
    })
end
function v29.handleAiming(u82, u83) --[[ Line: 262 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u17
        [3] = u22
        [4] = u14
    --]]
    u82:setCameraToCannon(u83)
    local u89 = u15.Heartbeat:Connect(function(p84) --[[ Line: 264 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u17
            [3] = u22
            [4] = u83
        --]]
        local v85 = u82
        v85.updateAccumulator = v85.updateAccumulator + p84
        if u82.updateAccumulator >= 0.2 then
            local v86 = u17.CurrentCamera
            if v86 ~= nil then
                v86 = v86.CFrame
            end
            local v87 = u17.CurrentCamera
            if v87 ~= nil then
                v87 = v87.CFrame.LookVector
            end
            if not (v87 and v86) then
                u82.updateAccumulator = 0
                return nil
            end
            local v88 = {
                ["cannon"] = u83,
                ["cameraCFrame"] = v86,
                ["lookVector"] = v87
            }
            u22.Client:Get("CannonLookVectorUpdate"):SendToServer(v88)
            u82.updateAccumulator = 0
        end
    end)
    local u91 = u83.AncestryChanged:Connect(function(_, p90) --[[ Line: 291 ]]
        --[[
        Upvalues:
            [1] = u82
        --]]
        if not p90 then
            u82.cleanupMaid:DoCleaning()
        end
    end)
    local v92 = u14.LocalPlayer.Character
    if v92 ~= nil then
        v92 = v92:WaitForChild("Humanoid")
    end
    local u93 = v92.Died:Connect(function() --[[ Line: 301 ]]
        --[[
        Upvalues:
            [1] = u82
        --]]
        u82.cleanupMaid:DoCleaning()
    end)
    u82.cleanupMaid:GiveTask(function() --[[ Line: 304 ]]
        --[[
        Upvalues:
            [1] = u91
            [2] = u89
            [3] = u93
            [4] = u82
            [5] = u83
        --]]
        u91:Disconnect()
        u89:Disconnect()
        u93:Disconnect()
        u82:stopOperatingCannon(u83)
    end)
end
function v29.setCannonTransparency(_, p94, p95) --[[ Line: 311 ]]
    if p94 and (p94.Parent and (p94.Base and p94.Barrel)) then
        p94.Base.Transparency = p95
        p94.Barrel.Transparency = p95
    end
end
function v29.setCameraToCannon(_, p96) --[[ Line: 317 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v97 = p96:GetAttribute("LastCameraCFrame")
    if v97 == "" or not v97 then
        return nil
    end
    local v98 = string.split(v97, ",")
    local v99 = table.create(#v98)
    for v100, v101 in v98 do
        local _ = v100 - 1
        v99[v100] = tonumber(v101)
    end
    local v102 = CFrame.new(v99[1], v99[2], v99[3], v99[4], v99[5], v99[6], v99[7], v99[8], v99[9], v99[10], v99[11], v99[12])
    u17.CurrentCamera.CFrame = v102
end
function v29.setCameraTargetCannon(_, p103) --[[ Line: 338 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u14
        [3] = u27
    --]]
    u17.CurrentCamera.CameraSubject = p103.Camera
    u14.LocalPlayer.CameraMinZoomDistance = u27.mounted.cameraMinZoomDistance
    u14.LocalPlayer.CameraMaxZoomDistance = u27.mounted.cameraMaxZoomDistance
end
function v29.setCameraTargetHumanoid(_) --[[ Line: 343 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u17
        [3] = u27
    --]]
    local v104 = u14.LocalPlayer.Character
    if v104 ~= nil then
        v104 = v104:FindFirstChild("Humanoid")
    end
    u17.CurrentCamera.CameraSubject = v104
    u14.LocalPlayer.CameraMinZoomDistance = u27.unmounted.cameraMinZoomDistance
    u14.LocalPlayer.CameraMaxZoomDistance = u27.unmounted.cameraMaxZoomDistance
end
function v29.createAmmoLoadPrompt(_, u105) --[[ Line: 352 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
        [3] = u20
        [4] = u14
        [5] = u22
    --]]
    local v106 = u7.Controllers.ProximityPromptController:createProximityPrompt({
        ["Name"] = "AmmoPrompt",
        ["HoldDuration"] = 0.4,
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 10,
        ["ClickablePrompt"] = false,
        ["ActionText"] = "Load TNT",
        ["UIOffset"] = Vector2.new(0, 40),
        ["KeyboardKeyCode"] = Enum.KeyCode.X,
        ["Parent"] = u105
    })
    u12:AddTag(v106, u20.proximity)
    v106.Triggered:Connect(function(p107) --[[ Line: 365 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u22
            [3] = u105
        --]]
        if p107 == u14.LocalPlayer then
            local v108 = {
                ["cannon"] = u105
            }
            u22.Client:Get("CannonLoadTNT"):SendToServer(v108)
        end
    end)
end
function v29.setPromptVisibility(_, p109) --[[ Line: 373 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u20
    --]]
    for v110, v111 in u12:GetTagged(u20.proximity) do
        local _ = v110 - 1
        v111.Enabled = p109
    end
end
function v29.setBillboardVisibility(_, p112) --[[ Line: 383 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u20
    --]]
    for v113, v114 in u12:GetTagged(u20.billboard) do
        local _ = v113 - 1
        v114.Enabled = p112
    end
end
function v29.toggleMovement(_, p115) --[[ Line: 393 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
    --]]
    if p115 then
        for v116, v117 in Enum.PlayerActions:GetEnumItems() do
            local _ = v116 - 1
            u13:UnbindAction("freeze-movement" .. "-" .. v117.Name)
        end
        local v118 = u14.LocalPlayer.Character
        if v118 ~= nil then
            v118 = v118.PrimaryPart
        end
        if v118 then
            u14.LocalPlayer.Character.PrimaryPart.Anchored = false
        end
    else
        for v119, v120 in Enum.PlayerActions:GetEnumItems() do
            local _ = v119 - 1
            u13:BindAction("freeze-movement" .. "-" .. v120.Name, function() --[[ Line: 398 ]]
                return Enum.ContextActionResult.Sink
            end, false, v120)
        end
        local v121 = u14.LocalPlayer.Character
        if v121 ~= nil then
            v121 = v121.PrimaryPart
        end
        if v121 then
            u14.LocalPlayer.Character.PrimaryPart.Anchored = true
            return
        end
    end
end
function v29.setCharacterVisible(_, p122) --[[ Line: 431 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
    --]]
    u6.Controllers.InvisibilityPotionController:setTransparencyOfCharacter(u14.LocalPlayer.Character, p122 and 0 or 1)
end
function v29.mountActiveHud(u123, u124) --[[ Line: 434 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u24
        [3] = u14
    --]]
    u123.activeHud = u10.mount(u10.createElement(u24, {
        ["cannon"] = u124,
        ["config"] = u123.cannonConfig,
        ["unmount"] = function() --[[ Name: unmount, Line 438 ]]
            --[[
            Upvalues:
                [1] = u123
                [2] = u124
            --]]
            u123:stopOperatingCannon(u124)
            u123.cleanupMaid:DoCleaning()
        end,
        ["requestFire"] = function(p125) --[[ Name: requestFire, Line 442 ]]
            --[[
            Upvalues:
                [1] = u123
            --]]
            u123:requestCannonFire(p125)
        end
    }), u14.LocalPlayer:WaitForChild("PlayerGui"))
end
function v29.unmountActiveHud(p126) --[[ Line: 447 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p126.activeHud then
        u10.unmount(p126.activeHud)
    end
end
function v29.isRelevantCannon(p127, p128) --[[ Line: 452 ]]
    local v129 = p127.cannonConfig
    if v129 ~= nil then
        v129 = v129.cannonType
    end
    return v129 == p128.Name
end
function v29.isBlockClientPredicted(_, p130) --[[ Line: 459 ]]
    return p130:GetAttribute("ClientPlaced")
end
function v29.isFriendlyCannon(_, p131) --[[ Line: 462 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v132 = u14:GetPlayerByUserId((p131:GetAttribute("PlacedByUserId")))
    if v132 ~= nil then
        v132 = v132.Team
        if v132 ~= nil then
            v132 = v132.Name
        end
    end
    local v133 = u14.LocalPlayer.Team
    if v133 ~= nil then
        v133 = v133.Name
    end
    return v132 == v133
end
function v29.isLocalPlayer(_, p134) --[[ Line: 478 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p134.UserId == u14.LocalPlayer.UserId
end
function v29.preFire(p135, p136, p137) --[[ Line: 481 ]]
    p135:playCannonSound(p136, p137)
    p135:playScreenShake(p136, p137)
    p135:onFire(p136, p137)
end
function v29.playCannonSound(p138, p139, p140) --[[ Line: 486 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u23
    --]]
    local v141 = p138.cannonConfig
    if v141 ~= nil then
        v141 = v141.autoFire
    end
    if v141 then
        u3:playSound(u23.CANNON_FIRE, {
            ["position"] = p140.Position
        })
        return nil
    end
    local v142 = u3
    local v143 = u23.CANNON_FIRE
    local v144 = {}
    local v145
    if p138:isLocalPlayer(p139) then
        v145 = nil
    else
        v145 = p140.Position
    end
    v144.position = v145
    v142:playSound(v143, v144)
end
function v29.playScreenShake(p146, p147, _) --[[ Line: 502 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v148 = p146.cannonConfig
    if v148 ~= nil then
        v148 = v148.autoFire
    end
    if v148 then
        return nil
    end
    if p146:isLocalPlayer(p147) then
        u6.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -2, 0))
    end
end
return {
    ["BaseCannonController"] = v29
}