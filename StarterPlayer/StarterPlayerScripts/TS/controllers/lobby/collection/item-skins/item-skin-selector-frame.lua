local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.UIUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
return {
    ["ItemSkinSelectorFrame"] = v6.new(u5)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u7
            [4] = u4
            [5] = u12
            [6] = u13
            [7] = u11
            [8] = u3
            [9] = u10
            [10] = u8
        --]]
        local _ = p15.useState
        local v16 = p15.useEffect
        local u17 = u5.createRef()
        local v18 = u14.SelectedItemSkin == u14.ItemSkinType
        local v19 = u14.EquipedItemSkin == u14.ItemSkinType
        local v20
        if u14.ItemSkinType then
            v20 = u9(u14.ItemSkinType)
        else
            v20 = nil
        end
        v16(function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u7
                [3] = u4
                [4] = u17
            --]]
            if u14.GamepadShouldAutoSelect and u7.GamepadEnabled then
                u4:selectGui(u17:getValue())
            end
        end, {})
        local v21 = {
            ["Size"] = UDim2.fromScale(0.25, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["BackgroundTransparency"] = (v18 or v19) and 0.7 or 0.85,
            ["BorderSizePixel"] = 0,
            [u5.Event.Activated] = function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14.SetSelectedItemSkin(u14.ItemSkinType)
            end
        }
        local v22 = u14.ImageButtonProps
        if v22 then
            for v23, v24 in v22 do
                v21[v23] = v24
            end
        end
        v21[u5.Ref] = u17
        local v25 = {}
        local v26 = #v25
        if v18 then
            v18 = u5.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["ZIndex"] = 10,
                ["Color"] = Color3.fromRGB(255, 255, 255),
                ["BorderStrokePosition"] = Enum.BorderStrokePosition.Inner
            })
        end
        if v18 then
            v25[v26 + 1] = v18
        end
        local v27 = #v25
        v25[v27 + 1] = u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v28 = v27 + 2
        local v29 = u5.createElement
        local v30 = "UIGradient"
        local v31 = {
            ["Rotation"] = -90
        }
        local v32 = ColorSequence.new
        local v33 = {}
        local v34 = ColorSequenceKeypoint.new
        local v35 = 0
        local v36
        if v19 then
            v36 = Color3.fromRGB(51, 255, 89)
        else
            v36 = Color3.fromRGB(96, 96, 96)
        end
        local v37 = v34(v35, v36)
        local v38 = ColorSequenceKeypoint.new
        local v39 = 1
        local v40
        if v19 then
            v40 = Color3.fromRGB(51, 255, 89)
        else
            v40 = Color3.fromRGB(255, 255, 255)
        end
        __set_list(v33, 1, {v37, v38(v39, v40)})
        v31.Color = v32(v33)
        v31.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
        v25[v28] = v29(v30, v31)
        local v41 = u14.ItemSkinType
        if v41 then
            local v42 = {
                ["Size"] = UDim2.fromScale(1, 0.03),
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1)
            }
            local v43 = u9(u14.ItemSkinType).rarity
            if v43 == nil then
                v43 = u12.ONE_STAR
            end
            v42.BackgroundColor3 = u13(v43).gradient.colorTop
            v42.BorderSizePixel = 0
            v42.ZIndex = 1
            v41 = u5.createFragment({
                ["RarityIndicator"] = u5.createElement("Frame", v42, { u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 12)
                    }) })
            })
        end
        if v41 then
            v25[v27 + 3] = v41
        end
        local v44 = #v25
        local v45
        if u14.ItemSkinType then
            if u3.isHoarceKat() then
                local v46 = {}
                if v20 ~= nil then
                    v20 = v20.renderImage
                end
                if v20 == nil then
                    v20 = u10.RANDOM_KIT_RENDER
                end
                v46.Image = v20
                v46.Size = UDim2.fromScale(0.7, 0.7)
                v46.Position = UDim2.fromScale(0.5, 0.5)
                v46.AnchorPoint = Vector2.new(0.5, 0.5)
                v46.BackgroundTransparency = 1
                v46.ImageTransparency = u14.IsOwned and 0 or 0.3
                v45 = u5.createFragment({
                    ["StudioTestImage"] = u5.createElement("ImageLabel", v46, { u5.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) })
                })
            else
                v45 = u5.createElement(u8, {
                    ["Reward"] = {
                        ["itemSkin"] = u14.ItemSkinType
                    },
                    ["GroupTransparency"] = u14.IsOwned and 0 or 0.3
                })
            end
        else
            v45 = u5.createFragment({
                ["DefaultSkin"] = u5.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = u11(u14.BaseItemSkinType).image,
                    ["Size"] = UDim2.fromScale(0.7, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }, { u5.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        end
        v25[v44 + 1] = v45
        local v47 = #v25
        if v19 then
            v19 = u5.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.125, 0.125),
                ["Image"] = u10.CIRCLE_CHECK_SOLID,
                ["ImageColor3"] = Color3.fromRGB(51, 255, 89),
                ["Position"] = UDim2.fromScale(0.925, 0.925),
                ["AnchorPoint"] = Vector2.new(1, 1)
            }, { u5.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        if v19 then
            v25[v47 + 1] = v19
        end
        local v48 = #v25
        local v49 = not u14.IsOwned
        if v49 then
            v49 = u5.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.125, 0.125),
                ["Image"] = u10.LOCK_ART,
                ["Position"] = UDim2.fromScale(0.05, 0.925),
                ["AnchorPoint"] = Vector2.new(0, 1)
            }, { u5.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        if v49 then
            v25[v48 + 1] = v49
        end
        return u5.createFragment({
            ["ItemSkinFrame"] = u5.createElement("ImageButton", v21, v25)
        })
    end)
}