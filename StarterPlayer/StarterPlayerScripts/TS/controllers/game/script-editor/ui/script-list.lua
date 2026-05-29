local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent, "script-list-name").ScriptListName
return {
    ["ScriptList"] = v8.new(u7)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u5
            [4] = u3
            [5] = u9
            [6] = u4
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local u14 = u7.createRef()
        local u15, u16 = v12(22)
        local u17, u18 = v12(800)
        local u19, u20 = v12(nil)
        v13(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u14
                [3] = u16
                [4] = u18
            --]]
            local u21 = u6.new()
            local u22 = u14:getValue()
            if u22 then
                u21:GiveTask(u22:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 23 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u22
                        [3] = u18
                    --]]
                    u16(u22.AbsoluteSize.X / 194 * 22)
                    u18(u22.AbsoluteSize.Y)
                end))
                u18(u22.AbsoluteSize.Y)
                u16(u22.AbsoluteSize.X / 194 * 22)
            end
            return function() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end, {})
        local function u25(p23) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u5
                [3] = u20
            --]]
            local v24 = u19
            if v24 == nil then
                return nil
            end
            if v24 == -1 and p23 ~= "" then
                u5.Controllers.ScriptEditorController:createScript(p23)
            end
            if v24 >= 0 and p23 ~= "" then
                u5.Controllers.ScriptEditorController:renameScript(v24, p23)
            end
            u20(nil)
        end
        local v26 = { u7.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["Padding"] = UDim.new(0.005, 0)
            }), u7.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Text"] = "SCRIPTS",
                ["TextScaled"] = true,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(0.82, 0.035),
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) }
        local v27 = #v26
        local v28 = u10.availableScripts
        local function v31(p29, p30) --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u9
                [3] = u19
                [4] = u15
                [5] = u17
                [6] = u25
                [7] = u10
            --]]
            return u7.createElement(u9, {
                ["scriptData"] = p29,
                ["editingName"] = u19 == p29.scriptId,
                ["TextSize"] = u15,
                ["Size"] = UDim2.new(0.824, 0, 0, 0.0445 * u17),
                ["LayoutOrder"] = p30,
                ["stopEditingName"] = u25,
                ["rerenderId"] = u10.rerenderId
            })
        end
        local v32 = table.create(#v28)
        for v33, v34 in v28 do
            v32[v33] = v31(v34, v33 - 1, v28)
        end
        local v35 = {
            ["Size"] = UDim2.fromScale(1, 0.93),
            ["BackgroundTransparency"] = 1,
            ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
            ["CanvasSize"] = UDim2.fromScale(1, 0),
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y,
            ["ScrollBarThickness"] = 3,
            ["ScrollBarImageTransparency"] = 0.5,
            [u7.Ref] = u14,
            ["BorderSizePixel"] = 0
        }
        local v36 = { u7.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }), u7.createElement(u4, {
                ["LayoutOrder"] = -1
            }) }
        local v37 = #v36
        for v38, v39 in v32 do
            v36[v37 + v38] = v39
        end
        local v40 = #v36
        local v41
        if u19 == -1 then
            v41 = u7.createElement(u9, {
                ["editingName"] = true,
                ["TextSize"] = u15,
                ["Size"] = UDim2.new(0.824, 0, 0, 0.0445 * u17),
                ["LayoutOrder"] = #u10.availableScripts + 1,
                ["stopEditingName"] = u25,
                ["rerenderId"] = u10.rerenderId
            })
        else
            v41 = false
        end
        if v41 then
            v36[v40 + 1] = v41
        end
        local v42 = #v36
        v36[v42 + 1] = u7.createElement("TextButton", {
            ["Text"] = "New script...",
            ["BackgroundTransparency"] = 0,
            ["BackgroundColor3"] = u3.hexColor(1973790),
            ["Font"] = Enum.Font.Arial,
            ["TextSize"] = u15,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Size"] = UDim2.new(0.824, 0, 0, 0.0445 * u17),
            ["TextColor3"] = u3.hexColor(11447982),
            ["LayoutOrder"] = #u10.availableScripts + 2,
            ["TextTruncate"] = Enum.TextTruncate.AtEnd,
            ["BorderSizePixel"] = 0,
            [u7.Event.MouseButton1Click] = function() --[[ Line: 136 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20(-1)
            end
        })
        v36[v42 + 2] = u7.createElement(u4, {
            ["LayoutOrder"] = #u10.availableScripts + 1
        })
        v26[v27 + 1] = u7.createElement("ScrollingFrame", v35, v36)
        return u7.createFragment(v26)
    end)
}