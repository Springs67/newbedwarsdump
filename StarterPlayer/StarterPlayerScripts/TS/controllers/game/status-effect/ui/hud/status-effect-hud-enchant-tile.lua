local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.TooltipContainer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.TweenService
local u10 = v8.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "glitch-effect", "ui-glitch-effect").UIGlitchEffect
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["StatusEffectHudEnchantTile"] = v7.new(u6)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u14
            [3] = u13
            [4] = u4
            [5] = u12
            [6] = u6
            [7] = u9
            [8] = u15
            [9] = u11
            [10] = u3
            [11] = u5
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local _, u20 = v18(false)
        local v21, _ = v18(false)
        local v22
        if u16.ActiveStatusEffect.expireTime == nil then
            v22 = -1
        else
            local v23 = u16.ActiveStatusEffect.expireTime - u10:GetServerTimeNow()
            v22 = math.max(0, v23)
        end
        local u24, u25 = v18(v22)
        local v26 = u24 ~= -1
        if u24 > 600 then
            v26 = false
        end
        local v27 = u14[u16.ActiveStatusEffect.statusEffect]
        local v28 = v27.image
        if v27.item then
            local v29 = u13(v27.item)
            if v27.image == nil then
                v28 = v29.image
            end
        end
        local v30 = u16.ActiveStatusEffect.stacks
        local v31
        if v30 == 0 or (v30 ~= v30 or not v30) then
            v31 = false
        else
            v31 = u16.ActiveStatusEffect.stacks > 1
        end
        local v32 = v27.showZeroStacks and true or v31
        local v33 = u16.ActiveStatusEffect.stacks
        v19(function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u10
                [3] = u25
            --]]
            local u34 = true
            if u16.ActiveStatusEffect.expireTime ~= nil then
                task.spawn(function() --[[ Line: 46 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u10
                        [3] = u34
                        [4] = u25
                    --]]
                    while true do
                        local v35 = u16.ActiveStatusEffect.expireTime - u10:GetServerTimeNow()
                        local v36 = math.max(0, v35)
                        local v37 = math.floor(v36)
                        if u34 then
                            u25(v37)
                        end
                        local v38 = u34
                        if v38 then
                            v38 = task.wait(1)
                        end
                        if v38 == 0 or (v38 ~= v38 or not v38) then
                            return
                        end
                    end
                end)
            end
            return function() --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u34
                --]]
                u34 = false
            end
        end, { u16.ActiveStatusEffect })
        local function v39() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u4
            --]]
            if u24 >= 60 then
                return u4.hexColor(16777215)
            elseif u24 >= 10 then
                return u4.hexColor(16754518)
            elseif u24 >= 0 then
                return Color3.fromRGB(255, 41, 41)
            else
                return u4.hexColor(16777215)
            end
        end
        local v42 = {
            ["Size"] = UDim2.new(1.2, 0, 1.2, 0),
            ["SizeConstraint"] = "RelativeYY",
            ["Image"] = u12.STATUS_EFFECT_FRAME_2,
            ["ImageColor3"] = u4.BLACK,
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            [u6.Event.MouseEnter] = function(p40) --[[ Line: 85 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u9
                    [3] = u15
                --]]
                u20(true)
                u9:Create(p40, TweenInfo.new(0.3), {
                    ["ImageColor3"] = u15.textPrimary
                }):Play()
            end,
            [u6.Event.MouseLeave] = function(p41) --[[ Line: 91 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u9
                    [3] = u4
                --]]
                u20(false)
                u9:Create(p41, TweenInfo.new(0.3), {
                    ["ImageColor3"] = u4.BLACK
                }):Play()
            end
        }
        local v43 = { u6.createElement(u11, {
                ["Disabled"] = not v21
            }, { u6.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 1,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["Image"] = v28,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
                }) }) }
        local v44 = #v43
        if v26 then
            v26 = u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Right",
                ["TextYAlignment"] = "Bottom",
                ["TextScaled"] = true,
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Position"] = UDim2.fromScale(0.7, 0.925),
                ["Size"] = UDim2.fromScale(0.5, 0.35),
                ["Text"] = tostring(u24),
                ["TextColor3"] = v39(),
                ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold)
            })
        end
        if v26 then
            v43[v44 + 1] = v26
        end
        local v45 = #v43
        if v32 then
            v32 = u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Top",
                ["TextScaled"] = true,
                ["TextStrokeTransparency"] = 0,
                ["Position"] = UDim2.fromScale(0.5, -0.25),
                ["Size"] = UDim2.fromScale(0.75, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Text"] = tostring(v33),
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold)
            })
        end
        if v32 then
            v43[v45 + 1] = v32
        end
        local v46 = #v43
        local v47 = { u6.createElement(u3, {
                ["TextSize"] = 16,
                ["Text"] = v27.displayName,
                ["Font"] = Enum.Font.SourceSansBold,
                ["Limits"] = Vector2.new(300, 60)
            }) }
        local v48 = #v47
        if v21 then
            v21 = u6.createElement(u3, {
                ["Text"] = "Glitched",
                ["TextSize"] = 14,
                ["Font"] = Enum.Font.SourceSans,
                ["TextColor3"] = Color3.fromRGB(56, 255, 247),
                ["Limits"] = Vector2.new(300, 60)
            })
        end
        if v21 then
            v47[v48 + 1] = v21
        end
        local v49 = #v47
        local v50
        if v27.description == nil then
            v50 = false
        else
            v50 = u6.createElement(u3, {
                ["TextSize"] = 14,
                ["Text"] = v27.description,
                ["Font"] = Enum.Font.SourceSans,
                ["Limits"] = Vector2.new(300, 60)
            })
        end
        if v50 then
            v47[v49 + 1] = v50
        end
        v43[v46 + 1] = u6.createElement(u5, {}, v47)
        return u6.createElement("ImageLabel", v42, v43)
    end)
}