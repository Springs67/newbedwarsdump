local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.ImageId
local u7 = v2.PlayerRender
local u8 = v2.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyClientConfig
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanProfileInviteEntry"] = v13.new(u12)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u9
            [4] = u15
            [5] = u12
            [6] = u5
            [7] = u16
            [8] = u8
            [9] = u10
            [10] = u14
            [11] = u7
            [12] = u3
            [13] = u6
        --]]
        local u19, u20 = p18.useState(false)
        local u21 = u11.new()
        local v22 = u12.createElement
        local v23 = u5
        local v24 = {
            ["Size"] = UDim2.new(1, 0, 0, 40)
        }
        local v25 = {}
        local v26 = u12.createElement
        local v27 = "ImageButton"
        local v32 = {
            ["Size"] = UDim2.new(0.98, 0, 1, 0),
            ["BackgroundColor3"] = u16.backgroundPrimary,
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 10,
            ["ImageTransparency"] = 1,
            ["AutoButtonColor"] = false,
            [u12.Event.MouseButton1Click] = function() --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u10
                    [3] = u20
                    [4] = u4
                    [5] = u9
                    [6] = u17
                    [7] = u15
                --]]
                u8:playSound(u10.sounds.UI_CLICK)
                u20(true)
                if not u4.isHoarceKat() then
                    u9.Controllers.ClanController:invitePlayerToClan(u17.Player, u15:getState().Clans.myClanId)
                end
            end,
            [u12.Event.MouseEnter] = function(p28) --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u21
                    [3] = u14
                --]]
                if u19 then
                    return nil
                end
                u21:DoCleaning()
                local u29 = u14:Create(p28, TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 0.3
                })
                u29:Play()
                u21:GiveTask(function() --[[ Line: 53 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29:Cancel()
                end)
            end,
            [u12.Event.MouseLeave] = function(p30) --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u21
                    [3] = u14
                --]]
                if u19 then
                    return nil
                end
                u21:DoCleaning()
                local u31 = u14:Create(p30, TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 0
                })
                u31:Play()
                u21:GiveTask(function() --[[ Line: 66 ]]
                    --[[
                    Upvalues:
                        [1] = u31
                    --]]
                    u31:Cancel()
                end)
            end
        }
        local v33 = {}
        local v34 = u12.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        local v35 = u12.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        })
        local v36 = u12.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder"
        })
        local v37 = u12.createElement(u5, {
            ["Size"] = UDim2.fromScale(0.7, 1)
        }, { u12.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }), u12.createElement(u7, {
                ["FallbackTransparency"] = 1,
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 21,
                ["LayoutOrder"] = 1,
                ["PlayerUserId"] = u17.Player.userId,
                ["Size"] = UDim2.fromScale(1, 0.7)
            }, { u12.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }), u12.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) }), u12.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["SizeConstraint"] = "RelativeXX",
                ["TextXAlignment"] = "Left",
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["ZIndex"] = 21,
                ["LayoutOrder"] = 2,
                ["AutoLocalize"] = false,
                ["Size"] = UDim2.fromScale(0, 1),
                ["Text"] = "<b>" .. u17.Player.displayName .. "</b>",
                ["TextColor3"] = u3.hexColor(16777215)
            }, { u12.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) }) })
        local v38
        if u19 then
            v38 = u12.createElement("TextLabel", {
                ["Text"] = "(Invited)",
                ["TextXAlignment"] = "Right",
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["ZIndex"] = 21,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["TextColor3"] = u3.hexColor(16777215)
            }, { u12.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) })
        else
            v38 = u12.createElement(u5, {
                ["Size"] = UDim2.fromScale(0.3, 1)
            }, { u12.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 21,
                    ["LayoutOrder"] = 3,
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Image"] = u6.PLUS,
                    ["Size"] = UDim2.fromScale(1, 0.5)
                }) })
        end
        __set_list(v33, 1, {v34, v35, v36, v37, v38})
        __set_list(v25, 1, {v26(v27, v32, v33)})
        return v22(v23, v24, v25)
    end)
}