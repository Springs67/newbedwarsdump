local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-type").QueueGroupType
local u7 = v1.import(script, script.Parent, "queue-selection-app").QueueSelectionApp
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u4
        [4] = u7
        [5] = u5
        [6] = u6
    --]]
    local u9 = u2.mount(u2.createElement(u3, {
        ["store"] = u4
    }, { u2.createElement(u7, {
            ["AppId"] = u5.QUEUE_SELECTION,
            ["QueueSelectionType"] = u6.BEDWARS_LUCKY_BLOCK
        }) }), p8)
    return function() --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
        --]]
        return u2.unmount(u9)
    end
end