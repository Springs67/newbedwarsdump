local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ToggleButton"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u6
            [4] = u5
            [5] = u8
            [6] = u2
        --]]
        local _ = p11.useState
        local v12 = {
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v13
        if u10.Active then
            v13 = u10.ActiveColor or u9.backgroundSuccess
        else
            v13 = u9.backgroundTertiary
        end
        v12.BackgroundColor3 = v13
        local v14 = u10.FrameProps
        if v14 ~= nil then
            v14 = v14.BackgroundTransparency
        end
        v12.BackgroundTransparency = v14
        v12.TextColor3 = u4.WHITE
        v12.Font = "Roboto"
        local v15
        if u10.Active then
            v15 = "<b>" .. u10.Text .. "</b>"
        else
            v15 = u10.Text
        end
        v12.Text = v15
        v12.TextXAlignment = "Center"
        v12.TextScaled = true
        v12.RichText = true
        v12[u6.Event.Activated] = function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u5
                [3] = u8
                [4] = u2
            --]]
            if u10.disabled then
                u5:playSound(u8.UI_ERROR)
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "This setting is disabled. Check setting description for more info"
                })
                return nil
            end
            u5:playSound(u8.UI_CLICK)
            local v16 = u10.SetValue
            if v16 ~= nil then
                v16(u10.Value)
            end
        end
        local v17 = u10.FrameProps
        if v17 then
            for v18, v19 in v17 do
                v12[v18] = v19
            end
        end
        return u6.createFragment({
            ["ToggleButton_" .. u10.Value] = u6.createElement("TextButton", v12, { u6.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.15, 0),
                    ["PaddingBottom"] = UDim.new(0.15, 0),
                    ["PaddingLeft"] = UDim.new(0.1, 0),
                    ["PaddingRight"] = UDim.new(0.1, 0)
                }), u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        })
    end)
}