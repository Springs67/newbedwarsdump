local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v2.IconButton
local u6 = v2.SlideIn
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = UDim2.fromScale(0.22, 0.2)
local u15 = UDim2.fromScale(0.8, 0.46)
local u16 = Vector2.new(0.5, 0.5)
return {
    ["FinalKillPopup"] = v10.new(u9)(function(_, p17) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u3
            [3] = u6
            [4] = u14
            [5] = u15
            [6] = u16
            [7] = u13
            [8] = u4
            [9] = u5
            [10] = u11
            [11] = u8
            [12] = u7
            [13] = u12
        --]]
        local _ = p17.useState
        local _ = p17.useEffect
        local v18 = u9.createElement
        local v19 = {
            ["DisplayOrder"] = 20,
            ["IgnoreGuiInset"] = u3.isSmallScreen()
        }
        local v20 = {}
        local v21 = u9.createElement
        local v22 = u6
        local v23 = {}
        local v24 = u9.createElement
        local v25 = {
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["Size"] = u14,
            ["Position"] = u15,
            ["AnchorPoint"] = u16,
            ["BackgroundColor3"] = u13.backgroundSecondary
        }
        local v26 = {}
        local v27 = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        local v28 = u9.createElement
        local v29 = u4
        local v30 = {
            ["Size"] = UDim2.fromScale(0.99, 0.99),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v31 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center
            }),
            ["Header"] = u9.createElement(u4, {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.new(1, 0, 0.12, 0)
            }, { u9.createElement(u5, {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u11.X,
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["Position"] = UDim2.fromScale(0.925, 0.9),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 60 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u7
                            [3] = u12
                        --]]
                        u8.Controllers.FinalKillPopupController:hidePopup()
                        u7:playSound(u12.UI_CLOSE_2)
                    end
                }) })
        }
        local v32 = u9.createElement
        local v33 = u4
        local v34 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.89)
        }
        local v35 = {}
        local v36 = u9.createElement
        local v37 = {
            ["Size"] = UDim2.fromScale(0.95, 0.75),
            ["BackgroundColor3"] = u13.backgroundPrimary,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v38 = {
            u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            ["TextWrapper"] = u9.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u9.createElement("TextLabel", {
                    ["Text"] = "You have been eliminated but your team is still alive!\n\nYou can click <b>Play Again</b> now or wait for your team to finish the game to see what rewards you\226\128\153ve earned.\n\nYou won\226\128\153t lose any rewards by leaving the game early.",
                    ["RichText"] = true,
                    ["LineHeight"] = 1.05,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }) })
        }
        v35.Textbox = v36("Frame", v37, v38)
        __set_list(v31, 2, {v32(v33, v34, v35)})
        __set_list(v26, 1, {v27, v28(v29, v30, v31)})
        __set_list(v23, 1, {v24("Frame", v25, v26)})
        __set_list(v20, 1, {v21(v22, {}, v23)})
        return v18("ScreenGui", v19, v20)
    end)
}