local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.RunService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "script-editor-util").ScriptEditorUtil
return {
    ["ScriptListName"] = v6.new(u5)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u11
            [4] = u2
            [5] = u8
            [6] = u3
            [7] = u10
            [8] = u9
        --]]
        local _ = p13.useState
        local v14 = p13.useEffect
        local u15 = u5.createRef()
        v14(function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u4
                [3] = u12
                [4] = u11
            --]]
            local u16 = u15:getValue()
            if not u16 then
                return nil
            end
            local u17 = u4.new()
            u17:GiveTask(u16.FocusLost:Connect(function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u16
                --]]
                u12.stopEditingName(u16.Text)
            end))
            u17:GiveTask(u16:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u16
                --]]
                local v18 = u11:liveCleanScriptName(u16.Text)
                if v18 ~= u16.Text then
                    u16.Text = v18
                end
            end))
            u16:CaptureFocus()
            return function() --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                u17:DoCleaning()
            end
        end, {})
        if not u12.editingName then
            local v19 = u2.WHITE
            if u12.scriptData and u8.LocalPlayer then
                v19 = u3.Controllers.ScriptEditorController:getScriptNameColor(u12.scriptData)
            end
            local v20 = {}
            local v21 = #v20
            local v22 = u12.scriptData
            if v22 then
                v22 = u5.createElement("TextButton", {
                    ["Text"] = u12.scriptData.scriptName,
                    ["BackgroundTransparency"] = 0,
                    ["BackgroundColor3"] = u2.hexColor(1973790),
                    ["Font"] = Enum.Font.Arial,
                    ["TextSize"] = u12.TextSize,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["Size"] = u12.Size,
                    ["TextColor3"] = v19,
                    ["LayoutOrder"] = u12.LayoutOrder,
                    ["TextTruncate"] = Enum.TextTruncate.AtEnd,
                    ["BorderSizePixel"] = 0,
                    [u5.Event.MouseButton1Click] = function() --[[ Line: 80 ]]
                        --[[
                        Upvalues:
                            [1] = u12
                            [2] = u10
                        --]]
                        if not u12.scriptData then
                            return nil
                        end
                        u10:dispatch({
                            ["type"] = "GameSetOpenScript",
                            ["scriptId"] = u12.scriptData.scriptId
                        })
                    end,
                    [u5.Event.MouseButton2Click] = function() --[[ Line: 89 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u12
                            [3] = u3
                        --]]
                        if not u9:IsStudio() then
                            return nil
                        end
                        if not u12.scriptData then
                            return nil
                        end
                        u3.Controllers.ScriptEditorController:deleteScript(u12.scriptData.scriptId)
                    end
                })
            end
            if v22 then
                v20[v21 + 1] = v22
            end
            return u5.createFragment(v20)
        end
        local v23 = {}
        local v24 = u12.scriptData
        if v24 ~= nil then
            v24 = v24.scriptName
        end
        v23.Text = v24 == nil and "" or v24
        v23.PlaceholderText = "script-name"
        v23.BackgroundTransparency = 0
        v23.BackgroundColor3 = u2.hexColor(1973790)
        v23.Font = Enum.Font.Arial
        v23.TextSize = u12.TextSize
        v23.TextXAlignment = Enum.TextXAlignment.Left
        v23.Size = u12.Size
        v23.TextColor3 = u2.WHITE
        v23.LayoutOrder = u12.LayoutOrder
        v23.TextTruncate = Enum.TextTruncate.AtEnd
        v23.BorderSizePixel = 0
        v23[u5.Ref] = u15
        return u5.createElement("TextBox", v23)
    end)
}