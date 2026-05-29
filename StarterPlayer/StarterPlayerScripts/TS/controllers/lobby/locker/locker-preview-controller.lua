local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.UILayers
local u6 = v3.WatchCharacter
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space")
local u17 = u16.ScreenWidthToWorldWidth
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u26 = v1.import(script, script.Parent, "ui", "preview", "locker-preview-fullscreen").LockerPreviewFullscreen
local u27 = v1.import(script, script.Parent, "ui", "preview", "locker-preview-plain-background").LockerPreviewPlainBackground
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "LockerPreviewController"
    end,
    ["__index"] = u15
})
u28.__index = u28
function u28.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u13
        [3] = u10
        [4] = u8
    --]]
    u15.constructor(p31)
    p31.Name = "LockerPreviewController"
    p31.camera = u13.CurrentCamera
    p31.initialCameraMaxZoom = u10.LocalPlayer.CameraMaxZoomDistance
    p31.initialCameraMinZoom = u10.LocalPlayer.CameraMinZoomDistance
    p31.initialOcclusionMode = u10.LocalPlayer.DevCameraOcclusionMode
    p31.previewOpen = false
    p31.isFullscreen = false
    p31.effectsPlaying = false
    p31.viewportOffsetBound = false
    p31.previewAngle = CFrame.Angles(0, 3.141592653589793, 0)
    p31.previewOffset = Vector3.new(0, 0, 0)
    p31.previewWorldPosition = CFrame.new(10000, 10000, 10000)
    p31.backstageWorldPosition = CFrame.new(-10000, 10000, 10000)
    p31.previewMaid = u8.new()
    p31.fullscreenMaid = u8.new()
    p31.effectsMaid = u8.new()
end
function u28.KnitStart(u32) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u11
        [4] = u13
        [5] = u24
        [6] = u4
        [7] = u19
        [8] = u6
        [9] = u20
        [10] = u7
        [11] = u21
        [12] = u18
        [13] = u8
    --]]
    u15.KnitStart(u32)
    task.spawn(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u10
        --]]
        while not game:IsLoaded() do
            task.wait(0.5)
        end
        u32.initialCameraMaxZoom = u10.LocalPlayer.CameraMaxZoomDistance
        u32.initialCameraMinZoom = u10.LocalPlayer.CameraMinZoomDistance
    end)
    u32.previewScene = u11.Assets.Misc.LockerPreview:Clone()
    u32.previewScene.Parent = u13
    u32.previewScene:PivotTo(u32.previewWorldPosition)
    u32:toggleLighting(false)
    u32:setFloorVisible(false)
    u24.Client:Get("OpenArmorTrimEffectPreview"):Connect(function(p33) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u4
            [3] = u19
        --]]
        u32:openPlainArmorTrimPreview({
            ["type"] = p33.armorTrimType,
            ["color"] = u4.WHITE,
            ["effectRank"] = u19.T7,
            ["effectType"] = p33.armorTrimEffectType,
            ["armorSet"] = p33.armorSet
        })
    end)
    u6(function(u34, u35, _) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u32
            [3] = u13
            [4] = u20
            [5] = u7
            [6] = u21
            [7] = u18
            [8] = u8
        --]]
        if u34.UserId ~= u10.LocalPlayer.UserId then
            return nil
        end
        task.spawn(function() --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u35
                [3] = u32
                [4] = u13
                [5] = u20
                [6] = u7
                [7] = u21
                [8] = u18
                [9] = u8
            --]]
            if u34 and not u34:HasAppearanceLoaded() then
                u34.CharacterAppearanceLoaded:Wait()
            end
            u35:WaitForChild("HumanoidRootPart")
            u35.Archivable = true
            u32.characterClone = u35:Clone()
            u32.characterClone.Name = u35.Name .. "_LockerPreviewClone"
            u32.characterClone.Parent = u13
            u20.sanitizeBedwarsChar(u32.characterClone)
            u32.characterClone:FindFirstChild("HumanoidRootPart").Anchored = true
            u32.characterClone:PivotTo(u32.backstageWorldPosition)
            u7.Controllers.NametagController:hideNametag(u32.characterClone)
            u32.cloneEntityInstance = u32.characterClone
            u32.cloneInventoryEntity = u21.new(u32.cloneEntityInstance)
            local v36 = u18:getAnimationFromCharacter(u32.characterClone, "idle")
            if v36 then
                u32.characterClone.Humanoid.Animator:LoadAnimation(v36):Play()
            end
            u7.Controllers.EmoteHandlerController:hookEmoteHandlers(-1, u32.characterClone, u8.new())
        end)
    end)
