local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.TooltipContainer
local u6 = v2.TopBarCard
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local v19 = v8.new(u7)(function(p11, p12) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u7
        [3] = u6
        [4] = u5
        [5] = u3
        [6] = u4
    --]]
    local v13 = p12.useState
    local v14 = p12.useEffect
    local v15, u16 = v13(1)
    v14(function() --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u16
        --]]
        local u18 = u10:GetAttributeChangedSignal("LuckyBlockLuck"):Connect(function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u16
            --]]
            local v17 = u10:GetAttribute("LuckyBlockLuck")
            if v17 ~= nil then
                u16((math.round(v17)))
            end
        end)
        return function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18:Disconnect()
        end
    end, {})
    return u7.createElement(u6, {
        ["LayoutOrder"] = p11.LayoutOrder
    }, { u7.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://17172512131",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(0, 16, 0, 16),
            ["ImageColor3"] = Color3.fromRGB(54, 158, 15)
        }, { u7.createElement(u5, {}, { u7.createElement(u3, {
                    ["Text"] = "Current Luck",
                    ["TextSize"] = 14,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["TextColor3"] = Color3.fromRGB(54, 158, 15),
                    ["Limits"] = Vector2.new(300, 60)
                }) }) }), u7.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextSize"] = 16,
            ["Text"] = tostring(v15),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u4.WHITE
        }) })
end)
return {
    ["HudLuckyBlockLuckHud"] = v9.connect(function(_, p20) --[[ Line: 60 ]]
        local v21 = {}
        for v22, v23 in p20 do
            v21[v22] = v23
        end
        return v21
    end)(v19)
}