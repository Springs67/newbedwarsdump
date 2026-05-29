local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
return {
    ["StatusEffectTag"] = v5.new(u4)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u3
            [4] = u8
            [5] = u4
            [6] = u2
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local v13 = u7[u9.ActiveStatusEffect.statusEffect]
        local v14, u15 = v11(u9.ActiveStatusEffect.stacks)
        local v16
        if v13.item then
            v16 = u6(v13.item)
        else
            v16 = nil
        end
        local v17 = v13.showOnTagList and true or false
        v12(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u9
                [3] = u8
                [4] = u15
            --]]
            local u18 = u3.new()
            u18:GiveTask(u9.EntityInstance:GetAttributeChangedSignal(u8:getAttributeName(u9.ActiveStatusEffect.statusEffect) .. "_stacks"):Connect(function() --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u8
                    [3] = u15
                --]]
                local v19 = u9.EntityInstance:GetAttribute(u8:getAttributeName(u9.ActiveStatusEffect.statusEffect) .. "_stacks")
                u15(v19 == nil and 0 or v19)
            end))
            return function() --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                u18:DoCleaning()
            end
        end, {})
        local v20 = {
            ["ScaleType"] = "Fit",
            ["SizeConstraint"] = "RelativeYY",
            ["Size"] = UDim2.fromScale(1, 1)
        }
        if v17 then
            v16 = v13.image
        elseif v16 ~= nil then
            v16 = v16.image
        end
        v20.Image = v16
        v20.BackgroundTransparency = 1
        local v21 = {}
        local v22 = #v21
        if v14 > 0 then
            if v17 then
                v17 = u4.createFragment({
                    ["StatusEffectStacks"] = u4.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Top",
                        ["TextScaled"] = true,
                        ["TextStrokeTransparency"] = 0,
                        ["Position"] = UDim2.fromScale(0.5, -0.25),
                        ["Size"] = UDim2.fromScale(0.75, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0),
                        ["Text"] = tostring(v14),
                        ["TextColor3"] = u2.WHITE,
                        ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold)
                    })
                })
            end
        else
            v17 = false
        end
        if v17 then
            v21[v22 + 1] = v17
        end
        return u4.createFragment({
            ["StatusEffectTag"] = u4.createElement("ImageLabel", v20, v21)
        })
    end)
}