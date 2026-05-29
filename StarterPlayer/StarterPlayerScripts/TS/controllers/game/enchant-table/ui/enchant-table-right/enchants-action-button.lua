local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantButton
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
return {
    ["EnchantActionButton"] = v9.new(u8)(function(_, p13) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u6
            [4] = u5
            [5] = u12
            [6] = u7
            [7] = u4
            [8] = u8
            [9] = u3
        --]]
        local _ = p13.useEffect
        local v14 = u11
        local v15 = u10.LocalPlayer:GetAttribute("EnchantPriceModifier")
        local v16 = v15 == nil and 1 or v15
        local v17 = v14.price * v16
        local v18 = math.floor(v17)
        local v19 = "<b>" .. tostring(v18) .. " " .. u6.capitalizeFirstLetter(v14.currency) .. (v18 > 1 and "s" or "") .. "</b>"
        local u20 = u5.isHoarceKat() and true or u12.hasEnough(u10.LocalPlayer, v14.currency, v18)
        if not u20 then
            v19 = "<b>Requires " .. tostring(v18) .. " " .. u6.capitalizeFirstLetter(v14.currency) .. (v18 > 1 and "s" or "") .. "</b>"
        end
        local v21 = {
            ["hoverBrightness"] = 0.2,
            ["Selectable"] = true,
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 10,
            ["GamepadShouldAutoSelect"] = true,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Text"] = v19,
            ["TextLabel"] = {
                ["ZIndex"] = 11
            },
            ["OnClick"] = function() --[[ Name: OnClick, Line 42 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u7
                --]]
                task.spawn(function() --[[ Line: 29 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u7
                    --]]
                    if not u20 then
                        return nil
                    end
                    u7.Controllers.EnchantTableController:researchEnchant()
                end)
            end
        }
        local v22
        if u20 then
            v22 = v14.buttonColor
        else
            v22 = u4.darken(v14.buttonColor, 0.2)
        end
        v21.BackgroundColor3 = v22
        local v23 = {}
        local v24 = #v23
        if u20 then
            u20 = u8.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(v14.buttonColor, 0.9)), ColorSequenceKeypoint.new(1, u4.darken(v14.buttonColor, 0.9)) })
            })
        end
        if u20 then
            v23[v24 + 1] = u20
        end
        v23[#v23 + 1] = u8.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u4.brighten(v14.buttonColor, 0.1)
        })
        return u8.createElement(u3, v21, v23)
    end)
}