local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.UIUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, script.Parent, "swap-ability-button").SwapButton
return {
    ["NecromancerStaffCore"] = v7.new(u6)(function(p10, p11) --[[ Line: 11 ]]
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
        local v14 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("KitPrimary")
        if v14 ~= nil then
            v14 = v14[1].Name
        end
        local u15 = u6.createRef()
        v12(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            local v16 = u15:getValue()
            if not v16 then
                return nil
            end
            v16:SetAttribute("ActionBarLayoutOrder", 1000)
        end, {})
        local function v28(p17) --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u13
            --]]
            local v18 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0,
                ["Size"] = UDim2.new(0, 30, 0.3, 0),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = Color3.fromRGB(46, 46, 46)
            }
            local v19 = {}
            local v20 = #v19
            local v21
            if p17.AspectRatio == nil then
                v21 = false
            else
                v21 = u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = p17.AspectRatio
                })
            end
            if v21 then
                v19[v20 + 1] = v21
            end
            local v22 = #v19
            v19[v22 + 1] = u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })
            local v23 = v22 + 2
            local v24
            if u13 then
                v24 = u6.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Image"] = p17.MobileImage,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            else
                local v25 = u6.createElement
                local v26 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Size"] = UDim2.fromScale(0.8, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v27 = p17.Hotkey
                v26.Text = "<b>" .. tostring(v27) .. "</b>"
                v26.Font = Enum.Font.Roboto
                v26.TextColor3 = Color3.fromRGB(255, 255, 255)
                v24 = v25("TextLabel", v26)
            end
            v19[v23] = v24
            return u6.createFragment({
                ["HotkeyComponent"] = u6.createElement("Frame", v18, v19)
            })
        end
        local v29 = {}
        local v30
        if u13 then
            v30 = UDim2.fromScale(0.25, 0.135)
        else
            v30 = UDim2.fromScale(1, 0.07)
        end
        v29.Size = v30
        local v31
        if u13 then
            v31 = UDim2.fromScale(0.275, 0.75)
        else
            v31 = u5:getActionBarPosition()
        end
        v29.Position = v31
        v29.AnchorPoint = Vector2.new(0.5, 1)
        v29.BorderSizePixel = 0
        v29.BackgroundTransparency = 1
        v29.LayoutOrder = 2
        v29[u6.Ref] = u15
        local v32 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.01, 0)
            }) }
        local _ = #v32
        local v33 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0.5,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v34 = { u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = #p10.Modes * 0.8
            }), u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local v35 = #v34
        local v36 = p10.Modes
        local v37 = table.create(#v36)
        for v38, v39 in v36 do
            local _ = v38 - 1
            v37[v38] = u6.createElement(u9, {
                ["extra"] = false,
                ["ChangeAbility"] = p10.ChangeAbility,
                ["activeMode"] = p10.activeMode,
                ["buttonMode"] = v39
            })
        end
        local v40 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v41 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v42 = #v41
        for v43, v44 in v37 do
            v41[v42 + v43] = v44
        end
        v34.AbilityButtons = u6.createElement("Frame", v40, v41)
        local v45
        if #p10.Modes > 1 then
            v45 = u6.createElement(v28, {
                ["Hotkey"] = v14,
                ["MobileImage"] = u8.SWAP_MOBILE
            })
        else
            v45 = false
        end
        if v45 then
            v34[v35 + 1] = v45
        end
        v32.SwapAbilitiesContainer = u6.createElement("Frame", v33, v34)
        return u6.createFragment({
            ["SwapAbilityBar"] = u6.createElement("Frame", v29, v32)
        })
    end)
}