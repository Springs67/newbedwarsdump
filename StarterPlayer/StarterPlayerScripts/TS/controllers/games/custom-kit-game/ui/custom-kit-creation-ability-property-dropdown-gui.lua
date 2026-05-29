local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DropdownComponent
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil
return {
    ["CustomKitCreation_AbilityPropertyDropdownGUI"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u3
            [4] = u4
        --]]
        local _ = p9.useState
        local _ = p9.useEffect
        local u10 = u7.getAbilityPropertyDropdownItems(u8.CommonProps.Ability, u8.CustomAbilityProperty)
        local function v15(p11) --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            local v12 = nil
            for v13, v14 in u10 do
                local _ = v13 - 1
                if v14.value == p11 == true then
                    return v14
                end
            end
            return v12
        end
        local v16 = #u10 ~= 0
        if v16 then
            local v17 = {
                ["Size"] = UDim2.new(1, 0, 0, 50),
                ["LayoutOrder"] = u8.LayoutOrder
            }
            local v18 = {
                u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["Padding"] = UDim.new(0, 0),
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }),
                ["CustomKitCreation_AbilityPropertyDropdown_Label"] = u5.createElement("TextLabel", {
                    ["TextTransparency"] = 0,
                    ["TextSize"] = 20,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(0.45, 1),
                    ["Text"] = u8.Label,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left
                })
            }
            local _ = #v18
            local v19 = {}
            local v20 = u8.DefaultValue
            local v21
            if v20 == "" or not v20 then
                v21 = u10[1]
            else
                v21 = v15(u8.DefaultValue) or u10[1]
            end
            v19.DefaultItem = v21
            v19.Items = u10
            function v19.OnItemSelected(p22) --[[ Line: 58 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                u8.OnItemChanged(p22)
            end
            v19.Size = UDim2.fromScale(0.55, 1)
            v19.LayoutOrder = 1
            local v23 = u8.DefaultValue
            local v24 = "CustomKitCreation_AbilityPropertyDropdown_"
            local v25
            if v23 == "" or not v23 then
                v25 = u10[1]
            else
                v25 = v15(u8.DefaultValue)
            end
            v18[v24 .. tostring(v25)] = u5.createElement(u3, v19)
            local v26 = u8.DefaultValue
            local v27 = u5.createFragment
            local v28 = {}
            local v29 = "CustomKitCreation_AbilityPropertyDropdownWrapper_"
            local v30
            if v26 == "" or not v26 then
                v30 = u10[1]
            else
                v30 = v15(u8.DefaultValue)
            end
            v28[v29 .. tostring(v30)] = u5.createElement(u4, v17, v18)
            v16 = v27(v28)
        end
        local v31 = {}
        local v32 = #v31
        if v16 then
            v31[v32 + 1] = v16
        end
        return u5.createFragment(v31)
    end)
}