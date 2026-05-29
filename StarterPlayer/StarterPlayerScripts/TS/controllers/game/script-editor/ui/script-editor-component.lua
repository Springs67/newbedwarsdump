local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v13 = u9.Component:extend("ScriptEditorComponent")
function v13.init(p14, _) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    p14.maid = u8.new()
    p14.shiftDown = false
    p14.commandDown = false
    p14.activeTextboxMaid = u8.new()
    p14:setState({
        ["textSize"] = 18,
        ["text"] = p14.props.initialText,
        ["numLines"] = #string.split(p14.props.initialText, "\n")
    })
end
function v13.willUpdate(p15, p16, _) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if p16.scriptId ~= p15.props.scriptId then
        local v17 = u11
        local v18 = {
            ["type"] = "GameUpdateScript",
            ["updateFromServer"] = false,
            ["scriptUpdates"] = {
                {
                    ["scriptId"] = p15.props.scriptId,
                    ["scriptContents"] = p15.state.text
                }
            }
        }
        v17:dispatch(v18)
    end
end
function v13.didUpdate(p19, p20, p21) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u7
    --]]
    p19:registerPotentiallyNewTextBox()
    local v22 = {}
    if p19.state.text ~= p21.text then
        v22.numLines = #string.split(p19.state.text, "\n")
        local v23 = p19.props.textBoxRef:getValue()
        if v23 then
            v23.Text = p19.state.text
        end
        local v24 = u11:getState().Game.scripts[p19.props.scriptId]
        if v24 ~= nil then
            v24 = v24.editInProgress
        end
        if v24 ~= true then
            u11:dispatch({
                ["type"] = "GameSetScriptEditInProgress",
                ["editInProgress"] = true,
                ["scriptId"] = p19.props.scriptId
            })
        end
    end
    if p19.props.scriptId ~= p20.scriptId then
        v22.text = p19.props.initialText
    end
    if #u7.keys(v22) > 0 then
        p19:setState(v22)
    end
end
function v13.registerPotentiallyNewTextBox(u25) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local u26 = u25.props.textBoxRef:getValue()
    if not u26 then
        return nil
    end
    u25.activeTextboxMaid:DoCleaning()
    if u26:IsA("TextBox") then
        u25.activeTextboxMaid:GiveTask(u26:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u25
            --]]
            local v27 = string.gsub(u26.Text, "\t", "    ")
            if v27 ~= u26.Text then
                u26.Text = v27
                if u26.CursorPosition ~= -1 then
                    local v28 = u26
                    v28.CursorPosition = v28.CursorPosition + 3
                end
                return nil
            end
            u25:setState({
                ["text"] = u26.Text
            })
        end))
    end
    u25.activeTextboxMaid:GiveTask(u10.InputBegan:Connect(function(p29) --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u26
        --]]
        if p29.KeyCode ~= Enum.KeyCode.Tab then
            return nil
        end
        local v30 = u25.props.textBoxRef:getValue()
        if not v30 then
            return nil
        end
        if not v30:IsA("TextBox") then
            return nil
        end
        if not v30:IsFocused() then
            return nil
        end
        if not u25.shiftDown then
            return nil
        end
        local v31 = v30.CursorPosition
        while true do
            local v32 = u26.Text
            local v33 = v31 - 1
            local v34 = { string.byte(v32, v33) }
            local v35 = #v34 > 0
            if v35 then
                v35 = v34[1] ~= 10
            end
            if not v35 then
                break
            end
            v31 = v31 - 1
        end
        local v36 = v30.CursorPosition
        local v37 = { " ", "\t" }
        local v38 = table.create(#v37)
        for v39, v40 in v37 do
            local _ = v39 - 1
            v38[v39] = string.byte(v40)
        end
        local v41 = {}
        local v42 = v30.Text
        local v43 = v31 + 3
        __set_list(v41, 1, {string.byte(v42, v31, v43)})
        local v44 = true
        for v45, v46 in v41 do
            local _ = v45 - 1
            if table.find(v38, v46) == nil then
                v44 = false
                break
            end
        end
        if v44 then
            local v47 = table.concat
            local v48 = {}
            local v49 = v30.Text
            local v50 = v31 - 1
            local v51 = string.sub(v49, 0, v50)
            local v52 = v30.Text
            local v53 = v31 + 4
            __set_list(v48, 1, {v51, (string.sub(v52, v53))})
            v30.Text = v47(v48, "")
            local v54 = v36 - 4
            v30.CursorPosition = math.max(v54, v31)
        end
    end))
    if u26:IsA("TextBox") then
        u26:CaptureFocus()
    end
