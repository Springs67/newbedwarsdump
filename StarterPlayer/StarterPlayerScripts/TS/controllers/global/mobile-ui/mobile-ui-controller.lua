local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent, "ui", "mobile-ui").MobileUI
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "MobileUiController"
    end,
    ["__index"] = u8
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
        [3] = u7
    --]]
    u8.constructor(p13)
    p13.Name = "MobileUiController"
    p13.uiMaid = u4.new()
    p13.uiHiddenIds = {}
    p13.isMoveMountEnabledSignal = u7.new()
end
function u10.KnitStart(u14) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u6
    --]]
    u8.KnitStart(u14)
    if not u2.isMobileControls() then
        return nil
    end
    u14:mountMobileUI()
    task.spawn(function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u6
        --]]
        u14.touchGui = u6.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TouchGui")
    end)
end
function u10.hideUi(p15, p16) --[[ Line: 42 ]]
    local v17 = p15.uiHiddenIds
    table.insert(v17, p16)
    p15:unmountMobileUI()
    p15:disableTouchGui()
end
function u10.unhideUi(p18, p19) --[[ Line: 49 ]]
    local v20 = p18.uiHiddenIds
    local v21 = (table.find(v20, p19) or 0) - 1
    if v21 ~= -1 then
        table.remove(p18.uiHiddenIds, v21 + 1)
    end
    if #p18.uiHiddenIds == 0 then
        p18:mountMobileUI()
        p18:enableTouchGui()
    end
end
function u10.toggleMountMovementControls(p22, p23) --[[ Line: 61 ]]
    p22.isMoveMountEnabledSignal:Fire(p23)
end
function u10.mountMobileUI(p24) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u9
        [3] = u6
    --]]
    local u25 = u5.mount(u5.createElement(u9, {
        ["isMoveMountEnabledSignal"] = p24.isMoveMountEnabledSignal
    }), u6.LocalPlayer:WaitForChild("PlayerGui"))
    p24.uiMaid:GiveTask(function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u25
        --]]
        return u5.unmount(u25)
    end)
end
function u10.unmountMobileUI(p26) --[[ Line: 72 ]]
    p26.uiMaid:DoCleaning()
end
function u10.disableTouchGui(p27) --[[ Line: 75 ]]
    if p27.touchGui then
        p27.touchGui.Enabled = false
    end
end
function u10.enableTouchGui(p28) --[[ Line: 80 ]]
    if p28.touchGui then
        p28.touchGui.Enabled = true
    end
end
v3.CreateController(u10.new())
return nil