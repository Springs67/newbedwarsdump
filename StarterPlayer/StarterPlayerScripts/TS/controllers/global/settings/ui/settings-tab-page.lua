local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-row").SettingRow
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-slider").SettingSlider
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-meta").getSettingMeta
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types")
local u15 = v14.Setting
local u16 = v14.SettingInputType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-util").SettingsUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "streamer-mode-config").StreamerModeConfig
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u20 = v1.import(script, script.Parent, "settings-section").SettingsSection
return {
    ["SettingsTabPage"] = v6.new(u5)(function(u21, p22) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
            [3] = u7
            [4] = u2
            [5] = u5
            [6] = u8
            [7] = u19
            [8] = u15
            [9] = u12
            [10] = u18
            [11] = u16
            [12] = u17
            [13] = u3
            [14] = u9
            [15] = u10
            [16] = u11
            [17] = u20
        --]]
        local _ = p22.useState
        local v23 = u4.values(u21.Settings)
        local v24 = {}
        for v25 = 1, #v23 do
            local v26 = v23[v25]
            local _ = v25 - 1
            local v27 = u13(v26)
            local v28 = v24[v27.section]
            if v28 then
                table.insert(v28, v26)
            else
                v24[v27.section] = { v26 }
            end
        end
        local u29 = u7:IsStudio() and true or u2.isMobileControls()
        local function u36(p30, p31) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
                [3] = u19
            --]]
            if not p30.toggleOptionsOverride then
                return { u5.createElement(u8, {
                        ["Value"] = "true",
                        ["Text"] = "On",
                        ["FrameProps"] = {
                            ["LayoutOrder"] = 1
                        },
                        ["disabled"] = p31
                    }), u5.createElement(u8, {
                        ["Value"] = "false",
                        ["Text"] = "Off",
                        ["ActiveColor"] = u19.mcRed,
                        ["FrameProps"] = {
                            ["LayoutOrder"] = 1
                        },
                        ["disabled"] = p31
                    }) }
            end
            local v32 = p30.toggleOptionsOverride
            local v33 = table.create(#v32)
            for v34, v35 in v32 do
                local _ = v34 - 1
                v33[v34] = u5.createElement(u8, {
                    ["Value"] = v35.value,
                    ["Text"] = v35.text,
                    ["ActiveColor"] = v35.activeColor
                })
            end
            return v33
        end
        local v37 = u4.entries(v24)
        table.sort(v37, function(p38, p39) --[[ Line: 90 ]]
            return p38[1] < p39[1]
        end)
        local function v81(p40) --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u29
                [3] = u15
                [4] = u12
                [5] = u18
                [6] = u16
                [7] = u19
                [8] = u21
                [9] = u2
                [10] = u17
                [11] = u3
                [12] = u36
                [13] = u5
                [14] = u9
                [15] = u10
                [16] = u11
                [17] = u20
            --]]
            local v41 = p40[1]
            local v42 = p40[2]
            local function v68(u43) --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u29
                    [3] = u15
                    [4] = u12
                    [5] = u18
                    [6] = u16
                    [7] = u19
                    [8] = u21
                    [9] = u2
                    [10] = u17
                    [11] = u3
                    [12] = u36
                    [13] = u5
                    [14] = u9
                    [15] = u10
                    [16] = u11
                --]]
                local v44 = u13(u43)
                if v44.mobileOnly and not u29 then
                    return nil
                end
                local v45 = false
                if u43 == u15.STREAMER_MODE then
                    local v46 = u12:getState().Lobby.profileData
                    if v46 ~= nil then
                        v46 = v46.level
                    end
                    v45 = (v46 == nil and 1 or v46) < u18.StreamerModePlayerLevelReq and true or v45
                end
                local v47 = v44.inputType
                if v47 == u16.TOGGLE then
                    local v48 = {
                        ["Name"] = v44.name,
                        ["Hint"] = v44.description,
                        ["ThemeColor"] = u19.backgroundPrimary,
                        ["FrameProps"] = {
                            ["Size"] = UDim2.new(0.98, 0, 0, 51)
                        }
                    }
                    local v49 = {}
                    local v50 = #v49
                    local v51 = {}
                    local v52 = u21.PlayerSettings[u43]
                    v51.Value = tostring(v52)
                    function v51.OnChange(p53) --[[ Line: 133 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u17
                            [3] = u3
                            [4] = u43
                        --]]
                        if u2.isHoarceKat() then
                            return nil
                        end
                        local v54 = u17.getBoolean(p53)
                        local v55 = u3.Controllers.SettingsController
                        local v56 = u43
                        if v54 ~= nil then
                            p53 = v54
                        end
                        v55:setSetting(v56, p53)
                    end
                    local v57 = {}
                    local v58 = #v57
                    for v59, v60 in u36(v44, v45) do
                        v57[v58 + v59] = v60
                    end
                    v49[v50 + 1] = u5.createElement(u9, v51, v57)
                    return u5.createElement(u10, v48, v49)
                end
                if v47 == u16.SLIDER then
                    local v61 = {
                        ["Name"] = v44.name,
                        ["Hint"] = v44.description,
                        ["ThemeColor"] = u19.backgroundPrimary,
                        ["FrameProps"] = {
                            ["Size"] = UDim2.new(0.98, 0, 0, 51)
                        }
                    }
                    local v62 = {}
                    local v63 = #v62
                    local v64 = {}
                    local v65 = u21.PlayerSettings[u43]
                    local v66 = tonumber(v65)
                    v64.Value = v66 == nil and 0 or v66
                    function v64.SetValue(p67) --[[ Line: 167 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u3
                            [3] = u43
                        --]]
                        if u2.isHoarceKat() then
                            return nil
                        end
                        u3.Controllers.SettingsController:setSetting(u43, p67)
                    end
                    v64.Min = v44.min
                    v64.Max = v44.max
                    v64.StepSize = v44.stepSize
                    v62[v63 + 1] = u5.createElement(u11, v64)
                    return u5.createElement(u10, v61, v62)
                end
            end
            local v69 = 0
            local v70 = {}
            for v71, v72 in v42 do
                local v73 = v68(v72, v71 - 1, v42)
                if v73 ~= nil then
                    v69 = v69 + 1
                    v70[v69] = v73
                end
            end
            local v74 = {
                ["Title"] = string.upper(v41),
                ["FrameProps"] = {
                    ["LayoutOrder"] = 2
                }
            }
            local v75 = {}
            local v76 = #v75
            for v77, v78 in v70 do
                v75[v76 + v77] = v78
            end
            local v79 = #v75
            local v80 = u21.ExtraSettings
            if v80 ~= nil then
                v80 = v80(v41)
            end
            if v80 then
                v75[v79 + 1] = v80
            end
            return u5.createElement(u20, v74, v75)
        end
        local v82 = table.create(#v37)
        for v83, v84 in v37 do
            v82[v83] = v81(v84, v83 - 1, v37)
        end
        local v85 = {}
        local v86 = #v85
        for v87, v88 in v82 do
            v85[v86 + v87] = v88
        end
        return u5.createFragment(v85)
    end)
}