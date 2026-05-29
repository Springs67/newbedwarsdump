local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SpiritBridgeProgressApp"] = v7.new(u6)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u4
            [4] = u8
            [5] = u3
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local v13 = math
        local v14 = u9.character:GetAttribute("CurrentBridgeLength")
        local v15 = v14 == nil and 100 or v14
        local v16, u17 = v11((v13.max(1, v15)))
        local v18 = u9.character:GetAttribute("CurrentBridgeDistanceTraveled")
        local v19, u20 = v11(v18 == nil and 0 or v18)
        local v21 = u9.character:GetAttribute("CurrentSpiritArmorModifier")
        local v22, u23 = v11(v21 == nil and 0 or v21)
        v12(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u9
                [3] = u20
                [4] = u17
                [5] = u23
            --]]
            local u24 = u5.new()
            u24:GiveTask(u9.character:GetAttributeChangedSignal("CurrentBridgeDistanceTraveled"):Connect(function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u20
                --]]
                local v25 = u9.character:GetAttribute("CurrentBridgeDistanceTraveled")
                u20(v25 == nil and 0 or v25)
            end))
            u24:GiveTask(u9.character:GetAttributeChangedSignal("CurrentBridgeLength"):Connect(function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u17
                --]]
                local v26 = u9.character:GetAttribute("CurrentBridgeLength")
                u17(v26 == nil and 100 or v26)
            end))
            u24:GiveTask(u9.character:GetAttributeChangedSignal("CurrentSpiritArmorModifier"):Connect(function() --[[ Line: 46 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u23
                --]]
                local v27 = u9.character:GetAttribute("CurrentSpiritArmorModifier")
                u23(v27 == nil and 0 or v27)
            end))
            return function() --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:DoCleaning()
            end
        end, {})
        local v28 = u6.createElement
        local v29 = u4
        local v30 = {
            ["AcceptZero"] = true,
            ["Size"] = u8.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3)
        }
        local v31 = v19 / v16
        v30.Progress = math.clamp(v31, 0, 1)
        v30.BarGradient = ColorSequence.new(u3.hexColor(16773050), u3.hexColor(16777215))
        v30.Title = {
            ["text"] = "+" .. tostring(v22) .. " Armor",
            ["color"] = u8.mcGold
        }
        return v28(v29, v30)
    end)
}