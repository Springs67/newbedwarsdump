local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "controllers", "global", "armor-trim", "ui", "armor-trim-player-viewport").DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "controllers", "global", "armor-trim", "ui", "armor-trim-player-viewport-base").ArmorTrimPlayerViewportBase
local u7 = v1.import(script, script.Parent.Parent.Parent, "rodux", "create-rodux-app").CreateRoduxApp
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = v1.import(script, script.Parent, "color-picker-app").ColorPickerApp
return function(p13) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u7
        [4] = u12
        [5] = u3
        [6] = u6
        [7] = u10
        [8] = u9
        [9] = u8
        [10] = u5
        [11] = u11
    --]]
    local u14 = u2.new()
    local u15 = u4.new()
    u14:GiveTask(u15)
    local v16 = u7
    local v17 = u12
    local v18 = {}
    local v19 = u3.createFragment
    local v20 = {}
    local v21 = u3.createElement
    local v22 = u6
    local v23 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["ButtonMode"] = "ALWAYS_VISIBLE",
        ["ColorSignal"] = u15,
        ["SelectedKit"] = u10.BARBARIAN,
        ["ArmorTrimType"] = u9.TRIM_2,
        ["ArmorTrimEffectRank"] = u8.T2,
        ["StartingSelection"] = {
            ["armorSet"] = u5.armorSet,
            ["displayMode"] = u5.displayMode
        },
        ["ViewportProps"] = {
            ["BackgroundTransparency"] = 0.5,
            ["BackgroundColor3"] = u11.backgroundPrimary
        }
    }
    v20.ViewportCard = v21(v22, v23)
    v18.Children = v19(v20)
    function v18.OnSelect(_) --[[ Line: 40 ]]
        print("Close")
    end
    function v18.OnUpdateColor(p24) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:Fire(p24)
    end
    function v18.OnClose() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:DoCleaning()
    end
    local u25 = v16("ColorPickerApp", v17, {
        ["AppId"] = "ColorPickerApp"
    }, v18, {
        ["Parent"] = p13
    })
    return function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u25
        --]]
        return u3.unmount(u25)
    end
end