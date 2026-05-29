local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.IconButton
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["CaretToggle"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u5
            [4] = u4
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local v12 = u8.InitialValue
        if v12 == nil then
            v12 = false
        end
        local u13, u14 = v10(v12)
        v11(function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u13
                [3] = u14
            --]]
            if u8.InitialValue ~= nil and u8.InitialValue ~= u13 then
                u14(u8.InitialValue)
            end
        end, { u8.InitialValue })
        local v16 = {
            ["ScaleType"] = "Fit",
            ["SizeConstraint"] = "RelativeYY",
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["Rotation"] = u13 and 0 or 180,
            ["ImageColor3"] = u3.WHITE,
            ["OnClick"] = function() --[[ Name: OnClick, Line 30 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u8
                    [3] = u14
                --]]
                local v15 = not u13
                u8.OnClick(v15)
                u14(v15)
            end
        }
        local v17 = u8.FrameProps
        if v17 then
            for v18, v19 in v17 do
                v16[v18] = v19
            end
        end
        v16.Image = u7.ARROW_DOWN_1
        return u5.createElement(u4, v16, { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end)
}