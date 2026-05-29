local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DarkBackground
local u5 = v3.DeviceUtil
local u6 = v3.SlideIn
local u7 = v3.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, script.Parent, "reader", "lore-reader").LoreReader
local u14 = v1.import(script, script.Parent, "toolbar", "lore-toolbar").LoreReaderToolbar
local v18 = v9.new(u8)(function(u15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
        [3] = u2
        [4] = u11
        [5] = u8
        [6] = u5
        [7] = u4
        [8] = u6
        [9] = u14
        [10] = u13
    --]]
    local _ = p16.useState
    p16.useEffect(function() --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
        --]]
        u7:playSound(u12.UI_OPEN_2)
        return function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u12
            --]]
            u7:playSound(u12.UI_CLOSE_2)
        end
    end, {})
    local function v17() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
            [3] = u15
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.KIT_DETAILS_APP, {
            ["SelectedKit"] = u15.SelectedKit
        })
    end
    return u8.createElement("ScreenGui", {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u5.isSmallScreen()
    }, { u8.createElement(u4, {
            ["AppId"] = u15.AppId,
            ["ImageButtonProps"] = {
                ["ZIndex"] = -99
            },
            ["OnClick"] = function() --[[ Name: OnClick, Line 39 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u11
                    [3] = u15
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.KIT_DETAILS_APP, {
                    ["SelectedKit"] = u15.SelectedKit
                })
                return false
            end
        }), u8.createElement(u6, {}, { u8.createElement("ImageButton", {
                ["BackgroundTransparency"] = 1,
                ["Modal"] = true,
                ["Size"] = UDim2.fromScale(u5.isSmallScreen() and 0.85 or 0.75, u5.isSmallScreen() and 0.85 or 0.75),
                ["Position"] = UDim2.fromScale(0.5, u5.isSmallScreen() and 0.02 or 0.1),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }, {
                u8.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1.6386036960985626
                }),
                u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical
                }),
                u8.createElement(u14, {
                    ["Size"] = UDim2.fromScale(1, 0.09),
                    ["OnBack"] = v17
                }),
                u8.createElement(u13, {
                    ["SelectedKit"] = u15.SelectedKit,
                    ["Size"] = UDim2.fromScale(1, 0.91)
                })
            }) }) })
end)
return {
    ["LoreApp"] = v10.connect(function(p19, p20) --[[ Line: 71 ]]
        local v21 = {
            ["store"] = p19
        }
        for v22, v23 in p20 do
            v21[v22] = v23
        end
        return v21
    end)(v18)
}