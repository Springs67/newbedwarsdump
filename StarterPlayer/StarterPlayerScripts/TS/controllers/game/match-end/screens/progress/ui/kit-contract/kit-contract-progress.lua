local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
return {
    ["KitContractProgress"] = v5.new(u4)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u4
            [4] = u3
            [5] = u2
        --]]
        local _ = p9.useState
        local _ = p9.useEffect
        local v10 = u7(p8.EquippedKit or u6.NONE).renderImage
        local v11 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v12 = {
            u4.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.5
            }),
            u4.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new((1 / 0), 50)
            }),
            ["KitRenderImage"] = u4.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(0.3, 0.9),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Image"] = v10
            })
        }
        local v13 = #v12
        local v14 = u3.entries(p8.KitStatsDelta)
        local function v18(p15) --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u2
            --]]
            local v16 = p15[1]
            local v17 = p15[2]
            if v17 <= 0 then
                return nil
            else
                return u4.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextTransparency"] = 0.1,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["Text"] = "+" .. tostring(v17) .. " " .. string.upper(v16),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u2.WHITE
                })
            end
        end
        local v19 = 0
        local v20 = {}
        for v21, v22 in v14 do
            local v23 = v18(v22, v21 - 1, v14)
            if v23 ~= nil then
                v19 = v19 + 1
                v20[v19] = v23
            end
        end
        local v24 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.68, 1),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(1, 0)
        }
        local v25 = { u4.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v26 = #v25
        for v27, v28 in v20 do
            v25[v26 + v27] = v28
        end
        v12[v13 + 1] = u4.createElement("Frame", v24, v25)
        return u4.createElement("Frame", v11, v12)
    end)
}