end
function u28.openPreview(u37, p38, p39) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u22
        [4] = u10
        [5] = u24
    --]]
    local v40 = u8.new()
    if u7.Controllers.SprintController:isSprinting() then
        u7.Controllers.SprintController:stopSprinting(true, true)
        if u37.camera then
            u37.camera.FieldOfView = u7.Controllers.FovController:getBaseFOV()
        end
    end
    local v41 = u7.Controllers.BackdropController
    local v42 = {
        ["fov"] = 35,
        ["cframe"] = u37.previewWorldPosition
    }
    local v43
    if p39 == nil then
        v43 = p39
    else
        v43 = p39.image
    end
    if v43 == nil then
        v43 = u22.BW_IN_GAME_ILLUSTRATION_BACKGROUND
    end
    v42.image = v43
    local v44
    if p39 == nil then
        v44 = p39
    else
        v44 = p39.backgroundColor
    end
    v42.backgroundColor = v44
    if p39 ~= nil then
        p39 = p39.imageTransparency
    end
    v42.imageTransparency = p39
    v41:setupBackdrop(v42)
    v40:GiveTask(function() --[[ Line: 162 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7.Controllers.BackdropController:clearBackdrop()
    end)
    u37:setupPreviewCamera()
    v40:GiveTask(function() --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u10
            [3] = u7
            [4] = u24
        --]]
        if u37.camera then
            local _ = u10.LocalPlayer.Character
            u7.Controllers.CameraController:deregisterCameraSubject("locker-preview")
            u37.camera.FieldOfView = u7.Controllers.FovController:getBaseFOV()
            u10.LocalPlayer.CameraMinZoomDistance = u37.initialCameraMinZoom
            u10.LocalPlayer.CameraMaxZoomDistance = u37.initialCameraMaxZoom
        end
        u24.Client:Get("ChangeCameraOcclusionMode"):SendToServer({
            ["occlusionMode"] = u37.initialOcclusionMode
        })
    end)
    if not p38 then
        u37:enableViewportOffset()
        v40:GiveTask(function() --[[ Line: 182 ]]
            --[[
            Upvalues:
                [1] = u37
            --]]
            return u37:disableViewportOffset()
        end)
    end
    u37:resetCamera()
    u37.previewOpen = true
    u37.previewMaid = v40
end
function u28.enableViewportOffset(u45) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u17
        [3] = u16
    --]]
    u12:BindToRenderStep("viewport-offset", Enum.RenderPriority.Camera.Value + 2, function() --[[ Line: 191 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u17
            [3] = u16
        --]]
        if u45.camera then
            local v46 = u17(u16.ViewSizeX(), 1, 35) * 9.5
            local v47 = u45.camera.CFrame
            local v48 = CFrame.new(v46 + u45.previewOffset.X, 0.5 + u45.previewOffset.Y, 5 + u45.previewOffset.Z)
            u45.camera.CFrame = v47 * v48
        end
    end)
    u45.viewportOffsetBound = true
end
function u28.disableViewportOffset(p49) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    if p49.viewportOffsetBound then
        u12:UnbindFromRenderStep("viewport-offset")
        p49.viewportOffsetBound = false
    end
