local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SettingTextbox"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u7
            [4] = u4
        --]]
        local v10 = p9.useState
        local _ = p9.useEffect
        local v11 = u8.Value
        local u12, u13 = v10(v11 == nil and "" or v11)
        local v14 = u8.Value
        local u15, u16 = v10(v14 == nil and "" or v14)
        local v17 = {}
        local v18 = u8.FrameProps
        if v18 then
            for v19, v20 in v18 do
                v17[v19] = v20
            end
        end
        local v21 = {}
        local v22 = #v21
        local v23
        if u8.Label == nil then
            v23 = false
        else
            v23 = u5.createFragment({ u5.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0, 6)
                }), u5.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "ArialBold",
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Left",
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Text"] = u8.Label,
                    ["TextColor3"] = u3.WHITE
                }, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) })
        end
        if v23 then
            v21[v22 + 1] = v23
        end
        local v24 = #v21
        local v25 = {}
        local v26 = u8.Label
        local v27
        if v26 == "" or not v26 then
            v27 = UDim2.fromScale(1, 1)
        else
            v27 = UDim2.new(1, 0, 0.9, -6)
        end
        v25.Size = v27
        local v28 = u8.TextBoxProps
        if v28 ~= nil then
            v28 = v28.PlaceholderText
        end
        v25.PlaceholderText = v28 == nil and "" or v28
        local v29 = u8.TextBoxProps
        if v29 ~= nil then
            v29 = v29.Text
        end
        v25.Text = v29 == nil and "" or v29
        v25.TextScaled = true
        v25.RichText = true
        v25.Font = "ArialBold"
        v25.TextColor3 = u3.WHITE
        v25.BackgroundColor3 = u7.backgroundTertiary
        v25.BorderSizePixel = 0
        v25.ClearTextOnFocus = false
        v25[u5.Event.FocusLost] = function(p30) --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u8
                [3] = u12
                [4] = u16
            --]]
            if p30.Text == u15 then
                return nil
            end
            if u8.NumbersOnly then
                local v31 = p30.Text
                local v32 = tonumber(v31)
                if v32 == 0 or (v32 ~= v32 or not v32) then
                    p30.Text = u12
                else
                    p30.Text = p30.Text
                end
            end
            u8.OnFocusLost(p30.Text)
            u16(p30.Text)
        end
        v25[u5.Change.Text] = function(p33) --[[ Line: 100 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u8
                [3] = u13
            --]]
            if p33.Text == u12 then
                return nil
            end
            if u8.NumbersOnly then
                local v34 = p33.Text
                local v35 = tonumber(v34)
                if v35 == 0 or (v35 ~= v35 or not v35) then
                    return nil
                end
            end
            local v36 = u8.MaxCharacters
            if v36 ~= 0 and (v36 == v36 and v36) then
                v36 = #p33.Text > u8.MaxCharacters
            end
            if v36 ~= 0 and (v36 == v36 and v36) then
                local v37 = p33.Text
                local v38 = u8.MaxCharacters
                p33.Text = string.sub(v37, 0, v38)
            end
            u13(p33.Text)
        end
        local v39 = u8.TextBoxProps
        if v39 then
            for v40, v41 in v39 do
                v25[v40] = v41
            end
        end
        local v42 = u8[u5.Children]
        if v42 ~= nil then
            v42 = v42.uipadding ~= nil
        end
        local v43 = not v42
        if v43 then
            v43 = u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingRight"] = UDim.new(0.1, 0)
            })
        end
        local v44 = {}
        local v45 = #v44
        if v43 then
            v44[v45 + 1] = v43
        end
        local v46 = #v44
        v44[v46 + 1] = u5.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 18
        })
        local v47 = u8[u5.Children]
        if v47 then
            for v48, v49 in v47 do
                if type(v48) == "number" then
                    v44[v46 + 1 + v48] = v49
                else
                    v44[v48] = v49
                end
            end
        end
        v21[v24 + 1] = u5.createElement("TextBox", v25, v44)
        return u5.createElement(u4, v17, v21)
    end)
}