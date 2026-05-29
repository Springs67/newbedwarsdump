local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Empty
local u6 = v3.ImageId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v13 = u8.Component:extend("HotbarKitButton")
function v13.init(p14) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
    --]]
    p14.bgRef = u8.createRef()
    p14.hoverMaid = u7.new()
end
function v13.openKitShop(_) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u10
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.KIT_SHOP_APP, {
        ["SelectedKit"] = u10:getState().Bedwars.kit
    })
end
function v13.render(u15) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u12
        [4] = u9
        [5] = u4
        [6] = u6
    --]]
    return u8.createElement(u5, {
        ["Size"] = UDim2.fromScale(0.3, 0.5),
        ["LayoutOrder"] = u15.props.LayoutOrder
    }, { u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.061224489795918
        }), u8.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u12.backgroundPrimary,
            ["BorderSizePixel"] = 0,
            [u8.Event.MouseEnter] = function(_) --[[ Line: 39 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u9
                --]]
                u15.hoverMaid:DoCleaning()
                local u16 = u9:Create(u15.bgRef:getValue(), TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 0.9
                })
                u16:Play()
                u15.hoverMaid:GiveTask(function() --[[ Line: 45 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                    --]]
                    u16:Cancel()
                end)
            end,
            [u8.Event.MouseLeave] = function(_) --[[ Line: 49 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u9
                --]]
                u15.hoverMaid:DoCleaning()
                local u17 = u9:Create(u15.bgRef:getValue(), TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 1
                })
                u17:Play()
                u15.hoverMaid:GiveTask(function() --[[ Line: 55 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                    --]]
                    u17:Cancel()
                end)
            end,
            [u8.Event.MouseButton1Click] = function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:openKitShop()
            end,
            ["AutoButtonColor"] = false
        }, { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }), u8.createElement("Frame", {
                [u8.Ref] = u15.bgRef,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u4.WHITE,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0
            }, { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.05, 0)
                }) }), u8.createElement(u5, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, {
                u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center"
                }),
                u8.createElement(u5, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Size"] = UDim2.fromScale(0.5, 0)
                }),
                u8.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.6, 0.6),
                    ["Image"] = u6.SHIELD
                }),
                u8.createElement("TextLabel", {
                    ["Text"] = "Kit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(1.611224489795918, 0.55),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u4.WHITE
                }),
                u8.createElement(u5, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Size"] = UDim2.fromScale(0.2, 0)
                })
            }) }) })
end
return {
    ["HotbarKitButton"] = v13
}