end
function u28.setupPreviewCamera(p50) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u24
    --]]
    if p50.camera then
        p50:resetCamera()
        u10.LocalPlayer.CameraMaxZoomDistance = 27
        u10.LocalPlayer.CameraMinZoomDistance = 27
        local v51 = p50.camera
        if v51 ~= nil then
            v51:PivotTo(CFrame.new(p50.camera:GetPivot().Position) * p50.previewAngle)
        end
        local v52 = p50.previewScene
        if v52 ~= nil then
            v52 = v52:FindFirstChild("CameraSubject")
        end
        u7.Controllers.CameraController:registerCameraSubject("locker-preview", 100, v52)
        p50.camera.FieldOfView = 35
    end
    u24.Client:Get("ChangeCameraOcclusionMode"):SendToServer({
        ["occlusionMode"] = Enum.DevCameraOcclusionMode.Invisicam
    })
end
function u28.setupFullscreenCamera(p53) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p53.camera then
        p53:resetCamera()
        u10.LocalPlayer.CameraMinZoomDistance = 12
        u10.LocalPlayer.CameraMaxZoomDistance = 12
        u10.LocalPlayer.CameraMaxZoomDistance = 30
        u10.LocalPlayer.CameraMinZoomDistance = 3
        p53.camera.FieldOfView = 70
    end
