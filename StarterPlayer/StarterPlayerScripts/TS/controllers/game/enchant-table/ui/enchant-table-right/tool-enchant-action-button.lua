local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.StringUtil
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").ToolEnchantButton
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
return {
    ["ToolEnchantActionButton"] = v10.new(u9)(function(_, p14) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u12
            [3] = u5
            [4] = u7
            [5] = u6
            [6] = u11
            [7] = u13
            [8] = u8
            [9] = u4
            [10] = u3
        --]]
        local v15 = p14.useEffect
        local u16 = u9.createRef()
        local v17 = u12
        v15(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u16
                [3] = u7
            --]]
            if u5.isGamepadControls() then
                u7:selectGui((u16:getValue()))
            end
        end, {})
        local function v23(p18) --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            local v19 = string.split(p18, "_")
            local v20 = false
            local v21 = 0
            local v22 = ""
            while true do
                if v20 then
                    v21 = v21 + 1
                else
                    v20 = true
                end
                if v21 >= #v19 then
                    return v22
                end
                v22 = v22 .. u6.capitalizeFirstLetter(v19[v21 + 1])
                if v21 < #v19 - 1 then
                    v22 = v22 .. " "
                end
            end
        end
        local v24 = u11.LocalPlayer:GetAttribute("EnchantPriceModifier")
        local v25 = v24 == nil and 1 or v24
        local v26 = v17.price * v25
        local v27 = math.floor(v26)
        local v28 = "<b>" .. tostring(v27) .. " " .. v23(v17.currency) .. (v27 > 1 and "s" or "") .. "</b>"
        local u29 = u5.isHoarceKat() and true or u13.hasEnough(u11.LocalPlayer, v17.currency, v27)
        if not u29 then
            v28 = "<b>Requires " .. tostring(v27) .. " " .. v23(v17.currency) .. (v27 > 1 and "s" or "") .. "</b>"
        end
        local v30 = {
            [u9.Ref] = u16,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Text"] = v28,
            ["TextLabel"] = {
                ["ZIndex"] = 11
            },
            ["OnClick"] = function() --[[ Name: OnClick, Line 74 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u8
                --]]
                task.spawn(function() --[[ Line: 60 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                        [2] = u8
                    --]]
                    if not u29 then
                        return nil
                    end
                    u8.Controllers.EnchantTableController:researchToolEnchant()
                end)
            end
        }
        local v31
        if u29 then
            v31 = v17.buttonColor
        else
            v31 = u4.darken(v17.buttonColor, 0.2)
        end
        v30.BackgroundColor3 = v31
        v30.hoverBrightness = 0.2
        v30.Selectable = true
        v30.LayoutOrder = 2
        v30.ZIndex = 10
        local v32 = {}
        local v33 = #v32
        if u29 then
            u29 = u9.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(v17.buttonColor, 0.9)), ColorSequenceKeypoint.new(1, u4.darken(v17.buttonColor, 0.9)) })
            })
        end
        if u29 then
            v32[v33 + 1] = u29
        end
        v32[#v32 + 1] = u9.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u4.brighten(v17.buttonColor, 0.1)
        })
        return u9.createElement(u3, v30, v32)
    end)
}