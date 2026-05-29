local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.ComponentUtil
local u6 = v3.GameCoreClientSyncEvents
local u7 = v3.GameTheme
local u8 = v3.ShineEffect
local u9 = v3.ShineEffectVariation
local u10 = v3.SoundManager
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v35 = v12.new(u11)(function(_, p17) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
        [3] = u7
        [4] = u4
        [5] = u11
        [6] = u5
        [7] = u15
        [8] = u2
        [9] = u10
        [10] = u16
        [11] = u8
        [12] = u9
    --]]
    local v18 = p17.useState
    local v19 = p17.useEffect
    local v20, u21 = v18(false)
    v19(function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u14
            [3] = u21
        --]]
        u6.AppClose:connect(function(p22) --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u21
            --]]
            if p22.appId ~= u14.BEDWARS_ITEM_SHOP then
                return nil
            end
            u21(false)
        end)
        u6.AppOpen:connect(function(p23) --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u21
            --]]
            if p23.appId ~= u14.BEDWARS_ITEM_SHOP then
                return nil
            end
            u21(true)
        end)
    end, {})
    local v24 = u7.mcGold
    local v25 = u4.WHITE
    local v26 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 900
    }
    local v27 = {}
    local v28 = #v27
    local v29 = not v20
    if v29 then
        v29 = u11.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromOffset(200, 50),
            ["Position"] = UDim2.fromScale(0.5, 0.8),
            ["AnchorPoint"] = Vector2.new(0.5, 1)
        }, { u11.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.new(0.5, 0, 0.5, 10),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = u4.darken(v24, 0.5)
            }, { u11.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 8)
                }) }), u11.createElement("ImageButton", {
                ["Size"] = UDim2.new(1, -4, 1, -4),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["BackgroundColor3"] = v24,
                [u11.Event.MouseButton1Click] = function() --[[ Line: 67 ]]
                    --[[
                    Upvalues:
                        [1] = u5
                        [2] = u15
                        [3] = u2
                        [4] = u14
                        [5] = u10
                        [6] = u16
                    --]]
                    local v30 = u5:getAllComponents(u15)
                    if not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u14.BEDWARS_ITEM_SHOP) then
                        local v31 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                        local v32 = u14.BEDWARS_ITEM_SHOP
                        local v33 = {}
                        local v34 = v30[1]
                        if v34 ~= nil then
                            v34 = v34.attributes.Id
                        end
                        v33.shopId = v34
                        v33.IsHomeBase = false
                        v31:openApp(v32, v33)
                        u10:playSound(u16.UI_CLICK_2)
                    end
                end,
                [u11.Event.MouseEnter] = function() --[[ Line: 84 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u16
                    --]]
                    u10:playSound(u16.UI_HOVER)
                end,
                [u11.Event.MouseLeave] = function() --[[ Line: 87 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u16
                    --]]
                    u10:playSound(u16.UI_HOVER)
                end,
                ["LayoutOrder"] = 2
            }, {
                u11.createElement(u8, {
                    ["OnHover"] = true,
                    ["ZIndex"] = 100,
                    ["Variation"] = u9.solid
                }),
                u11.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 8)
                }),
                u11.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Color"] = u4.brighten(v24, 0.5)
                }),
                u11.createElement("TextLabel", {
                    ["Text"] = "<b>Purchase Items</b>",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["Size"] = UDim2.fromScale(0.8, 0.45),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["TextColor3"] = v25
                })
            }) })
    end
    if v29 then
        v27[v28 + 1] = v29
    end
    return u11.createElement("ScreenGui", v26, v27)
end)
return {
    ["PvPArenaShopButton"] = v13.connect(function(_, p36) --[[ Line: 124 ]]
        local v37 = {}
        for v38, v39 in p36 do
            v37[v38] = v39
        end
        return v37
    end)(v35)
}