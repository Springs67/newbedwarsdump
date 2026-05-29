local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = v1.import(script, script.Parent, "mobile-layout-util").MobileLayoutUtil
local u11 = {
    ["KitPrimary"] = "Kit1",
    ["KitSecondary"] = "Kit2",
    ["KitTertiary"] = "Kit3",
    ["ItemPrimary"] = "Item1",
    ["ItemSecondary"] = "Item2",
    ["MiscPrimary"] = "Misc1",
    ["MiscSecondary"] = "Misc2"
}
local u12 = u10.ButtonMaxSize
local u13 = u10.ButtonMinSize
local u14 = v8.new()
local u15 = v8.new()
return {
    ["ButtonUpdateStartSignal"] = u14,
    ["ButtonUpdateEndSignal"] = u15,
    ["MobileLayoutCustomizationPlane"] = v6.new(u5)(function(u16, p17) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u4
            [4] = u14
            [5] = u15
            [6] = u7
            [7] = u12
            [8] = u13
            [9] = u2
            [10] = u10
            [11] = u9
            [12] = u11
        --]]
        local v18 = p17.useEffect
        local v19 = p17.useState
        local _ = p17.useValue
        local v20, _ = v19(u5.createRef())
        local u21 = u3.new()
        v18(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u4
                [3] = u14
                [4] = u15
                [5] = u16
            --]]
            local u22 = u3.new()
            local function u25(u23) --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u14
                    [3] = u15
                --]]
                local v24 = u4("UIDragDetector", {
                    ["Enabled"] = true,
                    ["Parent"] = u23,
                    ["BoundingBehavior"] = Enum.UIDragDetectorBoundingBehavior.Automatic
                })
                return { v24, v24.DragStart:Connect(function() --[[ Line: 39 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                            [2] = u23
                        --]]
                        u14:Fire(u23)
                    end), (v24.DragEnd:Connect(function() --[[ Line: 42 ]]
                        --[[
                        Upvalues:
                            [1] = u15
                            [2] = u23
                        --]]
                        u15:Fire(u23)
                    end)) }
            end
            task.delay(1, function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u25
                    [3] = u22
                --]]
                for v26, _ in u16.imageButtons do
                    local v27 = u25(v26:getValue())
                    local _ = v27[1]
                    local v28 = v27[2]
                    local v29 = v27[3]
                    u22:GiveTask(v28)
                    u22:GiveTask(v29)
                end
                for v30, _ in u16.textButtons do
                    local v31 = u25(v30:getValue())
                    local _ = v31[1]
                    local v32 = v31[2]
                    local v33 = v31[3]
                    u22:GiveTask(v32)
                    u22:GiveTask(v33)
                end
            end)
            return function() --[[ Line: 73 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                return u22:DoCleaning()
            end
        end, {})
        v18(function() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u7
                [3] = u16
                [4] = u12
                [5] = u13
                [6] = u15
                [7] = u14
            --]]
            u21:DoCleaning()
            u21:GiveTask(u7.TouchPinch:Connect(function(_, p34, _, p35) --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u12
                    [3] = u13
                    [4] = u15
                    [5] = u14
                --]]
                local v36 = u16.currentlySelected
                local v37
                if v36 == nil then
                    v37 = v36
                else
                    v37 = v36.AbsoluteSize
                end
                if v37 then
                    local v38
                    if p34 > 1 then
                        local v39 = u12 - v37.Y
                        local v40 = u12 - v37.X
                        local v41 = math.min(v40, 2)
                        v38 = math.min(v39, v41)
                    else
                        local v42 = v37.Y - u13
                        local v43 = v37.X - u13
                        local v44 = math.min(v43, 2)
                        v38 = math.min(v42, v44) * -1
                    end
                    v36.Size = v36.Size + UDim2.fromOffset(v38, v38)
                    if p35 == Enum.UserInputState.End then
                        u15:Fire(u16.currentlySelected)
                    elseif p35 == Enum.UserInputState.Begin then
                        u14:Fire(u16.currentlySelected)
                    end
                else
                    return nil
                end
            end))
            return function() --[[ Line: 100 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end, { u16.currentlySelected })
        local v45 = u2.entries(u16.imageButtons)
        local function v51(p46) --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u10
                [3] = u16
            --]]
            local u47 = p46[1]
            local v48 = p46[2]
            local v49 = u5.createFragment
            local v50 = {
                ["Layout-" .. v48.buttonType] = u5.createElement("ImageButton", {
                    [u5.Ref] = u47,
                    ["Image"] = u10.getImage(v48.buttonType),
                    ["ImageRectSize"] = u10.getImageRectSize(v48.buttonType),
                    ["ImageRectOffset"] = u10.getImageRectOffset(v48.buttonType),
                    ["ImageTransparency"] = 0.2,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = v48.size,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = v48.position,
                    [u5.Event.TouchTap] = function() --[[ Line: 119 ]]
                        --[[
                        Upvalues:
                            [1] = u16
                            [2] = u47
                        --]]
                        u16.setCurrentlySelected(u47:getValue())
                    end
                }, { u5.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }), u5.createElement("UIStroke", {
                        ["Thickness"] = u16.currentlySelected and u16.currentlySelected == u47:getValue() and 2 or 0,
                        ["Color"] = Color3.fromRGB(255, 80, 80),
                        ["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
                    }) })
            }
            return v49(v50)
        end
        local v52 = table.create(#v45)
        for v53, v54 in v45 do
            v52[v53] = v51(v54, v53 - 1, v45)
        end
        local v55 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundTransparency"] = 0.07,
            ["BackgroundColor3"] = u9.Gray,
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["Selectable"] = false,
            ["AutoButtonColor"] = false,
            ["Active"] = true,
            ["Modal"] = true,
            [u5.Ref] = v20
        }
        local v56 = {}
        local v57 = #v56
        for v58, v59 in v52 do
            v56[v57 + v58] = v59
        end
        local v60 = #v56
        local v61 = u2.entries(u16.textButtons)
        local function v69(p62) --[[ Line: 161 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u11
                [3] = u16
            --]]
            local u63 = p62[1]
            local v64 = p62[2]
            local v65 = {
                [u5.Ref] = u63
            }
            local v66 = u11[v64.buttonType]
            if v66 == nil then
                v66 = v64.buttonType
            end
            v65.Text = "<b>" .. v66 .. "</b>"
            v65.FontFace = Font.fromName("Roboto")
            v65.RichText = true
            v65.LineHeight = 2
            v65.TextScaled = true
            v65.TextColor3 = Color3.fromRGB(255, 255, 255)
            v65.BackgroundColor3 = Color3.fromRGB(255, 191, 66)
            v65.BackgroundTransparency = 0.2
            v65.AnchorPoint = Vector2.new(0.5, 0.5)
            v65.Size = v64.size
            v65.Position = v64.position
            v65[u5.Event.TouchTap] = function() --[[ Line: 183 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u63
                --]]
                u16.setCurrentlySelected(u63:getValue())
            end
            local v67 = u5.createFragment
            local v68 = {
                ["Layout-" .. v64.buttonType] = u5.createElement("TextButton", v65, {
                    u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }),
                    u5.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }),
                    u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }),
                    u5.createElement("UIStroke", {
                        ["Thickness"] = u16.currentlySelected and u16.currentlySelected == u63:getValue() and 2 or 0,
                        ["Color"] = Color3.fromRGB(255, 80, 80),
                        ["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
                    })
                })
            }
            return v67(v68)
        end
        local v70 = table.create(#v61)
        for v71, v72 in v61 do
            v70[v71] = v69(v72, v71 - 1, v61)
        end
        for v73, v74 in v70 do
            v56[v60 + v73] = v74
        end
        return u5.createFragment({
            ["MobileLayoutPositioningContainer"] = u5.createElement("ImageButton", v55, v56)
        })
    end)
}