local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "infernal-shield-balance").InfernalShieldBalance
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ShieldEnergyComponent"] = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u4
            [4] = u5
            [5] = u2
            [6] = u9
            [7] = u7
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local v14, u15 = v12(0)
        local v16 = u10.player.Character
        local v17 = Color3.fromRGB(8, 184, 74)
        if v16 then
            local v18 = u8[u3.Controllers.KitSkinController:getKitSkin(v16)].shielder
            if v18 ~= nil then
                v18 = v18.effectColor
            end
            v17 = v18 or v17
        end
        v13(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u10
                [3] = u15
            --]]
            local u19 = u4.new()
            local v20 = u10.player:GetAttribute("InfernalShieldEnergy")
            u15(v20 == nil and 0 or v20)
            u19:GiveTask(u10.player:GetAttributeChangedSignal("InfernalShieldEnergy"):Connect(function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u15
                --]]
                local v21 = u10.player:GetAttribute("InfernalShieldEnergy")
                u15(v21 == nil and 0 or v21)
            end))
            return function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19:DoCleaning()
            end
        end, {})
        return u5.createElement(u2, {
            ["AcceptZero"] = true,
            ["Size"] = u9.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            ["Progress"] = v14 / u7.SHIELD_MAX_ENERGY,
            ["BarGradient"] = ColorSequence.new(v17, v17),
            ["Title"] = {
                ["text"] = "Shield Energy"
            }
        })
    end)
}