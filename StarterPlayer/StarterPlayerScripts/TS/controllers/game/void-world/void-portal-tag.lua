local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["VoidPortalTag"] = v3.new(u2)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u5
        --]]
        local v8 = p7.useState
        local v9 = p7.useEffect
        local v10 = u6.closeTime - u4:GetServerTimeNow()
        local v11, u12 = v8((math.floor(v10)))
        v9(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u6
                [3] = u4
            --]]
            local u13 = true
            task.spawn(function() --[[ Line: 16 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u12
                    [3] = u6
                    [4] = u4
                --]]
                while true do
                    local v14 = task.wait(1)
                    if v14 ~= 0 and (v14 == v14 and v14) then
                        v14 = u13
                    end
                    if v14 == 0 or (v14 ~= v14 or not v14) then
                        return
                    end
                    local v15 = u12
                    local v16 = u6.closeTime - u4:GetServerTimeNow()
                    v15((math.floor(v16)))
                end
            end)
            return function() --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                u13 = false
            end
        end, {})
        local v17 = u2.createFragment
        local v18 = {}
        local v19 = u2.createElement
        local v20 = {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 4, 0),
            ["AlwaysOnTop"] = true,
            ["MaxDistance"] = 150,
            ["ResetOnSpawn"] = false,
            ["AutoLocalize"] = false,
            ["Size"] = UDim2.fromScale(6, 1)
        }
        local v21 = {}
        local v22 = u2.createElement
        local v23 = {
            ["BackgroundTransparency"] = 0.75,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.75, 0.75),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v24 = {
            u2.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 6),
                ["PaddingRight"] = UDim.new(0, 6)
            }),
            u2.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.01, 0)
            }),
            ["Stroke"] = u2.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Transparency"] = 1,
                ["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
            }),
            ["Tag"] = u2.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["AutoLocalize"] = false,
                ["TextYAlignment"] = "Center",
                ["LayoutOrder"] = 2,
                ["Text"] = u6.getTag(v11),
                ["Size"] = UDim2.fromScale(1, 1),
                ["TextColor3"] = u5.mcPink,
                ["Font"] = Enum.Font.ArialBold
            })
        }
        v21.TagContainer = v22("Frame", v23, v24)
        v18.VoidPortalTag = v19("BillboardGui", v20, v21)
        return v17(v18)
    end)
}