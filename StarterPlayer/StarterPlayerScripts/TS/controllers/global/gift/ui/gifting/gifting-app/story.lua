local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u6 = v1.import(script, script.Parent, "gifting-core").GiftingCore
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u2
        [4] = u3
        [5] = u5
    --]]
    local v8 = u4
    local v9 = u6
    local v10 = {}
    local v11 = {
        ["name"] = "Grim Reaper",
        ["price"] = 399,
        ["devProductId"] = 123,
        ["customImage"] = u2.createElement(u3, {
            ["BackgroundTransparency"] = 1,
            ["SizeConstraint"] = "RelativeYY",
            ["Kit"] = u5.GRIM_REAPER,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        })
    }
    v10.Gift = v11
    local u12 = v8("GiftingApp", v9, v10, {}, {
        ["Parent"] = p7
    })
    return function() --[[ Line: 26 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
        --]]
        return u2.unmount(u12)
    end
end