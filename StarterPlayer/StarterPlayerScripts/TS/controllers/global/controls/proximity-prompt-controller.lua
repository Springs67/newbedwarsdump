local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.GameCoreClientSyncEvents
local u5 = v2.GamepadKeycodes
local u6 = v2.KeyboardKeycodes
local u7 = v2.WatchCollectionTag
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "ProximityPromptController"
    end,
    ["__index"] = u13
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p18)
    p18.Name = "ProximityPromptController"
    p18.proximityPromptDefinitions = {}
end
function u15.KnitStart(u19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u4
        [3] = u9
        [4] = u14
        [5] = u6
        [6] = u5
        [7] = u12
        [8] = u7
    --]]
    u13.KnitStart(u19)
    u4.KeybindsRegistered:connect(function(p20) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u14
            [3] = u6
            [4] = u5
            [5] = u12
            [6] = u19
        --]]
        local v21 = u9.Controllers.KeybindLoadController:getKeybinds()
        local u22 = u14.KEYBOARD_KEYBINDS.controlActions.Interact
        local u23 = u14.GAMEPAD_KEYBINDS.controlActions.Interact
        local v24 = p20.actionKeybindDefinitions.Interact
        if v24 ~= nil then
            local function v26(p25) --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u22
                    [3] = u5
                    [4] = u23
                --]]
                if p25:IsA("KeyCode") then
                    if table.find(u6, p25) == nil then
                        if table.find(u5, p25) ~= nil then
                            u23 = p25
                        end
                    else
                        u22 = p25
                    end
                else
                    return nil
                end
            end
            for v27, v28 in v24 do
                v26(v28, v27 - 1, v24)
            end
        end
        local v29
        if v21 then
            local v30 = v21.keyboard
            if v30 ~= nil then
                v30 = v30.controlActions.Interact
            end
            v29 = v30 == u22
            if v29 then
                local v31 = v21.gamepad
                if v31 ~= nil then
                    v31 = v31.controlActions.Interact
                end
                v29 = v31 == u23
            end
        else
            v29 = v21
        end
        if v29 then
            return nil
        end
        for v32, v33 in u12:GetTagged("ProximityPrompt") do
            local _ = v32 - 1
            if v33:IsA("ProximityPrompt") then
                if not u19:isCustomKeyboardKeybind(v33) then
                    v33.KeyboardKeyCode = u22
                end
                if not u19:isCustomGamepadKeybind(v33) then
                    v33.GamepadKeyCode = u23
                end
            end
        end
    end)
    u7("ProximityPrompt", function(p34) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        if not p34:IsA("ProximityPrompt") then
            return nil
        end
        u19:setupProximityPromptKeybind(p34)
    end)
end
function u15.createProximityPrompt(_, p35) --[[ Line: 110 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u11
        [3] = u12
    --]]
    local v36 = {
        ["HoldDuration"] = 0,
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 7.5,
        ["ClickablePrompt"] = u3.isMobileControls()
    }
    for v37, v38 in p35 do
        v36[v37] = v38
    end
    local v39 = u11("ProximityPrompt", v36)
    if p35.KeyboardKeyCode then
        v39:SetAttribute("CustomKeyboardKeyCode", true)
    end
    if p35.GamepadKeyCode then
        v39:SetAttribute("CustomGamepadKeyCode", true)
    end
    u12:AddTag(v39, "ProximityPrompt")
    return v39
end
function u15.isCustomKeyboardKeybind(_, p40) --[[ Line: 131 ]]
    return p40:GetAttribute("CustomKeyboardKeyCode") == true
end
function u15.isCustomGamepadKeybind(_, p41) --[[ Line: 134 ]]
    return p41:GetAttribute("CustomGamepadKeyCode") == true
end
function u15.setupProximityPromptKeybind(p42, p43) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v44 = u10.Controllers.KeybindLoadController:waitForKeybinds()
    local v45 = not p42:isCustomKeyboardKeybind(p43)
    if v45 then
        v45 = v44.keyboard
        if v45 ~= nil then
            v45 = v45.controlActions.Interact
        end
    end
    if v45 then
        local v46 = v44.keyboard
        if v46 ~= nil then
            v46 = v46.controlActions.Interact
        end
        p43.KeyboardKeyCode = v46
    end
    local v47 = not p42:isCustomGamepadKeybind(p43)
    if v47 then
        v47 = v44.gamepad
        if v47 ~= nil then
            v47 = v47.controlActions.Interact
        end
    end
    if v47 then
        local v48 = v44.gamepad
        if v48 ~= nil then
            v48 = v48.controlActions.Interact
        end
        p43.GamepadKeyCode = v48
    end
end
u9.CreateController(u15.new())
return nil