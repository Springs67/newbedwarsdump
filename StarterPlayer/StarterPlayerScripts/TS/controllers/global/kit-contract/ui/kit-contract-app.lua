local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SlideIn
local u5 = v3.SoundManager
local u6 = v3.UILayers
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent, "kit-contract-core").KitContractCore
local v29 = v8.new(u7)(function(u15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u13
        [3] = u2
        [4] = u12
        [5] = u6
        [6] = u11
        [7] = u7
        [8] = u10
        [9] = u4
        [10] = u14
    --]]
    local _ = p16.useState
    p16.useEffect(function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u13
        --]]
        u5:playSound(u13.UI_OPEN_2)
        return function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u13
            --]]
            u5:playSound(u13.UI_CLOSE_2)
        end
    end, {})
    local function v17() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
            [3] = u15
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u12.KIT_CONTRACT_APP)
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.KIT_DETAILS_APP, {
            ["SelectedKit"] = u15.SelectedKit
        })
    end
    local function v18() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u6.MAIN)
    end
    local v19 = {}
    local v20 = {}
    for v21, v22 in u11.GENERIC_BW_IMAGE_PRESET do
        v19[v21] = v22
    end
    v19.OnClick = v18
    v20.Background = v19
    v20.BackButton = {
        ["OnClick"] = v17
    }
    v20.ExitButton = {
        ["OnClick"] = v18
    }
    local v23 = u7.createElement
    local v24 = u10
    local v25 = {}
    local v26 = u7.createElement
    local v27 = u4
    local v28 = {
        u7.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.025, 0)
        }),
        ["KitContractCore"] = u7.createElement(u14, {
            ["Size"] = UDim2.fromScale(1, 0.875),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["SelectedKit"] = u15.SelectedKit,
            ["store"] = u15.store
        })
    }
    __set_list(v25, 1, {v26(v27, {}, v28)})
    return v23(v24, v20, v25)
end)
return {
    ["KitContractApp"] = v9.connect(function(p30, p31) --[[ Line: 63 ]]
        local v32 = {
            ["store"] = p30
        }
        for v33, v34 in p31 do
            v32[v33] = v34
        end
        return v32
    end)(v29)
}