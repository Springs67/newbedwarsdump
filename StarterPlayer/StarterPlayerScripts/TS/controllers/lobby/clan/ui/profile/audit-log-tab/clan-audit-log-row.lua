local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v8 = v1.import(script, script.Parent, "audit-log-visualizer")
local u9 = v8.getAuditActionDisplay
local u10 = v8.getUserDisplayName
local u11 = v8.renderAuditLogDescription
return {
    ["ClanAuditLogRow"] = v6.new(u5)(function(p12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
            [3] = u11
            [4] = u7
            [5] = u5
            [6] = u3
            [7] = u4
        --]]
        local _ = p13.useState
        local v14 = {}
        for v15, v16 in p12.ColumnData[1] do
            v14[v15] = v16
        end
        v14.rowText = u10(p12.store, p12.AuditLog.performedByUserId)
        local v17 = {}
        for v18, v19 in p12.ColumnData[2] do
            v17[v18] = v19
        end
        v17.rowText = u9(p12.AuditLog.actionId)
        local v20 = {}
        for v21, v22 in p12.ColumnData[3] do
            v20[v21] = v22
        end
        local v23 = DateTime.fromIsoDate(p12.AuditLog.timestamp)
        if v23 ~= nil then
            v23 = v23:FormatLocalTime("lll", "en-us")
        end
        if v23 == nil then
            v23 = p12.AuditLog.timestamp
        end
        v20.rowText = v23
        local v24 = {}
        for v25, v26 in p12.ColumnData[4] do
            v24[v25] = v26
        end
        v24.rowText = u11(p12.store, p12.AuditLog)
        local v27 = {
            v14,
            v17,
            v20,
            v24
        }
        local u28 = (#v27 - 1) * 0.05 / #v27
        local v29 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(0.95, 0, 0, 60),
            ["BackgroundColor3"] = u7.backgroundPrimary,
            ["LayoutOrder"] = p12.Index
        }
        local v30 = { u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local _ = #v30
        local v31 = {
            ["BackgroundTransparency"] = 1,
            ["Text"] = "",
            ["TextTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v32 = { u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.03, 0),
                ["PaddingRight"] = UDim.new(0.03, 0)
            }), u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 12)
            }) }
        local v33 = #v32
        local function v35(p34) --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u28
                [3] = u3
            --]]
            return u5.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(p34.width - u28, 0, 1, 0),
                ["Text"] = p34.rowText,
                ["TextColor3"] = u3.WHITE
            }, { u5.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        end
        local v36 = table.create(#v27)
        for v37, v38 in v27 do
            v36[v37] = v35(v38, v37 - 1, v27)
        end
        local v39 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v40 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v41 = #v40
        for v42, v43 in v36 do
            v40[v41 + v42] = v43
        end
        v32[v33 + 1] = u5.createElement(u4, v39, v40)
        local v44 = p12.Index
        v30["ToggleAuditLog_" .. tostring(v44)] = u5.createElement("TextButton", v31, v32)
        return u5.createElement("Frame", v29, v30)
    end)
}