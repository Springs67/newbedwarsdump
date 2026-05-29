local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, script.Parent, "kit-details-bundle-action-buttons").KitDetailsBundleActionButtons
local u8 = v1.import(script, script.Parent, "kit-details-kit-action-buttons").KitDetailsKitActionButtons
local u9 = v1.import(script, script.Parent, "kit-details-kit-loadout-info-card").KitDetailsKitLoadoutInfoCard
return {
    ["KitDetailsRightContainer"] = v6.new(u5)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u3
            [4] = u4
            [5] = u8
            [6] = u7
        --]]
        local _ = p11.useState
        local _ = p11.useEffect
        local _ = p11.useMemo
        local v12 = {}
        for v13, v14 in p10 do
            v12[v13] = v14
        end
        v12.SelectedKit = nil
        v12.SelectedKitSkin = nil
        v12.SelectedKitBundle = nil
        v12.store = nil
        local v15 = {}
        for v16, v17 in v12 do
            v15[v16] = v17
        end
        local v18 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v19 = #v18
        local v20 = p10.SelectedKit
        if v20 then
            v20 = u5.createFragment({ u5.createElement(u9, {
                    ["BackgroundTransparency"] = 0.5,
                    ["BackgroundColor3"] = u3.BLACK,
                    ["Size"] = UDim2.fromScale(1, 0.725),
                    ["SelectedKit"] = p10.SelectedKit
                }), u5.createElement(u4, {
                    ["Size"] = UDim2.fromScale(1, 0.025)
                }) })
        end
        if v20 then
            v18[v19 + 1] = v20
        end
        local v21 = #v18
        local v22
        if p10.SelectedKit then
            v22 = u5.createElement(u8, {
                ["SelectedKit"] = p10.SelectedKit,
                ["SelectedKitSkin"] = p10.SelectedKitSkin,
                ["store"] = p10.store,
                ["Size"] = UDim2.new(1, 0, 0.25, -10)
            })
        elseif p10.SelectedKitBundle then
            v22 = u5.createElement(u7, {
                ["SelectedKitBundle"] = p10.SelectedKitBundle,
                ["store"] = p10.store,
                ["Size"] = UDim2.new(1, 0, 0.25, -10)
            })
        else
            v22 = nil
        end
        if v22 then
            v18[v21 + 1] = v22
        end
        return u5.createElement(u4, v15, v18)
    end)
}