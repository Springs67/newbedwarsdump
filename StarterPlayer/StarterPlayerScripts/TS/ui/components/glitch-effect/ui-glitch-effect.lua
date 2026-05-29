local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, script.Parent, "ui-glitch-effect-instance").UIGlitchEffectInstance
return {
    ["UIGlitchEffect"] = v5.new(u4)(function(u7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u2
            [4] = u6
        --]]
        local _ = p8.useState
        local u9 = u7.GlitchColors or { Color3.fromHex("#0ffbf9"), Color3.fromHex("#ff0d23") }
        local v10 = u7.Disabled or u7[u4.Children] == nil
        if not v10 then
            v10 = u7[u4.Children]
            if v10 ~= nil then
                v10 = next(v10) == nil
            end
        end
        if v10 then
            local v11 = {}
            local v12 = #v11
            local v13 = u7[u4.Children]
            if v13 then
                for v14, v15 in v13 do
                    if type(v14) == "number" then
                        v11[v12 + v14] = v15
                    else
                        v11[v14] = v15
                    end
                end
            end
            return u4.createFragment(v11)
        end
        local v16 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v17 = u7.ContainerProps
        if v17 then
            for v18, v19 in v17 do
                v16[v18] = v19
            end
        end
        local v20 = u3.values(u7[u4.Children])
        local function v27(p21) --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u9
                [3] = u4
                [4] = u2
                [5] = u6
                [6] = u7
            --]]
            local v22 = Instance.new(p21.component)
            if not v22:IsA("GuiObject") then
                return p21
            end
            local v23 = p21.props
            local v24 = v23.Size
            v23.Size = UDim2.fromScale(1, 1)
            v23.ZIndex = 2
            local v25 = u3.deepCopy(p21)
            local v26 = u3.deepCopy(p21)
            if v22:IsA("TextLabel") then
                v25.props.TextColor3 = u9[1]
                v26.props.TextColor3 = u9[2]
            elseif v22:IsA("ImageLabel") then
                v25.props.ImageColor3 = u9[1]
                v26.props.ImageColor3 = u9[2]
            end
            if v23.BackgroundTransparency ~= 1 then
                v25.props.BackgroundColor3 = u9[1]
                v26.props.BackgroundColor3 = u9[2]
            end
            v25.props.ZIndex = 1
            v26.props.ZIndex = 1
            return u4.createElement(u2, {
                ["Position"] = v23.Position,
                ["AnchorPoint"] = v23.AnchorPoint,
                ["Size"] = v24
            }, { u4.createElement(u6, {
                    ["Element"] = p21,
                    ["AnimationConfig"] = {
                        ["DisableRandomMovement"] = true,
                        ["DisableRandomTransparency"] = true,
                        ["DisableRandomSpaz"] = true
                    }
                }), u4.createElement(u6, {
                    ["Element"] = v25,
                    ["AnimationConfig"] = u7.AnimationConfig
                }), u4.createElement(u6, {
                    ["Element"] = v26,
                    ["AnimationConfig"] = u7.AnimationConfig
                }) })
        end
        local v28 = 0
        local v29 = {}
        for v30, v31 in v20 do
            local v32 = v27(v31, v30 - 1, v20)
            if v32 ~= nil then
                v28 = v28 + 1
                v29[v28] = v32
            end
        end
        local v33 = {}
        local v34 = #v33
        for v35, v36 in v29 do
            v33[v34 + v35] = v36
        end
        return u4.createElement(u2, v16, v33)
    end)
}