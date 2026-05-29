local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.GameCoreClientSyncEvents
local u6 = v3.getDefaultMobileLayoutDefinition
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.Signal
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u15 = {
    [v14.MOBILE_AUTO_BRIDGE_BUTTON] = "AutoBridge",
    [v14.MOBILE_BLOCK_BREAK_BUTTON] = "BlockBreak",
    [v14.MOBILE_INTERACT_BUTTON] = "Interact",
    [v14.MOBILE_PROJECTILE_BUTTON] = "FireProjectile"
}
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "MobileLayoutLoadController"
    end,
    ["__index"] = u12
})
u16.__index = u16
function u16.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
    --]]
    u12.constructor(p19)
    p19.Name = "MobileLayoutLoadController"
    p19.hasLoadedMobileLayout = false
    p19.hasLoadedMobileLayoutSignal = u9.new()
end
function u16.KnitStart(u20) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u4
        [3] = u13
        [4] = u2
        [5] = u11
        [6] = u15
        [7] = u6
        [8] = u5
    --]]
    u12.KnitStart(u20)
    if not u4.isMobileControls() then
        return nil
    end
    u13.Client:Get("RetrieveCustomMobileLayout"):CallServerAsync():andThen(function(p21) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u2
        --]]
        local v22
        if p21 == nil then
            v22 = p21
        else
            v22 = p21.mobileLayoutDefinition
        end
        if not v22 then
            u20.hasLoadedMobileLayout = true
            u20.hasLoadedMobileLayoutSignal:Fire(true)
            u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):setIsLegacyMode(false)
            return nil
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):setIsLegacyMode(false)
        u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):registerMoblileLayoutDefinition(p21.mobileLayoutDefinition)
        u20.hasLoadedMobileLayout = true
        u20.hasLoadedMobileLayoutSignal:Fire(true)
    end)
    u11.SettingChanged:connect(function(p23) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u2
            [3] = u6
            [4] = u13
        --]]
        if u15[p23.setting] == nil then
            return nil
        end
        local v24 = u15[p23.setting]
        local v25 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController").mobileLayoutDefinition
        if p23.value == true then
            v25[v24] = u6()[v24]
        else
            u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController").mobileLayoutDefinition[v24] = nil
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):registerMoblileLayoutDefinition(v25)
        u13.Client:Get("UpdateCustomMobileLayout"):SendToServer({
            ["mobileLayoutDefinition"] = v25
        })
    end)
    task.defer(function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:setJumpDefaults()
        u20:loadJumpButtonLayout()
    end)
    u5.MobileLayoutRegistered:connect(function(_) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:loadJumpButtonLayout()
    end)
end
function u16.onMobileLayoutLoaded(p26) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if p26.hasLoadedMobileLayout then
        return u1.Promise.new(function(p27) --[[ Line: 98 ]]
            return p27(true)
        end)
    else
        return p26.hasLoadedMobileLayoutSignal:WaitPromise()
    end
end
function u16.loadJumpButtonLayout(p28) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
    --]]
    local v29 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("Jump")
    local v30 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getIsLegacyMode()
    local v31 = u10.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")
    local v32
    if v30 then
        v32 = p28.defaultJumpAnchorPoint
    else
        v32 = Vector2.new(0.5, 0.5)
    end
    v31.AnchorPoint = v32
    local v33
    if v30 then
        v33 = p28.defaultJumpSize
    else
        v33 = v29.size
    end
    v31.Size = v33
    local v34
    if v30 then
        v34 = p28.defaultJumpPosition
    else
        v34 = v29.position
    end
    v31.Position = v34
    local v35
    if v30 then
        v35 = Enum.SizeConstraint.RelativeXY
    else
        v35 = Enum.SizeConstraint.RelativeYY
    end
    v31.SizeConstraint = v35
end
function u16.setJumpDefaults(p36) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v37 = u10.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")
    p36.defaultJumpAnchorPoint = v37.AnchorPoint
    p36.defaultJumpPosition = v37.Position
    p36.defaultJumpSize = v37.Size
end
v8.CreateController(u16.new())
return nil