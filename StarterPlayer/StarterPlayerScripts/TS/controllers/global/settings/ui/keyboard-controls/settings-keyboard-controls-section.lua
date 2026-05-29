local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-keybind-select").SettingKeybindSelect
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-row").SettingRow
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u8 = v1.import(script, script.Parent.Parent, "settings-section").SettingsSection
return {
    ["SettingsKeyboardControlsSection"] = v4.new(u3)(function(u9, p10) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
            [3] = u6
            [4] = u7
            [5] = u5
            [6] = u8
        --]]
        local _ = p10.useState
        local u11 = p10.useMemo
        local v12 = u2.entries(u9.Keybinds)
        table.sort(v12, function(p13, p14) --[[ Line: 15 ]]
            local v15 = p13[1]
            local v16 = tostring(v15)
            local v17 = p14[1]
            return v16 < tostring(v17)
        end)
        local function v35(p18) --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u11
                [3] = u3
                [4] = u6
                [5] = u7
                [6] = u5
            --]]
            local u19 = p18[1]
            local u20 = p18[2]
            local u21 = nil
            for v22, v23 in u9.InvalidActions do
                local _ = v22 - 1
                if v23.inputAction == u19 == true then
                    u21 = v23
                    break
                end
            end
            return u11(function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u19
                    [3] = u6
                    [4] = u7
                    [5] = u5
                    [6] = u20
                    [7] = u21
                    [8] = u9
                --]]
                local v24 = u3.createFragment
                local v25 = {}
                local v26 = u19
                local v27 = "SettingRow_" .. tostring(v26)
                local v28 = u3.createElement
                local v29 = u6
                local v30 = {}
                local v31 = u19
                v30.Name = tostring(v31)
                v30.ThemeColor = u7.backgroundPrimary
                v30.FrameProps = {
                    ["Size"] = UDim2.new(0.98, 0, 0, 51)
                }
                v30.ListLayoutPadding = UDim.new(0.1, 0)
                local v32 = {}
                local v33 = u19
                v32["SettingKeybindSelect_" .. tostring(v33)] = u3.createElement(u5, {
                    ["Keybind"] = u20,
                    ["IsInvalid"] = u21 and {
                        ["overlappedActions"] = u21.overlappingActions
                    } or nil,
                    ["UpdateProfileDataKeybind"] = function(p34) --[[ Name: UpdateProfileDataKeybind, Line 51 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u19
                        --]]
                        u9.UpdateProfileDataKeybind(u19, p34)
                    end,
                    ["ResetKeybind"] = function() --[[ Name: ResetKeybind, Line 54 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u19
                        --]]
                        return u9.ResetKeybind(u19)
                    end
                })
                v25[v27] = v28(v29, v30, v32)
                return v24(v25)
            end, { u20 })
        end
        local v36 = table.create(#v12)
        for v37, v38 in v12 do
            v36[v37] = v35(v38, v37 - 1, v12)
        end
        local v39 = {
            ["Title"] = u9.Title,
            ["FrameProps"] = u9.FrameProps
        }
        local v40 = {}
        local v41 = #v40
        for v42, v43 in v36 do
            v40[v41 + v42] = v43
        end
        return u3.createElement(u8, v39, v40)
    end)
}