local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u5 = v1.import(script, script.Parent, "currently-equipped").CurrentlyEquipped
local u6 = v1.import(script, script.Parent, "favorite-kits").FavoriteKits
return {
    ["PlayerProfileEquipped"] = v3.new(u2)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u6
            [4] = u5
        --]]
        local _ = p8.useState
        local v9 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u4.backgroundPrimary
        }
        local v10 = p7.FrameProps
        if v10 then
            for v11, v12 in v10 do
                v9[v11] = v12
            end
        end
        local v13 = { u2.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v14 = #v13
        local v15 = next(p7.ProfileData.favoriteKitData) ~= nil
        if v15 then
            v15 = u2.createElement(u6, {
                ["LayoutOrder"] = 0,
                ["ProfileData"] = p7.ProfileData,
                ["Size"] = UDim2.fromScale(0.5, 0.95)
            })
        end
        if v15 then
            v13[v14 + 1] = v15
        end
        v13[#v13 + 1] = u2.createElement(u5, {
            ["LayoutOrder"] = 1,
            ["ProfileData"] = p7.ProfileData,
            ["Size"] = UDim2.fromScale(0.5, 1)
        })
        return u2.createElement("Frame", v9, v13)
    end)
}