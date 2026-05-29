local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SettingsSection"] = v4.new(u3)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        local v8 = {
            ["AutomaticSize"] = "Y",
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v9 = p6.FrameProps
        if v9 then
            for v10, v11 in v9 do
                v8[v10] = v11
            end
        end
        local v12 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 2)
            }), u3.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0),
                ["Text"] = p6.Title,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u5.textPrimary
            }, { u3.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) }) }
        local v13 = #v12
        local v14 = p6[u3.Children]
        if v14 then
            for v15, v16 in v14 do
                if type(v15) == "number" then
                    v12[v13 + v15] = v16
                else
                    v12[v15] = v16
                end
            end
        end
        return u3.createElement(u2, v8, v12)
    end)
}