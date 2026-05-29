local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u9 = v1.import(script, script.Parent, "clan-create-form").ClanCreateForm
local u10 = v1.import(script, script.Parent, "clan-create-purchase").ClanCreatePurchase
return {
    ["ClanCreateTab"] = v6.new(u5)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u7
            [4] = u5
            [5] = u4
            [6] = u9
            [7] = u10
        --]]
        local _ = p12.useState
        local v13 = u3.isHoarceKat() and true or (p11.store.Clans.hasClanPass or u8.hasClanPass(u7.LocalPlayer))
        local v14 = u5.createFragment
        local v15 = {}
        local v16 = u5.createElement
        local v17 = u4
        local v18 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v19 = {}
        local v20
        if v13 then
            v20 = u5.createElement(u9)
        else
            v20 = u5.createElement(u10)
        end
        __set_list(v19, 1, {v20})
        v15.ClanCreateTab = v16(v17, v18, v19)
        return v14(v15)
    end)
}