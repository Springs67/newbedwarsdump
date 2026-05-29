local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SoundManager
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.TweenService
local u14 = v12.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["SceneDeathScreen"] = v11.new(u10)(function(u16, p17) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
            [3] = u14
            [4] = u13
            [5] = u6
            [6] = u15
            [7] = u7
            [8] = u8
            [9] = u3
            [10] = u5
            [11] = u4
        --]]
        local _ = p17.useState
        local v18 = p17.useEffect
        local u19 = u10.createRef()
        local u20 = u10.createRef()
        local u21 = u10.createRef()
        v18(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
                [3] = u21
                [4] = u9
                [5] = u14
                [6] = u13
                [7] = u6
                [8] = u15
                [9] = u16
                [10] = u7
                [11] = u8
            --]]
            local u22 = true
            local u23 = u19:getValue()
            local u24 = u20:getValue()
            local u25 = u21:getValue()
            if not (u23 and (u24 and u25)) then
                return nil
            end
            local u26 = u9.new()
            local u27 = u14.CurrentCamera
            local u28
            if u27 == nil then
                u28 = u27
            else
                u28 = u27.FieldOfView
            end
            if u27 then
                u13:Create(u27, TweenInfo.new(1), {
                    ["FieldOfView"] = 35
                }):Play()
            end
            local v29 = u13:Create(u23, TweenInfo.new(1), {
                ["BackgroundTransparency"] = 0
            })
            v29:Play()
            u26:GiveTask(v29.Completed:Connect(function() --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u15
                    [3] = u13
                    [4] = u24
                --]]
                u6:playSound(u15.HALLOWEEN_LTM_LOST)
                u13:Create(u24, TweenInfo.new(0.5), {
                    ["TextTransparency"] = 0
                }):Play()
            end))
            task.delay(#u16.hints * 4 + 1, function() --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u27
                    [3] = u28
                    [4] = u13
                    [5] = u7
                    [6] = u23
                    [7] = u26
                    [8] = u8
                --]]
                if not u22 then
                    return nil
                end
                local v30 = u27
                if v30 then
                    v30 = u28
                end
                if v30 ~= 0 and (v30 == v30 and v30) then
                    local v31 = {
                        ["FieldOfView"] = u28
                    }
                    u13:Create(u27, TweenInfo.new(0.5), v31):Play()
                end
                u7:setContainerTransparency(u23, 1, {
                    ["onSetTweenInfo"] = TweenInfo.new(0.5)
                }, {
                    ["exclude"] = { "Container" }
                })
                local v32 = u13:Create(u23, TweenInfo.new(1), {
                    ["BackgroundTransparency"] = 1
                })
                v32:Play()
                u26:GiveTask(v32.Completed:Connect(function() --[[ Line: 77 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    u8.Controllers.SceneDeathScreenController:unmountActiveDeathScreen()
                end))
            end)
            task.spawn(function() --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u25
                    [3] = u13
                    [4] = u16
                --]]
                task.wait(2)
                local function v34(p33) --[[ Line: 85 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u25
                        [3] = u13
                    --]]
                    if not u22 then
                        return nil
                    end
                    if not u25 then
                        return nil
                    end
                    u25.Text = p33
                    u13:Create(u25, TweenInfo.new(0.3), {
                        ["TextTransparency"] = 0,
                        ["Position"] = UDim2.fromScale(0, 0)
                    }):Play()
                    task.delay(3.7, function() --[[ Line: 99 ]]
                        --[[
                        Upvalues:
                            [1] = u13
                            [2] = u25
                        --]]
                        u13:Create(u25, TweenInfo.new(0.3), {
                            ["TextTransparency"] = 1,
                            ["Position"] = UDim2.fromScale(0, -0.1)
                        }):Play()
                    end)
                end
                for v35, v36 in u16.hints do
                    local _ = v35 - 1
                    v34(v36)
                    task.wait(4)
                end
            end)
            return function() --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u22
                --]]
                u26:DoCleaning()
                u22 = false
            end
        end)
        local v37 = u10.createFragment
        local v38 = {}
        local v39 = u10.createElement
        local v40 = "ScreenGui"
        local v41 = {
            ["DisplayOrder"] = 1000,
            ["IgnoreGuiInset"] = true,
            ["ResetOnSpawn"] = false
        }
        local v42 = {}
        local v43 = u10.createElement
        local v44 = "ImageLabel"
        local v45 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.BLACK,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ScaleType"] = "Crop",
            ["ZIndex"] = 1,
            [u10.Ref] = u19
        }
        local v46 = {}
        local v47 = u10.createElement
        local v48 = u5
        local v49 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v50 = {}
        local v51 = u10.createElement
        local v52 = "UIPadding"
        local v53 = {}
        local v54
        if u4.isSmallScreen() then
            v54 = UDim.new(0.05, 0)
        else
            v54 = UDim.new(0.05, 0)
        end
        v53.PaddingTop = v54
        local v55
        if u4.isSmallScreen() then
            v55 = UDim.new(0.05, 0)
        else
            v55 = UDim.new(0.05, 0)
        end
        v53.PaddingBottom = v55
        local v56
        if u4.isSmallScreen() then
            v56 = UDim.new(0.03, 0)
        else
            v56 = UDim.new(0.03, 0)
        end
        v53.PaddingLeft = v56
        local v57
        if u4.isSmallScreen() then
            v57 = UDim.new(0.03, 0)
        else
            v57 = UDim.new(0.03, 0)
        end
        v53.PaddingRight = v57
        __set_list(v50, 1, {(v51(v52, v53))})
        v50.TextContainer = u10.createElement(u5, {
            ["ZIndex"] = 3,
            ["Position"] = UDim2.fromScale(0.5, 0.35),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Size"] = UDim2.fromScale(0.4, 0.4)
        }, { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u10.createElement("TextLabel", {
                ["Size"] = UDim2.fromScale(1, 0),
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["Text"] = "<b>YOU DIED!</b>",
                ["TextXAlignment"] = "Center",
                ["Font"] = Enum.Font.Roboto,
                ["TextColor3"] = Color3.fromHex("89ffd4"),
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                [u10.Ref] = u20
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u4.isSmallScreen() and 46 or 66
                }) }), u10.createElement("TextLabel", {
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["Text"] = "",
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Top",
                ["Font"] = Enum.Font.Roboto,
                ["TextColor3"] = u3.WHITE,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["ZIndex"] = 3,
                [u10.Ref] = u21
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = u4.isSmallScreen() and 24 or 30
                }) }) })
        v46.Content = v47(v48, v49, v50)
        v42.Container = v43(v44, v45, v46)
        v38.DeathScreenGui = v39(v40, v41, v42)
        return v37(v38)
    end)
}