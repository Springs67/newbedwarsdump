local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CustomKitCreation_AbilitySlot"] = v9.new(u8)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u6
            [4] = u5
            [5] = u3
            [6] = u12
            [7] = u4
            [8] = u10
            [9] = u11
        --]]
        local _ = p14.useState
        local v15 = p14.useEffect
        local u16 = u7.new()
        v15(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u16
            --]]
            return function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:DoCleaning()
            end
        end, {})
        local v17 = u8.createFragment
        local v18 = {}
        local v19 = u8.createElement
        local v20 = u6
        local v21 = {
            ["Size"] = UDim2.new(1, 0, 0, u5.isSmallScreen() and 30 or 45),
            ["LayoutOrder"] = u13.LayoutOrder
        }
        local v22 = {}
        local v23
        if u13.Ability == nil then
            local v24 = u8.createElement
            local v25 = u6
            local v26 = {
                ["LayoutOrder"] = u13.LayoutOrder,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v27 = {}
            local v28 = u8.createElement
            local v29 = "TextLabel"
            local v30 = {
                ["Text"] = "N/A",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.new(0.2, 0, 0, u5.isSmallScreen() and 30 or 40),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["TextColor3"] = Color3.fromRGB(150, 150, 150),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }
            local v31
            if u5.isSmallScreen() then
                v31 = Enum.FontSize.Size24
            else
                v31 = Enum.FontSize.Size28
            end
            v30.FontSize = v31
            v30.TextXAlignment = Enum.TextXAlignment.Left
            v27.AbilityName = v28(v29, v30)
            __set_list(v27, 1, {u8.createElement(u3, {
    ["LayoutOrder"] = 1,
    ["Text"] = "CREATE ABILITY",
    ["Selectable"] = true,
    ["ZIndex"] = 60,
    ["Size"] = UDim2.new(0.7, 0, 0, u5.isSmallScreen() and 30 or 40),
    ["Position"] = UDim2.fromScale(1, 0.5),
    ["AnchorPoint"] = Vector2.new(1, 0.5),
    ["BackgroundColor3"] = u12.buttonPrimary,
    ["OnClick"] = function() --[[ Name: OnClick, Line 53 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.OnClicked()
    end,
    ["TextLabel"] = {
        ["ZIndex"] = 61,
        ["TextSize"] = 26,
        ["Size"] = UDim2.fromScale(0.8, 0.55),
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
    }
})})
            v23 = v24(v25, v26, v27)
        else
            local v32 = u8.createElement
            local v33 = u6
            local v34 = {
                ["LayoutOrder"] = u13.LayoutOrder,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v35 = {}
            local v36 = u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.02, 0),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })
            local v37 = u8.createElement
            local v38 = {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["ZIndex"] = 60,
                ["Size"] = UDim2.fromScale(0.78, 1),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5)
            }
            local v39 = u13.Ability.name
            local v40 = u4.richTextColor(Color3.fromRGB(125, 125, 125))
            local v41 = u10.getTotalAbilityCost
            local v42 = u13.Ability
            v38.Text = "<b>" .. v39 .. "</b> <font color=\"" .. v40 .. "\">(" .. tostring(v41(v42)) .. " points)</font>"
            v38.TextColor3 = u4.WHITE
            v38.Font = Enum.Font.Roboto
            v38.TextXAlignment = Enum.TextXAlignment.Left
            __set_list(v35, 1, {v36, v37("TextLabel", v38, { u8.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 26
    }) }), u8.createElement(u6, {
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.fromScale(0.2, 1)
}, {
    u8.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0.1, 0)
    }),
    ["EditButton"] = u8.createElement("ImageButton", {
        ["Size"] = UDim2.fromScale(0.495, 0.6),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        [u8.Event.Activated] = function() --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.OnClicked()
        end,
        [u8.Event.MouseEnter] = function(p43) --[[ Line: 113 ]]
            p43.ImageTransparency = 0.3
        end,
        [u8.Event.MouseLeave] = function(p44) --[[ Line: 116 ]]
            p44.ImageTransparency = 0
        end,
        ["Image"] = u11.EDIT_FILLED_ICON,
        ["ZIndex"] = 120,
        ["LayoutOrder"] = 2,
        ["Selectable"] = true,
        ["ScaleType"] = Enum.ScaleType.Fit
    }, { u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) }),
    ["TrashButton"] = u8.createElement("ImageButton", {
        ["Size"] = UDim2.fromScale(0.495, 0.6),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        [u8.Event.Activated] = function() --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.OnDeleteClicked()
        end,
        [u8.Event.MouseEnter] = function(p45) --[[ Line: 138 ]]
            p45.ImageTransparency = 0.3
        end,
        [u8.Event.MouseLeave] = function(p46) --[[ Line: 141 ]]
            p46.ImageTransparency = 0
        end,
        ["Image"] = u11.TRASH_ICON,
        ["ZIndex"] = 120,
        ["LayoutOrder"] = 3,
        ["Selectable"] = true,
        ["ScaleType"] = Enum.ScaleType.Fit
    }, { u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
})})
            v23 = v32(v33, v34, v35)
        end
        __set_list(v22, 1, {v23})
        v18.CustomKitCreation_KitSelection_AbilitySlotGUI = v19(v20, v21, v22)
        return v17(v18)
    end)
}