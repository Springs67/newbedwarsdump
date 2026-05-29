local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, script.Parent, "auto-complete-dropdown").AutoCompleteDropdown
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u4
        [4] = u8
        [5] = u2
        [6] = u7
        [7] = u6
    --]]
    local v10 = u5.Store.new(u5.combineReducers({}), {})
    local u14 = u3.mount(u3.createElement(u4, {
        ["store"] = v10
    }, { u3.createElement(u8, {
            ["AppId"] = "AutoCompleteDropdown",
            ["Items"] = u2.values(u7),
            ["DescribeItem"] = function(p11) --[[ Name: DescribeItem, Line 18 ]]
                --[[
                Upvalues:
                    [1] = u6
                --]]
                local v12 = u6(p11)
                return {
                    ["actionDescription"] = "select",
                    ["displayName"] = v12.displayName,
                    ["aliases"] = { v12.displayName },
                    ["image"] = v12.image
                }
            end,
            ["OnSelect"] = function(p13) --[[ Name: OnSelect, Line 27 ]]
                print(p13)
            end
        }) }), p9)
    return function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u14
        --]]
        return u3.unmount(u14)
    end
end