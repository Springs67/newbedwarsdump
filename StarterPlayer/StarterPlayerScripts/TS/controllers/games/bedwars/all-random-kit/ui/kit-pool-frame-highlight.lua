local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["KitPoolFrameHighlight"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(u4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local v6 = p5.useState
        local v7 = p5.useEffect
        local u8, u9 = v6(false)
        v7(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u4
            --]]
            if u8 and u4.OnHover then
                u4.OnHover()
            end
        end, { u8 })
        local v10 = {
            ["Size"] = UDim2.fromScale(1, 1),
            [u3.Event.MouseEnter] = function() --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                return u9(true)
            end,
            [u3.Event.MouseLeave] = function() --[[ Line: 20 ]]
                --[[
                Upvalues:
                    [1] = u9
                --]]
                return u9(false)
            end
        }
        local v11 = {}
        local v12 = #v11
        local v13 = u4[u3.Children]
        if v13 then
            for v14, v15 in v13 do
                if type(v14) == "number" then
                    v11[v12 + v14] = v15
                else
                    v11[v14] = v15
                end
            end
        end
        local v16 = #v11
        if u8 then
            u8 = u3.createElement("UIStroke", {
                ["Transparency"] = 0,
                ["Thickness"] = 3,
                ["Color"] = Color3.fromRGB(255, 240, 69)
            }, { u3.createElement("UIGradient", {
                    ["Rotation"] = -90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
                }) })
        end
        if u8 then
            v11[v16 + 1] = u8
        end
        return u3.createElement(u2, v10, v11)
    end)
}