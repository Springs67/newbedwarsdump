local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.UIUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, script.Parent, "clan-search-listing-card").ClanSearchListingCard
return {
    ["ClanMenuSearchClanList"] = v7.new(u6)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u4
            [3] = u5
            [4] = u8
            [5] = u3
        --]]
        local _ = p10.useState
        local v11 = p10.useEffect
        local u12 = u6.createRef()
        v11(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u12
                [3] = u5
            --]]
            if u4.isGamepadControls() then
                u5:selectGui((u12:getValue()))
            end
        end, {})
        local v13 = {
            ["AdditionalSpace"] = 80
        }
        local v14 = {
            ["Size"] = u9.Size or UDim2.new(1, 0, 1, 0)
        }
        local v15 = u9.LayoutOrder
        v14.LayoutOrder = v15 == nil and 2 or v15
        v13.ScrollingFrameProps = v14
        v13.ScrollingFrameRef = u12
        local v16 = u9.Clans
        local function v19(u17, p18) --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u8
                [3] = u9
            --]]
            return u6.createElement(u8, {
                ["Clan"] = u17,
                ["OnClick"] = function() --[[ Name: OnClick, Line 38 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u17
                    --]]
                    u9.SetSelectedClan(u17)
                end,
                ["FrameProps"] = {
                    ["LayoutOrder"] = p18
                },
                ["Selected"] = u9.SelectedClanId == u17.clanId
            })
        end
        local v20 = table.create(#v16)
        for v21, v22 in v16 do
            v20[v21] = v19(v22, v21 - 1, v16)
        end
        local v23 = { u6.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 2),
                ["PaddingLeft"] = UDim.new(0, 2)
            }), u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v24 = #v23
        for v25, v26 in v20 do
            v23[v24 + v25] = v26
        end
        return u6.createElement(u3, v13, v23)
    end)
}