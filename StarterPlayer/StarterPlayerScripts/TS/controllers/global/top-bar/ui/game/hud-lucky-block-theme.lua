local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.TooltipContainer
local u5 = v2.TopBarCard
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "rotation", "lucky-block-rotation-util").LuckyBlockRotationUtil
local v24 = v7.new(u6)(function(p11, p12) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u6
        [4] = u5
        [5] = u4
        [6] = u3
    --]]
    local v13 = p12.useState
    local v14 = p12.useEffect
    local v15, u16 = v13("")
    local v17, u18 = v13("Lucky Blocks")
    v14(function() --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
            [3] = u16
            [4] = u18
        --]]
        local v19 = u9:GetAttribute("LuckyBlockTheme")
        if v19 ~= nil then
            local v20 = u10.getLuckyBlockIcon(v19)
            u16(v20 == nil and "" or v20)
            u18(u10.getNameOfTheme(v19))
        end
        local u23 = u9:GetAttributeChangedSignal("LuckyBlockTheme"):Connect(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u10
                [3] = u16
                [4] = u18
            --]]
            local v21 = u9:GetAttribute("LuckyBlockTheme")
            if v21 ~= nil then
                local v22 = u10.getLuckyBlockIcon(v21)
                u16(v22 == nil and "" or v22)
                u18(u10.getNameOfTheme(v21))
            end
        end)
        return function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23:Disconnect()
        end
    end, {})
    return u6.createElement(u5, {
        ["LayoutOrder"] = p11.LayoutOrder
    }, { u6.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Image"] = v15,
            ["Size"] = UDim2.new(0, 20, 0, 20),
            ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
        }, { u6.createElement(u4, {}, { u6.createElement(u3, {
                    ["TextSize"] = 14,
                    ["Text"] = v17,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Limits"] = Vector2.new(300, 60)
                }) }) }) })
end)
return {
    ["LuckyBlockThemeHud"] = v8.connect(function(_, p25) --[[ Line: 65 ]]
        local v26 = {}
        for v27, v28 in p25 do
            v26[v27] = v28
        end
        return v26
    end)(v24)
}