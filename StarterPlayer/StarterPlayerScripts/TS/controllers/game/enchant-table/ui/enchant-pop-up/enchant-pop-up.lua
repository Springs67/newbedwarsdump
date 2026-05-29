local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SlideIn
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "glitch-effect", "ui-glitch-effect").UIGlitchEffect
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u13 = u1.import(script, script.Parent.Parent, "enchant-table-right", "enchant-rune-wheel").EnchantRuneWheel
local u14 = u1.import(script, script.Parent.Parent, "enchant-table-ui-util").EnchantTableUIUtil
return {
    ["EnchantPopUp"] = v9.new(u8)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u14
            [3] = u12
            [4] = u1
            [5] = u10
            [6] = u4
            [7] = u7
            [8] = u11
            [9] = u6
            [10] = u5
            [11] = u13
            [12] = u3
        --]]
        local v17 = p16.useEffect
        local u18 = u8.createRef()
        local v19 = u15.ThemeColor or u14.getThemeColor(u15.EnchantTableType)
        local u20 = u15.EnchantTableType == u12.ENCHANT_TABLE_GLITCHED
        v17(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u1
                [3] = u10
                [4] = u4
                [5] = u7
            --]]
            local u21 = u18:getValue()
            local u22 = nil
            local u23 = true
            if u21 then
                u1.Promise.delay(4):andThen(function() --[[ Line: 27 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                        [2] = u10
                        [3] = u21
                        [4] = u22
                        [5] = u4
                        [6] = u7
                    --]]
                    if not u23 then
                        return nil
                    end
                    local v24 = u10:Create(u21, TweenInfo.new(0.35), {
                        ["Position"] = UDim2.fromScale(0.5, -0.2)
                    })
                    v24:Play()
                    u22 = v24.Completed:Connect(function() --[[ Line: 35 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u7
                        --]]
                        if not u4.isHoarceKat() then
                            u7.Controllers.EnchantTableController:unmountEnchantPopup()
                        end
                    end)
                end)
            end
            return function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u22
                --]]
                u23 = false
                if u22 then
                    u22:Disconnect()
                end
            end
        end, {})
        local function v25() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u8
                [3] = u11
                [4] = u15
            --]]
            if u20 then
                return u8.createElement(u11, {}, { u8.createElement("ImageLabel", {
                        ["ScaleType"] = "Fit",
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.8, 0.8),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Image"] = u15.EnchantImage
                    }) })
            else
                return u8.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Image"] = u15.EnchantImage
                })
            end
        end
        local v26 = u8.createElement
        local v27 = "ScreenGui"
        local v28 = {
            ["ResetOnSpawn"] = false
        }
        local v29 = {}
        local v30 = u8.createElement
        local v31 = u6
        local v32 = {}
        local v33 = {}
        local v34 = u8.createElement
        local v35 = u5
        local v36 = {
            ["Position"] = UDim2.fromScale(0.5, 0.2),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.25, 0.25),
            [u8.Ref] = u18
        }
        local v37 = {}
        local v38 = u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        })
        local v39 = u8.createElement(u13, {
            ["RuneTransparency"] = 0,
            ["Color"] = v19,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        })
        local v40 = v25()
        local v41 = u8.createElement
        local v42 = "Frame"
        local v43 = {
            ["AutomaticSize"] = "X",
            ["BackgroundTransparency"] = 0.3,
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(0.75, 0.18),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.85),
            ["BackgroundColor3"] = u3.BLACK
        }
        local v44 = {}
        local v45 = u8.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.005, 0),
            ["PaddingRight"] = UDim.new(0.005, 0)
        })
        local v46 = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v47 = u8.createElement
        local v48 = "TextLabel"
        local v49 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextXAlignment"] = "Center",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.65),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v50 = "<b>"
        local v51
        if u20 then
            v51 = "Glitched " .. u15.EnchantName
        else
            v51 = u15.EnchantName
        end
        v49.Text = v50 .. v51 .. "</b>"
        v49.TextColor3 = u3.WHITE
        __set_list(v44, 1, {v45, v46, v47(v48, v49, { u8.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 16
    }) })})
        __set_list(v37, 1, {v38, v39, v40, v41(v42, v43, v44)})
        __set_list(v33, 1, {v34(v35, v36, v37)})
        __set_list(v29, 1, {v30(v31, v32, v33)})
        return v26(v27, v28, v29)
    end)
}