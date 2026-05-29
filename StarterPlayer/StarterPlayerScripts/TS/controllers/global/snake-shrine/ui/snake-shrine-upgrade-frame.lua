local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-meta").teamBuffMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["SnakeShrineUpgradeFrame"] = v8.new(u7)(function(u12) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u5
            [3] = u4
            [4] = u6
            [5] = u11
            [6] = u7
            [7] = u10
            [8] = u3
        --]]
        local v13 = u9[u12.TeamBuffType]
        local v14 = u12.TeamBuffType == u12.SelectedBuff
        local v15 = u5.isSmallScreen()
        local v16 = {
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.new(1, 0, 0, 46),
            ["BackgroundColor3"] = u4.BLACK,
            ["BackgroundTransparency"] = v14 and 0.6 or 0.3,
            ["OnClick"] = function() --[[ Name: OnClick, Line 21 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u6
                    [3] = u11
                --]]
                if u12.OnClickedBuff then
                    u12.OnClickedBuff(u12.TeamBuffType)
                    u6:playSound(u11.UI_CLICK)
                end
            end
        }
        local v17 = {}
        local v18 = #v17
        local v19
        if v14 then
            local v20 = u7.createElement
            local v21 = "UIStroke"
            local v22 = {
                ["Thickness"] = 2
            }
            local v23
            if v14 then
                v23 = Color3.fromHex("#89f692")
            else
                v23 = u4.WHITE
            end
            v22.Color = v23
            v19 = v20(v21, v22)
        else
            v19 = v14
        end
        if v19 then
            v17[v18 + 1] = v19
        end
        local v24 = #v17
        local v25 = {
            ["Position"] = UDim2.fromScale(-0.05, -0.3)
        }
        local v26 = v13.image
        if v26 == nil then
            v26 = u10.SNAKE_ICON
        end
        v25.Image = v26
        v25.BackgroundTransparency = 1
        v25.BackgroundColor3 = u4.BLACK
        v25.BorderSizePixel = 0
        v25.Size = UDim2.fromScale(0.3, 1.6)
        v25.SizeConstraint = Enum.SizeConstraint.RelativeXY
        v25.ScaleType = Enum.ScaleType.Crop
        v25.LayoutOrder = 1
        v17.BlessingIcon = u7.createElement("ImageLabel", v25)
        local v27 = v24 + 1
        local v28 = u7.createElement
        local v29 = "TextLabel"
        local v30 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.85, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v31
        if v14 then
            v31 = Color3.fromHex("#89f692")
        else
            v31 = u4.WHITE
        end
        v30.TextColor3 = v31
        v30.Text = v13.displayName
        v30.TextXAlignment = Enum.TextXAlignment.Right
        v30.TextYAlignment = Enum.TextYAlignment.Center
        v30.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v17[v27] = v28(v29, v30, { u7.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = v15 and 12 or 18
            }) })
        return u7.createElement(u3, v16, v17)
    end)
}