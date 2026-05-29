local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.PlayerRender
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["ObbyWinArea"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u7)(function(p8, p9) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u6
            [4] = u5
            [5] = u4
        --]]
        local _ = p9.useState
        local v10 = {
            ["Face"] = "Front",
            ["ResetOnSpawn"] = false,
            ["Adornee"] = p8.Adornee
        }
        local v11 = {}
        local _ = #v11
        local v12 = {
            ["Size"] = UDim2.fromScale(0.5, 0.7),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v13 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local _ = #v13
        local v14 = 0
        local v15 = {}
        for _ in p8.WinningPlayers do
            v14 = v14 + 1
        end
        local v16 = tostring(v14)
        local v17 = p8.NumActivePlayers
        v15.Text = "<b>" .. v16 .. " / " .. tostring(v17) .. "</b>"
        v15.TextColor3 = u3.WHITE
        v15.TextScaled = true
        v15.RichText = true
        v15.BackgroundTransparency = 1
        v15.TextXAlignment = "Center"
        v15.Size = UDim2.fromScale(0.95, 0.3)
        v15.LayoutOrder = 1
        v13.Counter = u7.createElement("TextLabel", v15)
        local v18 = u6.keys(p8.WinningPlayers)
        local function v22(p19) --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u5
            --]]
            local v20 = u7.createFragment
            local v21 = {
                ["PlayerRender"] = u7.createElement(u5, {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.21, 1),
                    ["PlayerUserId"] = p19.UserId
                }, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }) })
            }
            return v20(v21)
        end
        local v23 = table.create(#v18)
        for v24, v25 in v18 do
            v23[v24] = v22(v25, v24 - 1, v18)
        end
        local v26 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.3)
        }
        local v27 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v28 = #v27
        for v29, v30 in v23 do
            v27[v28 + v29] = v30
        end
        v13.PlayerRendersList = u7.createElement(u4, v26, v27)
        v13.Description = u7.createElement("TextLabel", {
            ["Text"] = "<b>Next Scene</b>",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextXAlignment"] = "Center",
            ["LayoutOrder"] = 3,
            ["TextColor3"] = u3.WHITE,
            ["Size"] = UDim2.fromScale(0.95, 0.3),
            ["Position"] = UDim2.fromScale(0.5, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 1)
        })
        v11.Container = u7.createElement(u4, v12, v13)
        return u7.createFragment({
            ["ObbyWinAreaSurface"] = u7.createElement("SurfaceGui", v10, v11)
        })
    end)
}