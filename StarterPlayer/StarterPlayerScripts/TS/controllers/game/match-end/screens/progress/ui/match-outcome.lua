local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.OfflinePlayerUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
return {
    ["MatchOutcome"] = v7.new(u6)(function(p12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u11
            [4] = u8
            [5] = u9
            [6] = u6
            [7] = u10
            [8] = u3
        --]]
        local _ = p13.useState
        local _ = p13.useEffect
        local v14 = {
            ["id"] = "4",
            ["name"] = "Orange",
            ["members"] = {
                [u5.Dummy.Bryan3838.userId] = u5.Dummy.Bryan3838,
                [u5.Dummy.oiogy.userId] = u5.Dummy.oiogy,
                [u5.Dummy.Rascal.userId] = u5.Dummy.Rascal
            },
            ["color"] = Color3.fromRGB(255, 166, 71)
        }
        local v15 = u4.isHoarceKat() and "3" or u11.getGamePlayer(u8.LocalPlayer):getTeamId()
        if not u4.isHoarceKat() then
            v14 = nil
            for v16, v17 in u9:getState().Game.teams do
                local _ = v16 - 1
                if v17.id == p12.WinningTeamId == true then
                    v14 = v17
                    break
                end
            end
        end
        local v18
        if v14 == nil then
            v18 = v14
        else
            v18 = v14.id
        end
        local v19 = v15 == v18
        local v20 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = p12.Size or UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = p12.AnchorPoint or Vector2.new(0.5, 0.5),
            ["Position"] = p12.Position or UDim2.fromScale(0.5, 0.5),
            ["LayoutOrder"] = p12.LayoutOrder
        }
        local v21 = {}
        local v22 = u6.createElement
        local v23 = "ImageLabel"
        local v24 = {
            ["ImageTransparency"] = 0.8,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v25
        if v19 then
            v25 = u10.TROPHY_SOLID
        else
            v25 = u10.BURST_ICON
        end
        v24.Image = v25
        local v26
        if v19 then
            v26 = Color3.fromHex("FFBD54")
        else
            v26 = u3.WHITE
        end
        v24.ImageColor3 = v26
        v24.ScaleType = Enum.ScaleType.Fit
        v24.Visible = not u4.isSmallScreen()
        v21.MatchOutcomeImage = v22(v23, v24)
        local _ = #v21
        local v27 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v28 = { (u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })) }
        local v29 = u6.createElement
        local v30 = "TextLabel"
        local v31 = {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.6 or 0.5),
            ["Text"] = v19 and "VICTORY" or "DEFEAT",
            ["Font"] = Enum.Font.LuckiestGuy
        }
        local v32
        if v19 then
            v32 = u3.hexColor(8585079)
        else
            v32 = u3.WHITE
        end
        v31.TextColor3 = v32
        v28.MatchOutcome = v29(v30, v31)
        local _ = #v28
        local v33 = {
            ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.3 or 0.2),
            ["Text"] = not v14 and "" or string.upper(v14.name) .. " TEAM WINS",
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
        }
        if v14 ~= nil then
            v14 = v14.color
        end
        v33.TextColor3 = v14
        v33.TextScaled = true
        v33.BackgroundTransparency = 1
        v33.LayoutOrder = 1
        v28.WinningTeam = u6.createElement("TextLabel", v33)
        v21.MatchOutcomeText = u6.createElement("Frame", v27, v28)
        return u6.createFragment({
            ["MatchOutcomeWrapper"] = u6.createElement("Frame", v20, v21)
        })
    end)
}