end
function v13.didMount(u55) --[[ Line: 170 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
    --]]
    u55.commandDown = false
    u55.shiftDown = false
    u55.maid:GiveTask(u55.activeTextboxMaid)
    u55:registerPotentiallyNewTextBox()
    local u56 = { Enum.KeyCode.LeftControl, Enum.KeyCode.RightControl }
    local u57 = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift }
    u55.maid:GiveTask(u10.InputBegan:Connect(function(p58) --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u55
            [3] = u57
            [4] = u6
        --]]
        local v59 = p58.KeyCode
        if table.find(u56, v59) ~= nil then
            u55.commandDown = true
        end
        local v60 = p58.KeyCode
        if table.find(u57, v60) ~= nil then
            u55.shiftDown = true
        end
        if u55.commandDown and p58.KeyCode == Enum.KeyCode.S then
            local v61 = u55.props.textBoxRef:getValue()
            if not v61 then
                return nil
            end
            local v62 = v61.Text
            if not u55.props.editInProgress then
                return nil
            end
            u6.Controllers.ScriptEditorController:editScriptContents(u55.props.scriptId, v62)
        end
        if u55.commandDown and p58.KeyCode == Enum.KeyCode.R then
            u6.Controllers.ScriptEditorController:setScriptsRunning(not u55.props.scriptsRunning)
        end
    end))
    u55.maid:GiveTask(u10.InputEnded:Connect(function(p63) --[[ Line: 204 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u55
            [3] = u57
        --]]
        local v64 = p63.KeyCode
        if table.find(u56, v64) ~= nil then
            u55.commandDown = false
        end
        local v65 = p63.KeyCode
        if table.find(u57, v65) ~= nil then
            u55.shiftDown = false
        end
    end))
end
function v13.willUnmount(p66) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    p66.maid:DoCleaning()
    local v67 = u11
    local v68 = {
        ["type"] = "GameUpdateScript",
        ["updateFromServer"] = false,
        ["scriptUpdates"] = {
            {
                ["scriptId"] = p66.props.scriptId,
                ["scriptContents"] = p66.state.text
            }
        }
    }
    v67:dispatch(v68)
