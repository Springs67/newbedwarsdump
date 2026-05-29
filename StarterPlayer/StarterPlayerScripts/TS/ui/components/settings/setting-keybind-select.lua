local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.KeyboardKeycodes
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.UserInputService
local u10 = v8.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SettingKeybindSelect"] = v7.new(u6)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u5
            [3] = u11
            [4] = u4
            [5] = u6
            [6] = u10
            [7] = u3
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local v16 = p13.useValue
        local v17, u18 = v14(u12.Keybind)
        local u19, u20 = v14(false)
        local u21 = v16(-1)
        v15(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u12
                [3] = u20
            --]]
            u18(u12.Keybind)
            u20(false)
        end, { u12.Keybind })
        local v22 = {}
        local v23 = #v22
        local v24 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 1),
            ["BackgroundColor3"] = u11.backgroundTertiary
        }
        local v25 = u12.FrameProps
        if v25 then
            for v26, v27 in v25 do
                v24[v26] = v27
            end
        end
        local v28 = {}
        local v29 = #v28
        local v30 = {
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v31
        if u19 then
            v31 = "Choose your key"
        else
            if v17 ~= nil then
                v17 = v17.Name
            end
            v31 = tostring(v17)
        end
        v30.Text = v31
        v30.TextScaled = true
        v30.RichText = true
        v30.Font = "ArialBold"
        v30.TextColor3 = u4.WHITE
        v30.BackgroundColor3 = u11.backgroundTertiary
        v30.BorderSizePixel = u12.IsInvalid and 3 or 0
        local v32
        if u12.IsInvalid then
            v32 = u11.backgroundError
        else
            v32 = nil
        end
        v30.BorderColor3 = v32
        v30.AutoLocalize = false
        v30[u6.Event.MouseButton1Up] = function(_) --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
                [3] = u21
                [4] = u10
                [5] = u9
                [6] = u5
                [7] = u12
                [8] = u18
            --]]
            if u19 then
                return nil
            end
            u20(true)
            u21.value = u10:GetServerTimeNow()
            task.delay(0.001, function() --[[ Line: 89 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u5
                    [3] = u12
                    [4] = u18
                    [5] = u20
                --]]
                local u33 = nil
                u9.InputEnded:Once(function(p34) --[[ Line: 29 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u12
                        [3] = u18
                        [4] = u33
                        [5] = u20
                    --]]
                    local v35 = p34.UserInputType == Enum.UserInputType.Keyboard
                    if v35 then
                        local v36 = p34.KeyCode
                        v35 = table.find(u5, v36) ~= nil
                    end
                    if v35 then
                        local v37 = p34.KeyCode
                        u12.UpdateProfileDataKeybind(v37)
                        u18(v37)
                        local v38 = u33
                        if v38 ~= nil then
                            v38()
                        end
                    end
                    u20(false)
                end)
            end)
        end
        v30[u6.Event.InputEnded] = function(_, p39) --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u10
                [3] = u21
                [4] = u12
                [5] = u18
            --]]
            if not u19 then
                return nil
            end
            if p39.UserInputType ~= Enum.UserInputType.MouseButton1 and (p39.UserInputType ~= Enum.UserInputType.MouseButton2 and p39.UserInputType ~= Enum.UserInputType.MouseButton3) then
                return nil
            end
            if u10:GetServerTimeNow() - u21.value < 0.001 then
                return nil
            end
            local v40 = p39.UserInputType
            u12.UpdateProfileDataKeybind(v40)
            u18(v40)
        end
        v28[v29 + 1] = u6.createElement("TextButton", v30, { u6.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingRight"] = UDim.new(0.1, 0)
            }), u6.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        local v41 = u12.IsInvalid
        if v41 then
            local v42 = {
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0, 1),
                ["Size"] = UDim2.fromScale(1, 0.27)
            }
            local v43
            if u12.IsInvalid.overlappedActions then
                local v44 = u12.IsInvalid.overlappedActions
                if v44 ~= nil then
                    v44 = table.concat(v44, ", ")
                end
                v43 = "Overlapping with " .. v44
            else
                v43 = "Invalid"
            end
            v42.Text = v43
            v42.TextColor3 = u4.WHITE
            v42.BackgroundColor3 = u4.BLACK
            v42.BackgroundTransparency = 0.4
            v42.BorderSizePixel = 0
            v42.TextScaled = true
            v41 = u6.createFragment({
                ["InvalidMessage"] = u6.createElement("TextLabel", v42, { u6.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.15, 0),
                        ["PaddingBottom"] = UDim.new(0.15, 0),
                        ["PaddingLeft"] = UDim.new(0.1, 0),
                        ["PaddingRight"] = UDim.new(0.1, 0)
                    }) })
            })
        end
        if v41 then
            v28[v29 + 2] = v41
        end
        v22[v23 + 1] = u6.createElement("Frame", v24, v28)
        v22[v23 + 2] = u6.createElement(u3, {
            ["Text"] = "Reset",
            ["Size"] = UDim2.fromScale(0.3, 0.6),
            ["OnClick"] = u12.ResetKeybind,
            ["BackgroundColor3"] = Color3.fromRGB(47, 48, 77)
        })
        return u6.createFragment(v22)
    end)
}