end
function u28.resetCamera(p54) --[[ Line: 241 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p54.camera then
        p54.camera.CameraType = Enum.CameraType.Scriptable
        p54.camera.CameraType = Enum.CameraType.Custom
        u10.LocalPlayer.CameraMaxZoomDistance = 27
        u10.LocalPlayer.CameraMinZoomDistance = 27
        local v55 = p54.camera
        if v55 ~= nil then
            v55:PivotTo(CFrame.new(p54.camera:GetPivot().Position) * p54.previewAngle)
        end
    end
end
function u28.setFloorVisible(p56, p57) --[[ Line: 256 ]]
    local v58 = p56.previewScene
    if v58 ~= nil then
        v58 = v58:FindFirstChild("Floor")
    end
    if p57 and v58 then
        v58.Transparency = 0
        for v59, v60 in v58:GetChildren() do
            local _ = v59 - 1
            if v60:IsA("Texture") then
                v60.Transparency = 0
            end
        end
    else
        v58.Transparency = 1
        for v61, v62 in v58:GetChildren() do
            local _ = v61 - 1
            if v62:IsA("Texture") then
                v62.Transparency = 1
            end
        end
    end
end
function u28.closePreview(p63) --[[ Line: 286 ]]
    p63:cleanup()
    p63.previewMaid:DoCleaning()
    p63.previewOpen = false
end
function u28.isPreviewOpen(p64) --[[ Line: 291 ]]
    return p64.previewOpen
end
function u28.isEffectsPlaying(p65) --[[ Line: 294 ]]
    return p65.effectsPlaying
end
function u28.cleanup(p66) --[[ Line: 297 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
    --]]
    p66.effectsPlaying = false
    p66.effectsMaid:DoCleaning()
    u14.LockerPreviewEnded:fire()
    u7.Controllers.BackgroundMusicController:setMusicPaused(false)
    p66:setFloorVisible(false)
end
function u28.openFullscreenPreview(u67, p68, p69) --[[ Line: 304 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u2
        [4] = u5
        [5] = u23
        [6] = u26
    --]]
    local v70 = u8.new()
    u7.Controllers.FovController:setFOVOverride("locker-fullscreen-preview", 70, 100)
    local v71 = not u67.previewOpen
    if v71 then
        u67:openPreview(true)
        v70:GiveTask(function() --[[ Line: 310 ]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            return u67:cleanup()
        end)
    else
        v70:GiveTask(function() --[[ Line: 314 ]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            return u67:enableViewportOffset()
        end)
    end
    u7.Controllers.BackdropController:changeBackdropFov(70)
    if v71 then
        v70:GiveTask(function() --[[ Line: 320 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            return u7.Controllers.BackdropController:changeBackdropFov(35)
        end)
    end
    if not p69.fromLocker then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u5.MAIN)
    end
    local v72 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v73 = {
        ["appId"] = u23.LOCKER_PREVIEW_FULLSCREEN_APP_ID,
        ["app"] = u26
    }
    local v74
    if p69.fromLocker then
        v74 = u5.OVERLAY
    else
        v74 = u5.MAIN
    end
    v73.layer = v74
    v72:openApp(v73, {
        ["AppId"] = u23.LOCKER_PREVIEW_FULLSCREEN_APP_ID,
        ["FromLocker"] = p69.fromLocker,
        ["PreviewItem"] = p68,
        ["OnClose"] = p69.onClose
    })
    if p69.onOpen then
        p69.onOpen()
    end
    u67.isFullscreen = true
    u67.fullscreenMaid = v70
    u67:disableViewportOffset()
    u67:setupFullscreenCamera()
    u67:preview(p68)
end
function u28.openPlainArmorTrimPreview(u75, p76) --[[ Line: 346 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u2
        [3] = u23
        [4] = u27
        [5] = u5
        [6] = u7
    --]]
    u75:closePlainArmorTrimPreview()
    u75:openPreview(true, {
        ["imageTransparency"] = 1,
        ["backgroundColor"] = u25.backgroundTertiary
    })
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = u23.LOCKER_PREVIEW_PLAIN_BACKGROUND_APP_ID,
        ["app"] = u27,
        ["layer"] = u5.MAIN
    }, {
        ["AppId"] = u23.LOCKER_PREVIEW_PLAIN_BACKGROUND_APP_ID,
        ["OnClose"] = function() --[[ Name: OnClose, Line 358 ]]
            --[[
            Upvalues:
                [1] = u75
            --]]
            return u75:closePlainArmorTrimPreview()
        end
    })
    u75.isFullscreen = true
    u75:disableViewportOffset()
    u75:setupFullscreenCamera()
    u7.Controllers.BackdropController:changeBackdropFov(70)
    u75:preview({
        ["armorTrim"] = p76
    })
end
function u28.closePlainArmorTrimPreview(p77) --[[ Line: 370 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u23
        [3] = u7
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u23.LOCKER_PREVIEW_PLAIN_BACKGROUND_APP_ID) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u23.LOCKER_PREVIEW_PLAIN_BACKGROUND_APP_ID)
    end
    if p77.previewOpen then
        p77:closePreview()
    end
    p77.isFullscreen = false
    u7.Controllers.FovController:removeFOVOverride("locker-fullscreen-preview")
end
function u28.closeFullscreenPreview(p78, p79) --[[ Line: 380 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u23
    --]]
    u7.Controllers.FovController:removeFOVOverride("locker-fullscreen-preview")
    p78.fullscreenMaid:DoCleaning()
    p78:resetCamera()
    p78:setupPreviewCamera()
    if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u23.LOCKER_PREVIEW_FULLSCREEN_APP_ID) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u23.LOCKER_PREVIEW_FULLSCREEN_APP_ID)
    end
    p78.isFullscreen = false
    if p79 then
        p79()
    end
end
function u28.preview(p80, p81, p82) --[[ Line: 393 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
    --]]
    if not p80.previewOpen then
        p80:openPreview()
    end
    p80:cleanup()
    p80.effectsPlaying = true
    u14.LockerPreviewStarted:fire()
    if p81.killEffect then
        u7.Controllers.BackgroundMusicController:setMusicPaused(true)
        p80.effectsMaid = u7.Controllers.KillEffectPreviewController:previewKillEffect(p81.killEffect)
    elseif p81.bedBreakEffect then
        u7.Controllers.BackgroundMusicController:setMusicPaused(true)
        p80.effectsMaid = u7.Controllers.BedBreakEffectPreviewController:previewBedBreakEffect(p81.bedBreakEffect)
    elseif p81.bedSkin then
        p80.effectsMaid = u7.Controllers.BedSkinPreviewController:previewBedSkin(p81.bedSkin)
    elseif p81.itemSkin then
        p80.effectsMaid = u7.Controllers.BedSkinPreviewController:previewBedSkin(p81.itemSkin)
    elseif p81.lobbyGadget then
        if p80.characterClone then
            p80.effectsMaid = u7.Controllers.LobbyGadgetPreviewController:previewLobbyGadget(p81.lobbyGadget, p80.characterClone, p80.cloneInventoryEntity)
        end
    elseif p81.emote then
        if p80.characterClone then
            u7.Controllers.BackgroundMusicController:setMusicPaused(true)
            p80.effectsMaid = u7.Controllers.EmotePreviewController:previewEmote(p81.emote, p80.characterClone)
        end
    elseif p81.armorTrim then
        p80.effectsMaid = u7.Controllers.KitPreviewController:previewArmorTrim(p81.armorTrim)
    elseif p81.kit and not p81.kitSkin then
        if p80.characterClone then
            p80.effectsMaid = u7.Controllers.KitPreviewController:previewKit({
                ["kind"] = "kit",
                ["kit"] = p81.kit
            }, p80.characterClone)
        end
    elseif p81.kitSkin and p80.characterClone then
        p80.effectsMaid = u7.Controllers.KitPreviewController:previewKit({
            ["kind"] = "kitSkin",
            ["kitSkin"] = p81.kitSkin,
            ["kit"] = p81.kit
        }, p80.characterClone)
    end
    if not (p80.isFullscreen or p82) then
        p80:resetCamera()
    end
end
function u28.setPreviewAngle(p83, p84) --[[ Line: 441 ]]
    p83.previewAngle = p84
end
function u28.setPreviewOffset(p85, p86) --[[ Line: 444 ]]
    p85.previewOffset = p86
end
function u28.getBackstageWorldPosition(p87) --[[ Line: 447 ]]
    return p87.backstageWorldPosition
end
function u28.getPreviewDummyPosition(p88) --[[ Line: 450 ]]
    local v89 = p88.previewScene
    if v89 ~= nil then
        v89 = v89:FindFirstChild("DummyPosition")
    end
    return v89.WorldPosition
end
function u28.getBedAttachment(p90) --[[ Line: 457 ]]
    local v91 = p90.previewScene
    if v91 ~= nil then
        v91 = v91:FindFirstChild("BedPosition")
    end
    return v91
end
function u28.getBedCenterAttachment(p92) --[[ Line: 464 ]]
    local v93 = p92.previewScene
    if v93 ~= nil then
        v93 = v93:FindFirstChild("BedCenterPosition")
    end
    return v93
end
function u28.getCameraSubject(p94) --[[ Line: 471 ]]
    local v95 = p94.previewScene
    if v95 ~= nil then
        v95 = v95:FindFirstChild("CameraSubject")
    end
    return v95
end
function u28.toggleLighting(p96, p97) --[[ Line: 478 ]]
    local v98 = p96.previewScene
    if v98 ~= nil then
        v98 = v98:FindFirstChild("BackLighting")
        if v98 ~= nil then
            v98 = v98:FindFirstChild("PointLight")
        end
    end
    local v99 = p96.previewScene
    if v99 ~= nil then
        v99 = v99:FindFirstChild("Lighting")
        if v99 ~= nil then
            v99 = v99:FindFirstChild("PointLight")
        end
    end
    v99.Brightness = 0.5
    if v98 then
        v98.Enabled = p97
    end
    if v99 then
        v99.Enabled = p97
    end
end
u7.CreateController(u28.new())
return nil