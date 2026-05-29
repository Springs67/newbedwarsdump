local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.Empty
local u5 = v2.TextInputComponent
local u6 = v2.UIUtil
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CustomMatchesCodeInputs"] = v9.new(u8)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u10
            [3] = u6
            [4] = u4
            [5] = u5
            [6] = u3
            [7] = u1
            [8] = u7
            [9] = u11
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local u16 = ""
        local u17, u18 = v14(false)
        local u19, u20 = v14(false)
        local u21, u22 = v14("")
        local v23, u24 = v14("")
        local _, _ = v14("")
        local u25 = u8.createRef()
        v15(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u6
                [3] = u25
            --]]
            if u10.GamepadEnabled then
                u6:selectGui(u25:getValue())
            end
        end, {})
        local v26 = {
            ["AutomaticSize"] = "Y",
            ["Size"] = UDim2.new(1, 0, 0, 0)
        }
        local v27 = u12.LayoutOrder
        v26.LayoutOrder = v27 == nil and 1 or v27
        local v28 = u12.FrameProps
        if v28 then
            for v29, v30 in v28 do
                v26[v29] = v30
            end
        end
        local v31 = u8.createFragment
        local v32 = {}
        local v33 = u8.createElement
        local v37 = {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0)
            }),
            ["JoinCodeContainer"] = u8.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.5, -1, 1, 0)
            }, { u8.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0),
                    ["PaddingTop"] = UDim.new(0, 12),
                    ["PaddingBottom"] = UDim.new(0, 12)
                }), u8.createElement(u4, {
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.64),
                    ["Size"] = UDim2.fromOffset(136, 32)
                }, { u8.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Text"] = "<b>ENTER JOIN CODE</b>",
                        ["RichText"] = true,
                        ["TextTransparency"] = 0.1,
                        ["TextSize"] = 12,
                        ["Size"] = UDim2.new(1, 0, 0, 14),
                        ["Position"] = UDim2.new(0, 0, 0, -14),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextColor3"] = Color3.new(1, 1, 1),
                        ["Font"] = Enum.Font.Roboto
                    }), u8.createElement(u5, {
                        ["MaxCharacters"] = 4,
                        ["TextBox"] = {
                            ["PlaceholderText"] = "EZGG",
                            ["ClearTextOnFocus"] = false,
                            ["Position"] = UDim2.fromScale(0, 0.11),
                            ["Size"] = UDim2.fromScale(1, 0.9)
                        },
                        ["OnFocusLost"] = function(p34) --[[ Name: OnFocusLost, Line 88 ]]
                            --[[
                            Upvalues:
                                [1] = u16
                            --]]
                            u16 = p34
                            return u16
                        end
                    }) }), u8.createElement(u3, {
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.fromScale(1, 0.64),
                    ["Size"] = UDim2.fromOffset(115, 32),
                    ["Text"] = u19 and "JOINING MATCH..." or "JOIN MATCH",
                    ["BackgroundColor3"] = Color3.fromRGB(100, 103, 167),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 101 ]]
                        --[[
                        Upvalues:
                            [1] = u19
                            [2] = u20
                            [3] = u12
                            [4] = u16
                            [5] = u1
                        --]]
                        if u19 then
                            return nil
                        end
                        u20(true)
                        u12.OnJoinMatch(u16)
                        u1.Promise.delay(5):andThen(function() --[[ Line: 108 ]]
                            --[[
                            Upvalues:
                                [1] = u20
                            --]]
                            return u20(false)
                        end)
                    end,
                    ["Selectable"] = true,
                    ["CornerRadius"] = UDim.new(0, 3),
                    [u8.Ref] = u25
                }) }),
            ["MapSaveCodeContainer"] = u8.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(0.5, -1, 1, 0)
            }, {
                u8.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0),
                    ["PaddingTop"] = UDim.new(0, 12),
                    ["PaddingBottom"] = UDim.new(0, 12)
                }),
                u8.createElement(u4, {
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.64),
                    ["Size"] = UDim2.fromOffset(136, 32)
                }, { u8.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Text"] = "<b>MAP CODE</b>",
                        ["RichText"] = true,
                        ["TextTransparency"] = 0.1,
                        ["TextSize"] = 12,
                        ["Size"] = UDim2.new(1, 0, 0, 14),
                        ["Position"] = UDim2.new(0, 0, 0, -14),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextColor3"] = Color3.new(1, 1, 1),
                        ["Font"] = Enum.Font.Roboto
                    }), u8.createElement(u5, {
                        ["MaxCharacters"] = 18,
                        ["TextBox"] = {
                            ["PlaceholderText"] = "1234-ABCD-5678",
                            ["ClearTextOnFocus"] = false,
                            ["Position"] = UDim2.fromScale(0, 0.11),
                            ["Size"] = UDim2.fromScale(1, 0.9)
                        },
                        ["OnFocusLost"] = function(p35) --[[ Name: OnFocusLost, Line 153 ]]
                            --[[
                            Upvalues:
                                [1] = u22
                            --]]
                            return u22(p35)
                        end
                    }) }),
                u8.createElement(u3, {
                    ["Selectable"] = true,
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.fromScale(1, 0.64),
                    ["Size"] = UDim2.fromOffset(115, 32),
                    ["Text"] = u17 and "LOADING MAP..." or "LOAD MAP",
                    ["BackgroundColor3"] = Color3.fromRGB(100, 103, 167),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 165 ]]
                        --[[
                        Upvalues:
                            [1] = u17
                            [2] = u21
                            [3] = u24
                            [4] = u18
                            [5] = u7
                            [6] = u12
                        --]]
                        if u17 then
                            return nil
                        end
                        if #u21 < 12 then
                            u24("INVALID MAP CODE")
                            u18(false)
                            return nil
                        end
                        u18(true)
                        u7.Controllers.CustomMatchController:getMapDisplayInfo(u21):andThen(function(p36) --[[ Line: 177 ]]
                            --[[
                            Upvalues:
                                [1] = u24
                                [2] = u12
                                [3] = u18
                            --]]
                            u24("")
                            if p36.success then
                                u12.OnCreateMatch(p36.data.queueType, p36.data.code, {
                                    ["isPublishedMap"] = true,
                                    ["mapName"] = p36.data.name,
                                    ["mapThumbnail"] = p36.data.image
                                }):andThen(function(_) --[[ Line: 185 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u18
                                    --]]
                                    u18(false)
                                end)
                            else
                                u18(false)
                                u24(p36.errorMessage)
                            end
                        end)
                    end,
                    ["CornerRadius"] = UDim.new(0, 3)
                }),
                u8.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["TextXAlignment"] = "Right",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["TextTransparency"] = 0.1,
                    ["BackgroundTransparency"] = 1,
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.new(1, 0, 0.5, 32),
                    ["Size"] = UDim2.new(0, 0, 0, 10),
                    ["Text"] = v23 == "" and "" or "<b>" .. v23 .. "</b>",
                    ["TextColor3"] = u11.mcRed
                })
            })
        }
        v32.CodeInputsSection = v33("Frame", v26, v37)
        return v31(v32)
    end)
}