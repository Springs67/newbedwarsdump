local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.Players
local u7 = v5.RunService
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-config").NametagConfig
return {
    ["TrainingRoomEntityDpsBillboard"] = v4.new(u3)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u7
            [4] = u3
            [5] = u9
            [6] = u8
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local v14, u15 = v12(nil)
        local u16 = nil
        local u17 = u10.initialPlayerDpsData
        local _, u18 = v12("0.00")
        local v19, u20 = v12("0.00")
        local v21, u22 = v12("0.00")
        v13(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u10
                [3] = u16
                [4] = u2
                [5] = u6
                [6] = u17
                [7] = u18
                [8] = u7
                [9] = u22
                [10] = u20
            --]]
            u15(u10.initialTargetDpsData)
            u16 = u10.initialTargetDpsData
            u2.Controllers.TrainingRoomDpsCounterController.syncEvents.PlayerDpsUpdatedEvent:connect(function(p23) --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u17
                    [3] = u10
                    [4] = u15
                    [5] = u16
                    [6] = u18
                --]]
                if p23.player == u6.LocalPlayer then
                    u17 = p23.dpsData
                    local v24 = p23.dpsData.targetDamageDataMap[u10.entityInstance]
                    if v24 then
                        u15(v24)
                        u16 = v24
                        u18(string.format("%.2f", v24.totalDamage))
                    end
                end
            end)
            local u27 = u7.Heartbeat:Connect(function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u17
                    [3] = u22
                    [4] = u20
                --]]
                if not u16 then
                    return nil
                end
                if not u17 then
                    return nil
                end
                if not u17.isRecording then
                    return nil
                end
                local v25 = tick() - u16.damageRecordingStartTime
                u22((string.format("%.2f", v25)))
                local v26 = u16.totalDamage / v25
                u20((string.format("%.2f", v26)))
            end)
            return function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27:Disconnect()
            end
        end, {})
        local v28 = u3.createFragment
        local v29 = {
            ["TrainingRoomEntityDpsBillboard_" .. u10.entityInstance.Name] = u3.createElement("BillboardGui", {
                ["StudsOffsetWorldSpace"] = Vector3.new(0, 6.5, 0),
                ["AlwaysOnTop"] = true,
                ["ResetOnSpawn"] = false,
                ["AutoLocalize"] = false,
                ["Adornee"] = u10.entityInstance,
                ["Size"] = UDim2.fromScale(10, 5),
                ["MaxDistance"] = u9.BillboardMaxDistanceGame
            }, { u3.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1)
                }, {
                    u3.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["VerticalAlignment"] = "Bottom",
                        ["HorizontalAlignment"] = "Left",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0, 6)
                    }),
                    u3.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["TextStrokeTransparency"] = 1,
                        ["TextSize"] = 12,
                        ["LayoutOrder"] = 0,
                        ["Text"] = "Total Damage: " .. string.format("%.2f", not v14 and 0 or v14.totalDamage),
                        ["AnchorPoint"] = Vector2.new(0, 0),
                        ["Size"] = UDim2.new(1, 0, 0, 13),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["Font"] = u8.Theme.font,
                        ["TextXAlignment"] = Enum.TextXAlignment.Right,
                        ["TextColor3"] = Color3.new(1, 0.23, 0.23)
                    }),
                    u3.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["TextStrokeTransparency"] = 1,
                        ["TextSize"] = 12,
                        ["LayoutOrder"] = 1,
                        ["Text"] = "Damage Per Second: " .. v19,
                        ["AnchorPoint"] = Vector2.new(0, 0),
                        ["Size"] = UDim2.new(1, 0, 0, 13),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["Font"] = u8.Theme.font,
                        ["TextXAlignment"] = Enum.TextXAlignment.Right,
                        ["TextColor3"] = Color3.new(1, 0.23, 0.23)
                    }),
                    u3.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["TextStrokeTransparency"] = 1,
                        ["TextSize"] = 12,
                        ["LayoutOrder"] = 2,
                        ["Text"] = "Time: " .. v21,
                        ["AnchorPoint"] = Vector2.new(0, 0),
                        ["Size"] = UDim2.new(1, 0, 0, 13),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["Font"] = u8.Theme.font,
                        ["TextXAlignment"] = Enum.TextXAlignment.Right,
                        ["TextColor3"] = Color3.new(1, 0.23, 0.23)
                    })
                }) })
        }
        return v28(v29)
    end)
}