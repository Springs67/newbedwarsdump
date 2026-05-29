local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent, "glitched-textlabel").GlitchedTextLabel
return {
    ["GlitchedText"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
        --]]
        local _ = p7.useState
        local _ = p7.useEffect
        local v8 = { Color3.fromHex("#0ffbf9"), Color3.fromHex("#ff0d23") }
        local v9 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v10 = u6.FrameProps
        if v10 then
            for v11, v12 in v10 do
                v9[v11] = v12
            end
        end
        local v13 = {}
        local v14 = #v13
        local v15 = {}
        local v16 = {}
        local v17 = u6.TextLabelProps
        if type(v17) == "table" then
            for v18, v19 in v17 do
                v16[v18] = v19
            end
        end
        v16.Text = "<b>" .. u6.Text .. "</b>"
        v16.RichText = true
        v16.ZIndex = 2
        v15.TextLabelProps = v16
        v15.AnimationConfig = {
            ["DisableRandomMovement"] = true,
            ["DisableRandomTransparency"] = true,
            ["DisableRandomSpaz"] = true
        }
        v13[v14 + 1] = u3.createElement(u5, v15)
        local function v26(p20) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u3
                [3] = u5
            --]]
            local v21 = {}
            local v22 = {}
            local v23 = u6.TextLabelProps
            if type(v23) == "table" then
                for v24, v25 in v23 do
                    v22[v24] = v25
                end
            end
            v22.Text = u6.Text
            v22.TextColor3 = p20
            v22.ZIndex = 1
            v21.TextLabelProps = v22
            return u3.createElement(u5, v21)
        end
        local v27 = table.create(#v8)
        for v28, v29 in v8 do
            v27[v28] = v26(v29, v28 - 1, v8)
        end
        for v30, v31 in v27 do
            v13[v14 + 1 + v30] = v31
        end
        return u3.createElement(u2, v9, v13)
    end)
}