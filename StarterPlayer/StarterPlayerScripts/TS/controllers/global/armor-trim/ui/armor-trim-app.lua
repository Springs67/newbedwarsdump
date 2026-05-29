local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v3.SlideIn
local u7 = v3.SoundManager
local u8 = v3.UILayers
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, script.Parent, "armor-trim-core").ArmorTrimCore
local u18 = v1.import(script, script.Parent, "armor-trim-toolbar").ArmorTrimToolbar
local v32 = v10.new(u9)(function(u19, p20) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u16
        [3] = u2
        [4] = u8
        [5] = u14
        [6] = u13
        [7] = u9
        [8] = u12
        [9] = u6
        [10] = u4
        [11] = u5
        [12] = u18
        [13] = u17
        [14] = u15
    --]]
    local v21 = p20.useState
    local v22 = p20.useEffect
    local u23, u24 = v21(false)
    v22(function() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u16
        --]]
        u7:playSound(u16.UI_OPEN_2)
        return function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u16
            --]]
            u7:playSound(u16.UI_CLOSE_2)
        end
    end, {})
    local function v25() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u8.MAIN)
    end
    local function v26() --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
            [3] = u19
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.KIT_DETAILS_APP, {
            ["SelectedKit"] = u19.SelectedKit
        })
    end
    local v27 = {}
    local v28 = {}
    local function v29() --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u23
        --]]
        u24(not u23)
    end
    for v30, v31 in u13.GENERIC_BW_IMAGE_PRESET do
        v27[v30] = v31
    end
    v28.Background = v27
    v28.ContainerSize = UDim2.fromScale(1, 1)
    v28.DisableScaleComponent = true
    v28.ExitButton = {
        ["OnClick"] = v25
    }
    v28.BackButton = {
        ["OnClick"] = v26
    }
    return u9.createElement(u12, v28, { u9.createElement(u6, {}, { u9.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(u4.isSmallScreen() and 0.1 or 0.02, 0),
                ["PaddingBottom"] = UDim.new(0.11, 0)
            }), u9.createElement(u5, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u9.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1)
                }, { u9.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Vertical
                    }), u9.createElement(u18, {
                        ["SelectedKit"] = u19.SelectedKit,
                        ["Size"] = UDim2.fromScale(1, 0.09),
                        ["OnViewAll"] = v29,
                        ["ViewAll"] = u23
                    }), u9.createElement(u17, {
                        ["store"] = u19.store,
                        ["SelectedKit"] = u19.SelectedKit,
                        ["ArmorTrimType"] = u15.TRIM_1,
                        ["ViewAll"] = u23
                    }) }) }) }) })
end)
return {
    ["ArmorTrimApp"] = v11.connect(function(p33, p34) --[[ Line: 90 ]]
        local v35 = {
            ["store"] = p33
        }
        for v36, v37 in p34 do
            v35[v36] = v37
        end
        return v35
    end)(v32)
}