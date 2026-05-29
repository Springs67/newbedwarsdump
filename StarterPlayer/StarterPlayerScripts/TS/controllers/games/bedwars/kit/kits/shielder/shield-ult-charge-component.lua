local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "infernal-shield-balance").InfernalShieldBalance
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ShieldUltChargeComponent"] = v8.new(u7)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u10
            [4] = u6
            [5] = u7
            [6] = u4
            [7] = u11
            [8] = u9
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local v16, u17 = v14(0)
        local v18 = u12.player.Character
        local v19 = u3.hexColor(12060447)
        if v18 then
            local v20 = u10[u5.Controllers.KitSkinController:getKitSkin(v18)].shielder
            if v20 ~= nil then
                v20 = v20.effectColor
            end
            v19 = v20 or v19
        end
        v15(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u12
                [3] = u17
            --]]
            local u21 = u6.new()
            local v22 = u12.player:GetAttribute("InfernalShieldUltCharge")
            u17(v22 == nil and 0 or v22)
            u21:GiveTask(u12.player:GetAttributeChangedSignal("InfernalShieldUltCharge"):Connect(function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u17
                --]]
                local v23 = u12.player:GetAttribute("InfernalShieldUltCharge")
                u17(v23 == nil and 0 or v23)
            end))
            return function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end, {})
        return u7.createElement(u4, {
            ["AcceptZero"] = true,
            ["Size"] = u11.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            ["Progress"] = v16 / u9.SHIELD_ULT_CHARGE_REQ,
            ["BarGradient"] = ColorSequence.new(v19, v19),
            ["Title"] = {
                ["text"] = "Leap Charge"
            }
        })
    end)
}