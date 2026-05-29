local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["HostPanelTextBox"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u7
            [4] = u4
        --]]
        local v10 = p9.useState
        local _ = p9.useEffect
        local v11 = {}
        for v12, v13 in u8 do
            v11[v12] = v13
        end
        v11[u5.Children] = nil
        v11.Text = nil
        v11.PlaceholderText = v11.Text
        v11.NumbersOnly = nil
        v11.OnFocusLost = nil
        v11.MaxCharacters = nil
        v11.Label = nil
        v11.LeftPadding = nil
        v11.MaxTextSize = nil
        local v14 = {
            ["Size"] = v11.Size,
            ["Position"] = v11.Position,
            ["AnchorPoint"] = v11.AnchorPoint,
            ["LayoutOrder"] = v11.LayoutOrder
        }
        v11.AnchorPoint = nil
        v11.Position = v11.AnchorPoint
        v11.Size = v11.Position
        local v15 = u8.Text
        local u16, u17 = v10(v15 == nil and "" or v15)
        local v18 = u8.Text
        local u19, u20 = v10(v18 == nil and "" or v18)
        local v21 = {
            ["Size"] = v14.Size or UDim2.fromScale(1, 1),
            ["Position"] = v14.Position,
            ["AnchorPoint"] = v14.AnchorPoint,
            ["LayoutOrder"] = v14.LayoutOrder
        }
        local v22 = {}
        local v23 = #v22
        local v24
        if u8.Label == nil then
            v24 = false
        else
            v24 = u5.createFragment({ u5.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0, 6)
                }), u5.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Left",
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Text"] = u8.Label,
                    ["Font"] = u8.Font or "ArialBold",
                    ["TextColor3"] = u3.WHITE
                }, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) })
        end
        if v24 then
            v22[v23 + 1] = v24
        end
        local v25 = #v22
        local v26 = {}
        local v27 = u8.Label
        local v28
        if v27 == "" or not v27 then
            v28 = UDim2.fromScale(1, 1)
        else
            v28 = UDim2.new(1, 0, 0.9, -6)
        end
        v26.Size = v28
        local v29 = u8.PlaceholderText
        local v30 = v29 == nil and "" or v29
        v26.PlaceholderText = tostring(v30)
        local v31 = u8.Text
        local v32 = v31 == nil and "" or v31
        v26.Text = tostring(v32)
        v26.TextScaled = true
        v26.RichText = true
        v26.Font = "ArialBold"
        v26.TextColor3 = u3.WHITE
        v26.BackgroundColor3 = u7.backgroundTertiary
        v26.BorderSizePixel = 0
        v26.ClearTextOnFocus = false
        v26[u5.Event.FocusLost] = function(p33) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u8
                [3] = u16
                [4] = u20
            --]]
            if p33.Text == u19 then
                return nil
            end
            if u8.NumbersOnly then
                local v34 = p33.Text
                local v35 = tonumber(v34)
                if v35 == 0 or (v35 ~= v35 or not v35) then
                    p33.Text = u16
                else
                    p33.Text = p33.Text
                end
            end
            u8.OnFocusLost(p33.Text)
            u20(p33.Text)
        end
        v26[u5.Change.Text] = function(p36) --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u8
                [3] = u17
            --]]
            if p36.Text == u16 then
                return nil
            end
            if u8.NumbersOnly then
                local v37 = p36.Text
                local v38 = tonumber(v37)
                if v38 == 0 or (v38 ~= v38 or not v38) then
                    return nil
                end
            end
            local v39 = u8.MaxCharacters
            if v39 ~= 0 and (v39 == v39 and v39) then
                v39 = #p36.Text > u8.MaxCharacters
            end
            if v39 ~= 0 and (v39 == v39 and v39) then
                local v40 = p36.Text
                local v41 = u8.MaxCharacters
                p36.Text = string.sub(v40, 0, v41)
            end
            u17(p36.Text)
        end
        for v42, v43 in v11 do
            v26[v42] = v43
        end
        local v44 = u8[u5.Children]
        if v44 ~= nil then
            v44 = v44.uipadding ~= nil
        end
        local v45 = not v44
        if v45 then
            local v46 = {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0)
            }
            local v47 = u8.LeftPadding
            local v48 = v47 == nil and 0.1 or v47
            v46.PaddingLeft = UDim.new(v48, 0)
            v46.PaddingRight = UDim.new(0.1, 0)
            v45 = u5.createElement("UIPadding", v46)
        end
        local v49 = {}
        local v50 = #v49
        if v45 then
            v49[v50 + 1] = v45
        end
        local v51 = #v49
        local v52 = {}
        local v53 = u8.MaxTextSize
        v52.MaxTextSize = v53 == nil and 18 or v53
        v49[v51 + 1] = u5.createElement("UITextSizeConstraint", v52)
        local v54 = u8[u5.Children]
        if v54 then
            for v55, v56 in v54 do
                if type(v55) == "number" then
                    v49[v51 + 1 + v55] = v56
                else
                    v49[v55] = v56
                end
            end
        end
        v22[v25 + 1] = u5.createElement("TextBox", v26, v49)
        return u5.createElement(u4, v21, v22)
    end)
}