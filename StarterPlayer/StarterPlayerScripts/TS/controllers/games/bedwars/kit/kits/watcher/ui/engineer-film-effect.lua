local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.Lighting
local u6 = v4.RunService
local u7 = v4.Workspace.CurrentCamera
local u8 = u3.Component:extend("EngineerFilmEffect")
function u8.init(p9, _) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    p9.maid = u2.new()
    p9.sizeX = 400
    p9.sizeY = 400
    local v10, v11 = u3.createBinding(UDim2.new(0.18, 0, 0.18, 0))
    p9.tileSize = v10
    p9.setTileSize = v11
end
function u8.render(p12) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
    --]]
    return u3.createFragment({ u3.createElement(u3.Portal, {
            ["target"] = u5
        }, { u3.createElement("ColorCorrectionEffect", {
                ["Contrast"] = 0.2,
                ["Saturation"] = -0.3,
                ["TintColor"] = p12.props.color or Color3.fromRGB(74, 107, 135),
                ["Enabled"] = p12.props.transparency ~= 1
            }) }), u3.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ScaleType"] = "Tile",
            ["Image"] = "http://www.roblox.com/asset/?id=28756351",
            ["Size"] = UDim2.fromScale(1.5, 1.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["ImageTransparency"] = p12.props.transparency,
            ["TileSize"] = p12.tileSize
        }) })
end
function u8.updateSize(p13) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p13.sizeX = 300000 / u7.ViewportSize.X
    p13.sizeY = 300000 / u7.ViewportSize.Y
end
function u8.didMount(u14) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
    --]]
    u14.maid:GiveTask(u6.Heartbeat:Connect(function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14.setTileSize(UDim2.fromScale(math.random(u14.sizeX * 0.9, u14.sizeX * 1.1) / 1000, math.random(u14.sizeY * 0.9, u14.sizeY * 1.1) / 1000))
    end))
    u14:updateSize()
    u14.maid:GiveTask(u7:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:updateSize()
    end))
end
function u8.willUnmount(p15) --[[ Line: 56 ]]
    p15.maid:DoCleaning()
end
return {
    ["EngineerFilmEffectWrapper"] = function(_) --[[ Name: EngineerFilmEffectWrapper, Line 60 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
        --]]
        local v16 = u3.createBinding(0.9)
        return u3.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true
        }, { u3.createElement(u8, {
                ["transparency"] = v16
            }) })
    end,
    ["EngineerFilmEffect"] = u8
}