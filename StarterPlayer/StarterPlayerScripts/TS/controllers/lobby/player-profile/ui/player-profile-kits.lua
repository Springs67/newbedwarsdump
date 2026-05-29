local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "lobby-kit-shop", "kit-shop-item-list").KitShopItemList
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u9 = v1.import(script, script.Parent, "player-profile-empty").PlayerProfileEmpty
return {
    ["PlayerProfileKits"] = v5.new(u4)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u9
            [4] = u6
            [5] = u2
            [6] = u3
            [7] = u7
        --]]
        local _ = p11.useState
        local v12 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u8.backgroundPrimary
        }
        local v13 = p10.FrameProps
        if v13 then
            for v14, v15 in v13 do
                v12[v14] = v15
            end
        end
        local v16 = p10.ProfileData.kits
        if v16 ~= nil then
            v16 = #v16 == 0
        end
        local v17 = {}
        local v18 = #v17 + 1
        local v19
        if v16 then
            v19 = u4.createElement(u9, {
                ["Text"] = "No kits owned.",
                ["Size"] = UDim2.fromScale(1, 1)
            })
        else
            local v20 = u4.createElement
            local v21 = u6
            local v22 = {
                ["SelectionMode"] = "VIEW_ONLY",
                ["ExcludeNonShopKits"] = true,
                ["Size"] = UDim2.fromScale(1, 1),
                ["store"] = p10.store
            }
            local v23
            if u2.isHoarceKat() then
                v23 = u3.values(u7)
            else
                v23 = p10.ProfileData.kits
            end
            v22.CustomKitView = v23
            v22.ScrollingFrameProps = {
                ["Size"] = UDim2.fromScale(1, u2.isSmallScreen() and 0.92 or 0.94)
            }
            v19 = v20(v21, v22)
        end
        v17[v18] = v19
        return u4.createElement("Frame", v12, v17)
    end)
}