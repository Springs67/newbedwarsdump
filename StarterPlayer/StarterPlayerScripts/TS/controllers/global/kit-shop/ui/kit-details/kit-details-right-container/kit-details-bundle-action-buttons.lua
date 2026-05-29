local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Empty
local u5 = v3.SoundManager
local u6 = v3.UILayers
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "purchase-button").PurchaseButton
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "square-image-button").SquareImageButton
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["KitDetailsBundleActionButtons"] = v9.new(u8)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u14
            [3] = u8
            [4] = u10
            [5] = u5
            [6] = u16
            [7] = u7
            [8] = u11
            [9] = u15
            [10] = u2
            [11] = u12
            [12] = u6
            [13] = u4
        --]]
        local _ = p18.useState
        local _ = p18.useEffect
        local v19 = u13[u17.SelectedKitBundle]
        local v20 = u14.isBundleGift(u17.SelectedKitBundle)
        local v21 = 0
        local v22 = {}
        local v23 = true
        for v24, v25 in v19.rewards do
            local _ = v24 - 1
            local v26
            if v25.kit then
                v26 = v25.kit
            else
                v26 = nil
            end
            if v26 ~= nil then
                v21 = v21 + 1
                v22[v21] = v26
            end
        end
        local v27 = true
        for v28, v29 in v22 do
            local _ = v28 - 1
            local v30 = u17.store.Bedwars.ownedKits
            if table.find(v30, v29) == nil then
                v27 = false
                break
            end
        end
        if v27 then
            v23 = false
        end
        local v31 = {}
        for v32, v33 in u17 do
            v31[v32] = v33
        end
        v31.SelectedKitBundle = nil
        v31.store = nil
        local v34 = {}
        for v35, v36 in v31 do
            v34[v35] = v36
        end
        local v37 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v38 = #v37
        local v39 = {
            ["Size"] = UDim2.fromScale(1, 0.333)
        }
        local v40 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 10),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v41 = #v40
        if v23 then
            v23 = u8.createElement(u10, {
                ["Title"] = "PURCHASE BUNDLE",
                ["Selectable"] = true,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.new(0.8, -10, 1, 0),
                ["Cost"] = {
                    {
                        ["robux"] = v19.price
                    }
                },
                ["OnClick"] = function() --[[ Name: OnClick, Line 99 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u16
                        [3] = u7
                        [4] = u17
                    --]]
                    u5:playSound(u16.UI_CLICK)
                    u7.Controllers.LobbyBundleController:purchaseBundle(u17.SelectedKitBundle)
                end
            })
        end
        if v23 then
            v40[v41 + 1] = v23
        end
        local v42 = #v40
        if v20 then
            v20 = u8.createElement(u11, {
                ["Selectable"] = true,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.2, 1),
                ["BackgroundColor3"] = Color3.fromRGB(84, 214, 235),
                ["Image"] = u15.GIFT_SOLID,
                ["OnClick"] = function() --[[ Name: OnClick, Line 114 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u16
                        [3] = u2
                        [4] = u12
                        [5] = u17
                        [6] = u6
                    --]]
                    u5:playSound(u16.UI_CLICK)
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.GIFTING, {
                        ["GiftType"] = u17.SelectedKitBundle
                    }, u6.OVERLAY)
                end
            })
        end
        if v20 then
            v40[v42 + 1] = v20
        end
        v37[v38 + 1] = u8.createElement(u4, v39, v40)
        return u8.createElement(u4, v34, v37)
    end)
}