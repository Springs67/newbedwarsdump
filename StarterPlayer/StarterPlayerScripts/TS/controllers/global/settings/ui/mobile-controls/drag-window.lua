local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, script.Parent, "caret-toggle").CaretToggle
return {
    ["DragWindow"] = v5.new(u4)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u2
            [4] = u6
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local u11, _ = v9(u4.createRef())
        local u12, _ = v9(u4.createRef())
        local u13, u14 = v9(false)
        local v15 = p7.WindowFrameProps
        if v15 ~= nil then
            v15 = v15.BackgroundColor3
        end
        if v15 == nil then
            v15 = Color3.fromRGB(4, 5, 8)
        end
        v10(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u3
                [3] = u12
            --]]
            local v16 = u11:getValue()
            if v16 ~= nil then
                v16 = v16.Position
            end
            local u17 = v16
            u3("UIDragDetector", {
                ["Parent"] = u11:getValue(),
                ["DragStyle"] = Enum.UIDragDetectorDragStyle.TranslatePlane,
                ["DragContinue"] = function(p18) --[[ Name: DragContinue, Line 32 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u11
                        [3] = u17
                    --]]
                    local v19 = u12:getValue()
                    local v20 = u11:getValue()
                    if not (v19 and v20) then
                        return false
                    end
                    local v21 = v19.AbsolutePosition
                    local v22 = v19.AbsoluteSize
                    local v23
                    if p18.X >= v21.X then
                        v23 = p18.X <= v21.X + v22.X
                    else
                        v23 = false
                    end
                    local v24
                    if p18.Y >= v21.Y then
                        v24 = p18.Y <= v21.Y + v22.Y
                    else
                        v24 = false
                    end
                    if not (v23 and v24) and u17 then
                        v20.Position = u17
                    end
                end,
                ["DragStart"] = function(_) --[[ Name: DragStart, Line 48 ]] end,
                ["DragEnd"] = function(_) --[[ Name: DragEnd, Line 49 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u17
                    --]]
                    local v25 = u11:getValue()
                    if v25 ~= nil then
                        v25 = v25.Position
                    end
                    u17 = v25
                end
            })
        end, {})
        local v26 = {
            ["Size"] = UDim2.fromScale(0.3, 0.3),
            ["BackgroundTransparency"] = 1,
            [u4.Ref] = u11
        }
        local v27 = p7.WindowFrameProps
        if v27 then
            for v28, v29 in v27 do
                v26[v28] = v29
            end
        end
        local v30 = not u13
        if v30 then
            local v31 = {
                ["BackgroundTransparency"] = 0.4,
                ["BorderSizePixel"] = 0,
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Size"] = UDim2.fromScale(1, 0.935),
                ["BackgroundColor3"] = v15
            }
            local v32 = {}
            local v33 = #v32
            local v34 = p7[u4.Children]
            if v34 then
                for v35, v36 in v34 do
                    if type(v35) == "number" then
                        v32[v33 + v35] = v36
                    else
                        v32[v35] = v36
                    end
                end
            end
            v30 = u4.createFragment({
                ["WindowContent"] = u4.createElement("Frame", v31, v32)
            })
        end
        local v38 = {
            ["WindowHeader"] = u4.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(1, 0.065),
                ["BackgroundColor3"] = v15,
                ["BorderSizePixel"] = 0,
                [u4.Ref] = u12,
                [u4.Event.Activated] = function() --[[ Line: 101 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u13
                    --]]
                    u14(not u13)
                end,
                ["ZIndex"] = 100
            }, { u4.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["TextTransparency"] = 0.3,
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 100,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.75, 0.7),
                    ["Text"] = u13 and "OPEN" or "HIDE",
                    ["TextColor3"] = u2.WHITE
                }), u4.createElement(u6, {
                    ["InitialValue"] = u13,
                    ["OnClick"] = function(p37) --[[ Name: OnClick, Line 119 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                        --]]
                        u14(p37)
                    end,
                    ["FrameProps"] = {
                        ["ZIndex"] = 100
                    }
                }) })
        }
        local v39 = #v38
        if v30 then
            v38[v39 + 1] = v30
        end
        return u4.createFragment({
            ["DragWindow"] = u4.createElement("Frame", v26, v38)
        })
    end)
}