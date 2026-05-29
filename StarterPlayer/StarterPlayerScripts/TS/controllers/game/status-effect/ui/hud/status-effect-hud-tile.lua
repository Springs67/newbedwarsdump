local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.TooltipContainer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta
return {
    ["StatusEffectHudTile"] = v7.new(u6)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u10
            [3] = u9
            [4] = u4
            [5] = u6
            [6] = u3
            [7] = u5
        --]]
        local v13 = p12.useState
        local v14 = p12.useEffect
        local _, u15 = v13(false)
        local v16
        if u11.ActiveStatusEffect.expireTime == nil then
            v16 = -1
        else
            local v17 = u11.ActiveStatusEffect.expireTime - u8:GetServerTimeNow()
            v16 = math.max(0, v17)
        end
        local v18, u19 = v13(v16)
        local v20, _ = v13(false)
        local v21 = u10[u11.ActiveStatusEffect.statusEffect]
        local v22 = v21.image
        if v21.item then
            local v23 = u9(v21.item)
            if v21.image == nil then
                v22 = v23.image
            end
        end
        v14(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u8
                [3] = u19
            --]]
            local u24 = true
            if u11.ActiveStatusEffect.expireTime ~= nil then
                task.spawn(function() --[[ Line: 30 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u8
                        [3] = u24
                        [4] = u19
                    --]]
                    while true do
                        local v25 = u11.ActiveStatusEffect.expireTime - u8:GetServerTimeNow()
                        local v26 = math.max(0, v25)
                        local v27 = math.floor(v26)
                        if u24 then
                            u19(v27)
                        end
                        local v28 = u24
                        if v28 then
                            v28 = task.wait(1)
                        end
                        if v28 == 0 or (v28 ~= v28 or not v28) then
                            return
                        end
                    end
                end)
            end
            return function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24 = false
            end
        end, { u11.ActiveStatusEffect })
        v18 = v18
        local u29
        if v20 then
            local v30 = v18 / 60
            u29 = math.floor(v30)
        else
            u29 = v18
        end
        local v31 = v18 ~= -1
        if v18 > 600 then
            v31 = false
        end
        local v32 = u11.ActiveStatusEffect.stacks
        local v33 = (v32 == nil and 0 or v32) >= 1
        local v34 = v21.showZeroStacks and true or v33
        local v35 = u11.ActiveStatusEffect.stacks
        local function v36() --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u4
            --]]
            if u29 >= 60 then
                return u4.hexColor(16777215)
            elseif u29 >= 10 then
                return u4.hexColor(16754518)
            elseif u29 >= 0 then
                return Color3.fromRGB(255, 41, 41)
            else
                return u4.hexColor(16777215)
            end
        end
        local v37 = {
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["BackgroundTransparency"] = 0.2,
            ["BorderSizePixel"] = 0,
            [u6.Event.MouseEnter] = function() --[[ Line: 86 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15(true)
            end,
            [u6.Event.MouseLeave] = function() --[[ Line: 89 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15(false)
            end
        }
        local v38 = { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }), u6.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Transparency"] = 0.5,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }), u6.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 1,
                ["Size"] = UDim2.new(0.75, 0, 0.75, 0),
                ["Image"] = v22,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
            }) }
        local v39 = #v38
        if v31 then
            v31 = u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Right",
                ["TextYAlignment"] = "Bottom",
                ["TextScaled"] = true,
                ["AnchorPoint"] = Vector2.new(1, 1),
                ["Position"] = UDim2.fromScale(0.925, 0.925),
                ["Size"] = UDim2.fromScale(0.5, 0.35),
                ["Text"] = tostring(u29),
                ["TextColor3"] = v36(),
                ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold)
            })
        end
        if v31 then
            v38[v39 + 1] = v31
        end
        local v40 = #v38
        if v34 then
            local v41 = {
                ["Position"] = UDim2.fromScale(0.5, -0.25),
                ["Size"] = UDim2.fromScale(0.75, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }
            local v42 = v35 == nil and 0 or v35
            v41.Text = tostring(v42)
            v41.TextColor3 = u4.WHITE
            v41.BackgroundTransparency = 1
            v41.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
            v41.TextXAlignment = "Center"
            v41.TextYAlignment = "Top"
            v41.TextScaled = true
            v41.TextStrokeTransparency = 0
            v34 = u6.createElement("TextLabel", v41)
        end
        if v34 then
            v38[v40 + 1] = v34
        end
        local v43 = #v38
        local v44 = { u6.createElement(u3, {
                ["TextSize"] = 16,
                ["Text"] = v21.displayName,
                ["Font"] = Enum.Font.SourceSansBold,
                ["Limits"] = Vector2.new(300, 60)
            }) }
        local v45 = #v44
        local v46
        if v21.description == nil then
            v46 = false
        else
            v46 = u6.createElement(u3, {
                ["TextSize"] = 14,
                ["Text"] = v21.description,
                ["Font"] = Enum.Font.SourceSans,
                ["Limits"] = Vector2.new(300, 60)
            })
        end
        if v46 then
            v44[v45 + 1] = v46
        end
        v38[v43 + 1] = u6.createElement(u5, {}, v44)
        return u6.createElement("ImageLabel", v37, v38)
    end)
}