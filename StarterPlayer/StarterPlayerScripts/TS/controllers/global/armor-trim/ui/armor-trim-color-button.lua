local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.ColorUtil
local u7 = v3.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v15 = v1.import(script, script.Parent, "armor-trim-player-viewport-base")
local u16 = v15.ArmorTrimPlayerViewportBase
local u17 = v15.DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION
return {
    ["ArmorTrimColorButton"] = v10.new(u9)(function(u18) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u11
            [3] = u2
            [4] = u12
            [5] = u9
            [6] = u16
            [7] = u17
            [8] = u14
            [9] = u5
            [10] = u6
            [11] = u13
            [12] = u7
            [13] = u4
        --]]
        local v19 = {}
        for v20, v21 in u18 do
            v19[v20] = v21
        end
        v19.OnColorSelected = nil
        v19.DefaultColor = nil
        v19.SelectedKit = nil
        v19.ArmorTrimType = nil
        v19.ArmorTrimEffectRank = nil
        local v35 = {
            ["OnClick"] = function() --[[ Name: OnClick, Line 31 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u11
                    [3] = u2
                    [4] = u12
                    [5] = u9
                    [6] = u16
                    [7] = u18
                    [8] = u17
                    [9] = u14
                --]]
                local u22 = u8.new()
                local u23 = u11.new()
                u22:GiveTask(u23)
                local v24 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v25 = u12.COLOR_PICKER_APP
                local v26 = {}
                local v27 = u9.createFragment
                local v28 = {}
                local v29 = u9.createElement
                local v30 = u16
                local v31 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ButtonMode"] = "ALWAYS_VISIBLE",
                    ["ColorSignal"] = u23,
                    ["SelectedKit"] = u18.SelectedKit,
                    ["ArmorTrimType"] = u18.ArmorTrimType,
                    ["ArmorTrimEffectRank"] = u18.ArmorTrimEffectRank,
                    ["StartingSelection"] = {
                        ["armorSet"] = u17.armorSet,
                        ["displayMode"] = u17.displayMode
                    },
                    ["ViewportProps"] = {
                        ["BackgroundTransparency"] = 0.5,
                        ["BackgroundColor3"] = u14.backgroundPrimary
                    }
                }
                v28.ViewportCard = v29(v30, v31)
                v26.Children = v27(v28)
                v26.Color = u18.DefaultColor
                function v26.OnSelect(p32) --[[ Line: 56 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                        [2] = u22
                        [3] = u2
                        [4] = u12
                    --]]
                    local v33 = u18.OnColorSelected
                    if v33 ~= nil then
                        v33(p32)
                    end
                    u22:DoCleaning()
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u12.COLOR_PICKER_APP)
                end
                function v26.OnUpdateColor(p34) --[[ Line: 64 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23:Fire(p34)
                end
                function v26.OnClose() --[[ Line: 67 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u2
                        [3] = u12
                    --]]
                    u22:DoCleaning()
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u12.COLOR_PICKER_APP)
                end
                v24:openApp(v25, v26)
            end
        }
        for v36, v37 in v19 do
            v35[v36] = v37
        end
        return u9.createElement(u5, v35, { u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u9.createElement("Frame", {
                ["BackgroundTransparency"] = 0.75,
                ["ZIndex"] = 3,
                ["BackgroundColor3"] = u6.BLACK,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }, { u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.22, 0)
                }), u9.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 3,
                    ["Image"] = u13.PALETTE_SOLID,
                    ["ImageColor3"] = u18.DefaultColor,
                    ["Size"] = UDim2.fromScale(0.65, 0.65),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
                }) }), u9.createElement(u7, {}, { u9.createElement(u4, {
                    ["Text"] = "Switch Color",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) })
    end)
}