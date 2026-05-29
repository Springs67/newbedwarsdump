local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-validator").KeybindValidator
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = u1.import(script, script.Parent, "settings-keyboard-controls-section").SettingsKeyboardControlsSection
return {
    ["SettingsKeyboardControlPage"] = v9.new(u8)(function(_, p15) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u12
            [4] = u6
            [5] = u11
            [6] = u4
            [7] = u1
            [8] = u8
            [9] = u13
            [10] = u3
            [11] = u5
            [12] = u14
        --]]
        local v16 = p15.useState
        local v17 = p15.useValue
        local v18 = p15.useEffect
        local u19, u20 = v16(u7.deepCopy(u10.KEYBOARD_KEYBINDS))
        local u21 = v17({})
        local u22 = nil
        local function v23() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u7
                [3] = u10
            --]]
            u22(u7.deepCopy(u10.KEYBOARD_KEYBINDS), true)
        end
        u22 = function(p24, p25) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u6
                [3] = u21
                [4] = u11
                [5] = u20
            --]]
            u12.Client:Get("UpdateProfileDataKeybinds"):SendToServer({
                ["keyboardKeybindDefinition"] = p24
            })
            u6.Controllers.KeybindLoadController:registerKeybinds({
                ["keyboard"] = p24,
                ["gamepad"] = u6.Controllers.KeybindLoadController:waitForKeybinds().gamepad
            })
            u21.value = u11.getInvalidActions(p24)
            if p25 then
                u20(p24)
            end
        end
        v18(function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u1
                [3] = u6
                [4] = u21
                [5] = u11
                [6] = u20
                [7] = u7
            --]]
            if u4.isHoarceKat() then
                return nil
            end
            u1.Promise.defer(function() --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u21
                    [3] = u11
                    [4] = u20
                    [5] = u7
                --]]
                local v26 = u6.Controllers.KeybindLoadController:waitForKeybinds().keyboard
                if v26 then
                    u21.value = u11.getInvalidActions(v26)
                    u20(u7.deepCopy(v26))
                end
            end):catch(function(p27) --[[ Line: 58 ]]
                return warn(p27)
            end)
        end, {})
        local v28 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.98, 1)
        }
        local v29 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v30 = #v29
        local v31 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 20)
        }
        local v32 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Right",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v33 = #v32
        local v34 = #u21.value ~= 0
        if v34 then
            local v35 = u8.createFragment
            local v36 = {}
            local v37 = u8.createElement
            local v38 = "TextLabel"
            local v39 = {
                ["TextXAlignment"] = "Right",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 1)
            }
            local v40
            if u21 then
                local v41 = #u21.value
                v40 = tostring(v41) .. " invalid actions"
            else
                v40 = ""
            end
            v39.Text = v40
            v39.TextColor3 = u13.backgroundError
            v36.ErrorText = v37(v38, v39)
            v34 = v35(v36)
        end
        if v34 then
            v32[v33 + 1] = v34
        end
        v32[#v32 + 1] = u8.createElement(u3, {
            ["Text"] = "Reset All To Default",
            ["LayoutOrder"] = 2,
            ["OnClick"] = v23,
            ["BackgroundColor3"] = Color3.fromRGB(47, 48, 77),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(0.98, 0)
        })
        v29.HelpSection = u8.createElement(u5, v31, v32)
        v29[v30 + 1] = u8.createElement(u14, {
            ["Title"] = "Controls",
            ["Keybinds"] = u19.controlActions,
            ["UpdateProfileDataKeybind"] = function(p42, p43) --[[ Name: UpdateProfileDataKeybind, Line 114 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u22
                --]]
                u19.controlActions[p42] = p43
                u22(u19, true)
            end,
            ["ResetKeybind"] = function(p44) --[[ Name: ResetKeybind, Line 118 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u10
                    [3] = u22
                --]]
                u19.controlActions[p44] = u10.KEYBOARD_KEYBINDS.controlActions[p44]
                u22(u19, true)
            end,
            ["InvalidActions"] = u21.value,
            ["FrameProps"] = {
                ["LayoutOrder"] = 2
            }
        })
        v29[v30 + 2] = u8.createElement(u14, {
            ["Title"] = "Abilities",
            ["Keybinds"] = u19.abilityActions,
            ["UpdateProfileDataKeybind"] = function(p45, p46) --[[ Name: UpdateProfileDataKeybind, Line 131 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u22
                --]]
                u19.abilityActions[p45] = p46
                u22(u19, true)
            end,
            ["ResetKeybind"] = function(p47) --[[ Name: ResetKeybind, Line 135 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u10
                    [3] = u22
                --]]
                u19.abilityActions[p47] = u10.KEYBOARD_KEYBINDS.abilityActions[p47]
                u22(u19, true)
            end,
            ["InvalidActions"] = u21.value,
            ["FrameProps"] = {
                ["LayoutOrder"] = 3
            }
        })
        return u8.createFragment({
            ["ControlsPageContainer"] = u8.createElement(u5, v28, v29)
        })
    end)
}