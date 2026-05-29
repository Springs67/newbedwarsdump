local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileButton
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v7 = v1.import(script, script.Parent, "event", "move-mount-event")
local u8 = v7.InputActionType
local u9 = v7.MoveMountDirection
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["MoveMountUI"] = v5.new(u4)(function(_, _) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u3
            [4] = u11
            [5] = u10
            [6] = u6
            [7] = u9
            [8] = u8
        --]]
        local v12 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
        local v13 = string.gsub(v12:getActionKeycodes("MoveMountUp")[1].Name, "Button", "")
        local v14 = string.gsub(v12:getActionKeycodes("MoveMountDown")[1].Name, "Button", "")
        return u4.createFragment({ u4.createElement(u3, {
                ["Image"] = u11.UP_MOBILE,
                ["Position"] = UDim2.fromScale(0.2, u10:getActionBarPosition().Y.Scale),
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 21 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u9
                        [3] = u8
                    --]]
                    u6.MoveMountButtonChange:fire(u9.UP, u8.PRESS)
                end,
                ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 24 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u9
                        [3] = u8
                    --]]
                    u6.MoveMountButtonChange:fire(u9.UP, u8.RELEASE)
                end
            }, { u4.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Font"] = "RobotoCondensed",
                    ["TextStrokeTransparency"] = 0,
                    ["TextXAlignment"] = "Left",
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.3, 0.3),
                    ["Position"] = UDim2.fromScale(1.2, 0.5),
                    ["Text"] = v13,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
                }) }), u4.createElement(u3, {
                ["Image"] = u11.DOWN_MOBILE,
                ["Position"] = UDim2.fromScale(0.8, u10:getActionBarPosition().Y.Scale),
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 45 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u9
                        [3] = u8
                    --]]
                    u6.MoveMountButtonChange:fire(u9.DOWN, u8.PRESS)
                end,
                ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 48 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u9
                        [3] = u8
                    --]]
                    u6.MoveMountButtonChange:fire(u9.DOWN, u8.RELEASE)
                end
            }, { u4.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Font"] = "RobotoCondensed",
                    ["TextXAlignment"] = "Right",
                    ["TextStrokeTransparency"] = 0,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.3, 0.3),
                    ["Position"] = UDim2.fromScale(-0.2, 0.5),
                    ["Text"] = v14,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
                }) }) })
    end)
}