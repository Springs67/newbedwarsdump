local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.StringUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "types", "script-console-line-type").ScriptConsoleLinetype
return {
    ["ConsoleView"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u7
            [4] = u5
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local u12, u13 = v10(#u8.consoleText)
        local v14, _ = v10(18)
        local v15, u16 = v10("")
        v11(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u8
            --]]
            u13(#u8.consoleText)
        end, { #u8.consoleText })
        v11(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u4
                [3] = u8
                [4] = u16
            --]]
            local v17 = false
            local v18 = 0
            local v19 = {}
            while true do
                if v17 then
                    v18 = v18 + 1
                else
                    v17 = true
                end
                if v18 >= u12 then
                    u16(table.concat(v19, "\n"))
                    return
                end
                local v20 = u4.formatCountdownTime
                local v21 = u8.consoleText[v18 + 1].time * 100
                local v22 = v20(math.floor(v21) / 100, {
                    ["seconds"] = true,
                    ["minutes"] = true,
                    ["decimalPoints"] = 2
                })
                table.insert(v19, v22)
            end
        end, { u12 })
        local v23 = u3.richTextColor(u3.hexColor(14178390))
        local v24 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v25 = {}
        local v26 = #v25
        local v27 = {
            ["BackgroundTransparency"] = 1,
            ["ScrollBarImageTransparency"] = 0.5,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
            ["CanvasSize"] = UDim2.fromScale(1, 1),
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y
        }
        local v28 = {}
        local v29 = #v28
        local v30 = {
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v31 = u8.consoleText
        local v32 = table.create(#v31)
        for v33, v34 in v31 do
            local _ = v33 - 1
            local v35
            if v34.lineType == nil or v34.lineType == u7.LOG then
                v35 = v34.text
            else
                v35 = "<font color=\"" .. v23 .. "\">" .. v34.text .. "</font>"
            end
            v32[v33] = v35
        end
        v30.Text = table.concat(v32, "\n")
        v30.RichText = true
        v30.Size = UDim2.fromScale(0.86, 0)
        v30.BackgroundTransparency = 1
        v30.AnchorPoint = Vector2.new(0, 0)
        v30.Position = UDim2.fromScale(0.13, 0)
        v30.TextXAlignment = Enum.TextXAlignment.Left
        v30.TextYAlignment = Enum.TextYAlignment.Top
        v30.TextSize = v14
        v30.LineHeight = 1.05
        v30.Font = Enum.Font.RobotoMono
        v30.TextColor3 = u3.hexColor(12303291)
        v28[v29 + 1] = u5.createElement("TextLabel", v30)
        v28[v29 + 2] = u5.createElement("TextLabel", {
            ["LineHeight"] = 1.05,
            ["TextTransparency"] = 0.8,
            ["BackgroundTransparency"] = 1,
            ["Text"] = v15,
            ["Size"] = UDim2.fromScale(0.12, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["TextSize"] = v14,
            ["Font"] = Enum.Font.RobotoMono,
            ["TextColor3"] = u3.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextYAlignment"] = Enum.TextYAlignment.Top
        })
        v25[v26 + 1] = u5.createElement("ScrollingFrame", v27, v28)
        return u5.createElement("ImageButton", v24, v25)
    end)
}