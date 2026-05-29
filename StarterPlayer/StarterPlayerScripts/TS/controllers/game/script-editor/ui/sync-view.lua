local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.CircularSpinner
local u5 = v2.ColorUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["SyncView"] = v10.new(u9)(function(p12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u7
            [4] = u5
            [5] = u3
            [6] = u6
            [7] = u4
            [8] = u11
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local u16, u17 = v14(p12.syncToken)
        local v18, u19 = v14(1)
        local v20, u21 = v14(false)
        local u22 = u9.createRef()
        local u23 = u9.createRef()
        v15(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u22
                [3] = u19
            --]]
            local u24 = u8.new()
            local u25 = u22:getValue()
            if u25 then
                u24:GiveTask(u25:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 25 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u25
                    --]]
                    u19(u25.AbsoluteSize.X / 1285)
                end))
            end
            return function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:DoCleaning()
            end
        end, {})
        v15(function() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u16
                [3] = u7
                [4] = u17
                [5] = u21
            --]]
            local u26 = u8.new()
            if u16 == "" or not u16 then
                local u28 = u7.Controllers.ScriptSyncController.syncTokenGenerated:Connect(function(p27) --[[ Line: 36 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u21
                    --]]
                    u17(p27)
                    u21(false)
                end)
                u26:GiveTask(function() --[[ Line: 40 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                    --]]
                    return u28:Disconnect()
                end)
            end
            return function() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                return u26:DoCleaning()
            end
        end, {})
        local v29 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundTransparency"] = 1,
            [u9.Ref] = u22
        }
        local v30 = {}
        local v31 = #v30
        local v32 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.7610894941634241, 0.9008620689655172),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v33 = {
            u9.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["Padding"] = UDim.new(0.1, 0)
            }),
            ["Header"] = u9.createElement("TextLabel", {
                ["LineHeight"] = 1.05,
                ["Text"] = "\240\159\148\129 Code Sync",
                ["LayoutOrder"] = 0,
                ["TextSize"] = 50 * v18,
                ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                ["TextColor3"] = u5.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            }),
            u9.createElement("TextLabel", {
                ["Text"] = "Download the BedWars Scripting Toolkit extension from the VS Code marketplace to use Code Sync. Code Sync allows you to write scripts in VS Code and automatically sync them into the BedWars script editor. Generate a sync token below to get started.",
                ["RichText"] = true,
                ["LineHeight"] = 1.05,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["TextWrapped"] = true,
                ["Size"] = UDim2.fromScale(1, 0.07177033492822966),
                ["TextSize"] = 30 * v18,
                ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
                ["TextColor3"] = u5.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top
            })
        }
        local v34 = #v33
        local v35
        if u16 == nil and v20 == false then
            v35 = u9.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.2)
            }, { u9.createElement(u3, {
                    ["Text"] = "<b>Generate Sync Token</b>",
                    ["OnClick"] = function() --[[ Name: OnClick, Line 105 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                            [2] = u21
                        --]]
                        u7.Controllers.ScriptSyncController:sendSyncEnableRequest()
                        u21(true)
                    end,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.5, 0.3),
                    ["BackgroundColor3"] = u5.hexColor(16738428),
                    ["TextLabel"] = {
                        ["RichText"] = true
                    }
                }) })
        else
            v35 = false
        end
        if v35 then
            v33[v34 + 1] = v35
        end
        local v36 = #v33
        local v37
        if u16 == nil and v20 == true then
            v37 = u9.createElement(u6, {
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.2)
            }, { u9.createElement(u4, {
                    ["Size"] = UDim2.fromScale(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }, { u9.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) })
        else
            v37 = false
        end
        if v37 then
            v33[v36 + 1] = v37
        end
        local v38 = #v33
        local v39
        if u16 == nil then
            v39 = false
        else
            v39 = u9.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.2)
            }, { u9.createElement("TextLabel", {
                    ["Text"] = "<b>Sync Token</b>",
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextSize"] = 12,
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Position"] = UDim2.fromScale(0.15, 0.5),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }), u9.createElement("TextBox", {
                    [u9.Ref] = u23,
                    ["RichText"] = true,
                    ["ClearTextOnFocus"] = false,
                    ["TextEditable"] = false,
                    ["Text"] = u16,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.5, 0.3),
                    ["TextSize"] = 12,
                    ["BackgroundTransparency"] = 0.5,
                    ["BackgroundColor3"] = Color3.fromRGB(83, 83, 83),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["ClipsDescendants"] = true
                }, { u9.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 8)
                    }) }), u9.createElement("ImageButton", {
                    ["Image"] = u11.EYE_ICON_1,
                    ["Position"] = UDim2.fromScale(0.725, 0.35),
                    ["Size"] = UDim2.fromScale(0.15, 0.3),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    [u9.Event.MouseButton1Down] = function() --[[ Line: 185 ]]
                        --[[
                        Upvalues:
                            [1] = u23
                            [2] = u16
                        --]]
                        local v40 = u23:getValue()
                        if v40 then
                            if #v40.Text > 25 then
                                v40.Text = "<i>hidden</i>"
                                return
                            end
                            v40.Text = u16
                        end
                    end
                }) })
        end
        if v39 then
            v33[v38 + 1] = v39
        end
        v33[#v33 + 1] = u9.createElement("TextLabel", {
            ["Text"] = "Paste your sync token into the Code Sync panel in VS Code to start syncing. \n\n<b>\226\154\160\239\184\143WARNING\226\154\160\239\184\143</b> If you share your token with other users, they will be able to sync scripts into your editor. Your token expires after each session and a new one will need to be generated.",
            ["RichText"] = true,
            ["LineHeight"] = 1.05,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["TextWrapped"] = true,
            ["Size"] = UDim2.fromScale(1, 0.07177033492822966),
            ["TextSize"] = 30 * v18,
            ["FontFace"] = Font.new("Arial", Enum.FontWeight.Light),
            ["TextColor3"] = u5.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Top
        })
        v30[v31 + 1] = u9.createElement("Frame", v32, v33)
        return u9.createElement("ImageButton", v29, v30)
    end)
}