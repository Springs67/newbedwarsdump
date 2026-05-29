local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.ProgressBar
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v36 = v8.new(u7)(function(_, p12) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u11
        [4] = u10
        [5] = u7
        [6] = u5
        [7] = u6
    --]]
    local v13 = p12.useState
    local v14 = p12.useEffect
    local v15, u16 = v13(0)
    local v17, u18 = v13(0)
    local v19, u20 = v13("0%")
    local v21, u22 = v13(true)
    local v23, u24 = v13("")
    local v25, u26 = v13(ColorSequence.new(u3.hexColor(14363435), u3.hexColor(14573407)))
    u4.isMobileControls()
    v14(function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u18
            [3] = u16
            [4] = u20
            [5] = u22
            [6] = u10
            [7] = u24
            [8] = u26
        --]]
        u11.Client:OnEvent("AngelProgress", function(p27) --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u16
                [3] = u20
                [4] = u22
            --]]
            u18(p27.level)
            if p27.level >= 4 then
                u16(1)
                u20("")
                u22(false)
            else
                u16(p27.newProgress)
                local v28 = p27.newProgress * 100
                local v29 = math.floor(v28)
                u20(tostring(v29) .. "%")
            end
        end)
        u10.LocalPlayer:GetAttributeChangedSignal("AngelType"):Connect(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u24
                [3] = u26
            --]]
            local v30 = u10.LocalPlayer:GetAttribute("AngelType")
            u24(v30)
            if v30 == "Light" then
                u26(ColorSequence.new(Color3.fromRGB(255, 217, 196), Color3.fromRGB(255, 184, 74)))
            elseif v30 == "Void" then
                u26(ColorSequence.new(Color3.fromRGB(173, 133, 207), Color3.fromRGB(51, 8, 87)))
            end
        end)
    end, {})
    local v31 = {
        ["Size"] = UDim2.fromScale(0.7, 0.08),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.8)
    }
    local v32 = {
        u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }),
        ["AngelLevelUI"] = u7.createElement(u5, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }, { u7.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["TextStrokeTransparency"] = 1,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Text"] = v17 >= 4 and "Angelic Tier MAX" or "Angelic Tier " .. tostring(v17),
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }), u7.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["TextStrokeTransparency"] = 1,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Text"] = v23,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Right
            }) })
    }
    local _ = #v32
    local v33 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.5)
    }
    local v34 = {}
    local v35 = #v34
    if v21 then
        v21 = u7.createElement(u6, {
            ["AcceptZero"] = true,
            ["Title"] = {
                ["text"] = v19
            },
            ["Size"] = UDim2.fromScale(1, 1),
            ["Progress"] = v15,
            ["BarGradient"] = v25
        })
    end
    if v21 then
        v34[v35 + 1] = v21
    end
    v32.AngelProgressBar = u7.createElement(u5, v33, v34)
    return u7.createElement(u5, v31, v32)
end)
return {
    ["AngelKitApp"] = v9.connect(function(_, p37) --[[ Line: 117 ]]
        local v38 = {}
        for v39, v40 in p37 do
            v38[v39] = v40
        end
        return v38
    end)(v36)
}