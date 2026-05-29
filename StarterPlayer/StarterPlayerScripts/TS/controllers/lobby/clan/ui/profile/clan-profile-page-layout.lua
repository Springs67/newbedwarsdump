local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanProfilePageLayout"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        local v8 = p6.Title ~= nil and true or p6.RightTitleElement ~= nil
        if v8 then
            local v9 = { u3.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 10)
                }) }
            local v10 = #v9
            local v11 = {
                ["Size"] = UDim2.new(1, 0, 0, 20)
            }
            local v12 = {}
            local v13 = #v12
            local v14
            if p6.Title == nil then
                v14 = false
            else
                v14 = u3.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Text"] = "<b>" .. p6.Title .. "</b>",
                    ["TextColor3"] = u5.textPrimary
                }, { u3.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 20
                    }) })
            end
            if v14 then
                v12[v13 + 1] = v14
            end
            local v15 = #v12
            local v16 = p6.RightTitleElement
            if v16 then
                v16 = u3.createElement(u2, {
                    ["Size"] = UDim2.new(0.5, 0, 0, 20),
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["AnchorPoint"] = Vector2.new(1, 0.5)
                }, { p6.RightTitleElement })
            end
            if v16 then
                v12[v15 + 1] = v16
            end
            v9[v10 + 1] = u3.createElement(u2, v11, v12)
            v8 = u3.createFragment(v9)
        end
        local v17 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v18 = {}
        local v19 = #v18
        if v8 then
            v18[v19 + 1] = v8
        end
        local v20 = #v18
        local v21 = {}
        local v22
        if p6.Title == nil and p6.RightTitleElement == nil then
            v22 = UDim2.fromScale(1, 1)
        else
            v22 = UDim2.new(1, 0, 1, -36)
        end
        v21.Size = v22
        local v23 = {}
        local v24 = #v23
        local v25 = p6.PaddingBottom
        if v25 then
            v25 = u3.createElement("UIPadding", {
                ["PaddingBottom"] = UDim.new(0, 15)
            })
        end
        if v25 then
            v23[v24 + 1] = v25
        end
        local v26 = #v23
        local v27 = p6[u3.Children]
        if v27 then
            for v28, v29 in v27 do
                if type(v28) == "number" then
                    v23[v26 + v28] = v29
                else
                    v23[v28] = v29
                end
            end
        end
        v18[v20 + 1] = u3.createElement(u2, v21, v23)
        return u3.createElement(u2, v17, v18)
    end)
}