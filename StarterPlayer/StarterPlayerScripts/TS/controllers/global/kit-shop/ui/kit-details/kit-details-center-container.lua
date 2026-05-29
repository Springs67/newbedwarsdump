local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.PlayerViewport
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, script.Parent.Parent, "misc", "kit-viewport").KitViewport
return {
    ["KitDetailsCenterContainer"] = v6.new(u5)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u7
            [4] = u4
        --]]
        local _ = p9.useState
        local v10 = {}
        for v11, v12 in p8 do
            v10[v11] = v12
        end
        v10.SelectedKit = nil
        v10.SelectedKitSkin = nil
        v10.ItemImage = nil
        local v13 = {}
        for v14, v15 in v10 do
            v13[v14] = v15
        end
        local v16 = u5.createElement
        local v17 = u3
        local v18 = {}
        local v19
        if p8.SelectedKit == nil then
            if p8.ItemImage == nil then
                v19 = u5.createElement(u4, {
                    ["Rotate"] = true,
                    ["Size"] = UDim2.fromScale(1.1, 1.1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                })
            else
                v19 = u5.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1.1, 1.1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = p8.ItemImage,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            end
        else
            v19 = u5.createElement(u7, {
                ["Kit"] = p8.SelectedKit,
                ["Skin"] = p8.SelectedKitSkin,
                ["Size"] = UDim2.fromScale(1.1, 1.1),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            })
        end
        __set_list(v18, 1, {v19})
        return v16(v17, v13, v18)
    end)
}