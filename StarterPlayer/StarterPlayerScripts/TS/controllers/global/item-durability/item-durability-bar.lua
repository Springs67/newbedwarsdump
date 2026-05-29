local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
return {
    ["ItemDurabilityBar"] = v5.new(u4)(function(u7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u4
            [4] = u2
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local v11 = u6(u7.inventoryItem.itemType).durability
        if v11 ~= nil then
            v11 = v11.itemHealth
        end
        local u12 = v11 == nil and 100 or v11
        local v13, u14 = v9(u7.inventoryItem.tool:GetAttribute("Durability") / u12)
        v10(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u7
                [3] = u14
                [4] = u12
            --]]
            local u15 = u3.new()
            u15:GiveTask(u7.inventoryItem.tool:GetAttributeChangedSignal("Durability"):Connect(function() --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u14
                    [3] = u12
                --]]
                local v16 = u7.inventoryItem.tool:GetAttribute("Durability")
                u14((v16 == nil and 0 or v16) / u12)
            end))
            return function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:DoCleaning()
            end
        end, {})
        local v17 = u7.uiStrokeColor
        if v17 then
            local v18 = {
                ["Thickness"] = 1,
                ["Color"] = u7.uiStrokeColor
            }
            local v19 = u7.uiStrokeTransparency
            v18.Transparency = v19 == nil and 0 or v19
            v17 = u4.createElement("UIStroke", v18)
        end
        local v20 = {
            ["AcceptZero"] = true,
            ["AnchorPoint"] = u7.AnchorPoint,
            ["Position"] = u7.Position,
            ["Size"] = u7.Size,
            ["Progress"] = v13,
            ["ChangingBarColor"] = {
                ["MinBarColor"] = Color3.fromRGB(255, 0, 0),
                ["MaxBarColor"] = Color3.fromRGB(0, 255, 0)
            },
            ["ZIndex"] = u7.ZIndex
        }
        local v21 = {}
        local v22 = #v21
        if v17 then
            v21[v22 + 1] = v17
        end
        return u4.createElement(u2, v20, v21)
    end)
}