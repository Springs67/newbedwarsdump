local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").EmptyButton
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
return {
    ["HotbarKitViewport"] = v5.new(u4)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
            [3] = u7
            [4] = u4
            [5] = u3
            [6] = u6
        --]]
        local _ = p10.useState
        local v11 = p9.store.Bedwars.kit
        local v12
        if v11 and p9.store.Bedwars.equippedKitSkins then
            v12 = p9.store.Bedwars.equippedKitSkins[v11]
        else
            v12 = nil
        end
        return u4.createElement(u3, {
            ["Size"] = p9.Size or UDim2.fromScale(1, 1),
            ["AnchorPoint"] = p9.AnchorPoint,
            ["Position"] = p9.Position,
            ["SizeConstraint"] = "RelativeYY",
            [u4.Event.MouseButton1Click] = function() --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u8
                    [3] = u7
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.KIT_SHOP_APP, {
                    ["SelectedKit"] = u7:getState().Bedwars.kit
                })
            end
        }, { u4.createElement(u6, {
                ["Kit"] = v11,
                ["Skin"] = v12,
                ["Size"] = UDim2.fromScale(1, 1)
            }) })
    end)
}