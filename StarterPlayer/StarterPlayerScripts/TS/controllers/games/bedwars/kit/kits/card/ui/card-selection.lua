local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.SlideIn
local u8 = v3.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util").CardUpgrades
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = Color3.fromHex("F7F9F1")
local u16 = Color3.fromHex("A26318")
local u17 = Color3.fromHex("45361A")
local v51 = v10.new(u9)(function(u18, p19) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u6
        [4] = u4
        [5] = u12
        [6] = u16
        [7] = u13
        [8] = u8
        [9] = u14
        [10] = u2
        [11] = u15
        [12] = u17
        [13] = u7
    --]]
    local _ = p19.useState
    p19.useEffect(function() --[[ Line: 24 ]] end, {})
    local v20 = { u9.createElement(u5, {
            ["AppId"] = u18.AppId
        }) }
    local v21 = #v20
    local v22 = {}
    local v23 = #v22
    local v24 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.45)
    }
    local v25
    if u6.isSmallScreen() then
        v25 = UDim2.fromScale(0.7, 0.7)
    else
        v25 = UDim2.fromScale(0.7, 0.7)
    end
    v24.Size = v25
    local v26 = {
        u9.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1.9878640776699028
        }),
        ["CardPickText"] = u9.createElement("TextLabel", {
            ["Text"] = "<b>Pick a card, any card!</b>",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.08),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["Font"] = Enum.Font.Roboto,
            ["TextColor3"] = u4.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
    }
    local _ = #v26
    local v27 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["ClipsDescendants"] = true,
        ["Size"] = UDim2.fromScale(0.9, 0.8),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v28 = {}
    local v29 = #v28
    for v49, v50 in (function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u12
            [3] = u9
            [4] = u16
            [5] = u13
            [6] = u8
            [7] = u14
            [8] = u2
            [9] = u15
            [10] = u4
            [11] = u17
        --]]
        local u30 = 0
        local v31 = false
        local v32 = {}
        while true do
            if v31 then
                u30 = u30 + 1
            else
                v31 = true
            end
            if u30 >= #u18.cardAvailableUpgrades then
                return v32
            end
            local v33 = u12[u18.cardAvailableUpgrades[u30 + 1]]
            local v34 = u9.createFragment
            local v35 = {}
            local v36 = "Card" .. tostring(u30)
            local v37 = u9.createElement
            local v38 = {
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["BorderSizePixel"] = 0,
                ["BackgroundColor3"] = u16,
                ["Transparency"] = 0,
                [u9.Event.Activated] = function() --[[ Line: 90 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u18
                        [3] = u30
                        [4] = u8
                        [5] = u14
                        [6] = u2
                    --]]
                    u13.Client:Get("CardSelectUpgrade"):SendToServer({
                        ["upgrade"] = u18.cardAvailableUpgrades[u30 + 1]
                    })
                    u8:playSound(u14.CARD_UPGRADE_SELECT, {
                        ["position"] = nil
                    })
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u18.AppId)
                end,
                ["Modal"] = true
            }
            local v39 = {}
            local v40 = "CardBase" .. tostring(u30)
            local v41 = u9.createElement
            local v42 = {
                ["BorderSizePixel"] = 0,
                ["Transparency"] = 0,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundColor3"] = u15
            }
            local v43 = {}
            local v44 = "CardImageContainer" .. tostring(u30)
            local v45 = u9.createElement
            local v46 = {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://13754981872",
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.3),
                ["ScaleType"] = Enum.ScaleType.Fit
            }
            local v47 = {
                ["CardImage" .. tostring(u30)] = u9.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Image"] = v33.image,
                    ["ImageColor3"] = v33.color or u16,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            }
            v43[v44] = v45("ImageLabel", v46, v47)
            v43["CardInfo" .. tostring(u30)] = u9.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "rbxassetid://13754981985",
                ["Size"] = UDim2.fromScale(0.95, 0.4),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.78)
            }, {
                ["CardTitle" .. tostring(u30)] = u9.createElement("Frame", {
                    ["Size"] = UDim2.fromScale(0.9, 0.25),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.2),
                    ["BackgroundColor3"] = u16
                }, { u9.createElement("TextLabel", {
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.9, 0.8),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Text"] = "<b>" .. v33.title .. "</b>",
                        ["Font"] = Enum.Font.Roboto,
                        ["TextColor3"] = u4.WHITE,
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }), u9.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 10)
                    }) }),
                ["CardDescription" .. tostring(u30)] = u9.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.55),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.65),
                    ["Text"] = "<b>" .. v33.description .. "</b>",
                    ["Font"] = Enum.Font.Roboto,
                    ["TextColor3"] = u17,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            })
            v39[v40] = v41("Frame", v42, v43)
            __set_list(v39, 1, {u9.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0, 10)
})})
            v35[v36] = v37("ImageButton", v38, v39)
            local v48 = v34(v35)
            table.insert(v32, v48)
        end
    end)() do
        v28[v29 + v49] = v50
    end
    v28[#v28 + 1] = u9.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["Padding"] = UDim.new(0.05)
    })
    v26.CardContainer = u9.createElement("Frame", v27, v28)
    v22[v23 + 1] = u9.createElement("Frame", v24, v26)
    v20[v21 + 1] = u9.createElement(u7, {}, v22)
    return u9.createFragment({
        ["CardSelection"] = u9.createElement("ScreenGui", {}, v20)
    })
end)
return {
    ["CardSelectionApp"] = v11.connect(function(p52, p53) --[[ Line: 199 ]]
        local v54 = {}
        for v55, v56 in p53 do
            v54[v55] = v56
        end
        v54.cardAvailableUpgrades = p52.Kit.cardAvailableUpgrades
        return v54
    end)(v51)
}