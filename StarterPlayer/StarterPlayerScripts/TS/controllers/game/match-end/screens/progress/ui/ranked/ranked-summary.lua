local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
return {
    ["RankedSummary"] = v6.new(u5)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u5
            [4] = u4
        --]]
        local _ = p9.useState
        local _ = p9.useEffect
        local v10 = u7[p8.RankChangeData.newDivision.division]
        local v11 = u3.WHITE
        if p8.RankChangeData.rpDelta > 0 then
            v11 = u3.hexColor(10419264)
        elseif p8.RankChangeData.rpDelta < 0 then
            v11 = u3.hexColor(16737380)
        end
        local v12 = p8.RankChangeData.oldDivision.division < p8.RankChangeData.newDivision.division
        local v13 = p8.RankChangeData.oldDivision.division > p8.RankChangeData.newDivision.division
        local v14 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v15 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }) }
        local v16 = #v15
        if v12 or v13 then
            v13 = u5.createFragment({
                ["RankDivision"] = u5.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.12 or 0.09),
                    ["Text"] = v12 and "PROMOTION" or "DEMOTION",
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = v11
                })
            })
        end
        if v13 then
            v15[v16 + 1] = v13
        end
        local _ = #v15
        v15.RankIcon = u5.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.5 or 0.45),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["Image"] = v10.image
        })
        local v17 = u5.createElement
        local v18 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.2 or 0.14)
        }
        local v19 = u3.richTextColor(v11)
        local v20 = p8.RankChangeData.rpDelta >= 0 and "+" or ""
        local v21 = p8.RankChangeData.rpDelta
        v18.Text = "<font color=\"" .. v19 .. "\">" .. v20 .. tostring(v21) .. "</font> LP"
        v18.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v18.TextColor3 = Color3.fromRGB(255, 255, 255)
        v15.RankDivision = v17("TextLabel", v18)
        v15.RankTitle = u5.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0.3,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.1 or 0.08),
            ["Text"] = v10.name,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        })
        return u5.createElement("Frame", v14, v15)
    end)
}