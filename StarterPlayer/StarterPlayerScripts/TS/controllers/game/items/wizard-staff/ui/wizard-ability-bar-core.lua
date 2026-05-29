local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.UIUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, script.Parent, "wizard-ability-button").WizardAbilityButton
return {
    ["WizardAbilityBarCore"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u6
            [4] = u5
            [5] = u9
            [6] = u8
        --]]
        local _ = p11.useState
        local v12 = p11.useEffect
        local u13 = u4.isMobileControls() or u4.isSmallScreen()
        local v14 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("ItemPrimary")
        if v14 ~= nil then
            v14 = v14[1].Name
        end
        local u15 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("ItemSecondary")
        if u15 ~= nil then
            u15 = u15[1].Name
        end
        local u16 = u6.createRef()
        v12(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            local v17 = u16:getValue()
            if not v17 then
                return nil
            end
            v17:SetAttribute("ActionBarLayoutOrder", 1000)
        end, {})
        local function u29(p18) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u13
            --]]
            local v19 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0,
                ["Size"] = UDim2.new(0, 30, 0.3, 0),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(46, 46, 46)
            }
            local v20 = {}
            local v21 = #v20
            local v22
            if p18.AspectRatio == nil then
                v22 = false
            else
                v22 = u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = p18.AspectRatio
                })
            end
            if v22 then
                v20[v21 + 1] = v22
            end
            local v23 = #v20
            v20[v23 + 1] = u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })
            local v24 = v23 + 2
            local v25
            if u13 then
                v25 = u6.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Image"] = p18.MobileImage,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            else
                local v26 = u6.createElement
                local v27 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Size"] = UDim2.fromScale(0.8, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v28 = p18.Hotkey
                v27.Text = "<b>" .. tostring(v28) .. "</b>"
                v27.Font = Enum.Font.Roboto
                v27.TextColor3 = Color3.fromRGB(255, 255, 255)
                v25 = v26("TextLabel", v27)
            end
            v20[v24] = v25
            return u6.createFragment({
                ["HotkeyComponent"] = u6.createElement("Frame", v19, v20)
            })
        end
        local v30 = {}
        local v31
        if u13 then
            v31 = UDim2.fromScale(0.25, 0.135)
        else
            v31 = UDim2.fromScale(1, 0.07)
        end
        v30.Size = v31
        local v32
        if u13 then
            v32 = UDim2.fromScale(0.275, 0.75)
        else
            v32 = u5:getActionBarPosition()
        end
        v30.Position = v32
        v30.AnchorPoint = Vector2.new(0.5, 1)
        v30.BorderSizePixel = 0
        v30.BackgroundTransparency = 1
        v30.LayoutOrder = 2
        v30[u6.Ref] = u16
        local v33 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.01, 0)
            }) }
        local v34 = #v33
        local v35 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0.5,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v36 = { u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = #u10.Abilities * 0.8
            }), u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local v37 = #v36
        local v38 = u10.Abilities
        local v39 = table.create(#v38)
        for v40, v41 in v38 do
            local _ = v40 - 1
            v39[v40] = u6.createElement(u9, {
                ["extra"] = false,
                ["ChangeAbility"] = u10.ChangeAbility,
                ["activeAbility"] = u10.activeAbility,
                ["ability"] = v41
            })
        end
        local v42 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v43 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v44 = #v43
        for v45, v46 in v39 do
            v43[v44 + v45] = v46
        end
        v36.AbilityButtons = u6.createElement("Frame", v42, v43)
        local v47
        if #u10.Abilities > 1 then
            v47 = u6.createElement(u29, {
                ["Hotkey"] = v14,
                ["MobileImage"] = u8.SWAP_MOBILE
            })
        else
            v47 = false
        end
        if v47 then
            v36[v37 + 1] = v47
        end
        v33.SwapAbilitiesContainer = u6.createElement("Frame", v35, v36)
        local v48 = u10.ExtraAbilities
        local function v55(p49, _) --[[ Line: 160 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u10
                [3] = u9
                [4] = u29
                [5] = u15
                [6] = u8
            --]]
            local v50 = u6.createFragment
            local v51 = {}
            local v52 = u6.createElement
            local v53 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0.5,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            }
            local v54 = {
                u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = #u10.ExtraAbilities * 0.8
                }),
                u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }),
                ["AbilityButtons"] = u6.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }, { u6.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["Padding"] = UDim.new(0.05, 0)
                    }), u6.createElement(u9, {
                        ["extra"] = true,
                        ["ChangeAbility"] = u10.ChangeAbility,
                        ["activeAbility"] = u10.activeAbility,
                        ["ability"] = p49
                    }) }),
                u6.createElement(u29, {
                    ["AspectRatio"] = 1,
                    ["Hotkey"] = u15,
                    ["MobileImage"] = u8.TOUCH
                })
            }
            v51.ExtraAbilitiesContainer = v52("Frame", v53, v54)
            return v50(v51)
        end
        local v56 = table.create(#v48)
        for v57, v58 in v48 do
            v56[v57] = v55(v58, v57 - 1, v48)
        end
        for v59, v60 in v56 do
            v33[v34 + v59] = v60
        end
        return u6.createFragment({
            ["WizardAbilityBar"] = u6.createElement("Frame", v30, v33)
        })
    end)
}