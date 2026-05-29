local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Checkbox
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["KitShopKitSkinToggle"] = v4.new(u3)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u5
            [4] = u7
            [5] = u6
        --]]
        local _ = p9.useState
        return u3.createElement(u2, {
            ["AspectRatio"] = 4.85,
            ["Selectable"] = false,
            ["Text"] = "<b>USE KIT SKIN" .. (u5.GamepadEnabled and " (X)" or "") .. "</b>",
            ["Value"] = p8.UseKitSkin,
            ["SetValue"] = function(p10) --[[ Name: SetValue, Line 14 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u6
                --]]
                u7.Client:Get("BedwarsSetUseKitSkin"):CallServerAsync({
                    ["useKitSkin"] = p10
                }):andThen(function() --[[ Line: 18 ]] end):catch(function(p11) --[[ Line: 19 ]]
                    warn(p11)
                end)
                u6:dispatch({
                    ["type"] = "SetUseKitSkin",
                    ["useKitSkin"] = p10
                })
            end,
            ["Size"] = p8.Size,
            ["LayoutOrder"] = p8.LayoutOrder
        })
    end)
}