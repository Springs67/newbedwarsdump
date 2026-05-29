local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.RunService
local u14 = v11.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent, "lobby", "ambience", "environments", "lobby-environment").LobbyEnvironment
local u16 = v1.import(script, script.Parent.Parent.Parent, "lobby", "ambience", "environments", "og-lobby-environment").OG_LOBBY_ENVIRONMENT
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space")
local u19 = u18.ScreenWidthToWorldWidth
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "BackdropController"
    end,
    ["__index"] = u17
})
u21.__index = u21
function u21.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u14
        [3] = u9
    --]]
    u17.constructor(p24)
    p24.Name = "BackdropController"
    p24.camera = u14.CurrentCamera
    p24.fov = 0
    p24.maid = u9.new()
end
function u21.KnitStart(p25) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    u17.KnitStart(p25)
end
function u21.setupBackdrop(u26, p27) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u5
        [4] = u7
        [5] = u12
        [6] = u2
        [7] = u10
        [8] = u14
        [9] = u4
        [10] = u20
        [11] = u13
        [12] = u16
        [13] = u15
    --]]
    u26.maid:DoCleaning()
    u26.maid = u9.new()
    u26.fov = p27.fov
    u8.Controllers.LobbyHudController:hideLobbyHud("backdrop-open")
    u8.Controllers.HotbarController:hideHotbar("backdrop-open")
    if u5.isMobileControls() then
        u7.Controllers.MobileUiController:hideUi("backdrop-open")
    end
    local u28 = u12.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    local u29
    if u28 == nil then
        u29 = u28
    else
        u29 = u28:FindFirstChild("ActionBarScreenGui")
    end
    if u29 then
        u29.Enabled = false
    end
    local u30
    if u28 == nil then
        u30 = u28
    else
        u30 = u28:FindFirstChild("RoactTree")
    end
    if u30 then
        u30.Enabled = false
    end
    if u28 ~= nil then
        u28 = u28:FindFirstChild("QueueRegionDisplay")
    end
    if u28 then
        u28.Enabled = false
    end
    u26.maid:GiveTask(function() --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u8
            [4] = u29
            [5] = u30
            [6] = u28
        --]]
        if u5.isMobileControls() then
            u7.Controllers.MobileUiController:unhideUi("backdrop-open")
        end
        u8.Controllers.LobbyHudController:unhideLobbyHud("backdrop-open")
        u8.Controllers.HotbarController:unhideHotbar("backdrop-open")
        if u29 then
            u29.Enabled = true
        end
        if u30 then
            u30.Enabled = true
        end
        if u28 then
            u28.Enabled = true
        end
    end)
    local u31 = {}
    for _, v32 in u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbilities() do
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):blockAbility(v32.abilityId, "backdrop-open")
        local v33 = v32.abilityId
        table.insert(u31, v33)
    end
    u26.maid:GiveTask(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u31
        --]]
        for v34, v35 in u31 do
            local _ = v34 - 1
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):unblockAbility(v35, "backdrop-open")
        end
    end)
    u26.maid:GiveTask(u7.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["blockSprint"] = true
    }))
    local u36 = u10("Part", {
        ["Name"] = "Backdrop",
        ["CastShadow"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["CanTouch"] = false,
        ["Size"] = u26:getBackdropSize(),
        ["CFrame"] = p27.cframe,
        ["Parent"] = u14
    })
    local v37 = {
        ["LightInfluence"] = 0,
        ["Parent"] = u36,
        ["Face"] = Enum.NormalId.Back
    }
    local v38 = {}
    local v39 = p27.image
    v38.Image = v39 == nil and "" or v39
    v38.Size = UDim2.fromScale(1, 1)
    v38.ScaleType = Enum.ScaleType.Stretch
    v38.BackgroundColor3 = p27.backgroundColor or u4.darken(u20.backgroundPrimary, 0.25)
    local v40 = p27.imageTransparency
    v38.ImageTransparency = v40 == nil and 0.9 or v40
    v38.BorderSizePixel = 0
    v37.Children = { u10("ImageLabel", v38) }
    u10("SurfaceGui", v37)
    u13:BindToRenderStep("viewport-backdrop", Enum.RenderPriority.Camera.Value + 3, function() --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u36
        --]]
        if u26.camera then
            u36.CFrame = CFrame.lookAt(u36.CFrame.Position, u26.camera:GetPivot().Position)
            u36.CFrame = u26.camera:GetPivot() + u26.camera:GetPivot().LookVector * 140
        end
    end)
    local u41 = u26.camera
    if u41 ~= nil then
        u41 = u41:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            if u26.backdrop then
                u26.backdrop.Size = u26:getBackdropSize()
            end
        end)
    end
    local u42 = u7.Controllers.EnvironmentController:getCurrentEnvironment()
    u7.Controllers.EnvironmentController:setupEnvironment(u16)
    u26.maid:GiveTask(function() --[[ Line: 180 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u42
            [3] = u15
        --]]
        u7.Controllers.EnvironmentController:setupEnvironment(u42 or u15)
    end)
    local u43 = u8.Controllers.LightingController:getAtmosphereModifier():addModifier(100, {
        ["Density"] = 0
    })
    local u44 = u8.Controllers.LightingController.sunRayModifier:addModifier(100, {
        ["Enabled"] = false
    })
    local u45 = u8.Controllers.LightingController.colorCorrectionModifier:addModifier(100, {
        ["Saturation"] = 0
    })
    u26.maid:GiveTask(function() --[[ Line: 192 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u44
            [3] = u45
            [4] = u7
            [5] = u42
            [6] = u15
        --]]
        u43:destroy()
        u44:destroy()
        u45:destroy()
        u7.Controllers.EnvironmentController:setupEnvironment(u42 or u15)
    end)
    u7.Controllers.ShiftLockController:registerShiftLockControlDisabler("backdrop")
    u26.maid:GiveTask(function() --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7.Controllers.ShiftLockController:unregisterShiftLockControlDisabler("backdrop")
    end)
    u26.backdrop = u36
    u26.maid:GiveTask(u36)
    u26.maid:GiveTask(function() --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        local v46 = u41
        if v46 ~= nil then
            v46 = v46:Disconnect()
        end
        return v46
    end)
    u26.maid:GiveTask(function() --[[ Line: 212 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        return u13:UnbindFromRenderStep("viewport-backdrop")
    end)
end
function u21.clearBackdrop(p47) --[[ Line: 216 ]]
    p47.maid:DoCleaning()
end
function u21.changeBackdropFov(p48, p49) --[[ Line: 219 ]]
    if not p48.backdrop then
        return nil
    end
    p48.fov = p49
    p48.backdrop.Size = p48:getBackdropSize()
end
function u21.getBackdropSize(p50) --[[ Line: 226 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u18
    --]]
    local v51 = u19(u18.ViewSizeX(), -1, p50.fov) * 165
    local v52 = u19(u18.ViewSizeY(), -1, p50.fov) * 165
    return Vector3.new(v51, v52, 1)
end
u7.CreateController(u21.new())
return nil