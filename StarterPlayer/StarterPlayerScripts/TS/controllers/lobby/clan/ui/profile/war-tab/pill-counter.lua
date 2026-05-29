local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "number-counter").NumberCounter
return {
    ["PillCounter"] = v8.new(u7)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u3
            [4] = u5
            [5] = u4
            [6] = u9
        --]]
        local _ = p11.useState
        local v12 = p10.MaxAmount
        local v13
        if v12 == 0 or (v12 ~= v12 or not v12) then
            v13 = p10.Amount
        else
            local v14 = p10.Amount
            local v15 = p10.MaxAmount
            v13 = math.min(v14, v15)
        end
        local v16 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(0, 100, 0, 25),
            ["BackgroundColor3"] = Color3.fromHex("#39385A")
        }
        local v17 = p10.FrameProps
        if v17 then
            for v18, v19 in v17 do
                v16[v18] = v19
            end
        end
        local v20 = { u7.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromHex("#5D5F92")
            }), u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }) }
        local v21 = #v20
        local v22 = {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1.3, 1.3),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0.1, 0.5),
            ["Image"] = p10.Icon
        }
        local v23 = {}
        local v24 = #v23
        local v25
        if p10.Tooltip == nil then
            v25 = false
        else
            v25 = u7.createElement(u6, {}, { u7.createElement(u3, {
                    ["TextSize"] = 16,
                    ["Text"] = p10.Tooltip,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) })
        end
        if v25 then
            v23[v24 + 1] = v25
        end
        v20[v21 + 1] = u7.createElement("ImageLabel", v22, v23)
        local v26 = u7.createElement
        local v27 = u5
        local v28 = {
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(1, 0),
            ["Size"] = UDim2.fromScale(0.8, 1)
        }
        local v29 = {}
        local v30 = u7.createElement("UIPadding", {
            ["PaddingRight"] = UDim.new(0.15, 0),
            ["PaddingTop"] = UDim.new(0.065, 0),
            ["PaddingBottom"] = UDim.new(0.065, 0)
        })
        local v31
        if p10.DisableCountAnimation then
            local v32 = u7.createFragment
            local v33 = {}
            local v34 = u7.createElement
            local v35 = "TextLabel"
            local v36 = {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Right",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v37 = tostring(v13)
            local v38
            if p10.MaxAmount == nil then
                v38 = ""
            else
                local v39 = p10.MaxAmount
                v38 = "/" .. tostring(v39)
            end
            v36.Text = v37 .. v38
            v36.TextColor3 = u4.WHITE
            v33.Count = v34(v35, v36)
            v31 = v32(v33)
        else
            local v40 = u7.createFragment
            local v41 = {
                ["Count"] = u7.createElement(u9, {
                    ["Value"] = v13,
                    ["TextLabelProps"] = {
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["AnchorPoint"] = Vector2.new(1, 0),
                        ["Position"] = UDim2.fromScale(1, 0),
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["TextColor3"] = u4.WHITE,
                        ["TextXAlignment"] = Enum.TextXAlignment.Right,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }
                })
            }
            v31 = v40(v41)
        end
        __set_list(v29, 1, {v30, v31})
        v20.ScoreContainer = v26(v27, v28, v29)
        return u7.createFragment({
            ["ScorePill"] = u7.createElement("Frame", v16, v20)
        })
    end)
}