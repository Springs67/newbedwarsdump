local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "soul-broker", "soul-broker-constants").SoulBrokerConstants
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["SoulLinkIndicator"] = v3.new(u2)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
            [3] = u6
            [4] = u5
        --]]
        local _ = p8.useState
        local v9 = p8.useEffect
        local u10 = u2.createRef()
        v9(function() --[[ Line: 12 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u4
            --]]
            local v11 = u10:getValue()
            if not v11 then
                return nil
            end
            local u12 = u4:Create(v11, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                ["Rotation"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            })
            u12:Play()
            return function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u12
                --]]
                u12:Destroy()
            end
        end, {})
        local v13 = u2.createElement
        local v14 = "BillboardGui"
        local v15 = {
            ["AlwaysOnTop"] = true,
            ["Size"] = UDim2.fromOffset(25, 25)
        }
        local v16 = {}
        local v17 = u2.createElement
        local v18 = "ImageLabel"
        local v19 = {
            [u2.Ref] = u10,
            ["Size"] = UDim2.fromScale(2, 2),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v20
        if p7.IsEnemy then
            v20 = u6.SOUL_LINK_ICON
        else
            v20 = u6.SHIELD
        end
        v19.Image = v20
        v19.BackgroundTransparency = 1
        v19.BorderSizePixel = 0
        local v21
        if p7.IsEnemy then
            v21 = nil
        else
            v21 = u5.SOUL_LINK_COLOR
        end
        v19.ImageColor3 = v21
        v19.ZIndex = 1
        v19.Rotation = 45
        __set_list(v16, 1, {v17(v18, v19)})
        return v13(v14, v15, v16)
    end)
}