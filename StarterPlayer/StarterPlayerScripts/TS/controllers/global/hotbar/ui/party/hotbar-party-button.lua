local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v11 = u7.Component:extend("HotbarPartyButton")
function v11.init(p12) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    p12.bgRef = u7.createRef()
    p12.hoverMaid = u6.new()
end
function v11.render(u13) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u8
        [4] = u5
        [5] = u9
        [6] = u3
        [7] = u4
    --]]
    return u7.createElement("ImageButton", {
        ["Size"] = UDim2.fromScale(0.3, 0.5),
        ["BackgroundColor3"] = u10.backgroundPrimary,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = u13.props.LayoutOrder,
        [u7.Event.MouseEnter] = function(_) --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u8
            --]]
            u13.hoverMaid:DoCleaning()
            local u14 = u8:Create(u13.bgRef:getValue(), TweenInfo.new(0.12), {
                ["BackgroundTransparency"] = 0.9
            })
            u14:Play()
            u13.hoverMaid:GiveTask(function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14:Cancel()
            end)
        end,
        [u7.Event.MouseLeave] = function(_) --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u8
            --]]
            u13.hoverMaid:DoCleaning()
            local u15 = u8:Create(u13.bgRef:getValue(), TweenInfo.new(0.12), {
                ["BackgroundTransparency"] = 1
            })
            u15:Play()
            u13.hoverMaid:GiveTask(function() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:Cancel()
            end)
        end,
        [u7.Event.MouseButton1Click] = function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u9
                [3] = u13
            --]]
            u5:playSound(u9.UI_OPEN)
            u13.props.OnClick()
        end,
        ["AutoButtonColor"] = false
    }, {
        u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 4.469387755102041
        }),
        u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        }),
        u7.createElement("Frame", {
            [u7.Ref] = u13.bgRef,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.WHITE,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0
        }, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.05, 0)
            }) }),
        u7.createElement(u4, {
            ["Size"] = UDim2.fromScale(1, 1)
        }, {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center"
            }),
            u7.createElement(u4, {
                ["SizeConstraint"] = "RelativeYY",
                ["Size"] = UDim2.fromScale(0.5, 0)
            }),
            u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.6, 0.6),
                ["Image"] = u13.props.Image
            }),
            u7.createElement("TextLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["Text"] = u13.props.Text,
                ["Size"] = UDim2.fromScale(3.1693877551020404, 0.55),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }),
            u7.createElement(u4, {
                ["SizeConstraint"] = "RelativeYY",
                ["Size"] = UDim2.fromScale(0.2, 0)
            })
        })
    })
end
function v11.willUnmount(p16) --[[ Line: 104 ]]
    p16.hoverMaid:DoCleaning()
end
return {
    ["HotbarPartyButton"] = v11
}