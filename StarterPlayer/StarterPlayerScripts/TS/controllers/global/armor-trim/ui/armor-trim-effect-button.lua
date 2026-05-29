local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.ColorUtil
local u7 = v3.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-definition").getArmorTrimEffect
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
return {
    ["ArmorTrimEffectButton"] = v10.new(u9)(function(u19) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u16
            [3] = u14
            [4] = u12
            [5] = u13
            [6] = u15
            [7] = u8
            [8] = u2
            [9] = u11
            [10] = u9
            [11] = u5
            [12] = u6
            [13] = u17
            [14] = u7
            [15] = u4
        --]]
        local v20 = {}
        for v21, v22 in u19 do
            v20[v21] = v22
        end
        v20.DefaultColor = nil
        v20.SelectedKit = nil
        v20.ArmorTrimType = nil
        v20.ArmorTrimEffectRank = nil
        local v28 = {
            ["OnClick"] = function() --[[ Name: OnClick, Line 31 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u16
                    [3] = u19
                    [4] = u14
                    [5] = u12
                    [6] = u13
                    [7] = u15
                    [8] = u8
                    [9] = u2
                    [10] = u11
                --]]
                if not u18.isLobbyServer() then
                    return nil
                end
                local v23 = u16.BLACK_LISTED_ARMOR_TRIM_KITS
                local v24 = u19.SelectedKit
                if table.find(v23, v24) ~= nil then
                    return nil
                end
                local v25 = u14[u19.ArmorTrimType].effects
                if v25 ~= nil then
                    v25 = v25.definition
                end
                local v26
                if v25 == nil then
                    v26 = u13.DEFAULT
                else
                    v26 = u12(v25, u19.DefaultColor)
                end
                local v27 = {
                    ["armorSet"] = "LEATHER",
                    ["type"] = u19.ArmorTrimType,
                    ["color"] = u19.DefaultColor,
                    ["effectRank"] = u15.T7,
                    ["effectType"] = v26
                }
                u8.Controllers.LockerPreviewController:openFullscreenPreview({
                    ["armorTrim"] = v27,
                    ["kit"] = u19.SelectedKit
                }, {
                    ["fromLocker"] = false,
                    ["onOpen"] = function() --[[ Name: onOpen, Line 58 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                        --]]
                        u8.Controllers.LobbyHudController:unmountLobbyHud()
                        u8.Controllers.HotbarController:unmountHotbar()
                    end,
                    ["onClose"] = function() --[[ Name: onClose, Line 62 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u11
                            [3] = u19
                            [4] = u8
                        --]]
                        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.ARMOR_TRIM_APP, {
                            ["SelectedKit"] = u19.SelectedKit
                        })
                        u8.Controllers.LockerPreviewController:closePreview()
                    end
                })
            end
        }
        for v29, v30 in v20 do
            v28[v29] = v30
        end
        return u9.createElement(u5, v28, { u9.createElement("UIAspectRatioConstraint", {
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
                    ["Image"] = u17.SPARKLE_SOLID,
                    ["Size"] = UDim2.fromScale(0.65, 0.65),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
                }) }), u9.createElement(u7, {}, { u9.createElement(u4, {
                    ["Text"] = "Switch Effect",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) })
    end)
}