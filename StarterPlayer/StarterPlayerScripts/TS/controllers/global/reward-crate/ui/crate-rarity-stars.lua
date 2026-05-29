local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
return {
    ["CrateRarityStars"] = v3.new(u2)(function(p6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u4
        --]]
        local _ = p7.useState
        local v8 = u5(p6.Rarity)
        local v9 = false
        local v10 = 0
        local v11 = {}
        while true do
            if v9 then
                v10 = v10 + 1
            else
                v9 = true
            end
            if v10 >= v8.stars then
                local v12 = {}
                local v13 = #v12
                for v14, v15 in v11 do
                    v12[v13 + v14] = v15
                end
                return u2.createFragment(v12)
            end
            local v16 = u2.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 11,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u4.STAR_SOLID
            }, { u2.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
            table.insert(v11, v16)
        end
    end)
}