local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.UIUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "player-viewport").PlayerViewport
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u8 = v1.import(script, script.Parent.Parent.Parent, "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect
local u9 = u5.Component:extend("Distraction")
function u9.init(p10, _) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v11, v12 = u5.createBinding(0.9)
    p10.transparency = v11
    p10.setTransparency = v12
end
function u9.render(p13) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u7
        [4] = u6
        [5] = u3
        [6] = u8
    --]]
    local v14 = math.random(1, 100) <= 2 and "http://www.roblox.com/asset/?id=5917459365" or "http://www.roblox.com/asset/?id=4841405708"
    local v15 = {}
    local v16 = #v15
    local v17 = {
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
        ["Size"] = UDim2.new(1, 0, 1, 0)
    }
    local v18 = {}
    local v19 = #v18
    local v20 = {
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 3,
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = u4:getActionBarPosition() - UDim2.new(0, 0, 0.1, 0),
        ["Size"] = UDim2.new(0.8, 0, 0.1, 0),
        ["Text"] = "Hacked by Vulcan!!!!",
        ["Font"] = "Ubuntu",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextScaled"] = true
    }
    v18[v19 + 1] = u5.createElement("TextLabel", v20, { u5.createElement("UIStroke", {
            ["Thickness"] = 5,
            ["Color"] = u7.backgroundSecondary
        }) })
    v18[v19 + 2] = u5.createElement(u6, {
        ["Animation"] = v14,
        ["Size"] = UDim2.new(1, 0, 1, 0)
    })
    v15[v16 + 1] = u5.createElement(u3, v17, v18)
    v15[v16 + 2] = u5.createElement(u8, {
        ["transparency"] = p13.transparency
    })
    return u5.createFragment(v15)
end
return {
    ["DistractionWrapper"] = function() --[[ Name: DistractionWrapper, Line 59 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
        --]]
        return u5.createElement("ScreenGui", {}, { u5.createElement(u9) })
    end,
    ["Distraction"] = u9
}