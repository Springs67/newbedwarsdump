local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["HotbarTeamEventCollectableDisplay"] = v5.new(u4)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u2
            [4] = u6
            [5] = u8
            [6] = u9
            [7] = u4
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local v14 = u7[p10.EventType]
        local v15, u16 = v12((u3.Controllers.GlobalTeamsController:getCollectedPointsDuringMatch()))
        local v17
        if u2.isHoarceKat() then
            v17 = u6
        else
            v17 = u3.Controllers.MatchController:getQueueType()
        end
        local v18 = v17 and u8(v17).disableTeamEventCollectable and true or false
        v13(function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u16
            --]]
            local u20 = u9.Client:Get("TeamEventCollectableCollected"):Connect(function(p19) --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16(p19.amountAfterCollection)
            end)
            return function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20:Disconnect()
            end
        end, {})
        local v21 = not v18
        if v21 then
            local v22 = {
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            }
            local v23 = v14.customPagesConfig
            if v23 ~= nil then
                v23 = v23.setTeamPage
                if v23 ~= nil then
                    v23 = v23.eventContributionCurrency
                end
            end
            v22.Image = v23
            v22.BackgroundTransparency = 1
            v22.BorderSizePixel = 0
            v21 = u4.createElement("ImageLabel", v22)
        end
        local v24 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(1.16, 0.5),
            ["Size"] = UDim2.fromScale(0.15, 0.5)
        }
        local v25 = { u4.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 2)
            }) }
        local v26 = #v25
        if v21 then
            v25[v26 + 1] = v21
        end
        local v27 = #v25
        local v28 = not v18
        if v28 then
            v28 = u4.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Text"] = tostring(v15),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["Font"] = Enum.Font.Roboto
            })
        end
        if v28 then
            v25[v27 + 1] = v28
        end
        return u4.createFragment({
            ["HotbarTeamEventCollectableDisplay"] = u4.createElement("Frame", v24, v25)
        })
    end)
}