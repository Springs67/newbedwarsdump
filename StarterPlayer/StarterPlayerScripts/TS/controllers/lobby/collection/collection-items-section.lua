local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent, "collection-item-frame").CollectionItemFrame
local u6 = v1.import(script, script.Parent, "collection-sections").CollectionSectionMeta
return {
    ["CollectionItemsSection"] = v4.new(u3)(function(u7, p8) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u5
            [4] = u2
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local u11, u12 = v9(u7.Section)
        local v13, u14 = v9(nil)
        v10(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u7
                [3] = u14
                [4] = u6
                [5] = u11
            --]]
            u12(u7.Section)
            u14(u6[u11])
        end, { u7.Section })
        local v15 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = u7.Size or UDim2.fromScale(1, 1)
        }
        local v16 = {}
        local v17 = #v16
        local v18 = {
            ["Size"] = UDim2.fromScale(1, 0.16)
        }
        local v19
        if v13 == nil then
            v19 = v13
        else
            v19 = v13.title
            if v19 ~= nil then
                v19 = string.upper(v19)
            end
        end
        v18.Text = v19
        v18.TextScaled = true
        v18.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v18.TextColor3 = Color3.fromRGB(255, 255, 255)
        v18.TextXAlignment = "Left"
        v18.BackgroundTransparency = 1
        v16.Title = u3.createElement("TextLabel", v18)
        local v20
        if v13 == nil then
            v20 = v13
        else
            local v21 = v13.skinBaseItemTypes
            if v21 == nil then
                v20 = v21
            else
                local function v24(u22) --[[ Line: 46 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u5
                        [3] = u7
                    --]]
                    return u3.createElement(u5, {
                        ["AppId"] = "CollectionItemFrame",
                        ["BaseItemSkinType"] = u22,
                        ["OnClick"] = function() --[[ Name: OnClick, Line 51 ]]
                            --[[
                            Upvalues:
                                [1] = u7
                                [2] = u22
                            --]]
                            local v23 = u7.SetSelectedBaseItemSkin
                            if v23 ~= nil then
                                v23(u22)
                            end
                        end,
                        ["GamepadShouldAutoSelect"] = u7.GamepadShouldAutoSelect
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) })
                end
                v20 = table.create(#v21)
                for v25, v26 in v21 do
                    v20[v25] = v24(v26, v25 - 1, v21)
                end
            end
        end
        local v27 = {
            ["Size"] = UDim2.fromScale(1, 0.74),
            ["Position"] = UDim2.fromScale(0, 0.26)
        }
        local v28 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalFlex"] = Enum.UIFlexAlignment.Fill,
                ["Padding"] = UDim.new(0.01, 0)
            }) }
        local v29 = #v28
        if v20 then
            for v30, v31 in v20 do
                v28[v29 + v30] = v31
            end
        end
        local v32 = #v28
        local v33
        if v13 == nil then
            v33 = v13
        else
            v33 = v13.lockerCategory
        end
        if v33 then
            v33 = u3.createElement(u5, {
                ["AppId"] = "CollectionItemFrame",
                ["LockerCategory"] = v13.lockerCategory,
                ["Size"] = UDim2.fromScale(1, 1),
                ["OnClick"] = function() --[[ Name: OnClick, Line 101 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                    --]]
                    local v34 = u7.OnLockerClick
                    if v34 ~= nil then
                        v34()
                    end
                end,
                ["GamepadShouldAutoSelect"] = u7.GamepadShouldAutoSelect
            }, { u3.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 2.14
                }) })
        end
        if v33 then
            v28[v32 + 1] = v33
        end
        v16.ItemList = u3.createElement(u2, v27, v28)
        local v35 = u7[u3.Children]
        if v35 then
            for v36, v37 in v35 do
                if type(v36) == "number" then
                    v16[v17 + v36] = v37
                else
                    v16[v36] = v37
                end
            end
        end
        return u3.createFragment({
            ["Section"] = u3.createElement("Frame", v15, v16)
        })
    end)
}