local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TextService
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local function u17(p10, p11, p12, p13) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v14 = u7:GetTextSize(p10, p11, Enum.Font.Arial, Vector2.new(10000, 10000)).X + 30 * p13
    local v15 = u7:GetTextSize("Script", p11, Enum.Font.Arial, Vector2.new(10000, 10000)).X + 30 * p13
    local v16 = p12 and (1 / 0) or u7:GetTextSize("GameDamageHandler", p11, Enum.Font.Arial, Vector2.new(10000, 10000)).X + 30 * p13
    return math.clamp(v14, v15, v16)
end
return {
    ["ScriptEditorTopBar"] = v6.new(u5)(function(u18, p19) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u17
            [4] = u2
            [5] = u8
            [6] = u3
            [7] = u9
        --]]
        local v20 = p19.useState
        local v21 = p19.useEffect
        local u22, u23 = v20(1)
        local u24 = u5.createRef()
        v21(function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u24
                [3] = u23
            --]]
            local u25 = u4.new()
            local u26 = u24:getValue()
            if u26 then
                u25:GiveTask(u26:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 26 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                        [2] = u26
                    --]]
                    u23(u26.AbsoluteSize.X / 146)
                end))
                u23(u26.AbsoluteSize.X / 146)
            end
            return function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:DoCleaning()
            end
        end, {})
        local u27, u28 = v20(24)
        v21(function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u22
            --]]
            u28(u22 * 24)
        end, { u22 })
        local v29 = { u5.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal
            }) }
        local v30 = #v29
        local v31 = {
            ["LayoutOrder"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8099688473520249, 1)
        }
        local v32 = {}
        local v33 = #v32
        local v34 = u18.loadedTabs
        local function v41(u35, p36) --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u17
                [3] = u27
                [4] = u22
                [5] = u2
                [6] = u5
                [7] = u8
                [8] = u3
            --]]
            local v37 = {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 0,
                ["Active"] = u35.scriptId ~= u18.activeTabScriptId,
                ["AutoButtonColor"] = u35.scriptId ~= u18.activeTabScriptId,
                ["Size"] = UDim2.new(0, u17(u35.scriptName, u27, u35.scriptId == u18.activeTabScriptId, u22), 1, 0),
                ["BackgroundColor3"] = u2.hexColor(u35.scriptId == u18.activeTabScriptId and 1579032 or 3223857),
                ["BorderSizePixel"] = 0,
                [u5.Event.MouseButton1Click] = function() --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u35
                    --]]
                    u8:dispatch({
                        ["type"] = "GameSetOpenScript",
                        ["scriptId"] = u35.scriptId
                    })
                end
            }
            local v38 = {}
            local v39 = #v38
            local v40
            if p36 == #u18.loadedTabs - 1 then
                v40 = false
            else
                v40 = u5.createFragment({
                    ["Divider"] = u5.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.new(0, 4 * u22, 1, 0),
                        ["BackgroundColor3"] = u2.hexColor(1579032),
                        ["Position"] = UDim2.new(1, 0, 0, 0),
                        ["AnchorPoint"] = Vector2.new(1, 0)
                    })
                })
            end
            if v40 then
                v38[v39 + 1] = v40
            end
            v38[#v38 + 1] = u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextColor3"] = u3.Controllers.ScriptEditorController:getScriptNameColor(u35),
                ["Text"] = u35.scriptName,
                ["Size"] = UDim2.new(1, -20 * u22, 1, 0),
                ["Position"] = UDim2.fromOffset(u22 * 10, 0),
                ["TextSize"] = u27,
                ["Font"] = Enum.Font.Arial,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["TextTruncate"] = Enum.TextTruncate.AtEnd
            })
            return u5.createFragment({
                ["ScriptTab"] = u5.createElement("ImageButton", v37, v38)
            })
        end
        local v42 = table.create(#v34)
        for v43, v44 in v34 do
            v42[v43] = v41(v44, v43 - 1, v34)
        end
        local v45 = {
            ["BackgroundTransparency"] = 1,
            ["ScrollBarThickness"] = 1,
            ["ScrollBarImageTransparency"] = 0.8,
            ["BorderSizePixel"] = 0,
            ["ScrollingDirection"] = Enum.ScrollingDirection.X,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AutomaticCanvasSize"] = Enum.AutomaticSize.X,
            ["CanvasSize"] = UDim2.fromScale(0.95, 1)
        }
        local v46 = { u5.createElement("UIListLayout", {
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["FillDirection"] = Enum.FillDirection.Horizontal
            }) }
        local v47 = #v46
        for v48, v49 in v42 do
            v46[v47 + v48] = v49
        end
        v32[v33 + 1] = u5.createElement("ScrollingFrame", v45, v46)
        v29[v30 + 1] = u5.createElement("Frame", v31, v32)
        v29.SyncTab = u5.createFragment({
            ["SyncTab"] = u5.createElement("ImageButton", {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 0,
                ["Size"] = UDim2.fromScale(0.0763239875389408, 1),
                ["BackgroundColor3"] = u2.hexColor(u18.syncOpen and 1579032 or 2566194),
                [u5.Ref] = u24,
                ["BorderSizePixel"] = 0,
                [u5.Event.MouseButton1Click] = function() --[[ Line: 137 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    u8:dispatch({
                        ["type"] = "GameSetScriptSyncOpen",
                        ["open"] = true
                    })
                end
            }, { u5.createElement("TextLabel", {
                    ["Text"] = "Sync",
                    ["BackgroundTransparency"] = 1,
                    ["TextColor3"] = u2.WHITE,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextSize"] = u27,
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }) })
        })
        local v50 = u5.createFragment
        local v51 = {
            ["InfoTab"] = u5.createElement("ImageButton", {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 0,
                ["Size"] = UDim2.fromScale(0.0763239875389408, 1),
                ["BackgroundColor3"] = u2.hexColor(u18.infoOpen and 1579032 or 2566194),
                [u5.Ref] = u24,
                ["BorderSizePixel"] = 0,
                [u5.Event.MouseButton1Click] = function() --[[ Line: 164 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    u8:dispatch({
                        ["type"] = "GameSetScriptInfoOpen",
                        ["open"] = true
                    })
                end
            }, { u5.createElement("TextLabel", {
                    ["Text"] = "Info",
                    ["BackgroundTransparency"] = 1,
                    ["TextColor3"] = u2.WHITE,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextSize"] = u27,
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }) })
        }
        v29.InfoTab = v50(v51)
        local v52 = u5.createFragment
        local v53 = {}
        local v54 = u5.createElement
        local v55 = "ImageButton"
        local v56 = {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 0,
            ["Size"] = UDim2.fromScale(0.11370716510903427, 1),
            ["BackgroundColor3"] = u2.hexColor(u18.consoleOpen and 1579032 or 2566194),
            [u5.Ref] = u24,
            ["BorderSizePixel"] = 0,
            [u5.Event.MouseButton1Click] = function() --[[ Line: 191 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                u8:dispatch({
                    ["type"] = "GameSetConsoleOpen",
                    ["open"] = true
                })
            end
        }
        local v57 = {}
        local v58 = u5.createElement
        local v59 = "TextLabel"
        local v60 = {
            ["BackgroundTransparency"] = 1
        }
        local v61
        if u18.errors > 0 then
            v61 = u9.mcRed
        else
            v61 = u2.WHITE
        end
        v60.TextColor3 = v61
        local v62 = "Console"
        local v63
        if u18.errors > 0 then
            local v64 = u18.errors
            v63 = " (" .. tostring(v64) .. ")"
        else
            v63 = ""
        end
        v60.Text = v62 .. v63
        v60.Size = UDim2.fromScale(1, 1)
        v60.TextSize = u27
        v60.Font = Enum.Font.Arial
        v60.TextXAlignment = Enum.TextXAlignment.Center
        v60.TextYAlignment = Enum.TextYAlignment.Center
        __set_list(v57, 1, {v58(v59, v60)})
        v53.ConsoleTab = v54(v55, v56, v57)
        v29.ConsoleTab = v52(v53)
        return u5.createFragment(v29)
    end)
}