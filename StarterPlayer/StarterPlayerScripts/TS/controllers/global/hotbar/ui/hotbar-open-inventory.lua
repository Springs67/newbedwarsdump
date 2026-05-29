local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Empty
local u6 = v3.ImageId
local u7 = v3.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "keybind", "keybind-defaults").KeybindDefaults
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v14 = u9.Component:extend("HotbarOpenInventory")
function v14.init(_) --[[ Line: 18 ]] end
function v14.render(p15) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u10
        [4] = u4
        [5] = u11
        [6] = u9
        [7] = u2
        [8] = u7
        [9] = u13
        [10] = u6
        [11] = u5
    --]]
    local v16 = u8.Controllers.KeybindLoadController:getKeybinds()
    local v17
    if v16 == nil then
        v17 = v16
    else
        v17 = v16.keyboard
        if v17 ~= nil then
            v17 = v17.controlActions.Inventory.Name
        end
    end
    if v17 == nil then
        v17 = u12.KEYBOARD_KEYBINDS.controlActions.Inventory.Name
    end
    local v18 = u10.KeyboardEnabled or true
    if u10.GamepadEnabled and not u10.KeyboardEnabled then
        if v16 ~= nil then
            v16 = v16.gamepad
            if v16 ~= nil then
                v16 = v16.controlActions.Inventory.Name
            end
        end
        if v16 == nil then
            v16 = u12.GAMEPAD_KEYBINDS.controlActions.Inventory.Name
        end
    else
        v16 = v17
    end
    local v19 = {
        ["SizeConstraint"] = "RelativeYY",
        ["Size"] = UDim2.fromScale(1, 1),
        ["LayoutOrder"] = p15.props.LayoutOrder
    }
    local v20 = {}
    local v21 = #v20
    local v22 = {
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 0.4,
        ["BorderMode"] = "Inset",
        ["BorderSizePixel"] = 1,
        ["Image"] = nil,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u4.hexColor(1909806),
        ["BorderColor3"] = u4.hexColor(7503788),
        ["LayoutOrder"] = p15.props.LayoutOrder
    }
    local v23 = p15.props.store.AppInfo.openApps
    local v24 = u11.INVENTORY
    v22.Selectable = table.find(v23, v24) ~= nil
    v22[u9.Event.MouseButton1Click] = function() --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.INVENTORY, {})
    end
    v22[u9.Event.MouseEnter] = function(_) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u13
        --]]
        u7:playSound(u13.UI_HOVER)
    end
    local v25 = v21 + 1
    local v26 = u9.createElement
    local v27 = "ImageButton"
    local v28 = {}
    local v29 = u9.createElement("Frame", {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.88, 0.88),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = u4.hexColor(5331056)
    }, { u9.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.7, 0.7),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Image"] = u6.ELLIPSIS
        }) })
    if v18 then
        v18 = u9.createElement("TextLabel", {
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["Text"] = v16,
            ["Size"] = UDim2.fromScale(0.23, 0.23),
            ["Position"] = UDim2.fromScale(0, 0),
            ["BackgroundColor3"] = u4.hexColor(7503788),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
        }, { u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }), u9.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0)
            }) })
    end
    __set_list(v28, 1, {v29, v18})
    v20[v25] = v26(v27, v22, v28)
    return u9.createElement(u5, v19, v20)
end
return {
    ["HotbarOpenInventory"] = v14
}