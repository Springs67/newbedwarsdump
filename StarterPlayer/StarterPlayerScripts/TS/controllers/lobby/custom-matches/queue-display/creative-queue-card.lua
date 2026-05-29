local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.GetTarmacAsset
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["CreativeQueueCard"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u7)(function(p8, p9) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u6
            [4] = u3
            [5] = u4
        --]]
        local v10 = p9.useEffect
        local v11 = p9.useState
        local v12, u13 = v11(false)
        local u14, _ = v11(u7.createRef())
        local v15 = p8.DisplayDto
        if v15 ~= nil then
            v15 = v15.blobData.thumbnailImage
        end
        local v16
        if v15 == "" or not v15 then
            v16 = u5("NoImage").Image
        else
            v16 = "rbxassetid://" .. string.gsub(p8.DisplayDto.blobData.thumbnailImage, "rbxassetid://", "")
        end
        v10(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u13
                [3] = u14
            --]]
            local u17 = u6.new()
            local u18 = true
            u17:GiveTask(function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18 = false
                return u18
            end)
            u13(false)
            task.delay(0.5, function() --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u14
                    [3] = u13
                --]]
                if not u18 then
                    return nil
                end
                local v19 = u14:getValue()
                if v19 ~= nil then
                    v19 = v19.IsLoaded
                end
                if v19 ~= true then
                    u13(true)
                    while true do
                        local v20 = task.wait(0.05)
                        if v20 ~= 0 and (v20 == v20 and v20) then
                            v20 = u18
                        end
                        if v20 == 0 or (v20 ~= v20 or not v20) then
                            break
                        end
                        local v21 = u14:getValue()
                        if v21 ~= nil then
                            v21 = v21.IsLoaded
                        end
                        if v21 == true then
                            u13(false)
                            return
                        end
                    end
                end
            end)
            return function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                u17:DoCleaning()
            end
        end, { p8.DisplayDto })
        local v22 = p8.DisplayDto
        if v22 then
            local v23 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.7213114754098361, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }
            local v24 = {}
            local v25 = u7.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["Padding"] = UDim.new(0.03278688524590164, 0)
            })
            local v26 = u7.createElement
            local v27 = {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 0.45,
                ["Size"] = UDim2.fromScale(1, 0.09836065573770492),
                ["BackgroundColor3"] = u3.BLACK
            }
            local v28 = {}
            local v29 = u7.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0.045454545454545456, 0)
            })
            local v30 = u7.createElement("Frame", {
                ["LayoutOrder"] = 1,
                ["BackgroundColor3"] = u3.hexColor(16719390),
                ["Size"] = UDim2.fromScale(0.2727272727272727, 1)
            }, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.08, 0)
                }), u7.createElement("TextLabel", {
                    ["Text"] = "LIVE",
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Font"] = Enum.Font.ArialBold,
                    ["Size"] = UDim2.fromScale(0.95, 0.95),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["TextColor3"] = u3.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }) })
            local v31 = u7.createElement
            local v32 = {
                ["LayoutOrder"] = 2,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1
            }
            local v33 = p8.DisplayDto.players
            v32.Text = tostring(v33) .. " playing"
            v32.Font = Enum.Font.ArialBold
            v32.Size = UDim2.fromScale(0.7272727272727273, 1)
            v32.AnchorPoint = Vector2.new(0.5, 0.5)
            v32.Position = UDim2.fromScale(0.5, 0.5)
            v32.TextColor3 = u3.WHITE
            v32.TextXAlignment = Enum.TextXAlignment.Left
            v32.TextYAlignment = Enum.TextYAlignment.Center
            __set_list(v28, 1, {v29, v30, v31("TextLabel", v32)})
            __set_list(v24, 1, {v25, v26("Frame", v27, v28)})
            local v34 = #v24
            local v35 = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.7213114754098361)
            }
            local v36 = { u7.createElement("ImageLabel", {
                    [u7.Ref] = u14,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = v16,
                    ["ScaleType"] = Enum.ScaleType.Crop,
                    ["BackgroundColor3"] = u3.BLACK,
                    ["BackgroundTransparency"] = v12 and 1 or 0.8,
                    ["ImageTransparency"] = v12 and 1 or 0.2
                }, { u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.08, 0)
                    }) }) }
            local v37 = #v36
            if v12 then
                v12 = u7.createElement("ImageLabel", {
                    ["Image"] = "rbxassetid://14721220192",
                    ["ImageTransparency"] = 0.2,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["ScaleType"] = Enum.ScaleType.Crop
                }, { u7.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.08, 0)
                    }) })
            end
            if v12 then
                v36[v37 + 1] = v12
            end
            v24[v34 + 1] = u7.createElement(u4, v35, v36)
            v24[v34 + 2] = u7.createElement("TextLabel", {
                ["LayoutOrder"] = 3,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 0.45,
                ["AutoLocalize"] = false,
                ["Text"] = p8.DisplayDto.blobData.mapTitle,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(1, 0.19672131147540983),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["BackgroundColor3"] = u3.BLACK
            })
            v22 = u7.createElement("Frame", v23, v24)
        end
        local v38 = {
            ["AlwaysOnTop"] = true,
            ["MaxDistance"] = 90,
            ["Adornee"] = p8.Adornee,
            ["Enabled"] = p8.DisplayDto ~= nil
        }
        local v39 = {}
        local v40 = #v39
        if v22 then
            v39[v40 + 1] = v22
        end
        return u7.createElement("SurfaceGui", v38, v39)
    end)
}