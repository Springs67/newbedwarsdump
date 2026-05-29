local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.ProgressBar
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util").summoner_getPlayerSpellLevel
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local function v43(_, p12) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u11
        [4] = u10
        [5] = u9
        [6] = u7
        [7] = u6
        [8] = u5
    --]]
    local v13 = p12.useState
    local v14 = p12.useEffect
    local v15, u16 = v13(0)
    local v17, u18 = v13(1)
    local v19, u20 = v13(2)
    local v21, u22 = v13("0%")
    local v23, _ = v13(true)
    local v24, _ = v13(ColorSequence.new(u3.hexColor(14363435), u3.hexColor(14573407)))
    u4.isMobileControls()
    v14(function() --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u16
            [3] = u10
            [4] = u9
            [5] = u18
            [6] = u20
            [7] = u22
        --]]
        u11.Client:Get("SummonerLevelUpProgressFromServer"):Connect(function(p25) --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u10
                [3] = u9
                [4] = u18
                [5] = u20
                [6] = u22
            --]]
            local v26 = p25.progress
            u16(v26)
            local v27 = u10(u9.LocalPlayer)
            if v27 == nil then
                return nil
            else
                u18(v27)
                local v28
                if v27 == 4 then
                    v28 = nil
                else
                    v28 = v27 + 1
                end
                u20(v28)
                local v29 = v26 * 100
                local v30 = math.floor(v29)
                local v31 = tostring(v30) .. "%"
                if v28 == nil then
                    u22("Max Level")
                else
                    u22(v31)
                end
            end
        end)
    end, {})
    local v32 = {
        ["Size"] = UDim2.fromScale(0.6, 0.04),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v33 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local _ = #v33
    if v23 then
        local v34 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v35 = { u7.createElement(u6, {
                ["AcceptZero"] = true,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Progress"] = v15,
                ["BarGradient"] = v24,
                ["BarCornerRadius"] = UDim.new(0.25, 0),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }) }
        local v36 = #v35
        local v37
        if v19 == nil then
            v37 = false
        else
            v37 = u7.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["TextStrokeTransparency"] = 1,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.95, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Text"] = "Lv. " .. tostring(v17),
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Regular),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        end
        if v37 then
            v35[v36 + 1] = v37
        end
        local v38 = #v35
        local v39
        if v19 == nil then
            v39 = false
        else
            v39 = u7.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["TextStrokeTransparency"] = 1,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.95, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Text"] = "Lv. " .. tostring(v19),
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Regular),
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        end
        if v39 then
            v35[v38 + 1] = v39
        end
        v35[#v35 + 1] = u7.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["TextStrokeTransparency"] = 1,
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(0.95, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Text"] = v21,
            ["TextColor3"] = u3.WHITE,
            ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
        v23 = u7.createElement(u5, v34, v35)
    end
    local v40 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v41 = {}
    local v42 = #v41
    if v23 then
        v41[v42 + 1] = v23
    end
    v33.SummonerLevelUpBar = u7.createElement(u5, v40, v41)
    return u7.createElement(u5, v32, v33)
end
v8.new(u7)(v43)
return {
    ["SummonerKitLevelUI"] = v8.new(u7)(v43)
}