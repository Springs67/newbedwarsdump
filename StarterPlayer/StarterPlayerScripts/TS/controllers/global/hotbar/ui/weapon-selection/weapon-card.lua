local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.TweenService
local u9 = v7.UserInputService
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util").getWeaponMeta
local v14 = u6.Component:extend("WeaponCard")
function v14.init(p15) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    p15.hoverMaid = u5.new()
    p15.ref = u6.createRef()
    p15.maid = u5.new()
end
function v14.didMount(p16) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u12
    --]]
    local v17 = #u9:GetConnectedGamepads() ~= 0 and p16.ref:getValue()
    if v17 then
        p16.maid:GiveTask(v17.SelectionGained:Connect(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u12
            --]]
            u4:playSound(u12.UI_CLICK)
        end))
    end
end
function v14.willUnmount(p18) --[[ Line: 33 ]]
    p18.maid:DoCleaning()
end
function v14.render(u19) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
        [3] = u3
        [4] = u4
        [5] = u12
        [6] = u8
        [7] = u10
        [8] = u11
    --]]
    local v20 = u13(u19.props.weapon)
    local v26 = {
        [u6.Ref] = u19.ref,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u3.BLACK,
        ["BackgroundTransparency"] = u19.props.Selected and 0.25 or 0.5,
        ["BorderSizePixel"] = 1,
        ["BorderMode"] = "Outline",
        ["BorderColor3"] = u3.hexColor(16771973),
        ["LayoutOrder"] = u19.props.LayoutOrder,
        ["AutoButtonColor"] = false,
        ["Selectable"] = true,
        [u6.Event.MouseButton1Click] = function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u12
                [3] = u19
            --]]
            u4:playSound(u12.UI_CLICK)
            u19.props.OnClick()
        end,
        [u6.Event.MouseButton2Click] = function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u12
                [3] = u19
            --]]
            u4:playSound(u12.UI_CLICK)
            local v21 = u19.props.OnRightClick
            if v21 ~= nil then
                v21()
            end
        end,
        [u6.Event.MouseEnter] = function(p22) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u8
            --]]
            u19.hoverMaid:DoCleaning()
            if not u19.props.Selected then
                local u23 = u8:Create(p22, TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = 0.25
                })
                u19.hoverMaid:GiveTask(function() --[[ Line: 66 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23:Cancel()
                end)
                u23:Play()
            end
        end,
        [u6.Event.MouseLeave] = function(p24) --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u8
            --]]
            u19.hoverMaid:DoCleaning()
            if not u19.props.Selected then
                local u25 = u8:Create(p24, TweenInfo.new(0.12), {
                    ["BackgroundTransparency"] = u19.props.Selected and 0.25 or 0.5
                })
                u19.hoverMaid:GiveTask(function() --[[ Line: 78 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    u25:Cancel()
                end)
                u25:Play()
            end
        end
    }
    local v27 = {}
    local v28 = u6.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0.02, 0)
    })
    local v29 = u6.createElement
    local v30 = "UIStroke"
    local v31 = {}
    local v32
    if u19.props.Selected then
        v32 = Color3.fromRGB(255, 227, 66)
    else
        v32 = u3.WHITE
    end
    v31.Color = v32
    v31.Thickness = u19.props.Selected and 2 or 1
    v31.Transparency = u19.props.Selected and 0 or 0.5
    __set_list(v27, 1, {v28, v29(v30, v31)})
    local v33 = #v27
    local v34 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["ImageTransparency"] = 0,
        ["Image"] = v20.image,
        ["ScaleType"] = Enum.ScaleType.Fit,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
    }
    local v35 = {}
    local v36 = #v35
    local v37 = u19.props[u6.Children]
    if v37 then
        for v38, v39 in v37 do
            if type(v38) == "number" then
                v35[v36 + v38] = v39
            else
                v35[v38] = v39
            end
        end
    end
    v27[v33 + 1] = u6.createElement("ImageLabel", v34, v35)
    local v40
    if u10:getState().Bedwars.weapon == u19.props.weapon then
        v40 = u6.createFragment({
            ["Results"] = u6.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u6.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.6,
                    ["Size"] = UDim2.fromScale(0.85, 0.85),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Image"] = u11.CIRCLE_HOLLOW,
                    ["ImageColor3"] = u3.hexColor(16772696)
                }, { u6.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }), u6.createElement("TextLabel", {
                    ["Text"] = "Selected",
                    ["TextSize"] = 20,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.85, 0.85),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["TextColor3"] = u3.hexColor(16772696),
                    ["Font"] = Enum.Font.LuckiestGuy
                }) })
        })
    else
        v40 = false
    end
    if v40 then
        v27[v33 + 2] = v40
    end
    local v41 = #v27 + 1
    if v20 then
        v20 = u6.createFragment({
            ["KitNameTag"] = u6.createElement("Frame", {
                ["BackgroundTransparency"] = 0.55,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["BackgroundColor3"] = u3.BLACK
            }, { u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.035, 0)
                }), u6.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["TextTransparency"] = 0,
                    ["LayoutOrder"] = 2,
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["Text"] = v20.name,
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
                }), u6.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["TextTransparency"] = 0,
                    ["LayoutOrder"] = 2,
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Size"] = UDim2.fromScale(0.8, 0.6),
                    ["Text"] = v20.description,
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Light)
                }) })
        })
    end
    v27[v41] = v20
    return u6.createElement("ImageButton", v26, v27)
end
return {
    ["WeaponCard"] = v14
}