end
function v13.render(u69) --[[ Line: 226 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u5
        [3] = u3
        [4] = u6
        [5] = u12
        [6] = u4
    --]]
    local v70 = false
    local v71 = 1
    local v72 = {}
    while true do
        if v70 then
            v71 = v71 + 1
        else
            v70 = true
        end
        if v71 > u69.state.numLines + 23 then
            local v73 = table.concat(v72, "\n")
            local v74 = u9.createElement
            local v75 = "ImageButton"
            local v78 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundTransparency"] = 1,
                [u9.Event.MouseButton1Click] = function() --[[ Line: 254 ]]
                    --[[
                    Upvalues:
                        [1] = u69
                    --]]
                    local v76 = u69.props.textBoxRef:getValue()
                    local v77
                    if v76 == nil then
                        v77 = v76
                    else
                        v77 = v76:IsA("TextBox")
                    end
                    if v77 then
                        if v76.Focused then
                            v76.CursorPosition = #v76.Text + 1
                        else
                            v76:CaptureFocus()
                        end
                    else
                        return nil
                    end
                end
            }
            local v79 = {}
            local v80 = u9.createElement
            local v81 = u5
            local v82 = {
                ["Size"] = UDim2.fromScale(0.96, 0.08),
                ["Position"] = UDim2.fromScale(0.5, 0.98),
                ["AnchorPoint"] = Vector2.new(0.5, 1)
            }
            local v83 = {}
            local v84 = u9.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["Padding"] = UDim.new(0.02, 0)
            })
            local v85 = u9.createElement
            local v86 = u3
            local v87 = {
                ["LayoutOrder"] = 0,
                ["Text"] = "SAVE",
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(0.1, 1),
                ["TextLabel"] = {
                    ["ZIndex"] = 2,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Size"] = UDim2.fromScale(0.95, 0.65)
                }
            }
            local v88
            if u69.props.editInProgress then
                v88 = Color3.fromRGB(44, 184, 96)
            else
                v88 = Color3.fromRGB(169, 201, 181)
            end
            v87.BackgroundColor3 = v88
            function v87.OnClick() --[[ Line: 292 ]]
                --[[
                Upvalues:
                    [1] = u69
                    [2] = u6
                --]]
                local v89 = u69.props.textBoxRef:getValue()
                if v89 ~= nil then
                    v89 = v89.Text
                end
                if v89 == nil then
                    return nil
                end
                if not u69.props.editInProgress then
                    return nil
                end
                u6.Controllers.ScriptEditorController:editScriptContents(u69.props.scriptId, v89)
            end
            local v90 = v85(v86, v87)
            local v91 = u9.createElement
            local v92 = u3
            local v93 = {
                ["LayoutOrder"] = 0,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(0.1, 1),
                ["TextLabel"] = {
                    ["ZIndex"] = 2,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Size"] = UDim2.fromScale(0.95, 0.65)
                },
                ["Text"] = u69.props.scriptsRunning and "STOP" or "RUN"
            }
            local v94
            if u69.props.scriptsRunning then
                v94 = u12.mcRed
            else
                v94 = Color3.fromRGB(30, 144, 255)
            end
            v93.BackgroundColor3 = v94
            function v93.OnClick() --[[ Line: 318 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u69
                --]]
                u6.Controllers.ScriptEditorController:setScriptsRunning(not u69.props.scriptsRunning)
            end
            __set_list(v83, 1, {v84, v90, v91(v92, v93)})
            __set_list(v79, 1, {v80(v81, v82, v83), u9.createElement(u5, {
    ["Size"] = UDim2.fromScale(1, 1)
}, { u9.createElement("ScrollingFrame", {
        ["BackgroundTransparency"] = 1,
        ["ScrollBarImageTransparency"] = 0.5,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AutomaticCanvasSize"] = Enum.AutomaticSize.XY,
        ["CanvasSize"] = UDim2.fromScale(0.99, 1),
        ["ScrollingDirection"] = Enum.ScrollingDirection.XY
    }, { u9.createElement("TextBox", {
            ["AutomaticSize"] = Enum.AutomaticSize.XY,
            [u9.Ref] = u69.props.textBoxRef,
            ["Text"] = u69.props.initialText,
            ["Size"] = UDim2.fromScale(0.9, 0),
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0.05, 0),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Top,
            ["TextSize"] = u69.state.textSize,
            ["LineHeight"] = 1.05,
            ["Font"] = Enum.Font.RobotoMono,
            ["TextColor3"] = u4.hexColor(7260153),
            ["ClearTextOnFocus"] = false,
            ["MultiLine"] = true
        }), u9.createElement("TextLabel", {
            ["LineHeight"] = 1.05,
            ["TextTransparency"] = 0.8,
            ["BackgroundTransparency"] = 1,
            ["Text"] = v73,
            ["Size"] = UDim2.fromScale(0.04, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["TextSize"] = u69.state.textSize,
            ["Font"] = Enum.Font.RobotoMono,
            ["TextColor3"] = u4.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextYAlignment"] = Enum.TextYAlignment.Top
        }) }) })})
            return v74(v75, v78, v79)
        end
        if v71 <= u69.state.numLines then
            local v95 = tostring(v71)
            table.insert(v72, v95)
        else
            table.insert(v72, " ")
        end
    end
end
return {
    ["ScriptEditorComponent"] = v13
}