local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "purchase-button").PurchaseButton
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u7 = v1.import(script, script.Parent, "purchase-options-screen-app").PurchaseOptionsScreenApp
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u4
        [4] = u7
        [5] = u2
        [6] = u3
    --]]
    local v9 = u6(u5.JELLYFISH)
    local v10 = u4
    local v11 = u7
    local v12 = {
        ["Description"] = "Please select your payment method.",
        ["Title"] = "Purchase " .. v9.name .. " Kit",
        ["Image"] = v9.renderImage,
        ["Buttons"] = { u2.createElement(u3, {
                ["Size"] = UDim2.new(0.4, 0, 1, 0),
                ["Cost"] = {
                    {
                        ["robux"] = 100
                    }
                },
                ["OnClick"] = function() --[[ Name: OnClick, Line 21 ]] end
            }), u2.createElement(u3, {
                ["Size"] = UDim2.new(0.4, 0, 1, 0),
                ["Cost"] = {
                    {
                        ["bedcoin"] = 100
                    }
                },
                ["OnClick"] = function() --[[ Name: OnClick, Line 27 ]] end
            }) },
        ["OnExit"] = function() --[[ Name: OnExit, Line 29 ]]
            print("Exit")
        end,
        ["OnBack"] = function() --[[ Name: OnBack, Line 32 ]]
            print("Back")
        end
    }
    local u13 = v10("PurchaseOptionScreenApp", v11, {}, v12, {
        ["Parent"] = p8
    })
    return function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u13
        --]]
        u2.unmount(u13)
    end
end