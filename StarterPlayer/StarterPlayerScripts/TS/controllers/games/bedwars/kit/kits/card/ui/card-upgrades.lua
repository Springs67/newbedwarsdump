local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DarkBackground
local u5 = v2.DeviceUtil
local u6 = v2.SlideIn
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util").CardUpgrades
local u11 = Color3.fromHex("F7F9F1")
local u12 = Color3.fromHex("A26318")
local u13 = Color3.fromHex("45361A")
local v47 = v8.new(u7)(function(u14, p15) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u5
        [4] = u3
        [5] = u10
        [6] = u12
        [7] = u11
        [8] = u13
        [9] = u6
    --]]
    local _ = p15.useState
    p15.useEffect(function() --[[ Line: 20 ]] end, {})
    local v16 = { u7.createElement(u4, {
            ["AppId"] = u14.AppId
        }) }
    local v17 = #v16
    local v18 = {}
    local v19 = #v18
    local v20 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.45)
    }
    local v21
    if u5.isSmallScreen() then
        v21 = UDim2.fromScale(0.7, 0.7)
    else
        v21 = UDim2.fromScale(0.7, 0.7)
    end
    v20.Size = v21
    local v22 = {
        u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1.9878640776699028
        }),
        ["CardUpgradeText"] = u7.createElement("TextLabel", {
            ["Text"] = "<b>Current Upgrades</b>",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.08),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["Font"] = Enum.Font.Roboto,
            ["TextColor3"] = u3.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
    }
    local _ = #v22
    local v23 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["ClipsDescendants"] = false,
        ["Size"] = UDim2.fromScale(0.8, 0.7),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v24 = {}
    local v25 = #v24
    for v45, v46 in (function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u10
            [3] = u7
            [4] = u12
            [5] = u11
            [6] = u3
            [7] = u13
        --]]
        local v26 = false
        local v27 = 0
        local v28 = {}
        while true do
            if v26 then
                v27 = v27 + 1
            else
                v26 = true
            end
            if v27 >= #u14.cardUpgrades then
                return v28
            end
            local v29 = u10[u14.cardUpgrades[v27 + 1]]
            local v30 = u7.createFragment
            local v31 = {}
            local v32 = "Card" .. tostring(v27)
            local v33 = u7.createElement
            local v34 = {
                ["BorderSizePixel"] = 0,
                ["Transparency"] = 0,
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["BackgroundColor3"] = u12
            }
            local v35 = {}
            local v36 = "CardBase" .. tostring(v27)
            local v37 = u7.createElement
            local v38 = {
                ["BorderSizePixel"] = 0,
                ["Transparency"] = 0,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundColor3"] = u11
            }
            local v39 = {}
            local v40 = "CardImageContainer" .. tostring(v27)
            local v41 = u7.createElement
            local v42 = {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://13754981872",
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.3),
                ["ScaleType"] = Enum.ScaleType.Fit
            }
            local v43 = {
                ["CardImage" .. tostring(v27)] = u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Image"] = v29.image,
                    ["ImageColor3"] = v29.color or u12,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            }
            v39[v40] = v41("ImageLabel", v42, v43)
            v39["CardInfo" .. tostring(v27)] = u7.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://13754981985",
                ["Size"] = UDim2.fromScale(0.95, 0.4),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.78)
            }, {
                ["CardTitle" .. tostring(v27)] = u7.createElement("Frame", {
                    ["Size"] = UDim2.fromScale(0.9, 0.25),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.2),
                    ["BackgroundColor3"] = u12
                }, { u7.createElement("TextLabel", {
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.9, 0.8),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Text"] = "<b>" .. v29.title .. "</b>",
                        ["Font"] = Enum.Font.Roboto,
                        ["TextColor3"] = u3.WHITE,
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }), u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 10)
                    }) }),
                ["CardDescription" .. tostring(v27)] = u7.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.55),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.65),
                    ["Text"] = "<b>" .. v29.description .. "</b>",
                    ["Font"] = Enum.Font.Roboto,
                    ["TextColor3"] = u13,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            })
            v35[v36] = v37("Frame", v38, v39)
            __set_list(v35, 1, {u7.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0, 10)
})})
            v31[v32] = v33("ImageLabel", v34, v35)
            local v44 = v30(v31)
            table.insert(v28, v44)
        end
    end)() do
        v24[v25 + v45] = v46
    end
    v24[#v24 + 1] = u7.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["Padding"] = UDim.new(0.05)
    })
    v22.CardContainer = u7.createElement("Frame", v23, v24)
    v18[v19 + 1] = u7.createElement("Frame", v20, v22)
    v16[v17 + 1] = u7.createElement(u6, {}, v18)
    return u7.createFragment({
        ["CardUpgrades"] = u7.createElement("ScreenGui", {}, v16)
    })
end)
return {
    ["CardUpgradesApp"] = v9.connect(function(p48, p49) --[[ Line: 183 ]]
        local v50 = {}
        for v51, v52 in p49 do
            v50[v51] = v52
        end
        v50.cardUpgrades = p48.Kit.cardUpgrades
        return v50
    end)(v47)
}