local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Action
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults
local v5 = {}
local u6 = nil
local u7 = nil
function v5.toProfileData(p8) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    local v9 = {}
    local v10
    if p8.keyboardKeybindDefinition then
        v10 = u6(p8.keyboardKeybindDefinition)
    else
        v10 = nil
    end
    v9.keyboard = v10
    local v11
    if p8.gamepadKeybindDefinition then
        v11 = u7(p8.gamepadKeybindDefinition)
    else
        v11 = nil
    end
    v9.gamepad = v11
    return v9
end
local u12 = nil
local u13 = nil
function v5.toKeybindDefinition(p14) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
    --]]
    local v15
    if p14.keyboard then
        v15 = u12(p14.keyboard)
    else
        v15 = nil
    end
    local v16
    if p14.gamepad then
        v16 = u13(p14.gamepad)
    else
        v16 = nil
    end
    return {
        ["keyboardKeybindDefinition"] = v15,
        ["gamepadKeybindDefinition"] = v16
    }
end
local u17 = nil
u6 = function(p18) --[[ Name: toKeyboardProfileData, Line 28 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
    --]]
    local v19 = {}
    for v20, v21 in u2.KeyboardControlActions do
        local _ = v20 - 1
        v19[v21] = u17(p18.controlActions[v21])
    end
    for v22, v23 in u2.AbilityActions do
        local _ = v22 - 1
        v19[v23] = u17(p18.abilityActions[v23])
    end
    return v19
end
v5.toKeyboardProfileData = u6
u7 = function(p24) --[[ Name: toGamepadProfileData, Line 51 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u17
    --]]
    local v25 = {
        ["abilityKeybind"] = {},
        ["abilityPositionActions"] = {},
        ["controls"] = {}
    }
    for v26, v27 in u2.GamepadControlActions do
        local _ = v26 - 1
        local v28 = u17(p24.controlActions[v27])
        v25.controls[v27] = v28
    end
    for v29, v30 in u2.GamepadAbilityPositions do
        local _ = v29 - 1
        local v31 = u17(p24.abilityKeybind[v30])
        v25.abilityKeybind[v30] = v31
    end
    for v32, v33 in u2.GamepadAbilityPositions do
        local _ = v32 - 1
        local v34 = p24.abilityPositionActions[v33]
        v25.abilityPositionActions[v33] = v34
    end
    return v25
end
v5.toGamepadProfileData = u7
u13 = function(p35) --[[ Name: toGamepadKeybindDefinition, Line 88 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    local u36 = u4.GAMEPAD_KEYBINDS
    if p35 ~= nil then
        local v37 = p35.controls
        local function v47(p38, p39) --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u36
            --]]
            local v40 = nil
            for v41, v42 in u2.GamepadControlActions do
                local _ = v41 - 1
                if v42 == p39 == true then
                    v40 = v42
                    break
                end
            end
            local v43 = p38.keycodeName
            if v43 == "" then
                v43 = false
            end
            local v44 = v43 and true or false
            if v40 then
                local v45 = u36.controlActions
                local v46
                if v44 then
                    v46 = Enum.KeyCode[p38.keycodeName]
                else
                    v46 = Enum.UserInputType[p38.userInputTypeName]
                end
                v45[p39] = v46
            end
        end
        for v48, v49 in v37 do
            v47(v49, v48, v37)
        end
    end
    if p35 ~= nil then
        local v50 = p35.abilityKeybind
        local function v60(p51, p52) --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u36
            --]]
            local v53 = nil
            for v54, v55 in u2.GamepadControlActions do
                local _ = v54 - 1
                if v55 == p52 == true then
                    v53 = v55
                    break
                end
            end
            local v56 = p51.keycodeName
            if v56 == "" then
                v56 = false
            end
            local v57 = v56 and true or false
            if v53 then
                local v58 = u36.controlActions
                local v59
                if v57 then
                    v59 = Enum.KeyCode[p51.keycodeName]
                else
                    v59 = Enum.UserInputType[p51.userInputTypeName]
                end
                v58[p52] = v59
            end
        end
        for v61, v62 in v50 do
            v60(v62, v61, v50)
        end
    end
    return u36
end
v5.toGamepadKeybindDefinition = u13
u12 = function(p63) --[[ Name: toKeyboardKeybindDefinition, Line 150 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
    --]]
    local u64 = u4.KEYBOARD_KEYBINDS
    local function v76(p65, p66) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u64
        --]]
        local v67 = nil
        for v68, v69 in u2.KeyboardControlActions do
            local _ = v68 - 1
            if v69 == p66 == true then
                v67 = v69
                break
            end
        end
        local v70 = p65.keycodeName
        if v70 == "" then
            v70 = false
        end
        local v71 = v70 and true or false
        if v67 then
            local v72 = u64.controlActions
            local v73
            if v71 then
                v73 = Enum.KeyCode[p65.keycodeName]
            else
                v73 = Enum.UserInputType[p65.userInputTypeName]
            end
            v72[p66] = v73
        else
            local v74 = u64.abilityActions
            local v75
            if v71 then
                v75 = Enum.KeyCode[p65.keycodeName]
            else
                v75 = Enum.UserInputType[p65.userInputTypeName]
            end
            v74[p66] = v75
        end
    end
    for v77, v78 in p63 do
        v76(v78, v77, p63)
    end
    return u64
end
v5.toKeyboardKeybindDefinition = u12
u17 = function(p79) --[[ Name: getInputName, Line 183 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v80 = p79.Name
    local v81 = false
    for v82, v83 in Enum.KeyCode:GetEnumItems() do
        local _ = v82 - 1
        if u3.includes(v83.Name, v80) then
            v81 = true
            break
        end
    end
    return v81 and {
        ["keycodeName"] = v80
    } or {
        ["userInputTypeName"] = v80
    }
end
return {
    ["KeybindDefinitionConverter"] = v5
}