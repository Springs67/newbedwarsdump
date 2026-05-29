local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["MapCreditsBillboard"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(u4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local _ = p5.useState
        local v6 = {
            ["MapCreditsBillboardTitle"] = u3.createFragment({
                ["MapCreditsBillboardTitle"] = u3.createElement("BillboardGui", {
                    ["Brightness"] = 2.5,
                    ["MaxDistance"] = 100,
                    ["StudsOffset"] = Vector3.new(0, 6.25, 0),
                    ["Size"] = UDim2.new(15, 0, 2, 0)
                }, {
                    ["Title"] = u3.createElement("TextLabel", {
                        ["Text"] = "MAP CREDITS",
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextColor3"] = Color3.fromRGB(255, 204, 0)
                    })
                })
            })
        }
        local _ = #v6
        local v7 = {
            ["Brightness"] = 1.25,
            ["MaxDistance"] = 100,
            ["StudsOffset"] = Vector3.new(0, 1.5, 0),
            ["Size"] = UDim2.new(15, 0, 7, 0)
        }
        local v8 = {}
        local v9 = #v8
        local v10 = {
            ["BackgroundTransparency"] = 0.8,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v11 = { u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 12)
            }), u3.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0),
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingRight"] = UDim.new(0.1, 0)
            }), u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 4)
            }) }
        local v12 = #v11
        local v13
        if u4.Image == nil then
            v13 = false
        else
            v13 = u3.createFragment({
                ["MapName"] = u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["Image"] = "rbxassetid://" .. u4.Image
                }, { u3.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        end
        if v13 then
            v11[v12 + 1] = v13
        end
        local _ = #v11
        v11.MapName = u3.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.25),
            ["Text"] = u4.MapName,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        })
        local v14 = u4.Creators
        local function v20(p15, p16) --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u3
            --]]
            local v17 = {
                ["Size"] = UDim2.new(1, 0, 1 / #u4.Creators, 0)
            }
            local v18 = (p16 == 0 and "By " or "") .. p15.displayName
            local v19 = p15.username
            v17.Text = v18 .. ((v19 == "" or not v19) and "" or " (@" .. p15.username .. ")")
            v17.TextScaled = true
            v17.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            v17.TextColor3 = Color3.fromRGB(253, 253, 32)
            v17.BackgroundTransparency = 1
            v17.LayoutOrder = 4
            return u3.createFragment({
                ["CreatorName"] = u3.createElement("TextLabel", v17)
            })
        end
        local v21 = table.create(#v14)
        for v22, v23 in v14 do
            v21[v22] = v20(v23, v22 - 1, v14)
        end
        local v24 = {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, u4.Image == nil and 0.6 or 0.2)
        }
        local v25 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 4)
            }) }
        local v26 = #v25
        for v27, v28 in v21 do
            v25[v26 + v27] = v28
        end
        v11.CreatorsList = u3.createElement(u2, v24, v25)
        v8[v9 + 1] = u3.createElement("Frame", v10, v11)
        v6.MapCreditsBillboardBody = u3.createFragment({
            ["MapCreditsBillboardBody"] = u3.createElement("BillboardGui", v7, v8)
        })
        return u3.createFragment(v6)
    end)
}