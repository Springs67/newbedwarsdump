local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
return {
    ["PlayerInfoBillboard"] = v5.new(u4)(function(u7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u6
            [4] = u3
        --]]
        local _ = p8.useState
        local _ = p8.useEffect
        local v9 = u7.UserId
        local v10 = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v9) .. "&w=48&h=48"
        local v11 = {}
        local v12 = #v11
        local v14 = {
            ["Size"] = UDim2.fromOffset(210, 53),
            ["Position"] = UDim2.fromOffset(u7.ScreenPosition.X, u7.ScreenPosition.Y),
            ["AutomaticSize"] = Enum.AutomaticSize.XY,
            ["BackgroundColor3"] = u2.BLACK,
            ["BackgroundTransparency"] = 0.3,
            ["BorderSizePixel"] = 0,
            [u4.Event.Activated] = function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u7
                    [3] = u3
                --]]
                local v13 = u6:GetPlayerByUserId(u7.UserId)
                if not v13 then
                    return nil
                end
                u3.Controllers.PlayerProfileUIController:openPlayerProfile(v13)
            end
        }
        local v15 = {
            u4.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.9622641509433962
            }),
            u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }),
            u4.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            }),
            u4.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.04, 0.5),
                ["Image"] = v10
            }, { u4.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }),
            ["ActionName"] = u4.createElement("TextLabel", {
                ["Text"] = "VIEW PROFILE",
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Size"] = UDim2.fromScale(0.7, 0.8),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["TextColor3"] = u2.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.SemiBold),
                ["TextXAlignment"] = Enum.TextXAlignment.Center
            })
        }
        local v16 = #v15
        local v17
        if u7.HelperText == nil then
            v17 = false
        else
            v17 = u4.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Size"] = UDim2.fromScale(0.7, 0.4),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, -0.5),
                ["Text"] = u7.HelperText,
                ["TextColor3"] = u2.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.SemiBold),
                ["TextXAlignment"] = Enum.TextXAlignment.Center
            }, { u4.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Color"] = Color3.fromRGB(0, 0, 0)
                }) })
        end
        if v17 then
            v15[v16 + 1] = v17
        end
        v11[v12 + 1] = u4.createElement("ImageButton", v14, v15)
        return u4.createFragment({
            ["PlayerInfo"] = u4.createElement("ScreenGui", {}, v11)
        })
    end)
}