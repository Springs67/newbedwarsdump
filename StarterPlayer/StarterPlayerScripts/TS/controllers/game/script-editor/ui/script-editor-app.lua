local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.Empty
local u7 = v3.SlideIn
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "types", "script-console-line-type").ScriptConsoleLinetype
local u14 = v1.import(script, script.Parent, "console-view").ConsoleView
local u15 = v1.import(script, script.Parent, "info", "info-view").InfoView
local u16 = v1.import(script, script.Parent, "script-editor-component").ScriptEditorComponent
local u17 = v1.import(script, script.Parent, "script-editor-top-bar").ScriptEditorTopBar
local u18 = v1.import(script, script.Parent, "script-list").ScriptList
local u19 = v1.import(script, script.Parent, "sync-view").SyncView
local v62 = v10.new(u9)(function(p20, p21) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u8
        [3] = u9
        [4] = u5
        [5] = u4
        [6] = u6
        [7] = u18
        [8] = u2
        [9] = u13
        [10] = u17
        [11] = u15
        [12] = u19
        [13] = u14
        [14] = u16
        [15] = u7
    --]]
    local v22 = p21.useEffect
    if u12.LocalPlayer then
        v22(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            local u23 = u8.Controllers.ShiftLockController:registerShiftLockControlDisabler("script-editor")
            return function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:DoCleaning()
            end
        end, {})
    end
    local v24 = u9.createRef()
    local v25 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true
    }
    local v26 = { u9.createElement(u5, {
            ["AppId"] = p20.AppId
        }) }
    local _ = #v26
    local v27 = {
        ["BackgroundTransparency"] = 0.03,
        ["BackgroundColor3"] = u4.hexColor(4276545),
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v28 = {}
    local v29 = #v28
    local v30 = {}
    local v31 = #v30
    local v32 = {
        ["BackgroundTransparency"] = 1,
        ["AutoButtonColor"] = false,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.9, 0.9)
    }
    local v33 = {
        u9.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1.5441329179646937
        }),
        u9.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Horizontal
        }),
        ["ExplorerBackground"] = u9.createElement("Frame", {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.1324815063887021, 1),
            ["BackgroundColor3"] = u4.hexColor(1973790)
        }, { u9.createElement(u6, {
                ["Size"] = UDim2.fromScale(1, 0.98),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u9.createElement(u18, {
                    ["availableScripts"] = u2.values(p20.scripts),
                    ["rerenderId"] = p20.rerenderId
                }) }) })
    }
    local _ = #v33
    local v34 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.867518493611298, 1)
    }
    local v35 = { u9.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Vertical
        }) }
    local _ = #v35
    local v36 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.93, 0.036344755970924195)
    }
    local v37 = {}
    local v38 = #v37
    local v39 = {}
    local v40
    if p20.consoleOpen or (p20.infoOpen or p20.syncOpen) then
        v40 = nil
    else
        v40 = p20.scriptId
    end
    v39.activeTabScriptId = v40
    local v41 = 0
    local v42 = {}
    for v43, v44 in u2.values(p20.scripts) do
        local _ = v43 - 1
        if v44.loaded == true then
            v41 = v41 + 1
            v42[v41] = v44
        end
    end
    v39.loadedTabs = v42
    local v45 = 0
    local v46 = {}
    for v47, v48 in p20.consoleText do
        local _ = v47 - 1
        if v48.lineType == u13.ERROR == true then
            v45 = v45 + 1
            v46[v45] = v48
        end
    end
    v39.errors = #v46
    v39.consoleOpen = p20.consoleOpen
    v39.infoOpen = p20.infoOpen
    v39.syncOpen = p20.syncOpen
    v37[v38 + 1] = u9.createElement(u17, v39)
    v35.OpenTabsBackground = u9.createElement("Frame", v36, v37)
    local v49 = {
        ["LayoutOrder"] = 2,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.9636552440290758),
        ["BackgroundColor3"] = u4.hexColor(1579032)
    }
    local v50 = {}
    local v51 = #v50
    local v52
    if p20.infoOpen == true then
        v52 = u9.createElement(u15)
    else
        v52 = false
    end
    if v52 then
        v50[v51 + 1] = v52
    end
    local v53 = #v50
    local v54
    if p20.syncOpen == true then
        v54 = u9.createElement(u19, {
            ["syncToken"] = u8.Controllers.ScriptSyncController.syncToken
        })
    else
        v54 = false
    end
    if v54 then
        v50[v53 + 1] = v54
    end
    local v55 = #v50
    local v56
    if p20.consoleOpen == true then
        v56 = u9.createElement(u14, {
            ["consoleText"] = p20.consoleText
        })
    else
        v56 = false
    end
    if v56 then
        v50[v55 + 1] = v56
    end
    local v57 = #v50
    local v58
    if p20.consoleOpen == true or (p20.infoOpen == true or p20.syncOpen == true) then
        v58 = false
    else
        v58 = p20.scriptId ~= nil
    end
    if v58 then
        local v59 = {}
        local v60 = p20.scriptContents[p20.scriptId]
        v59.initialText = v60 == nil and "" or v60
        v59.scriptId = p20.scriptId
        v59.textBoxRef = v24
        v59.scriptsRunning = p20.scriptsRunning
        local v61 = p20.scripts[p20.scriptId]
        if v61 ~= nil then
            v61 = v61.editInProgress
        end
        v59.editInProgress = v61 == true
        v58 = u9.createElement(u16, v59)
    end
    if v58 then
        v50[v57 + 1] = v58
    end
    v35.ScriptEditorBackground = u9.createElement("Frame", v49, v50)
    v33.ScriptPanelBackground = u9.createElement("Frame", v34, v35)
    v30[v31 + 1] = u9.createElement("TextButton", v32, v33)
    v28[v29 + 1] = u9.createElement(u7, {}, v30)
    v26.EditorGrayBackground = u9.createElement("Frame", v27, v28)
    return u9.createFragment({
        ["ScriptEditor"] = u9.createElement("ScreenGui", v25, v26)
    })
end)
return {
    ["ScriptEditorApp"] = v11.connect(function(p63, p64) --[[ Line: 206 ]]
        local v65 = {}
        for v66, v67 in p64 do
            v65[v66] = v67
        end
        v65.scripts = p63.Game.scripts
        v65.scriptContents = p63.Game.scriptContents
        v65.consoleText = p63.Game.consoleText
        v65.consoleOpen = p63.Game.consoleOpen
        v65.infoOpen = p63.Game.infoOpen
        v65.syncOpen = p63.Game.syncOpen
        v65.scriptId = p63.Game.openScript
        v65.rerenderId = p63.Game.scriptUpdateId
        v65.scriptsRunning = p63.Game.scriptsRunning
        return v65
    end)(v62)
}