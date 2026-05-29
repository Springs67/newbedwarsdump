local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.Countdown
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["KitShopEquipButton"] = v7.new(u6)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u4
            [4] = u10
            [5] = u3
            [6] = u9
            [7] = u5
        --]]
        local _ = p12.useState
        local function v13() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            if not u11.Equipped then
                u11.EquipKit()
            end
        end
        local v14 = {
            ["Size"] = u11.Size or UDim2.fromScale(1, 1)
        }
        local v15 = {}
        local v16 = #v15
        local v17 = u11.ActiveRental
        if v17 ~= nil then
            v17 = v17.endTime
        end
        local v18 = v17 ~= nil
        if v18 then
            local v19 = { u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center"
                }) }
            local v20 = #v19
            local v21 = {
                ["EndTime"] = u11.ActiveRental.endTime
            }
            local v22 = u8:GetServerTimeNow()
            local v23 = u11.ActiveRental
            if v23 ~= nil then
                v23 = v23.endTime
            end
            v21.PreText = " (" .. (v23 < v22 and "Expired" or "")
            v21.PostText = ")"
            v21.TextLabel = {
                ["TextTransparency"] = 0.3,
                ["Size"] = UDim2.fromScale(0.5, 0.5)
            }
            v19[v20 + 1] = u6.createElement(u4, v21)
            v18 = u6.createFragment(v19)
        end
        local v24 = {
            ["Selectable"] = true,
            ["LayoutOrder"] = 3,
            ["Text"] = "<b>" .. (u11.Equipped and "EQUIPPED" or "EQUIP") .. "</b>",
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u10.backgroundSuccess,
            ["OnClick"] = v13,
            ["TextLabel"] = {
                ["Size"] = UDim2.fromScale(0, 0.5),
                ["AutomaticSize"] = Enum.AutomaticSize.X
            }
        }
        local v25 = {}
        local v26 = #v25
        if v18 then
            v25[v26 + 1] = v18
        end
        v15[v16 + 1] = u6.createElement(u3, v24, v25)
        local v27 = u11.ActiveRental
        if v27 then
            v27 = u6.createElement("Frame", {
                ["Size"] = UDim2.fromScale(0.6, 0.6),
                ["Position"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, {
                u6.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }),
                u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }),
                u6.createElement("UIGradient", {
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(73, 83, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(114, 122, 255)) })
                }),
                u6.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.7, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u9.HUD_TIMER_ICON
                })
            })
        end
        if v27 then
            v15[v16 + 2] = v27
        end
        return u6.createElement(u5, v14, v15)
    end)
}