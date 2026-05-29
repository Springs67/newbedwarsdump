local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u11 = v1.import(script, script.Parent, "kit-skin-card").KitSkinCard
return {
    ["KitSkinList"] = v8.new(u7)(function(p12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u4
            [4] = u11
            [5] = u5
            [6] = u9
            [7] = u3
            [8] = u6
        --]]
        local _ = p13.useState
        local v14 = 0
        local v15 = {}
        for v16, v17 in p12.Skins do
            local _ = v16 - 1
            local v18 = u10[v17].variantOfSkin
            if v18 ~= nil then
                v18 = v18.parentSkin
            end
            if (not v18 and true or v18 == v17) == true then
                v14 = v14 + 1
                v15[v14] = v17
            end
        end
        local v19 = {
            ["LayoutOrder"] = 0,
            ["Size"] = p12.Size
        }
        local v20 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Bottom",
                ["Padding"] = UDim.new(0.03, 0)
            }), u7.createElement("TextLabel", {
                ["Text"] = "Skins:",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.17),
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }) }
        local v21 = #v20
        local v22 = 0
        local v23 = {}
        for v24, v25 in v15 do
            local _ = v24 - 1
            local v26
            if u10[v25].hideInShop then
                v26 = nil
            else
                v26 = u7.createElement(u11, {
                    ["Kit"] = p12.Kit,
                    ["Skin"] = v25,
                    ["SelectedSkin"] = p12.SelectedSkin,
                    ["SetSelectedSkin"] = p12.SetSelectedSkin,
                    ["store"] = p12.store
                })
            end
            if v26 ~= nil then
                v22 = v22 + 1
                v23[v22] = v26
            end
        end
        local v27 = {
            ["AdditionalSpace"] = 10,
            ["ScrollingFrameProps"] = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.7999999999999999),
                ["CanvasSize"] = UDim2.fromScale(0, 0.7999999999999999),
                ["ScrollingDirection"] = Enum.ScrollingDirection.X,
                ["AutomaticCanvasSize"] = Enum.AutomaticSize.X
            }
        }
        local v28 = { u7.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.01, 0),
                ["PaddingTop"] = UDim.new(u5.isSmallScreen() and 0.02 or 0.01, 0)
            }), u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Top",
                ["Padding"] = UDim.new(0.03, 0)
            }), u7.createElement(u11, {
                ["Kit"] = p12.Kit,
                ["Skin"] = u9.DEFAULT,
                ["SelectedSkin"] = p12.SelectedSkin,
                ["SetSelectedSkin"] = p12.SetSelectedSkin,
                ["store"] = p12.store
            }) }
        local v29 = #v28
        for v30, v31 in v23 do
            v28[v29 + v30] = v31
        end
        v20[v21 + 1] = u7.createElement(u3, v27, v28)
        return u7.createElement(u6, v19, v20)
    end)
}